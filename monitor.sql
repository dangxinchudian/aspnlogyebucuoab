-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 05 月 04 日 14:17
-- 服务器版本: 5.5.30
-- PHP 版本: 5.4.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `monitor`
--

-- --------------------------------------------------------

--
-- 表的结构 `constant`
--

CREATE TABLE IF NOT EXISTS `constant` (
  `constant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '/' COMMENT '监测路径',
  `creat_time` int(10) unsigned NOT NULL,
  `watch_time` int(10) unsigned NOT NULL,
  `status` enum('start','stop') NOT NULL DEFAULT 'start',
  `period` int(10) unsigned NOT NULL DEFAULT '60',
  `last_watch_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`constant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `constant`
--

INSERT INTO `constant` (`constant_id`, `domain_id`, `path`, `creat_time`, `watch_time`, `status`, `period`, `last_watch_time`) VALUES
(1, 1, '/', 1366427257, 840, 'start', 60, 1367407259),
(2, 2, '/', 1366427265, 780, 'start', 60, 1367407259);

-- --------------------------------------------------------

--
-- 表的结构 `constant_log_2012`
--

CREATE TABLE IF NOT EXISTS `constant_log_2012` (
  `constant_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `constant_id` int(10) unsigned NOT NULL,
  `request_time` decimal(7,4) unsigned NOT NULL COMMENT '请求时间',
  `request_result` varchar(255) NOT NULL,
  `request_status` int(10) unsigned NOT NULL COMMENT '响应状态值',
  `insert_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`constant_log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='连续性监测日志' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `constant_log_2012`
--

INSERT INTO `constant_log_2012` (`constant_log_id`, `constant_id`, `request_time`, `request_result`, `request_status`, `insert_time`) VALUES
(1, 1, 0.3280, 'Found', 302, 1356427492),
(2, 2, 0.0630, 'OK', 200, 1356427492),
(3, 1, 0.3750, 'Moved Temporarily', 302, 1356427739),
(4, 2, 0.0620, 'OK', 200, 1356427740),
(5, 1, 0.3290, 'Moved Temporarily', 302, 1356428505),
(6, 1, 0.3280, 'Moved Temporarily', 302, 1356428522),
(7, 1, 0.3280, 'Moved Temporarily', 302, 1356428546),
(8, 2, 0.0620, 'OK', 200, 1356428546),
(9, 1, 21.0150, 'Unable to access', 0, 1356428628),
(10, 2, 0.0470, 'OK', 200, 1356428628),
(11, 1, 21.2190, 'Unable to access', 0, 1356428796),
(12, 2, 0.0630, 'OK', 200, 1356428796),
(13, 1, 21.0000, 'Unable to access', 0, 1356431361),
(14, 2, 0.0620, 'OK', 200, 1356431361),
(15, 1, 21.0160, 'Unable to access', 0, 1356431846),
(16, 2, 0.0470, 'OK', 200, 1356431846),
(17, 1, 0.0000, 'Unable to access', 0, 1356431963),
(18, 2, 0.0000, 'Unable to access', 0, 1356431963),
(19, 1, 21.2660, 'Unable to access', 0, 1356432045),
(20, 2, 0.0620, 'OK', 200, 1356432045),
(21, 1, 21.0160, 'Unable to access', 0, 1356432135),
(22, 2, 0.0470, 'OK', 200, 1356432135),
(23, 1, 20.9850, 'Unable to access', 0, 1356432251),
(24, 2, 0.0470, 'OK', 200, 1356432251),
(25, 1, 21.0000, 'Unable to access', 0, 1356432333),
(26, 2, 0.0310, 'OK', 200, 1356432333),
(27, 1, 0.0000, 'Unable to access', 0, 1356432394),
(28, 2, 0.0000, 'Unable to access', 0, 1356432394),
(29, 1, 0.0000, 'Unable to access', 0, 1356432465),
(30, 2, 0.0000, 'Unable to access', 0, 1356432500),
(31, 1, 21.5000, 'Unable to access', 0, 1356432550);

-- --------------------------------------------------------

--
-- 表的结构 `constant_log_2013`
--

CREATE TABLE IF NOT EXISTS `constant_log_2013` (
  `constant_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `constant_id` int(10) unsigned NOT NULL,
  `request_time` decimal(7,4) unsigned NOT NULL COMMENT '请求时间',
  `request_result` varchar(255) NOT NULL,
  `request_status` int(10) unsigned NOT NULL COMMENT '响应状态值',
  `insert_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`constant_log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='连续性监测日志' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `constant_log_2013`
--

INSERT INTO `constant_log_2013` (`constant_log_id`, `constant_id`, `request_time`, `request_result`, `request_status`, `insert_time`) VALUES
(1, 1, 0.3280, 'Found', 302, 1366426492),
(2, 2, 0.0630, 'OK', 200, 1366427492),
(3, 1, 0.3750, 'Moved Temporarily', 302, 1366427739),
(4, 2, 0.0620, 'OK', 200, 1366427740),
(5, 1, 0.3290, 'Moved Temporarily', 302, 1366428505),
(6, 1, 0.3280, 'Moved Temporarily', 302, 1366428522),
(7, 1, 0.3280, 'Moved Temporarily', 302, 1366428546),
(8, 2, 0.0620, 'OK', 200, 1366428546),
(9, 1, 21.0150, 'Unable to access', 0, 1366428628),
(10, 2, 0.0470, 'OK', 200, 1366428628),
(11, 1, 21.2190, 'Unable to access', 0, 1366428796),
(12, 2, 0.0630, 'OK', 200, 1366428796),
(13, 1, 21.0000, 'Unable to access', 0, 1366431361),
(14, 2, 0.0620, 'OK', 200, 1366431361),
(15, 1, 21.0160, 'Unable to access', 0, 1366431846),
(16, 2, 0.0470, 'OK', 200, 1366431846),
(17, 1, 0.0000, 'Unable to access', 0, 1366431963),
(18, 2, 0.0000, 'Unable to access', 0, 1366431963),
(19, 1, 21.2660, 'Unable to access', 0, 1366432045),
(20, 2, 0.0620, 'OK', 200, 1366432045),
(21, 1, 21.0160, 'Unable to access', 0, 1366432135),
(22, 2, 0.0470, 'OK', 200, 1366432135),
(23, 1, 20.9850, 'Unable to access', 0, 1366432251),
(24, 2, 0.0470, 'OK', 200, 1366432251),
(25, 1, 21.0000, 'Unable to access', 0, 1366432333),
(26, 2, 0.0310, 'OK', 200, 1366432333),
(27, 1, 0.0000, 'Unable to access', 0, 1366432394),
(28, 2, 0.0000, 'Unable to access', 0, 1366432394),
(29, 1, 0.0000, 'Unable to access', 0, 1366432465),
(30, 2, 0.0000, 'Unable to access', 0, 1334941261),
(31, 1, 21.5000, 'Unable to access', 0, 1366432550),
(32, 1, 0.0000, 'Unable to access', 0, 1367407259),
(33, 2, 0.2169, 'OK', 200, 1367407259);

-- --------------------------------------------------------

--
-- 表的结构 `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
  `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `custom_name` varchar(255) NOT NULL COMMENT '别名',
  `domain_name` varchar(255) NOT NULL,
  `creat_time` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL DEFAULT '0',
  `port` int(10) unsigned NOT NULL DEFAULT '80',
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY `domain_name` (`domain_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `domain`
--

INSERT INTO `domain` (`domain_id`, `user_id`, `custom_name`, `domain_name`, `creat_time`, `server_id`, `port`) VALUES
(1, 1, '', 'test.com', 1366427257, 0, 80),
(2, 1, '', 'www.hdu.edu.cn', 1366427265, 0, 80);

-- --------------------------------------------------------

--
-- 表的结构 `fault`
--

CREATE TABLE IF NOT EXISTS `fault` (
  `fault_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `constant_id` int(10) unsigned NOT NULL,
  `status` enum('slove','unslove') NOT NULL DEFAULT 'unslove',
  `keep_time` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fault_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='故障时间' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fault`
--

INSERT INTO `fault` (`fault_id`, `constant_id`, `status`, `keep_time`, `start_time`) VALUES
(1, 1, 'unslove', 600, 1366431846),
(2, 2, 'slove', 180, 1366431963),
(3, 2, 'slove', 120, 1366432394);

-- --------------------------------------------------------

--
-- 表的结构 `server`
--

CREATE TABLE IF NOT EXISTS `server` (
  `server_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(255) NOT NULL COMMENT '别名',
  `ip` varchar(255) NOT NULL,
  `creat_time` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `period` int(10) unsigned NOT NULL DEFAULT '60',
  `snmpv2_community` varchar(255) NOT NULL DEFAULT 'public',
  `sys_descr` varchar(255) NOT NULL,
  `sys_name` varchar(255) NOT NULL,
  `sys_uptime` varchar(255) NOT NULL COMMENT '连续开机时间',
  `last_netstat` text NOT NULL,
  `last_run` text NOT NULL,
  `last_device` text NOT NULL,
  `last_cpu` text NOT NULL,
  `last_memory` text NOT NULL,
  `last_disk` text NOT NULL,
  `last_network` text NOT NULL,
  `last_watch_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `server`
--

INSERT INTO `server` (`server_id`, `custom_name`, `ip`, `creat_time`, `user_id`, `period`, `snmpv2_community`, `sys_descr`, `sys_name`, `sys_uptime`, `last_netstat`, `last_run`, `last_device`, `last_cpu`, `last_memory`, `last_disk`, `last_network`, `last_watch_time`) VALUES
(1, '', '127.0.0.1', 1366269711, 1, 60, '', '', '', '0', '', '', '', '', 'eJyrVirJL0nMUbJKS8wpTtVRKi1OTYFzyjKLSkqRJIvLEwugnFoARS4UOA==', '', '', 1367415295),
(2, '', '110.76.43.117', 1367203974, 1, 60, 'public', 'Linux MGMT 2.6.18-164.el5 #1 SMP Thu Sep 3 03:33:56 EDT 2009 i686', 'MGMT', 'Timeticks: (261542295) 30 days, 6:30:22.95', 'eJy11D0LwjAQBuD/0qlCDbnLd0c7OQiCgkPpUDVgQavQ/H9sOulgsdYjhFyWJ1x4ubJM9sV2uVmv8jycHsW9bXehDj7JEs6G1VeIb9e4r00XfJviIqmybwjLZxNCO/cjAsCZ0UwKBmAiZZSOPUlkgMCsYIjDE4Lr/gjNzR/qJqQA011B5EoiV312fRfqY//DF39O1XRZk8mGTLZksqOSDSeRpXV2JHMzZZrURflPqUMzzBmI9e9z50WxnKsxpnoCToZhOA==', 'eJzNWE2P4jgQ/SsWElKv1IQESBpamsvsHlba3tvchhEyiZO427HTtsOHRvvftwI9xAbPpAWZqA8o+Nmxn+tVucr5+n3AcUEGjwPKqR7cD0qs87cW+jr9dkAkjNBEAgxNvS/r4bgsGY2xpoLfzf4AXGmsKwU9suIcrxm5m9RwXFaAPYRT+F+QQsg9NKPJHP3zea+JGvx3f2JQ0EweJlyO/YbJBXo7G9/k4juYvCiRaipfE4vJBXo7k0kbky3WcZ6IzCJyDvZgEbIhXCuLhQ3dziEIFq265ISVsEgjiQHczmDWTkDnkuDEIGAAfTjmmon45cwtbex2FtOwlQaOS2paoWn3YIT4tSIVsWxgQ30IkVdr0wCnZgfmbz+diKTCXN0AuojDNgJlkrJK5Q0BE+jB+L95/eAdCmxxmVipoQF6MACmwnJ/o92H75eqEJUipgdaUA8cdoQfsmBDwUJuZ9CaCmC9Nbxtrv+j3YELtnqAxrYHNO0+/E/jFa521vInoJf6TEtaWg5oIn0weBaV5JiZFCzodg7zYPKORFwlVFuZuAF6MEOVkI2x+nKs1hQK9QZuOIySa1lEg9arAyd6heOYMCsoLtA+HKOoFz+r0GysNxarHPOEEZmcU7E7euCj9oqJzOBhAoaPFMi/lsNsHljhEi0mLsPYNF5cJHadmGG6iFyGULkVL5WSP4Lm1NVB8opmJpXAnzmDRpcGl1PLsESFAH2EHxqVaDneYCAL6y3H9WAPSn40yq5Ocb4l1ywMXHo94w2+sBfcdzDE9HPyEngPnr8K/OX4YMLTaGMPf9WgV2nKPBA7ozzzYsFTmnkpZeSTPaUWBWwgWo7rITV6fKGUAm6ZmhKFXPMVmOOMyE9CZh4ucZwT77li1PuTYaWeBL765Asn/iKaW1JGYTifuS5FUnBDzabZwUeKqU0hCFyenSm4i7OfObfZ2/F5MwldjkO50DTdb7H5VcsW+0DsfJx5GMlXNBppWpC00GgI5/ewgN8eDf9+HP4LXamQBYaeL2i4HaZDgkYEFSKB6e4TwmCa+1gSDA+soTpZI3t5Dr6zO3raCp6d2CKMXKfvGpuXpbeNn8BmxxDcQui3fqn2PPYOY27nNfNdPvsxNcpFQZbjLVkrqsmKUQUWgaErQFY15Omd7kYs33UqfwSxXLw+pli/CCiOd4qCkDlodlSxG9WcufQDqObMn2rDFZEbciHZseQwe81SHY0kGHe73R7GHCNCkbj+CA8y1dYkfFQKqdE0WiyuTiwm/4UzqxSQX4nW+8s7htXTcAckuLqEtOw57YrPpBt9p059eVH+tKA89RnSPikQ9ylF9Zm2gSCpGDsv7g7vHas7/F7qsPm7wLiyRWFgWfNhYZTj3/4HTLpqQQ==', 'eJy1kUFLAzEQhf/KkIsKXVmL9pCTsAltD3XXTVcU8RDitBu6ZJYkVVT635vqoYfiYQ+dwww8mO+9YV5/WPzqkXFWzgWHWamWWS1V2dSFVNnypZKK89YL/LAGK08GQyDPRuwdg/G2j5ZcWp6i21qHcxex4/A7LusreEZyh1lUDRxL3k3GOcA9jK9v8+nsm+1GQ1I8YPwkvznJ4P50sMndr7RB6OhsaIxtfk74zUC4sGGjInm9xhODR7loQDyJrC4XA7EF9f//fJt069YQWx1TQ48XATSsOtLxoPeUTgJD2ZGxe9sDixzM6w==', 'eJyLVjI0VIoFAATKAV8=', 'eJyrVirJL0nMUbJSMjQwNjU0N1LwdqosSS1W0lEqLU5NAYqbmYGEgfyyzKKSUpDSagwpNDOUanWUissTC5Ss0hJzilNrAaigHMo=', 'eJyLrlbKS8xNVbJSitFX0lEqyS9JzAFyTA3MzQ0MTIEipcWpKSABI0tjEwulWh0k9SmpZTH6xRm5SPoMgcoszRDaDJRqYwFU2hs6', 'eJytkrFqwzAQht/FUwoZdLJ1sryV0i20KSVT6eDYFxLSSEaSCaH03Xt2CUlRpiSa9H8H+rkPfXxnLYXGZ1X25bJpFg8d8T24VdzXnmbOdcu62U5k8cDTXex5CFjkyCl0RO2Qxd9h1K0P4bFtPYXAAwZ1u9vY91jHfgB9N4HhHdeRT+DGvjaR4oByI1DlI1s0dYjz7YgLU+AIX86pGNGz986f4sJurdvbuXfRHanrY9rA8EIF06SD2b8Szm8zsmP6mZ48UlyLk0lO5C3Fp7Crm3aCZxrVqOxoMdUnKsAqp0pUqKtlebVNAKO0xNKUiVEpEAqp4U5WC8E7YWoVjYLbrcL9rZbqBqtQKg0GLljNtZYlint9Vo1GS4NGpmZzBUIpeY3cz1/P2DCc', 1367415310),
(3, '', '61.175.163.196', 1367408698, 1, 60, 'public', '', '', '', 'eJydkz0LwjAQhv9LJ4Va7nIfSTrayUEQdCsdRDoIUgX7/7F0u7iUI0NyQx7ePHfp++rWXQ7n07Ft58ene0/Tdb7PY1VX0KxrOQUxJUJIvOyv53cep13YV0O9BZPAlIKU1IFBzKZmQgUPh4pnJVV0cJjJ2kLw2GG2cSSzRgdHtIgD6omzNNnmIc7s0gxBC8+CTlAqDYEHRBSDVRRk+yAqNhilQaUGs679LsdItgv/oyHlIhtsH0oMcb2I67fIYn0tHyUmyxp+5179MQ==', '', 'eJzt0kFPg0AQhuG/MtlTm0BSetzEgwXURhHSxURjPSzLWDa0DBnWKjH+d2niDS9NOHjw/s3zXub5U7i+RSFFuo4k3KQq9zexSh82Yaz8/CmLlZQVR3i0BjMmg11HLDxRYmfYts5SMxyvG4d78eX9a79p9+jeieuRlSjIwwzuiNpCmxrsYPOrNjiRv2LSpaEDDINHx3hAuLY7XVgHsauQG3QQsT0i//VgZLtaOWK9w1H0Um63E3LRtNyV/cASTosz0VvsC9Jcjj9wlQA2lW7MAM+CReADMQSLpV9jP4f6584D9VacchezxfzMtkK2ep8Ru1E9TJNATsotB+7lG7hwfLg=', 'eJyLVjJQ0kHCsQAbbQMN', 'eJyrVirJL0nMUbJSMjQwMbe0MFHwdqosSS1W0lEqLU5NUbJKS8wpTtVRKsssKikFqauGiisZGZiaAFXBtJuamhiYKtXqKBWXJxZAtdUCAEaQHJQ=', 'eJx9jrsOwjAQBH/FujqFz+fXuaVFNJSEwiYukJwghbhC+XfcINNAuauZ1V5esMQ5Q4BDGEdxjCmXIMQ5r/dYxKnOKa9CU7rhlBwMsD22WBptiZ2zrajPPLVMRJoR9uGzt9RSOo7KMbP3rhsoDaOVVv+VjMGuKOXtb5rRePy6pCUx7Nc3y20/nA==', 'eJzVkl1LwzAUhv9K6dWEXeSjH2nvdA5v5pzMgSBeZM2pK6NJSVLHkP130+qYtmMO8cZeFN7nhJfwnDy9+QJMpv3Uv517D6OZN1GqWvJs7RXSgs55Bv7Qt9sK3BGjcrvhGvZnBiS4cNPS1m6IQ4RcMBWAaCL6+ByqVltzKYQGY9zAAS7KQs4tt3UD6mqAmxpVge7BQt5lFmyDaExbsMi4sbN1y6KWTL8i1KKx1kof4kKupdrImVZW7amqbafbkW65Q712x77Vu3w/Admm3fBg9EorLjJVelOwj1ZDCd5N8cKXhfXGdgVagvWudfEK+qAYPgcjU/JMDKIf/R4xjNI8xXka5SnNUozOEy6cngHpKEc94eiPhKO+bvQvdJ+2Db9+3QQhxoKEsaTnHIeMIUZJXz12t0wQjdg5KwhphKPOGnBMaUwQwUeeP45JjGIcHlkLZu6ip3cTkCRIotj9/d3zOzLoV74=', 1367415318);

-- --------------------------------------------------------

--
-- 表的结构 `server_disk_log_2013`
--

CREATE TABLE IF NOT EXISTS `server_disk_log_2013` (
  `server_disk_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `used` bigint(20) unsigned NOT NULL,
  `insert_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`server_disk_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `server_disk_log_2013`
--

INSERT INTO `server_disk_log_2013` (`server_disk_id`, `server_id`, `log_id`, `name`, `total`, `used`, `insert_time`) VALUES
(1, 2, 2, 'Lw==', 5077005, 529348, 1367415308),
(2, 2, 2, 'L2Rldi9zaG0=', 129396, 0, 1367415308),
(3, 3, 3, 'QzpcIExhYmVsOiAgU2VyaWFsIE51bWJlciA0M2JjMWRiNw==', 639776, 333491, 1367415317),
(4, 3, 3, 'RTpcIExhYmVsOtDCvNO+7SAgU2VyaWFsIE51bWJlciBlY2RmZjJjMg==', 127999887, 105916064, 1367415317),
(5, 3, 3, 'RjpcIExhYmVsOtDCvNO+7SAgU2VyaWFsIE51bWJlciAzNGZjOWFlYg==', 1279551, 2286, 1367415317),
(6, 3, 3, 'RzpcIExhYmVsOtDCvNO+7SAgU2VyaWFsIE51bWJlciA1NDA0ZmEyNA==', 1915816, 4039, 1367415317);

-- --------------------------------------------------------

--
-- 表的结构 `server_log_2013`
--

CREATE TABLE IF NOT EXISTS `server_log_2013` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `run_count` int(10) unsigned NOT NULL,
  `netstat_count` int(10) unsigned NOT NULL,
  `memory_total` bigint(20) unsigned NOT NULL,
  `memory_used` bigint(20) unsigned NOT NULL,
  `virtual_memory_total` bigint(20) unsigned NOT NULL,
  `virtual_memory_used` bigint(20) unsigned NOT NULL,
  `swap_memory_total` bigint(20) unsigned NOT NULL,
  `swap_memory_used` bigint(20) unsigned NOT NULL,
  `processor_load` int(10) unsigned NOT NULL,
  `insert_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `server_log_2013`
--

INSERT INTO `server_log_2013` (`log_id`, `server_id`, `run_count`, `netstat_count`, `memory_total`, `memory_used`, `virtual_memory_total`, `virtual_memory_used`, `swap_memory_total`, `swap_memory_used`, `processor_load`, `insert_time`) VALUES
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1367415293),
(2, 2, 45, 17, 1035172, 665172, 1035172, 665172, 0, 0, 11, 1367415307),
(3, 3, 0, 14, 1047984, 0, 55405, 2054, 0, 0, 0, 1367415316);

-- --------------------------------------------------------

--
-- 表的结构 `server_network_log_2013`
--

CREATE TABLE IF NOT EXISTS `server_network_log_2013` (
  `server_network_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `descr` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `inOctets` bigint(20) unsigned NOT NULL,
  `outOctets` bigint(20) unsigned NOT NULL,
  `insert_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`server_network_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `server_network_log_2013`
--

INSERT INTO `server_network_log_2013` (`server_network_id`, `server_id`, `log_id`, `descr`, `type`, `inOctets`, `outOctets`, `insert_time`) VALUES
(1, 2, 2, 'bG8=', 'c29mdHdhcmVMb29wYmFjaygyNCk=', 390653, 390653, 1367415310),
(2, 2, 2, 'ZXRoMA==', 'ZXRoZXJuZXRDc21hY2QoNik=', 1195726898, 405006, 1367415310),
(3, 2, 2, 'ZXRoMQ==', 'ZXRoZXJuZXRDc21hY2QoNik=', 1118571918, 769729692, 1367415310),
(4, 3, 3, 'TVMgVENQIExvb3BiYWNrIGludGVyZmFjZQ==', 'c29mdHdhcmVMb29wYmFjaygyNCk=', 373, 373, 1367415318),
(5, 3, 3, 'QnJvYWRjb20gTmV0WHRyZW1lIEdpZ2FiaXQgRXRoZXJuZXQgRHJpdmVy', 'ZXRoZXJuZXRDc21hY2QoNik=', 0, 0, 1367415318),
(6, 3, 3, 'QnJvYWRjb20gTmV0WHRyZW1lIEdpZ2FiaXQgRXRoZXJuZXQgRHJpdmVy', 'ZXRoZXJuZXRDc21hY2QoNik=', 2008849889, 1733720213, 1367415318);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) NOT NULL,
  `passwd` char(32) NOT NULL,
  `usalt` char(27) NOT NULL,
  `creat_time` int(10) unsigned NOT NULL,
  `last_login_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `mail`, `passwd`, `usalt`, `creat_time`, `last_login_time`) VALUES
(1, 'zje2008@qq.com', '7245b8234755f6ecc280c80369c85156', '9WSd6Nb2xLBK8uFlO3Q58BnR0Lw', 1366189506, 1367203917);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
