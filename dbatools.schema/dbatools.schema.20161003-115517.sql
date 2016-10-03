-- MySQL dump 10.13  Distrib 5.6.32, for osx10.8 (x86_64)
--
-- Host: localhost    Database: dbatools
-- ------------------------------------------------------
-- Server version	5.6.32

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
-- Table structure for table `innodb_lock_monitor`
--

DROP TABLE IF EXISTS `innodb_lock_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_lock_monitor` (
  `innodb_lock_monitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`innodb_lock_monitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_lock_monitor`
--

LOCK TABLES `innodb_lock_monitor` WRITE;
/*!40000 ALTER TABLE `innodb_lock_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `innodb_lock_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `revision_num` char(8) NOT NULL,
  `github_commit_hash` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of initial creation.',
  PRIMARY KEY (`revision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,'0.0.5','0a44a7a','2016-08-31 18:08:09'),(2,'0.0.6','f6a38ea','2016-09-01 23:45:09'),(3,'0.0.7','4dbe296','2016-09-12 23:10:00'),(4,'0.0.8','efae195','2016-09-26 23:00:00'),(5,'0.0.9','8014e02','2016-09-27 21:00:00'),(6,'0.1.0','','2016-10-03 18:15:00');
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_table_sizes`
--

DROP TABLE IF EXISTS `stats_table_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_table_sizes` (
  `STATS_TABLE_SIZES_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SERVER_HOSTNAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `STATS_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of data collection.',
  PRIMARY KEY (`STATS_TABLE_SIZES_ID`),
  UNIQUE KEY `ux_stats_date_table_schema_table_name` (`STATS_DATE`,`TABLE_SCHEMA`,`TABLE_NAME`),
  KEY `ix_table_schema_table_name` (`TABLE_SCHEMA`,`TABLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_table_sizes`
--

LOCK TABLES `stats_table_sizes` WRITE;
/*!40000 ALTER TABLE `stats_table_sizes` DISABLE KEYS */;
INSERT INTO `stats_table_sizes` VALUES (1,'bumbles.local','dbatools','innodb_lock_monitor','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(2,'bumbles.local','dbatools','revision','InnoDB',6,16384,0,0,7,'2016-10-03 18:54:28'),(3,'bumbles.local','dbatools','stats_table_sizes','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(4,'bumbles.local','mysql','columns_priv','MyISAM',0,0,4096,0,NULL,'2016-10-03 18:54:28'),(5,'bumbles.local','mysql','db','MyISAM',3,1320,5120,0,NULL,'2016-10-03 18:54:28'),(6,'bumbles.local','mysql','event','MyISAM',0,0,2048,0,NULL,'2016-10-03 18:54:28'),(7,'bumbles.local','mysql','func','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(8,'bumbles.local','mysql','general_log','CSV',2,0,0,0,NULL,'2016-10-03 18:54:28'),(9,'bumbles.local','mysql','help_category','MyISAM',40,1120,3072,0,NULL,'2016-10-03 18:54:28'),(10,'bumbles.local','mysql','help_keyword','MyISAM',611,120367,21504,0,NULL,'2016-10-03 18:54:28'),(11,'bumbles.local','mysql','help_relation','MyISAM',1218,10962,21504,0,NULL,'2016-10-03 18:54:28'),(12,'bumbles.local','mysql','help_topic','MyISAM',583,566956,22528,0,NULL,'2016-10-03 18:54:28'),(13,'bumbles.local','mysql','innodb_index_stats','InnoDB',3241,425984,0,0,NULL,'2016-10-03 18:54:28'),(14,'bumbles.local','mysql','innodb_table_stats','InnoDB',364,65536,0,0,NULL,'2016-10-03 18:54:28'),(15,'bumbles.local','mysql','ndb_binlog_index','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(16,'bumbles.local','mysql','plugin','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(17,'bumbles.local','mysql','proc','MyISAM',48,271636,8192,58024,NULL,'2016-10-03 18:54:28'),(18,'bumbles.local','mysql','procs_priv','MyISAM',0,0,4096,0,NULL,'2016-10-03 18:54:28'),(19,'bumbles.local','mysql','proxies_priv','MyISAM',2,1386,5120,0,NULL,'2016-10-03 18:54:28'),(20,'bumbles.local','mysql','servers','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(21,'bumbles.local','mysql','slave_master_info','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(22,'bumbles.local','mysql','slave_relay_log_info','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(23,'bumbles.local','mysql','slave_worker_info','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(24,'bumbles.local','mysql','slow_log','CSV',2,0,0,0,NULL,'2016-10-03 18:54:28'),(25,'bumbles.local','mysql','tables_priv','MyISAM',0,0,4096,0,NULL,'2016-10-03 18:54:28'),(26,'bumbles.local','mysql','time_zone','MyISAM',0,0,1024,0,1,'2016-10-03 18:54:28'),(27,'bumbles.local','mysql','time_zone_leap_second','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(28,'bumbles.local','mysql','time_zone_name','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(29,'bumbles.local','mysql','time_zone_transition','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(30,'bumbles.local','mysql','time_zone_transition_type','MyISAM',0,0,1024,0,NULL,'2016-10-03 18:54:28'),(31,'bumbles.local','mysql','user','MyISAM',8,1032,2048,0,NULL,'2016-10-03 18:54:28'),(32,'bumbles.local','promo2','JH_1_col','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(33,'bumbles.local','promo2','JH_2_col','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(34,'bumbles.local','promo2','JH_3_col','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(35,'bumbles.local','promo2','JH_dac','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(36,'bumbles.local','promo2','JH_globalBlacklist','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(37,'bumbles.local','promo2','JH_mps_1_28_2015','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(38,'bumbles.local','promo2','JH_nielsen_url_backup','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(39,'bumbles.local','promo2','JH_safe_acct','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(40,'bumbles.local','promo2','JH_site_safety_2_4_2015','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(41,'bumbles.local','promo2','JH_sites','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(42,'bumbles.local','promo2','JH_topics','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(43,'bumbles.local','promo2','account','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(44,'bumbles.local','promo2','account_advertiser','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(45,'bumbles.local','promo2','account_advertiser_media_placement','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(46,'bumbles.local','promo2','account_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(47,'bumbles.local','promo2','action_pixel','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(48,'bumbles.local','promo2','action_pixel_list','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(49,'bumbles.local','promo2','action_pixel_template','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(50,'bumbles.local','promo2','action_pixel_template_content','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(51,'bumbles.local','promo2','ad','InnoDB',0,16384,131072,0,1,'2016-10-03 18:54:28'),(52,'bumbles.local','promo2','ad_class','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(53,'bumbles.local','promo2','ad_creative_attribute_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(54,'bumbles.local','promo2','ad_expand_direction_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(55,'bumbles.local','promo2','ad_external','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(56,'bumbles.local','promo2','ad_part','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(57,'bumbles.local','promo2','ad_pixel','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(58,'bumbles.local','promo2','ad_plugin','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(59,'bumbles.local','promo2','ad_product_category_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(60,'bumbles.local','promo2','ad_recovery','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(61,'bumbles.local','promo2','ad_restricted_category_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(62,'bumbles.local','promo2','ad_sensitive_category_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(63,'bumbles.local','promo2','ad_server','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(64,'bumbles.local','promo2','ad_server_service','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(65,'bumbles.local','promo2','ad_server_template','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(66,'bumbles.local','promo2','ad_template','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(67,'bumbles.local','promo2','ad_unit_js_template','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(68,'bumbles.local','promo2','ad_vendor_attribute_list','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(69,'bumbles.local','promo2','admax_alert','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(70,'bumbles.local','promo2','admax_log','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(71,'bumbles.local','promo2','admax_template','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(72,'bumbles.local','promo2','advertiser_media_property','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(73,'bumbles.local','promo2','asset','InnoDB',0,16384,98304,0,1,'2016-10-03 18:54:28'),(74,'bumbles.local','promo2','asset_external','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(75,'bumbles.local','promo2','asset_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(76,'bumbles.local','promo2','base_plan','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(77,'bumbles.local','promo2','blacklist','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(78,'bumbles.local','promo2','blacklist_old','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(79,'bumbles.local','promo2','blacklist_unmapped','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(80,'bumbles.local','promo2','blocked_ip','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(81,'bumbles.local','promo2','blue_kai_inventory','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(82,'bumbles.local','promo2','brand_dashboard_account_name','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(83,'bumbles.local','promo2','brand_dashboard_accounts','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(84,'bumbles.local','promo2','brand_report_generated','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(85,'bumbles.local','promo2','brand_report_sections','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(86,'bumbles.local','promo2','brand_report_subscribers','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(87,'bumbles.local','promo2','brand_report_subscriptions','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(88,'bumbles.local','promo2','brand_reports','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(89,'bumbles.local','promo2','brand_reports_brand_report_sections','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(90,'bumbles.local','promo2','brand_safety_category','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(91,'bumbles.local','promo2','brand_safety_provider','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(92,'bumbles.local','promo2','brand_safety_provider_brand_safety_category','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(93,'bumbles.local','promo2','campaign','InnoDB',0,16384,81920,0,NULL,'2016-10-03 18:54:28'),(94,'bumbles.local','promo2','campaign_audit','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(95,'bumbles.local','promo2','campaign_city_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(96,'bumbles.local','promo2','campaign_conversion_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(97,'bumbles.local','promo2','campaign_country_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(98,'bumbles.local','promo2','campaign_electoral_district_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(99,'bumbles.local','promo2','campaign_facebook','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(100,'bumbles.local','promo2','campaign_goal','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(101,'bumbles.local','promo2','campaign_goal_log','InnoDB',9,147456,0,0,1,'2016-10-03 18:54:28'),(102,'bumbles.local','promo2','campaign_media_placement','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(103,'bumbles.local','promo2','campaign_media_placement_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(104,'bumbles.local','promo2','campaign_metro_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(105,'bumbles.local','promo2','campaign_optimization_goal','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(106,'bumbles.local','promo2','campaign_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(107,'bumbles.local','promo2','campaign_placement','InnoDB',342966,144408576,96763904,4194304,668228,'2016-10-03 18:54:28'),(108,'bumbles.local','promo2','campaign_placement_ad_external','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(109,'bumbles.local','promo2','campaign_placement_brand_safety_category_list','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(110,'bumbles.local','promo2','campaign_placement_change_log','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(111,'bumbles.local','promo2','campaign_placement_conversion_pixel','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(112,'bumbles.local','promo2','campaign_placement_device_targeting','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(113,'bumbles.local','promo2','campaign_placement_experiment','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(114,'bumbles.local','promo2','campaign_placement_fee_history_old','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(115,'bumbles.local','promo2','campaign_placement_goal','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(116,'bumbles.local','promo2','campaign_placement_goal_log','InnoDB',9,147456,0,0,1,'2016-10-03 18:54:28'),(117,'bumbles.local','promo2','campaign_placement_isp_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(118,'bumbles.local','promo2','campaign_placement_media_property_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(119,'bumbles.local','promo2','campaign_placement_optimization_goal','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(120,'bumbles.local','promo2','campaign_placement_partner_extension_provider','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(121,'bumbles.local','promo2','campaign_placement_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(122,'bumbles.local','promo2','campaign_placement_prebid_targeting_profile','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(123,'bumbles.local','promo2','campaign_placement_site_category_targeting','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(124,'bumbles.local','promo2','campaign_placement_site_tier_targeting','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(125,'bumbles.local','promo2','campaign_placement_tag_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(126,'bumbles.local','promo2','campaign_postal_code_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(127,'bumbles.local','promo2','campaign_site_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(128,'bumbles.local','promo2','campaign_state_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(129,'bumbles.local','promo2','campaign_topic_targeting','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(130,'bumbles.local','promo2','campaign_vendor_list','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(131,'bumbles.local','promo2','campaign_vendor_list_audit','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(132,'bumbles.local','promo2','checksum','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(133,'bumbles.local','promo2','checksums','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(134,'bumbles.local','promo2','city','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(135,'bumbles.local','promo2','conversion_pixel','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(136,'bumbles.local','promo2','country','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(137,'bumbles.local','promo2','creative_attribute','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(138,'bumbles.local','promo2','db2552','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(139,'bumbles.local','promo2','db2609','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(140,'bumbles.local','promo2','db2794','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(141,'bumbles.local','promo2','db3742_account_advertiser_facebook','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(142,'bumbles.local','promo2','db3742_asset_facebook','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(143,'bumbles.local','promo2','db3742_campaign_placement_facebook_targeting','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(144,'bumbles.local','promo2','db4191','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(145,'bumbles.local','promo2','demographic_targeting','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(146,'bumbles.local','promo2','demographic_user_segment','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(147,'bumbles.local','promo2','device_information','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(148,'bumbles.local','promo2','display_code_template','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(149,'bumbles.local','promo2','electoral_district','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(150,'bumbles.local','promo2','event','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(151,'bumbles.local','promo2','expand_direction','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(152,'bumbles.local','promo2','experiment','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(153,'bumbles.local','promo2','experiment_user_segment','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(154,'bumbles.local','promo2','external_segment','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(155,'bumbles.local','promo2','facebook_ad_email_change_log','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(156,'bumbles.local','promo2','facebook_campaign_placement_email_change_log','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(157,'bumbles.local','promo2','flight','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(158,'bumbles.local','promo2','flight_ad','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(159,'bumbles.local','promo2','geo_boundaries','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(160,'bumbles.local','promo2','global_blacklist_seller','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(161,'bumbles.local','promo2','global_blacklist_unmapped','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(162,'bumbles.local','promo2','goal_interval','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(163,'bumbles.local','promo2','goal_metric','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(164,'bumbles.local','promo2','goal_type','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(165,'bumbles.local','promo2','google_geos','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(166,'bumbles.local','promo2','google_product_category','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(167,'bumbles.local','promo2','google_product_category2','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(168,'bumbles.local','promo2','google_restricted_category','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(169,'bumbles.local','promo2','google_sensitive_category','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(170,'bumbles.local','promo2','google_sensitive_category2','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(171,'bumbles.local','promo2','inplay_opt_out','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(172,'bumbles.local','promo2','insertion_order','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(173,'bumbles.local','promo2','isp_by_location','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(174,'bumbles.local','promo2','isp_information','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(175,'bumbles.local','promo2','language','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(176,'bumbles.local','promo2','logging_forecast','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(177,'bumbles.local','promo2','mariadb_checksum','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(178,'bumbles.local','promo2','maxmind_city','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(179,'bumbles.local','promo2','maxmind_country','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(180,'bumbles.local','promo2','maxmind_region','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(181,'bumbles.local','promo2','media_placement','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(182,'bumbles.local','promo2','media_placement_change_log','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(183,'bumbles.local','promo2','media_placement_tag','InnoDB',944,81920,49152,0,NULL,'2016-10-03 18:54:28'),(184,'bumbles.local','promo2','media_property','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(185,'bumbles.local','promo2','media_property_city','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(186,'bumbles.local','promo2','media_property_city_hive','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(187,'bumbles.local','promo2','media_property_country','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(188,'bumbles.local','promo2','media_property_country_hive','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(189,'bumbles.local','promo2','media_property_creative_attribute','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(190,'bumbles.local','promo2','media_property_expand_direction','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(191,'bumbles.local','promo2','media_property_metro','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(192,'bumbles.local','promo2','media_property_metro_hive','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(193,'bumbles.local','promo2','media_property_pixel_exclusion','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(194,'bumbles.local','promo2','media_property_postal_code','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(195,'bumbles.local','promo2','media_property_product_category','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(196,'bumbles.local','promo2','media_property_restricted_category','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(197,'bumbles.local','promo2','media_property_sensitive_category','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(198,'bumbles.local','promo2','media_property_site','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(199,'bumbles.local','promo2','media_property_state','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(200,'bumbles.local','promo2','media_property_state_hive','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(201,'bumbles.local','promo2','media_property_state_zone_weight','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(202,'bumbles.local','promo2','media_property_vendor_attribute','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(203,'bumbles.local','promo2','metro','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(204,'bumbles.local','promo2','metro_state','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(205,'bumbles.local','promo2','mrgdb_chng_ntfctn','InnoDB',7,114688,0,0,1,'2016-10-03 18:54:28'),(206,'bumbles.local','promo2','new_publisher','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(207,'bumbles.local','promo2','new_tpas_mapping','InnoDB',0,16384,49152,0,NULL,'2016-10-03 18:54:28'),(208,'bumbles.local','promo2','new_tv_campaign_placement','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(209,'bumbles.local','promo2','nielsen_statistic_history','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(210,'bumbles.local','promo2','nielsen_universe','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(211,'bumbles.local','promo2','optimization_goal','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(212,'bumbles.local','promo2','package','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(213,'bumbles.local','promo2','package_audit','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(214,'bumbles.local','promo2','package_dba','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(215,'bumbles.local','promo2','package_dba2','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(216,'bumbles.local','promo2','package_goal','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(217,'bumbles.local','promo2','package_goal_log','InnoDB',9,147456,0,0,1,'2016-10-03 18:54:28'),(218,'bumbles.local','promo2','package_optimization_goal','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(219,'bumbles.local','promo2','package_pixel','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(220,'bumbles.local','promo2','package_type','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(221,'bumbles.local','promo2','parent_rate_card','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(222,'bumbles.local','promo2','partner','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(223,'bumbles.local','promo2','pixel','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(224,'bumbles.local','promo2','pixel_integration','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(225,'bumbles.local','promo2','placement_site','InnoDB',151908,52019200,18972672,4194304,684478,'2016-10-03 18:54:28'),(226,'bumbles.local','promo2','placement_site_category','InnoDB',1369596,66732032,41500672,4194304,NULL,'2016-10-03 18:54:28'),(227,'bumbles.local','promo2','placement_site_hive','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(228,'bumbles.local','promo2','placement_site_property','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(229,'bumbles.local','promo2','placement_site_tag','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(230,'bumbles.local','promo2','planning','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(231,'bumbles.local','promo2','postal_code','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(232,'bumbles.local','promo2','postal_code_electoral_district','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(233,'bumbles.local','promo2','prebid_targeting_profile','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(234,'bumbles.local','promo2','premium_inventory_new_advertiser','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(235,'bumbles.local','promo2','product_category','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(236,'bumbles.local','promo2','programmatic_reserve','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(237,'bumbles.local','promo2','promoted_ad','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(238,'bumbles.local','promo2','promoted_ad_external','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(239,'bumbles.local','promo2','promoted_ad_new','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(240,'bumbles.local','promo2','promoted_ad_snippet','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(241,'bumbles.local','promo2','promoted_site_video','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(242,'bumbles.local','promo2','promoted_site_video_old','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(243,'bumbles.local','promo2','promoted_video','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(244,'bumbles.local','promo2','promotion_player','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(245,'bumbles.local','promo2','ptv_campaign_placement','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(246,'bumbles.local','promo2','ptv_user_segment','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(247,'bumbles.local','promo2','publisher_report','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(248,'bumbles.local','promo2','publisher_report_file','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(249,'bumbles.local','promo2','publisher_report_media_placement','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(250,'bumbles.local','promo2','publisher_report_stat','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(251,'bumbles.local','promo2','ranked_demand_by_feed','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(252,'bumbles.local','promo2','rate_card','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(253,'bumbles.local','promo2','restricted_category','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(254,'bumbles.local','promo2','rtb_account_suspend_renamed','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(255,'bumbles.local','promo2','rtb_bid_codes','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(256,'bumbles.local','promo2','rtb_campaign_placement_adpop_renamed','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(257,'bumbles.local','promo2','rtb_campaign_placement_fill_renamed','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(258,'bumbles.local','promo2','rtb_last_update_renamed','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(259,'bumbles.local','promo2','rtb_zone','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(260,'bumbles.local','promo2','screenshot_info','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(261,'bumbles.local','promo2','screenshot_status','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(262,'bumbles.local','promo2','sensitive_category','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(263,'bumbles.local','promo2','service','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(264,'bumbles.local','promo2','service_context','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(265,'bumbles.local','promo2','service_fee','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(266,'bumbles.local','promo2','service_provider','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(267,'bumbles.local','promo2','site','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(268,'bumbles.local','promo2','site_category','InnoDB',2140,180224,0,0,80610,'2016-10-03 18:54:28'),(269,'bumbles.local','promo2','site_list','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(270,'bumbles.local','promo2','site_list_site','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(271,'bumbles.local','promo2','state','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(272,'bumbles.local','promo2','survey','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(273,'bumbles.local','promo2','survey_answer','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(274,'bumbles.local','promo2','survey_lift_metric','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(275,'bumbles.local','promo2','survey_question','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(276,'bumbles.local','promo2','tab_chunks_delay','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(277,'bumbles.local','promo2','tab_chunks_log','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(278,'bumbles.local','promo2','tag','InnoDB',2205,311296,180224,0,5050,'2016-10-03 18:54:28'),(279,'bumbles.local','promo2','targeting_segment','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(280,'bumbles.local','promo2','temp_addthis_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(281,'bumbles.local','promo2','temp_adobe_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(282,'bumbles.local','promo2','temp_adserver','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(283,'bumbles.local','promo2','temp_aggk_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(284,'bumbles.local','promo2','temp_as2_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(285,'bumbles.local','promo2','temp_bluekai_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(286,'bumbles.local','promo2','temp_bluekai_segments2','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(287,'bumbles.local','promo2','temp_datalogix_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(288,'bumbles.local','promo2','temp_exelate_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(289,'bumbles.local','promo2','temp_eyeota_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(290,'bumbles.local','promo2','temp_ibehavior_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(291,'bumbles.local','promo2','temp_jiwire_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(292,'bumbles.local','promo2','temp_kijiji_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(293,'bumbles.local','promo2','temp_krux_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(294,'bumbles.local','promo2','temp_liveramp_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(295,'bumbles.local','promo2','temp_lotame_s2s_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(296,'bumbles.local','promo2','temp_lotame_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(297,'bumbles.local','promo2','temp_lotames2smobile_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(298,'bumbles.local','promo2','temp_neustar_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(299,'bumbles.local','promo2','temp_ogilvy_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(300,'bumbles.local','promo2','temp_partner_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(301,'bumbles.local','promo2','temp_quantcast_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(302,'bumbles.local','promo2','temp_temp_partner','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(303,'bumbles.local','promo2','temp_vasya','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(304,'bumbles.local','promo2','temp_visualdna_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(305,'bumbles.local','promo2','temp_weborama_segments','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(306,'bumbles.local','promo2','test_repl','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(307,'bumbles.local','promo2','third_party_ad','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(308,'bumbles.local','promo2','third_party_companion','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(309,'bumbles.local','promo2','third_party_linear','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(310,'bumbles.local','promo2','third_party_media_file','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(311,'bumbles.local','promo2','third_party_vast','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(312,'bumbles.local','promo2','timezone','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(313,'bumbles.local','promo2','timezone2','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(314,'bumbles.local','promo2','tm_demo_polarized_items','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(315,'bumbles.local','promo2','tmp_campaign_media_placement_targeting','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(316,'bumbles.local','promo2','tmp_promoted_ad_id','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(317,'bumbles.local','promo2','tmp_ptv','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(318,'bumbles.local','promo2','topic','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(319,'bumbles.local','promo2','tpas_audit','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(320,'bumbles.local','promo2','tpas_billing_metrics','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(321,'bumbles.local','promo2','tpas_billing_unit','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(322,'bumbles.local','promo2','tpas_billing_unit_config','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(323,'bumbles.local','promo2','tpas_billing_unit_mapping','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(324,'bumbles.local','promo2','tpas_campaign','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(325,'bumbles.local','promo2','tpas_file','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(326,'bumbles.local','promo2','tpas_mapping_retired','InnoDB',0,16384,49152,0,NULL,'2016-10-03 18:54:28'),(327,'bumbles.local','promo2','tpas_metric_type','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(328,'bumbles.local','promo2','tpas_metrics','InnoDB',0,16384,65536,0,1,'2016-10-03 18:54:28'),(329,'bumbles.local','promo2','tpas_package','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(330,'bumbles.local','promo2','tpas_placement','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(331,'bumbles.local','promo2','tpas_stat','InnoDB',0,16384,49152,0,1,'2016-10-03 18:54:28'),(332,'bumbles.local','promo2','traffic_estimates_by_site','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(333,'bumbles.local','promo2','traffic_estimates_by_site_by_country','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(334,'bumbles.local','promo2','traffic_estimates_site','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(335,'bumbles.local','promo2','traffic_estimates_site_preroll','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(336,'bumbles.local','promo2','traffic_estimates_state','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(337,'bumbles.local','promo2','trafficking_postal_code_aux','InnoDB',7,114688,114688,0,1,'2016-10-03 18:54:28'),(338,'bumbles.local','promo2','trafficking_site_aux','InnoDB',7,114688,114688,0,1,'2016-10-03 18:54:28'),(339,'bumbles.local','promo2','trafficking_targeting_aux','InnoDB',7,114688,114688,0,1,'2016-10-03 18:54:28'),(340,'bumbles.local','promo2','tv_brand','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(341,'bumbles.local','promo2','tv_brand_data','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(342,'bumbles.local','promo2','tv_brand_distributor','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(343,'bumbles.local','promo2','tv_brand_distributor_spend','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(344,'bumbles.local','promo2','tv_brand_reach','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(345,'bumbles.local','promo2','tv_brand_site','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(346,'bumbles.local','promo2','tv_campaign_placement','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(347,'bumbles.local','promo2','tv_distributor','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(348,'bumbles.local','promo2','tv_segment','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(349,'bumbles.local','promo2','tv_universe','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(350,'bumbles.local','promo2','updated_id','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(351,'bumbles.local','promo2','upload_category','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(352,'bumbles.local','promo2','user_data_hierarchy','InnoDB',0,16384,32768,0,NULL,'2016-10-03 18:54:28'),(353,'bumbles.local','promo2','user_segment','InnoDB',0,16384,32768,0,1,'2016-10-03 18:54:28'),(354,'bumbles.local','promo2','user_segment_count','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(355,'bumbles.local','promo2','user_segment_service','InnoDB',0,16384,16384,0,NULL,'2016-10-03 18:54:28'),(356,'bumbles.local','promo2','user_segment_user_data_hierarchy','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(357,'bumbles.local','promo2','vast_data','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(358,'bumbles.local','promo2','vendor','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(359,'bumbles.local','promo2','vendor_attribute','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(360,'bumbles.local','promo2','white_label_logo','InnoDB',0,16384,16384,0,1,'2016-10-03 18:54:28'),(361,'bumbles.local','promo2','wideorbit_ad','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(362,'bumbles.local','promo2','wideorbit_advertiser','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(363,'bumbles.local','promo2','wideorbit_agency','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(364,'bumbles.local','promo2','zid','InnoDB',0,16384,0,0,1,'2016-10-03 18:54:28'),(365,'bumbles.local','promo2','zmp','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(366,'bumbles.local','promo2','zpixel','InnoDB',0,16384,0,0,NULL,'2016-10-03 18:54:28'),(367,'bumbles.local','tm_source_live','account','InnoDB',309628,75087872,41058304,5242880,456551,'2016-10-03 18:54:28');
/*!40000 ALTER TABLE `stats_table_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbatools'
--
/*!50003 DROP PROCEDURE IF EXISTS `AUTH_USER_PASS_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH_USER_PASS_UPDATE`(
  IN q_username CHAR(64),
  IN q_passwd VARCHAR(64))
    COMMENT 'Update password for a user ARGV1, with specified password as ARGV2. mysql> call AUTH_USER_PASS_UPDATE("user","newpass")'
proc_label:BEGIN

IF q_username IS NULL OR q_username = '' THEN
  SELECT "ERROR: ARGV1 not set. Syntax: AUTH_USER_PASS_UPDATE('username','newpass');" AS error;
  LEAVE proc_label;
END IF;

IF q_passwd IS NULL OR q_passwd = '' THEN
  SELECT "ERROR: ARGV2 not set. Syntax: AUTH_USER_PASS_UPDATE('username','newpass');" AS error;
  LEAVE proc_label;
END IF;

UPDATE mysql.user SET Password=PASSWORD(q_passwd) WHERE User=q_username;
SELECT CONCAT("Updated user [",q_username, "] to password [", q_passwd,"]") AS output;
FLUSH PRIVILEGES;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AUTH_USER_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AUTH_USER_SEARCH`(
  IN q_username CHAR(64))
    COMMENT 'Lists permissions for a given username. mysql> call AUTH_USER_SEARCH("foo")'
proc_label:BEGIN

IF q_username IS NULL OR q_username = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a username via mysql> call AUTH_USER_SEARCH('foo');" AS error;
  LEAVE proc_label;

ELSE
  SELECT * FROM mysql.user WHERE User LIKE CONCAT('%', q_username , '%') ORDER BY User,Host;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HELP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HELP`()
    COMMENT 'Show the help menu for dbatools schema. mysql> call HELP()'
proc_label:BEGIN

SELECT ROUTINE_NAME, ROUTINE_COMMENT
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_SCHEMA = 'dbatools'
  ORDER BY ROUTINE_NAME;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INNODB_BUFFER_POOL_RECOMMEND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INNODB_BUFFER_POOL_RECOMMEND`()
    COMMENT 'Calcs recommended innodb_buffer_pool_size. mysql> call INNODB_BUFFER_POOL_RECOMMEND()'
proc_label:BEGIN

SELECT CONCAT(CEILING(RIBPS/POWER(1024,pw)),SUBSTR(' KMGT',pw+1,1))
  recommended_innodb_buffer_pool_size FROM
    (
      SELECT RIBPS,FLOOR(LOG(RIBPS)/LOG(1024)) pw
      FROM
        (
          SELECT SUM(data_length+index_length)*1.1*growth RIBPS
          FROM information_schema.tables AAA,
          (SELECT 1.25 growth) BBB
            WHERE ENGINE='InnoDB'
          ) AA
        ) A;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_CONNECTION_SUMMARY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_CONNECTION_SUMMARY`()
    COMMENT 'Improved version of "show processlist". mysql> call REPORT_CONNECTION_SUMMARY()'
proc_label:BEGIN

SELECT user AS username, SUBSTRING_INDEX(host, ':', 1) AS hostname, COUNT(id) AS connections
  FROM information_schema.processlist
  GROUP BY CONCAT(user,'@',(SUBSTRING_INDEX(host, ':', 1)))
  ORDER BY connections DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_ENGINE_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_ENGINE_STATS`()
    COMMENT 'Generates engine usage repoprt (MyISAM, INNODB, MEMORY). mysql> call REPORT_ENGINE_STATS()'
proc_label:BEGIN

SELECT
-- TOTALS
ROUND(((data_size + index_size) / gb),4) AS total_size_gb,
ROUND((index_size / gb),4) AS index_size_gb,
ROUND((data_size / gb),4) AS data_size_gb,
ROUND((index_size / (data_size + index_size)),2) * 100 AS perc_index,
ROUND((data_size / (data_size + index_size)),2) * 100 AS perc_data,
--
-- InnoDB ENGINE REPORTING
ROUND((SUM(innodb_index_size + innodb_data_size) / gb),4) AS innodb_total_size_gb,
ROUND((innodb_data_size / gb),4) AS innodb_data_size_gb,
ROUND((innodb_index_size / gb),4) AS innodb_index_size_gb,
ROUND(innodb_index_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_index,
ROUND(innodb_data_size / (innodb_data_size + innodb_index_size),2) * 100 AS innodb_perc_data,
ROUND(innodb_index_size / index_size,2) * 100 AS innodb_perc_total_index,
ROUND(innodb_data_size / data_size,2) * 100 AS innodb_perc_total_data,
--
-- MyISAM ENGINE REPORTING
ROUND((SUM(myisam_index_size + myisam_data_size) / gb),4) AS myisam_total_size_gb,
ROUND((myisam_data_size / gb),4) AS myisam_data_size_gb,
ROUND((myisam_index_size / gb),4) AS myisam_index_size_gb,
ROUND(myisam_index_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_index,
ROUND(myisam_data_size / (myisam_data_size + myisam_index_size),2) * 100 AS myisam_perc_data,
ROUND(myisam_index_size / index_size,2) * 100 AS myisam_perc_total_index,
ROUND(myisam_data_size / data_size,2) * 100 AS myisam_perc_total_data,
--
-- MEMORY ENGINE REPORTING
ROUND((SUM(memory_index_size + memory_data_size) / gb),4) AS memory_total_size_gb,
ROUND((memory_data_size / gb),4) AS memory_data_size_gb,
ROUND((memory_index_size / gb),4) AS memory_index_size_gb,
ROUND(memory_index_size / (memory_data_size + memory_index_size),2) * 100 AS memory_perc_index,
ROUND(memory_data_size / (memory_data_size + memory_index_size),2) * 100 AS memory_perc_data,
ROUND(memory_index_size / index_size,2) * 100 AS memory_perc_total_index,
ROUND(memory_data_size / data_size,2) * 100 AS memory_perc_total_data
--
-- Generate summaries from which to analyze
FROM (
  SELECT
  SUM(data_length) data_size,
  SUM(index_length) index_size,
  SUM(if(engine = 'innodb', data_length, 0)) AS innodb_data_size,
  SUM(if(engine = 'innodb', index_length, 0)) AS innodb_index_size,
  SUM(if(engine = 'myisam', data_length, 0)) AS myisam_data_size,
  SUM(if(engine = 'myisam', index_length, 0)) AS myisam_index_size,
  SUM(if(engine = 'memory', data_length, 0)) AS memory_data_size,
  SUM(if(engine = 'memory', index_length, 0)) AS memory_index_size,
  POW(1024, 3) gb
  FROM information_schema.tables
  WHERE table_type = 'BASE TABLE') a;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_SLOW_QUERIES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_SLOW_QUERIES`()
    COMMENT 'Lists top 50 long running queries. mysql> call REPORT_SLOW_QUERIES()'
proc_label:BEGIN

SELECT id,state,command,time,left(replace(info,'\n','<lf>'),120) as Query
FROM information_schema.processlist
WHERE command <> 'Sleep'
AND info NOT LIKE '%PROCESSLIST%'
ORDER BY time DESC LIMIT 50;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_TABLE_SIZES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_TABLE_SIZES`()
    COMMENT 'Lists all tables on the server. Ordered by schema, total_size. mysql> call REPORT_TABLE_SIZES()'
proc_label:BEGIN
SELECT
   table_schema as `schema`,
   table_name AS `table`,
   round((data_length / POW(1024,2)), 2) `data_size_mb`,
   round((index_length / POW(1024,2)), 2) `index_size_mb`,
   round(((data_length + index_length) / POW(1024,2)), 2) `total_size_mb`,
   table_rows AS `rows`
FROM information_schema.TABLES
WHERE table_schema NOT IN ('information_schema','mysql','performance_schema')
ORDER BY table_schema, (data_length + index_length) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_TABLE_SIZES_ALPHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_TABLE_SIZES_ALPHA`()
    COMMENT 'Lists all tables on the server. Ordered by schema, table_name. mysql> call REPORT_TABLE_SIZES_ALPHA()'
proc_label:BEGIN
SELECT
   table_schema as `schema`,
   table_name AS `table`,
   round((data_length / POW(1024,2)), 2) `data_size_mb`,
   round((index_length / POW(1024,2)), 2) `index_size_mb`,
   round(((data_length + index_length) / POW(1024,2)), 2) `total_size_mb`,
   table_rows AS `rows`
FROM information_schema.TABLES
WHERE table_schema NOT IN ('information_schema','mysql','performance_schema')
ORDER BY table_schema, table_name ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_LIST_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_LIST_ALL`()
    COMMENT 'Lists all ROUTINES on the server. mysql> call ROUTINE_LIST_ALL()'
proc_label:BEGIN
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_LIST_SCHEMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_LIST_SCHEMA`(
  IN q_schema CHAR(64))
    COMMENT 'Lists all ROUTINES in a schema. mysql> call ROUTINE_LIST_SCHEMA("foo")'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call ROUTINE_LIST_SCHEMA('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = q_schema ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_SEARCH`(
  IN q_proc CHAR(64))
    COMMENT 'Searches for a ROUTINE by name. mysql> call ROUTINE_SEARCH("foo")'
proc_label:BEGIN

IF q_proc IS NULL OR q_proc = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call ROUTINE_SEARCH('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME LIKE CONCAT('%', q_proc , '%') ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROUTINE_SEARCH_DEFINER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROUTINE_SEARCH_DEFINER`(
  IN q_definer CHAR(64))
    COMMENT 'Lists all ROUTINES owned by a definer. mysql> call ROUTINE_SEARCH_DEFINER("foo")'
proc_label:BEGIN

IF q_definer IS NULL OR q_definer = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a definer via 'call ROUTINE_SEARCH_DEFINER('foo');'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT ROUTINE_NAME, ROUTINE_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.ROUTINES WHERE DEFINER LIKE CONCAT('%', q_definer , '%') ORDER BY ROUTINE_SCHEMA, ROUTINE_NAME;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_LIST_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_ALL`()
    COMMENT 'Lists all triggers on the server. mysql> call TRIGGER_LIST_ALL()'
proc_label:BEGIN
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS ORDER BY TRIGGER_SCHEMA, TRIGGER_NAME;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_LIST_SCHEMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_LIST_SCHEMA`(
  IN q_schema CHAR(64))
    COMMENT 'Lists all triggers in a schema. mysql> call TRIGGER_LIST_SCHEMA("foo");'
proc_label:BEGIN

IF q_schema IS NULL OR q_schema = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a schema via 'call TRIGGER_LIST_SCHEMA('foo')'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_SCHEMA = q_schema ORDER BY TRIGGER_NAME, TRIGGER_SCHEMA;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TRIGGER_SEARCH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRIGGER_SEARCH`(
  IN q_trigger CHAR(64))
    COMMENT 'Searches for a trigger by name. mysql> call TRIGGER_SEARCH("foo");'
proc_label:BEGIN

IF q_trigger IS NULL OR q_trigger = '' THEN
  SELECT "ERROR: ARGV1 not set. Specify a trigger via 'call TRIGGER_SEARCH('foo')'" AS error;
  LEAVE proc_label;

 ELSE
  SELECT TRIGGER_NAME, TRIGGER_SCHEMA, DEFINER FROM INFORMATION_SCHEMA.TRIGGERS WHERE TRIGGER_NAME LIKE CONCAT('%', q_trigger , '%') ORDER BY TRIGGER_NAME, TRIGGER_SCHEMA;
 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VERSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VERSION`()
    COMMENT 'Show the help menu for dbatools schema. mysql> call VERSION()'
proc_label:BEGIN

SELECT * FROM dbatools.revision
  ORDER BY revision_id DESC LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-03 11:55:17
