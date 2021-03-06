<?php

class constant extends model{

	public function add($domain_id){
		$insertArray = array(
			'domain_id' => $domain_id,
			'creat_time' => time()
		);
		$result = $this->db()->insert('constant', $insertArray);
		if($result == 0) return false;
		return $this->db()->insertId();
	}

	public function faultList($constant_id, $start_time, $stop_time, $start, $limit, $type = false){
		if($constant_id != 0) $where = " AND constant_id = '{$constant_id}' ";
		else $where = '';
		if($type !== false) $where .= " AND request_status = '{$type}' ";
		$sql = "SELECT * FROM fault WHERE start_time >= {$start_time} AND start_time + keep_time <= {$stop_time} {$where} ORDER BY start_time DESC LIMIT {$start},{$limit}";
		return $this->db()->query($sql, 'array');
	}

	public function faultCount($constant_id, $start_time, $stop_time, $type = false){
		if($constant_id != 0) $where = " AND constant_id = '{$constant_id}' ";
		else $where = '';
		if($type !== false) $where .= " AND request_status = '{$type}' ";
		$sql = "SELECT count(fault_id) FROM fault WHERE start_time >= {$start_time} AND start_time + keep_time <= {$stop_time} {$where}";
		$result = $this->db()->query($sql, 'row');
		if(empty($result['count(fault_id)'])) return 0;
		return $result['count(fault_id)'];
	}

	//需要进行跨表查询
	public function dataGet($constant_id, $time_unit, $start_time, $stop_time, $node_id = false){
		$start_year = date('Y', $start_time);
		$stop_year = date('Y', $stop_time);
		$year = array();
		if($node_id) $node = " AND constant_node_id = '{$node_id}' ";
		else $node = '';

		for ($i = $start_year; $i <= $stop_year; $i++){
			$sql = "SHOW TABLES LIKE 'constant_log_{$i}'";
			$result = $this->db()->query($sql, 'row');
			if(!empty($result)) $year[] = $i;
		}
		$typeArray = array(
			'year' => '%Y',
			'month' => '%Y-%m',
			'day' => '%Y-%m-%d'
		);

		$sql200 = array();
		$sqltotal = array();
		foreach ($year as $key => $value) {
			$sql200[] = "SELECT count(constant_log_id) AS log_count,date_format(FROM_UNIXTIME(insert_time),'{$typeArray[$time_unit]}') AS time FROM constant_log_{$value} WHERE constant_id = '{$constant_id}'  AND insert_time >= {$start_time} AND insert_time <= {$stop_time} AND request_status = '200' {$node} GROUP BY time";
			$sqltotal[] = "SELECT count(constant_log_id) AS log_count,date_format(FROM_UNIXTIME(insert_time),'{$typeArray[$time_unit]}') AS time FROM constant_log_{$value} WHERE constant_id = '{$constant_id}'  AND insert_time >= {$start_time} AND insert_time <= {$stop_time} {$node} GROUP BY time";
		}
		$sql200 = implode(' UNION ALL ', $sql200);
		$sqltotal = implode(' UNION ALL ', $sqltotal);
		$sqltotal .= ' ORDER BY time ASC';

		$array200 = $this->db()->query($sql200, 'array');
		$arraytotal =  $this->db()->query($sqltotal, 'array');
		$result = array();
		foreach ($arraytotal as $key => $value){
			$result[$value['time']] = $value;
			$result[$value['time']]['count_200'] = 0;
		}
		foreach ($array200 as $key => $value) $result[$value['time']]['count_200'] = $value['log_count'];
		foreach ($result as $key => $value) {
			$result[$key]['available'] = round($value['count_200'] / $value['log_count'] * 100, 2);
		}
		return $result;
	}

	public function get($value, $type = 'constant_id'){
		if($value != 0){
			$whereArray = array(
				'domain_id' => " constant.domain_id = '{$value}' AND domain.domain_id = constant.domain_id",
				'constant_id' => " constant.constant_id = '{$value}' AND domain.domain_id = constant.domain_id",
				'user_id' => " domain.domain_id = constant.domain_id AND domain.user_id = '{$value}' ORDER BY constant.creat_time ASC LIMIT 0,1"
			);
			$sql = "SELECT * FROM constant,domain WHERE {$whereArray[$type]}";
		}
		return $this->db()->query($sql, 'row');
	}

	public function available($constant_id, $creat_time){
		$sql = "SELECT sum(keep_time) FROM fault WHERE constant_id = '{$constant_id}'";
		$result = $this->db()->query($sql, 'row');
		$keep_time = $result['sum(keep_time)'];
		$per = round($keep_time / (time() - $creat_time), 2);
		return (100 - $per);
	}

	public function faultNode($constant_id, $node_id, $period){
		$year = array();
		$sql = "SHOW TABLES LIKE 'constant_log%'";
		$result = $this->db()->query($sql, 'array');
		foreach ($result as $key => $value) $year[] = array_shift($value);
		$sqlarray = array();
		$sql200 = array();
		foreach ($year as $key => $value) {
			$sqlarray[] = "SELECT count({$value}.constant_log_id) as constant_count FROM {$value} WHERE constant_id = '{$constant_id}' AND constant_node_id = '{$node_id}'";
			$sql200[] = "SELECT count({$value}.constant_log_id) as constant_count FROM {$value} WHERE constant_id = '{$constant_id}' AND request_status = '200' AND constant_node_id = '{$node_id}'";
		}
		$sqlarray = implode(' UNION ALL ', $sqlarray);
		$sql200 = implode(' UNION ALL ', $sql200);
		$result = $this->db()->query($sqlarray, 'array');
		$result200 = $this->db()->query($sql200, 'array');
		$return['total'] = $return['available'] = 0;
		foreach ($result as $key => $value) {
			$return['total'] = $return['total'] + $value['constant_count'] * $period;
		}
		foreach ($result200 as $key => $value) {
			$return['available'] = $return['available'] + $value['constant_count'] * $period;
		}
		return $return;
	}

	public function check($constant_id){
		$url = $this->path($constant_id);
		if(!$url) return false;
		$result = httpHeader($url);
		$table = $this->table();
		$time = time();
		if($result['code'] != 200) $this->fault($constant_id, true, $result['code']);
		else $this->fault($constant_id, false);
		$insertArray = array(
			'constant_id' => $constant_id,
			'request_time' => $result['time'],
			'insert_time' => time(),
			'request_status' => $result['code'],
			'request_result' => $result['status']
		);
		$result = $this->db()->insert($table, $insertArray);

		//分布式监控点
		$nodeList = $this->nodeList();
		foreach ($nodeList as $key => $value) {
			$result = $this->nodeHttp($value['url'], $url);
			$insertArray = array(
				'constant_id' => $constant_id,
				'request_time' => $result['time'],
				'insert_time' => time(),
				'request_status' => $result['code'],
				'request_result' => $result['status'],
				'constant_node_id' => $value['constant_node_id']
			);
			$result = $this->db()->insert($table, $insertArray);
		}

		if($result == 0) return false;
		$sql = "UPDATE constant SET last_watch_time = '{$time}', watch_time = watch_time + period WHERE constant_id = '{$constant_id}'";
		$this->db()->query($sql, 'exec');
	}

	public function nodeHttp($node_url, $url, $port = 80){
		$curl = curl_init();
		$timeOut = 30;

		$node_url .= "?url={$url}&port={$port}";
		curl_setopt($curl, CURLOPT_URL, $node_url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_PORT, $port);
		curl_setopt($curl, CURLOPT_TIMEOUT, $timeOut);

		$return = curl_exec($curl);

		return json_decode($return, true);
	}

	public function nodeList($constant_id = false, $self = false){
		$table = $this->table();
		$sql = "SELECT * FROM constant_node";
		$result = $this->db()->query($sql, 'array');
		if($constant_id){
			foreach ($result as $key => $value) {
				$sql = "SELECT * FROM {$table} WHERE constant_id = '{$constant_id}' AND constant_node_id = '{$value['constant_node_id']}' ORDER BY insert_time DESC LIMIT 0,1";
				$node = $this->db()->query($sql, 'row');
				$result[$key]['info'] = $node;
			}
		}
		if($self){
			$sql = "SELECT * FROM {$table} WHERE constant_id = '{$constant_id}' AND constant_node_id = 0 ORDER BY insert_time DESC LIMIT 0,1";
			$node = $this->db()->query($sql, 'row');
			$local[] = array(
				'url' => '',
				'constant_node_id' => 0,
				'name' => 'localhost',
				'info' => $node
			);
			return array_merge($local, $result);
		}
		return $result;
	}

	public function path($constant_id){
		$sql = "SELECT domain.domain_name,constant.path FROM constant,domain WHERE domain.domain_id = constant.domain_id AND constant.constant_id = '{$constant_id}'";
		$result = $this->db()->query($sql, 'row');
		if(empty($result)) return false;
		$path = "http://{$result['domain_name']}{$result['path']}";
		return $path;
	}

	private function table(){		//判断表是否存在,不存在的话,创建。返回表名。
		$year = date('Y');
		$name = "constant_log_{$year}";
		$sql = "CREATE TABLE IF NOT EXISTS `{$name}` (
				  `constant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
				  `domain_id` int(10) unsigned NOT NULL,
				  `request_time` decimal(9,2) unsigned NOT NULL,
				  `request_result` varchar(255) NOT NULL,
				  `request_status` int(10) unsigned NOT NULL,
				  `insert_time` int(10) unsigned NOT NULL,
				  `constant_node_id` int(10) unsigned NOT NULL,
				  PRIMARY KEY (`constant_id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8;";
		$this->db()->query($sql, 'exec');
		return $name;
	}

	public function listGet($where = 'status = \'start\''){
		if(!empty($where)) $where = " WHERE {$where}";
		$sql = "SELECT * FROM constant {$where}";
		return $this->db()->query($sql, 'array');
	}

	public function faultTime($constant_id, $start_time, $stop_time){
		if($start_time != 0) $start = " AND start_time >= {$start_time} ";
		else $start = '';
		if($stop_time != 0) $stop = " AND start_time + keep_time <= {$stop_time} ";
		else $stop = '';
		$sql = "SELECT sum(keep_time) FROM fault WHERE constant_id = '{$constant_id}' {$start} {$stop}";
		$result = $this->db()->query($sql, 'row');
		$keep_time = $result['sum(keep_time)'];
		if(empty($keep_time)) $keep_time = 0;
		return $keep_time;
	}

	/*public function faultCount($constant_id, $start_time, $stop_time){
		$sql = "SELECT count(fault_id) FROM fault WHERE constant_id = '{$constant_id}' AND start_time >= {$start_time} AND start_time + keep_time <= {$stop_time}";
		$result = $this->db()->query($sql, 'row');
		$count = $result['count(fault_id)'];
		return $count;
	}*/

	public function constant_id($user_id){
		$sql = "SELECT constant_id FROM constant,domain WHERE constant.domain_id = domain.domain_id AND domain.user_id = '{$user_id}' ORDER BY constant.creat_time ASC LIMIT 0,1";
		$result = $this->db()->query($sql, 'row');
		if(empty($result)) return false;
		return $result['constant_id'];
	}

	public function userGet($user_id, $start, $limit){
		$sql = "SELECT * FROM constant,domain WHERE constant.domain_id = domain.domain_id AND domain.user_id = '{$user_id}' LIMIT {$start},{$limit}";
		return $this->db()->query($sql, 'array');
	}

	public function userCount($user_id){
		$sql = "SELECT count(constant.constant_id) FROM constant,domain WHERE constant.domain_id = domain.domain_id AND domain.user_id = '{$user_id}'";
		$result = $this->db()->query($sql, 'row');	
		return $result['count(constant.constant_id)'];		
	}

	public function update($constant_id, $updateArray){
		return $this->db()->update('constant', $updateArray, "constant_id = '{$constant_id}'");
	}

	public function fault($constant_id, $error = false, $code = false){
		$sql = "SELECT period FROM constant WHERE constant_id = '{$constant_id}'";
		$result = $this->db()->query($sql, 'row');
		if(empty($result)) return false;
		$period = $result['period'];

		$sql = "SELECT fault_id,start_time FROM fault WHERE constant_id = '{$constant_id}' AND status = 'unslove' ORDER BY start_time DESC";
		$result = $this->db()->query($sql, 'array');

		$fault = array();
		if(!empty($result)) $fault = array_shift($result);

		//正常情况下最多只会有一个unslove
		if(count($result) > 0){		//如果出现多个。除了第一个其他全部闭合
			$fault_array = array();
			foreach ($result as $key => $value) {
				$fault_array[] = $value['fault_id'];
			}
			$fault_where = implode(',', $fault_array);
			$updateArray = array('status' => 'slove');
			$this->db()->update('fault', $updateArray, "fault_id in ({$fault_where})");
			echo '闭合修复';
		}

		if($error){		//开启故障，持续故障
			if(empty($fault)){		//开启故障
				$insertArray = array(
					'constant_id' => $constant_id,
					'start_time' => time(),
					'keep_time' => $period
				);
				if($code) $insertArray['request_status'] = $code;
				$result = $this->db()->insert('fault', $insertArray);
			}else{		//持续故障时间累加
				$sql = "UPDATE fault SET keep_time = keep_time + {$period} WHERE fault_id = '{$fault['fault_id']}'";
				$this->db()->query($sql, 'exec');
			}
		}else{		//闭合故障
			if(!empty($fault)){
				$updateArray = array(
					'status' => 'slove'
				);
				$this->db()->update('fault', $updateArray, "fault_id = '{$fault['fault_id']}'");
			}
		}
	}
}



?>