-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: qqservice
-- ------------------------------------------------------
-- Server version	5.7.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员账号',
  `password` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员密码',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `ip` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录IP',
  `loginTime` datetime DEFAULT NULL COMMENT '登录时间',
  `value1` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value2` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value3` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value4` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','qweqwe123123@','2022-03-15 09:06:59','218.65.221.110-广西壮族自治区河池市','2022-04-15 11:12:23',NULL,NULL,NULL,NULL),(12,'laoshu22','qq123123','2022-03-17 23:58:47','218.65.221.110-广西壮族自治区河池市','2022-04-14 17:40:04',NULL,NULL,NULL,NULL),(13,'lui24','lui24','2022-03-18 00:10:03','112.96.228.184-广东省佛山市','2022-03-26 21:05:47',NULL,NULL,NULL,NULL),(16,'10','qq123123','2022-03-19 11:42:36','118.123.249.132-四川省成都市','2022-03-25 13:15:10',NULL,NULL,NULL,NULL),(18,'yu07','qq123123','2022-03-19 11:43:19','36.133.43.95-CHINA','2022-04-04 08:55:40',NULL,NULL,NULL,NULL),(25,'uy20','qq123123','2022-03-19 22:07:33','182.239.92.167-香港特别行政区','2022-03-30 17:36:23',NULL,NULL,NULL,NULL),(26,'gjd22','qq123123','2022-03-19 22:07:56','112.96.247.189-广东省佛山市','2022-03-27 23:57:45',NULL,NULL,NULL,NULL),(27,'tfvb26','qq123123','2022-03-19 22:08:37','182.239.92.66-香港特别行政区','2022-04-02 19:47:15',NULL,NULL,NULL,NULL),(28,'cffh27','qq123123','2022-03-19 22:09:02','112.96.247.189-广东省佛山市','2022-03-27 23:59:33',NULL,NULL,NULL,NULL),(31,'nbb29','qq123123','2022-03-27 23:54:50','112.96.247.189-广东省佛山市','2022-03-27 23:55:24',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '网站名称',
  `siteIcon` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '网站头像',
  `filingNo` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备案号',
  `enableSite` int(11) DEFAULT NULL COMMENT '是否启用站点',
  `ClosingInstructions` varchar(100) COLLATE utf8mb4_bin DEFAULT '对不起，网站维护，请稍后登录。网站维护期间对您造成的不便，请谅解！' COMMENT '网站关闭说明',
  `value1` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `value2` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `value3` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `value4` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,NULL,NULL,NULL,NULL,'对不起，网站维护，请稍后登录。网站维护期间对您造成的不便，请谅解！','http://134.209.85.159/',NULL,NULL,NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账号',
  `password` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `AuditStatus` int(11) DEFAULT '5' COMMENT '审核状态： 1 密码错误， 2 验证验证码 ， 3 验证码错误 ， 4 验证码正确 ，5 加载页面',
  `VerificationCode` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '验证码',
  `IP` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ip号码',
  `state` int(11) DEFAULT '0' COMMENT '备用使用：0 在线 1 离线',
  `stayPage` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '停留页面配置',
  `loginTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `admin` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附属管理员',
  `value1` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value2` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value3` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  `value4` varchar(400) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用字段',
  KEY `id` (`id`),
  KEY `username` (`username`),
  KEY `admin` (`admin`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (48,'admin','qweqwe123123',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:42:18','null',NULL,NULL,NULL,NULL),(49,'laoshu22','qq123123',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:43:53','null',NULL,NULL,NULL,NULL),(50,'laoshu22','qq123123',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:45:21','null',NULL,NULL,NULL,NULL),(51,'2345487','hshshh',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:47:10','null',NULL,NULL,NULL,NULL),(52,'laoshu22','qq123123',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:47:38','null',NULL,NULL,NULL,NULL),(53,'22784946','hsbbbbz',5,NULL,'223.104.90.246-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-18 21:53:12','null',NULL,NULL,NULL,NULL),(55,'admin','qweqwe123123',5,NULL,'221.221.148.171-北京市海淀区',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-19 09:31:16','undefined',NULL,NULL,NULL,NULL),(78,'848888888','etyffhhfrgdt',2,NULL,'103.77.192.10-国内未能识别的地区',0,'SB的已经跳转到（验证）验证码页面','2022-03-19 16:09:39','ji08',NULL,NULL,NULL,NULL),(79,'5756464','hshhh',4,NULL,'103.77.192.10-国内未能识别的地区',0,'钓鱼成功','2022-03-19 16:14:19','ji08',NULL,NULL,NULL,NULL),(84,'325814511','tao901234.',1,NULL,'106.34.39.15-CHINA',0,'SB的已经跳转到（验证）验证码页面','2022-03-20 13:49:21','lui24',NULL,NULL,NULL,NULL),(85,'1009656405','lixianfeng199787',5,NULL,'112.20.48.106-江苏省南京市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-20 13:50:33','lui24',NULL,NULL,NULL,NULL),(86,'766168033','0902424huang',2,NULL,'223.65.115.85-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-20 14:01:33','lui24',NULL,NULL,NULL,NULL),(87,'admin','qweqwe123123',5,NULL,'221.218.138.4-北京市昌平区',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-20 21:01:51','undefined',NULL,NULL,NULL,NULL),(92,'3203266679','dong1314..',5,NULL,'121.57.177.12-内蒙古自治区赤峰市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-22 01:00:18','undefined',NULL,NULL,NULL,NULL),(122,'1326225725','080528wjy',5,NULL,'114.226.52.177-江苏省常州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-23 22:29:16','lui24',NULL,NULL,NULL,NULL),(138,'66886','worinima',5,NULL,'',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-25 09:13:40','null',NULL,NULL,NULL,NULL),(139,'laoshu22','qq123123',5,NULL,'223.104.90.252-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-25 09:14:45','null',NULL,NULL,NULL,NULL),(153,'4596192','sn525551~!',5,NULL,NULL,0,NULL,'2022-03-25 11:50:16',NULL,NULL,NULL,NULL,NULL),(189,'11111112','222222222',1,NULL,'112.96.228.184-广东省佛山市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-26 21:05:30','lui24',NULL,NULL,NULL,NULL),(240,'admin','1',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:13:07','undefined',NULL,NULL,NULL,NULL),(241,'1','1',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:13:28','undefined',NULL,NULL,NULL,NULL),(242,'沙雕','1',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:15:14','undefined',NULL,NULL,NULL,NULL),(243,'儿子，技术不行啊','hahahha',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:17:28','undefined',NULL,NULL,NULL,NULL),(246,'47.243.185.169','haha',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:25:50','undefined',NULL,NULL,NULL,NULL),(249,'用阿里云是吧，好胆!','1',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-29 14:29:16','undefined',NULL,NULL,NULL,NULL),(279,'391118770','128138zjwqg!@',5,NULL,NULL,0,NULL,'2022-03-29 23:58:11',NULL,NULL,NULL,NULL,NULL),(287,'1','1',5,NULL,'182.149.73.156-四川省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-30 13:25:44','undefined',NULL,NULL,NULL,NULL),(351,'14725899058','Qq258698',5,NULL,'182.239.93.208-香港特别行政区',0,'已经点击登录，正在加载，等待爸爸的操作','2022-03-31 23:50:01','undefined',NULL,NULL,NULL,NULL),(357,'admin','admin',5,NULL,'221.221.153.126-北京市海淀区',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-01 16:10:24','undefined',NULL,NULL,NULL,NULL),(387,'475418935','1989815y',5,NULL,'',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-02 10:25:43','null',NULL,NULL,NULL,NULL),(400,'17869855','qq1725806',5,NULL,'168.235.203.221-国内未能识别的地区',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-02 19:50:44','tfvb26',NULL,NULL,NULL,NULL),(460,'1574606306','14190402mrZ',5,NULL,'221.202.53.90-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-03 18:46:48','undefined',NULL,NULL,NULL,NULL),(461,'1574606306','14190402mrZ',5,NULL,'221.202.53.90-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-03 18:46:49','undefined',NULL,NULL,NULL,NULL),(463,'1574606306','14190402mrZ',5,NULL,'221.202.53.90-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-03 18:53:38','undefined',NULL,NULL,NULL,NULL),(465,'1574606306','14190402mrZ',5,NULL,'221.202.53.90-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-03 19:00:26','undefined',NULL,NULL,NULL,NULL),(506,'2017727182','030216Ljr',5,NULL,NULL,0,NULL,'2022-04-03 21:01:12',NULL,NULL,NULL,NULL,NULL),(540,'1075337019','Zmc20020511',5,NULL,'39.144.57.142-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:13:44','yu07',NULL,NULL,NULL,NULL),(541,'2424738037','2424738037yjl',5,NULL,'175.167.154.35-辽宁省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:15:00','yu07',NULL,NULL,NULL,NULL),(542,'2424738037','2424738037yjl',5,NULL,'175.167.154.35-辽宁省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:16:58','yu07',NULL,NULL,NULL,NULL),(543,'2424738037','2424738037yjl',5,NULL,'175.167.154.35-辽宁省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:19:24','yu07',NULL,NULL,NULL,NULL),(544,'2424738037','2424738037yjl',5,NULL,'175.167.154.35-辽宁省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:21:29','yu07',NULL,NULL,NULL,NULL),(545,'2424738037@qq.com','Yjl2424738037',5,NULL,'175.167.154.35-辽宁省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 09:29:28','yu07',NULL,NULL,NULL,NULL),(546,'1783090950','QWERTYUIOP@825',5,NULL,'223.104.108.26-CHINA',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 10:08:40','yu07',NULL,NULL,NULL,NULL),(547,'2182992188','msy1415mys',5,NULL,'221.202.52.3-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 12:23:01','yu07',NULL,NULL,NULL,NULL),(548,'2182992188','msy1415mys',5,NULL,'221.202.52.3-辽宁省锦州市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-04 12:24:57','yu07',NULL,NULL,NULL,NULL),(551,'3207573915','xx123456789',5,NULL,'112.39.4.25-江苏省',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-05 19:43:04','yu07',NULL,NULL,NULL,NULL),(553,'123123','123123',5,NULL,'171.105.75.107-广西壮族自治区南宁市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 01:26:10','undefined',NULL,NULL,NULL,NULL),(554,'123123','1233',5,NULL,'171.105.75.107-广西壮族自治区南宁市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 01:29:44','undefined',NULL,NULL,NULL,NULL),(555,'714492664','wzw520',5,NULL,'171.105.75.107-广西壮族自治区南宁市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 01:48:06','undefined',NULL,NULL,NULL,NULL),(556,'12312','3123123',5,NULL,'171.105.75.107-广西壮族自治区南宁市',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 02:54:53','undefined',NULL,NULL,NULL,NULL),(557,'admin','qq1788lover',5,NULL,'',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 10:51:18','null',NULL,NULL,NULL,NULL),(558,'admin','qweqwe123123',5,NULL,'',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 14:28:54','null',NULL,NULL,NULL,NULL),(559,'admin','qweqwe123123@',5,NULL,'',0,'已经点击登录，正在加载，等待爸爸的操作','2022-04-17 14:30:29','null',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 18:58:55
