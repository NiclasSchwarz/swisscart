-- MySQL dump 10.10
--
-- Host: localhost    Database: swisscart_development
-- ------------------------------------------------------
-- Server version	5.0.18

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
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) collate latin1_general_ci NOT NULL,
  `entry_company` varchar(32) collate latin1_general_ci default NULL,
  `entry_firstname` varchar(32) collate latin1_general_ci NOT NULL,
  `entry_lastname` varchar(32) collate latin1_general_ci NOT NULL,
  `entry_street_address` varchar(64) collate latin1_general_ci NOT NULL,
  `entry_suburb` varchar(32) collate latin1_general_ci default NULL,
  `entry_postcode` varchar(10) collate latin1_general_ci NOT NULL,
  `entry_city` varchar(32) collate latin1_general_ci NOT NULL,
  `entry_state` varchar(32) collate latin1_general_ci default NULL,
  `entry_country_id` int(11) NOT NULL default '0',
  `entry_zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `address_book`
--


/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
LOCK TABLES `address_book` WRITE;
INSERT INTO `address_book` VALUES (1,1,'m','ACME Inc.','John','Doe','1 Way Street','','12345','NeverNever','',223,12),(2,2,'m','Openstream Internet Solutions','Nick','Weisser','Wieslergasse 6','','8049','Zürch','',204,129);
UNLOCK TABLES;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL auto_increment,
  `address_format` varchar(128) collate latin1_general_ci NOT NULL,
  `address_summary` varchar(48) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`address_format_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `address_format`
--


/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
LOCK TABLES `address_format` WRITE;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');
UNLOCK TABLES;
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL auto_increment,
  `banners_title` varchar(64) collate latin1_general_ci NOT NULL,
  `banners_url` varchar(255) collate latin1_general_ci NOT NULL,
  `banners_image` varchar(64) collate latin1_general_ci NOT NULL,
  `banners_group` varchar(10) collate latin1_general_ci NOT NULL,
  `banners_html_text` text collate latin1_general_ci,
  `expires_impressions` int(7) default '0',
  `expires_date` datetime default NULL,
  `date_scheduled` datetime default NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`banners_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `banners`
--


/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
LOCK TABLES `banners` WRITE;
INSERT INTO `banners` VALUES (1,'osCommerce','http://www.oscommerce.com','banners/oscommerce.gif','468x50','',0,NULL,NULL,'2007-06-12 22:50:01','2007-07-05 15:50:01',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL auto_increment,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL default '0',
  `banners_clicked` int(5) NOT NULL default '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY  (`banners_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `banners_history`
--


/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
LOCK TABLES `banners_history` WRITE;
INSERT INTO `banners_history` VALUES (1,1,21,0,'2007-06-12 22:50:08'),(2,1,176,0,'2007-06-13 02:03:37'),(3,1,196,0,'2007-07-05 00:43:57');
UNLOCK TABLES;
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `cache_id` varchar(32) collate latin1_general_ci NOT NULL default '',
  `cache_language_id` tinyint(1) NOT NULL default '0',
  `cache_name` varchar(255) collate latin1_general_ci NOT NULL default '',
  `cache_data` mediumtext collate latin1_general_ci NOT NULL,
  `cache_global` tinyint(1) NOT NULL default '1',
  `cache_gzip` tinyint(1) NOT NULL default '1',
  `cache_method` varchar(20) collate latin1_general_ci NOT NULL default 'RETURN',
  `cache_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `cache_expires` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`cache_id`,`cache_language_id`),
  KEY `cache_id` (`cache_id`),
  KEY `cache_language_id` (`cache_language_id`),
  KEY `cache_global` (`cache_global`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cache`
--


/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
LOCK TABLES `cache` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `categories_image` varchar(64) collate latin1_general_ci default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `sort_order` int(3) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `categories`
--


/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
LOCK TABLES `categories` WRITE;
INSERT INTO `categories` VALUES (1,'category_hardware.gif',0,1,'2007-06-12 22:50:01',NULL),(2,'category_software.gif',0,2,'2007-06-12 22:50:01',NULL),(3,'category_dvd_movies.gif',0,3,'2007-06-12 22:50:01',NULL),(4,'subcategory_graphic_cards.gif',1,0,'2007-06-12 22:50:01',NULL),(5,'subcategory_printers.gif',1,0,'2007-06-12 22:50:01',NULL),(6,'subcategory_monitors.gif',1,0,'2007-06-12 22:50:01',NULL),(7,'subcategory_speakers.gif',1,0,'2007-06-12 22:50:01',NULL),(8,'subcategory_keyboards.gif',1,0,'2007-06-12 22:50:01',NULL),(9,'subcategory_mice.gif',1,0,'2007-06-12 22:50:01',NULL),(10,'subcategory_action.gif',3,0,'2007-06-12 22:50:01',NULL),(11,'subcategory_science_fiction.gif',3,0,'2007-06-12 22:50:01',NULL),(12,'subcategory_comedy.gif',3,0,'2007-06-12 22:50:01',NULL),(13,'subcategory_cartoons.gif',3,0,'2007-06-12 22:50:01',NULL),(14,'subcategory_thriller.gif',3,0,'2007-06-12 22:50:01',NULL),(15,'subcategory_drama.gif',3,0,'2007-06-12 22:50:01',NULL),(16,'subcategory_memory.gif',1,0,'2007-06-12 22:50:01',NULL),(17,'subcategory_cdrom_drives.gif',1,0,'2007-06-12 22:50:01',NULL),(18,'subcategory_simulation.gif',2,0,'2007-06-12 22:50:01',NULL),(19,'subcategory_action_games.gif',2,0,'2007-06-12 22:50:01',NULL),(20,'subcategory_strategy.gif',2,0,'2007-06-12 22:50:01',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `categories_name` varchar(32) collate latin1_general_ci NOT NULL,
  `categories_seo_url` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `categories_description`
--


/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
LOCK TABLES `categories_description` WRITE;
INSERT INTO `categories_description` VALUES (1,1,'Hardware',''),(2,1,'Software',''),(3,1,'DVD Movies',''),(4,1,'Graphics Cards',''),(5,1,'Printers',''),(6,1,'Monitors',''),(7,1,'Speakers',''),(8,1,'Keyboards',''),(9,1,'Mice',''),(10,1,'Action',''),(11,1,'Science Fiction',''),(12,1,'Comedy',''),(13,1,'Cartoons',''),(14,1,'Thriller',''),(15,1,'Drama',''),(16,1,'Memory',''),(17,1,'CDROM Drives',''),(18,1,'Simulation',''),(19,1,'Action',''),(20,1,'Strategy',''),(1,2,'Hardware',''),(2,2,'Software',''),(3,2,'DVD Filme',''),(4,2,'Grafikkarten',''),(5,2,'Drucker',''),(6,2,'Bildschirme',''),(7,2,'Lautsprecher',''),(8,2,'Tastaturen',''),(9,2,'Mäuse',''),(10,2,'Action',''),(11,2,'Science Fiction',''),(12,2,'Komödie',''),(13,2,'Zeichentrick',''),(14,2,'Thriller',''),(15,2,'Drama',''),(16,2,'Speicher',''),(17,2,'CDROM Laufwerke',''),(18,2,'Simulation',''),(19,2,'Action',''),(20,2,'Strategie',''),(1,3,'Hardware',''),(2,3,'Software',''),(3,3,'Peliculas DVD',''),(4,3,'Tarjetas Graficas',''),(5,3,'Impresoras',''),(6,3,'Monitores',''),(7,3,'Altavoces',''),(8,3,'Teclados',''),(9,3,'Ratones',''),(10,3,'Accion',''),(11,3,'Ciencia Ficcion',''),(12,3,'Comedia',''),(13,3,'Dibujos Animados',''),(14,3,'Suspense',''),(15,3,'Drama',''),(16,3,'Memoria',''),(17,3,'Unidades CDROM',''),(18,3,'Simulacion',''),(19,3,'Accion',''),(20,3,'Estrategia',''),(1,4,'Hardware',''),(2,4,'Software',''),(3,4,'DVD Filme',''),(4,4,'Grafikkarten',''),(5,4,'Drucker',''),(6,4,'Bildschirme',''),(7,4,'Lautsprecher',''),(8,4,'Tastaturen',''),(9,4,'Mäuse',''),(10,4,'Action',''),(11,4,'Science Fiction',''),(12,4,'Komödie',''),(13,4,'Zeichentrick',''),(14,4,'Thriller',''),(15,4,'Drama',''),(16,4,'Speicher',''),(17,4,'CDROM Laufwerke',''),(18,4,'Simulation',''),(19,4,'Action',''),(20,4,'Strategie',''),(1,5,'Hardware',''),(2,5,'Software',''),(3,5,'DVD Filme',''),(4,5,'Grafikkarten',''),(5,5,'Drucker',''),(6,5,'Bildschirme',''),(7,5,'Lautsprecher',''),(8,5,'Tastaturen',''),(9,5,'Mäuse',''),(10,5,'Action',''),(11,5,'Science Fiction',''),(12,5,'Komödie',''),(13,5,'Zeichentrick',''),(14,5,'Thriller',''),(15,5,'Drama',''),(16,5,'Speicher',''),(17,5,'CDROM Laufwerke',''),(18,5,'Simulation',''),(19,5,'Action',''),(20,5,'Strategie','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `configuration_title` varchar(64) collate latin1_general_ci NOT NULL,
  `configuration_key` varchar(64) collate latin1_general_ci NOT NULL,
  `configuration_value` varchar(255) collate latin1_general_ci NOT NULL,
  `configuration_description` varchar(255) collate latin1_general_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) collate latin1_general_ci default NULL,
  `set_function` varchar(255) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `configuration`
--


/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
LOCK TABLES `configuration` WRITE;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','swisscart®','The name of my store',1,1,'2007-06-13 03:41:48','2007-06-12 22:50:01',NULL,NULL),(2,'Store Owner','STORE_OWNER','Nick Weisser','The name of my store owner',1,2,'2007-06-13 02:02:45','2007-06-12 22:50:01',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','root@localhost','The e-mail address of my store owner',1,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','osCommerce <root@localhost>','The e-mail address used in (sent) e-mails',1,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(5,'Country','STORE_COUNTRY','204','The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>',1,6,'2007-06-13 02:02:21','2007-06-12 22:50:01','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','129','The zone my store is located in',1,7,'2007-06-13 02:02:30','2007-06-12 22:50:01','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'asc\', \'desc\'), '),(8,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(9,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,NULL,'2007-06-12 22:50:01',NULL,NULL),(11,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',1,12,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(13,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','Allow guests to tell a friend about a product',1,15,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(14,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(15,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,18,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_textarea('),(16,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,'2007-07-05 21:49:10','2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2007-06-12 22:50:01',NULL,NULL),(18,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(19,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2007-06-12 22:50:01',NULL,NULL),(20,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(21,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(22,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(23,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(24,'Company','ENTRY_COMPANY_MIN_LENGTH','2','Minimum length of company name',2,6,NULL,'2007-06-12 22:50:01',NULL,NULL),(25,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2007-06-12 22:50:01',NULL,NULL),(26,'City','ENTRY_CITY_MIN_LENGTH','3','Minimum length of city',2,8,NULL,'2007-06-12 22:50:01',NULL,NULL),(27,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2007-06-12 22:50:01',NULL,NULL),(28,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2007-06-12 22:50:01',NULL,NULL),(29,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2007-06-12 22:50:01',NULL,NULL),(30,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2007-06-12 22:50:01',NULL,NULL),(31,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2007-06-12 22:50:01',NULL,NULL),(32,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of review text',2,14,NULL,'2007-06-12 22:50:01',NULL,NULL),(33,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2007-06-12 22:50:01',NULL,NULL),(34,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2007-06-12 22:50:01',NULL,NULL),(35,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2007-06-12 22:50:01',NULL,NULL),(36,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(37,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(38,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Maximum number of products on special to display',3,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(39,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Maximum number of new products to display in a category',3,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(40,'Products Expected','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Maximum number of products expected to display',3,6,NULL,'2007-06-12 22:50:01',NULL,NULL),(41,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',3,7,NULL,'2007-06-12 22:50:01',NULL,NULL),(42,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.',3,7,NULL,'2007-06-12 22:50:01',NULL,NULL),(43,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display',3,8,NULL,'2007-06-12 22:50:01',NULL,NULL),(44,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','Maximum number of new reviews to display',3,9,NULL,'2007-06-12 22:50:01',NULL,NULL),(45,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2007-06-12 22:50:01',NULL,NULL),(46,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2007-06-12 22:50:01',NULL,NULL),(47,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2007-06-12 22:50:01',NULL,NULL),(48,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2007-06-12 22:50:01',NULL,NULL),(49,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','Maximum number of new products to display in new products page',3,14,NULL,'2007-06-12 22:50:01',NULL,NULL),(50,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','Maximum number of best sellers to display',3,15,NULL,'2007-06-12 22:50:01',NULL,NULL),(51,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','Maximum number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2007-06-12 22:50:01',NULL,NULL),(52,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2007-06-12 22:50:01',NULL,NULL),(53,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2007-06-12 22:50:01',NULL,NULL),(54,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2007-06-12 22:50:01',NULL,NULL),(55,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(56,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(57,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(58,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(59,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2007-06-12 22:50:01',NULL,NULL),(60,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(61,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Gender','ACCOUNT_GENDER','true','Display gender in the customers account',5,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(63,'Date of Birth','ACCOUNT_DOB','true','Display date of birth in the customers account',5,2,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(64,'Company','ACCOUNT_COMPANY','true','Display company in the customers account',5,3,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(65,'Suburb','ACCOUNT_SUBURB','true','Display suburb in the customers account',5,4,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(66,'State','ACCOUNT_STATE','true','Display state in the customers account',5,5,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(67,'Installed Modules','MODULE_PAYMENT_INSTALLED','cc.php;cod.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(68,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(69,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(70,'Enable Cash On Delivery Module','MODULE_PAYMENT_COD_STATUS','True','Do you want to accept Cash On Delevery payments?',6,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(71,'Payment Zone','MODULE_PAYMENT_COD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2007-06-12 22:50:01','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(72,'Sort order of display.','MODULE_PAYMENT_COD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(73,'Set Order Status','MODULE_PAYMENT_COD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2007-06-12 22:50:01','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(74,'Enable Credit Card Module','MODULE_PAYMENT_CC_STATUS','True','Do you want to accept credit card payments?',6,0,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(75,'Split Credit Card E-Mail Address','MODULE_PAYMENT_CC_EMAIL','','If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(76,'Sort order of display.','MODULE_PAYMENT_CC_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(77,'Payment Zone','MODULE_PAYMENT_CC_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2007-06-12 22:50:01','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(78,'Set Order Status','MODULE_PAYMENT_CC_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2007-06-12 22:50:01','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(79,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(80,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(81,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2007-06-12 22:50:01','tep_get_tax_class_title','tep_cfg_pull_down_tax_classes('),(82,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2007-06-12 22:50:01','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(83,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(84,'Default Currency','DEFAULT_CURRENCY','CHF','Default Currency',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(85,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(86,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2007-06-12 22:50:01',NULL,NULL),(87,'Display Shipping','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','Do you want to display the order shipping cost?',6,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(88,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','2','Sort order of display.',6,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(89,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(90,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2007-06-12 22:50:01','currencies->format',NULL),(91,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), '),(92,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(93,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','1','Sort order of display.',6,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(94,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(95,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','3','Sort order of display.',6,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(96,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(97,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','4','Sort order of display.',6,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(98,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2007-06-12 22:50:01','tep_get_country_name','tep_cfg_pull_down_country_list('),(99,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.',7,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(100,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(101,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(102,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','For 10% enter 10',7,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(103,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2007-06-12 22:50:01',NULL,NULL),(104,'Display Product Manufaturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(105,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(106,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(107,'Display Product Price','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price',8,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(108,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2007-06-12 22:50:01',NULL,NULL),(109,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2007-06-12 22:50:01',NULL,NULL),(110,'Display Buy Now column','PRODUCT_LIST_BUY_NOW','4','Do you want to display the Buy Now column?',8,8,NULL,'2007-06-12 22:50:01',NULL,NULL),(111,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','1','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2007-06-12 22:50:01',NULL,NULL),(112,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,10,NULL,'2007-06-12 22:50:01',NULL,NULL),(113,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(114,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(115,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(116,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2007-06-12 22:50:01',NULL,NULL),(117,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2007-06-12 22:50:01',NULL,NULL),(118,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(119,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(120,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2007-06-12 22:50:01',NULL,NULL),(121,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(122,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log (PHP4 only)',10,5,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(123,'Use Cache','USE_CACHE','false','Use caching features',11,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(124,'Cache Directory','DIR_FS_CACHE','/tmp/','The directory where the cached files are saved',11,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(125,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(126,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'LF\', \'CRLF\'),'),(127,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(128,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(129,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(130,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(131,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(132,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2007-06-12 22:50:01',NULL,''),(133,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2007-06-12 22:50:01',NULL,''),(134,'Enable GZip Compression','GZIP_COMPRESSION','false','Enable HTTP GZip compression.',14,1,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(135,'Compression Level','GZIP_LEVEL','5','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,NULL,'2007-06-12 22:50:01',NULL,NULL),(136,'Session Directory','SESSION_WRITE_DIRECTORY','/tmp','If sessions are file based, store them in this directory.',15,1,NULL,'2007-06-12 22:50:01',NULL,NULL),(137,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(138,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(139,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(140,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(141,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','False','Prevent known spiders from starting a session.',15,6,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(142,'Recreate Session','SESSION_RECREATE','False','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2007-06-12 22:50:01',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(143,'Enable SEO URLs?','SEO_ENABLED','false','Enable the SEO URLs?  This is a global setting and will turn them off completely.',16,0,'2007-06-13 02:04:03','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(144,'Add cPath to product URLs?','SEO_ADD_CPATH_TO_PRODUCT_URLS','false','This setting will append the cPath to the end of product URLs (i.e. - some-product-p-1.html?cPath=xx).',16,1,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(145,'Add category parent to begining of URLs?','SEO_ADD_CAT_PARENT','true','This setting will add the category parent name to the beginning of the category URLs (i.e. - parent-category-c-1.html).',16,2,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(146,'Filter Short Words','SEO_URLS_FILTER_SHORT_WORDS','3','This setting will filter words less than or equal to the value from the URL.',16,3,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,NULL),(147,'Output W3C valid URLs (parameter string)?','SEO_URLS_USE_W3C_VALID','true','This setting will output W3C valid URLs.',16,4,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(148,'Enable SEO cache to save queries?','USE_SEO_CACHE_GLOBAL','true','This is a global setting and will turn off caching completely.',16,5,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(149,'Enable product cache?','USE_SEO_CACHE_PRODUCTS','true','This will turn off caching for the products.',16,6,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(150,'Enable categories cache?','USE_SEO_CACHE_CATEGORIES','true','This will turn off caching for the categories.',16,7,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(151,'Enable manufacturers cache?','USE_SEO_CACHE_MANUFACTURERS','true','This will turn off caching for the manufacturers.',16,8,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(152,'Enable articles cache?','USE_SEO_CACHE_ARTICLES','true','This will turn off caching for the articles.',16,9,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(153,'Enable topics cache?','USE_SEO_CACHE_TOPICS','true','This will turn off caching for the article topics.',16,10,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(154,'Enable information cache?','USE_SEO_CACHE_INFO_PAGES','true','This will turn off caching for the information pages.',16,11,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(155,'Enable automatic redirects?','USE_SEO_REDIRECT','true','This will activate the automatic redirect code and send 301 headers for old to new URLs.',16,12,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(156,'Choose URL Rewrite Type','SEO_REWRITE_TYPE','Rewrite','Choose which SEO URL format to use.',16,13,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'Rewrite\'),'),(157,'Enter special character conversions','SEO_CHAR_CONVERT_SET','','This setting will convert characters.<br><br>The format <b>MUST</b> be in the form: <b>char=>conv,char2=>conv2</b>',16,14,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,NULL),(158,'Remove all non-alphanumeric characters?','SEO_REMOVE_ALL_SPEC_CHARS','false','This will remove all non-letters and non-numbers.  This should be handy to remove all special characters with 1 setting.',16,15,'2007-06-12 23:21:07','2007-06-12 23:21:07',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(159,'Reset SEO URLs Cache','SEO_URLS_CACHE_RESET','false','This will reset the cache data for SEO',16,16,'2007-06-12 23:31:15','2007-06-12 23:21:07','tep_reset_cache_data_seo_urls','tep_cfg_select_option(array(\'reset\', \'false\'),'),(160,'Installed Modules','MODULE_STS_INSTALLED','sts_default.php','This is automatically updated. No need to edit.',6,0,'2007-06-13 16:12:04','2007-06-13 16:11:39',NULL,NULL),(169,'Code for debug output','MODULE_STS_DEBUG_CODE','debug','Code to enable debug output from URL (ex: index.php?sts_debug=debug',6,2,NULL,'2007-06-13 16:12:04',NULL,NULL),(170,'Files for normal template','MODULE_STS_DEFAULT_NORMAL','sts_user_code.php','Files to include for a normal template, separated by semicolon',6,2,NULL,'2007-06-13 16:12:04',NULL,NULL),(171,'Base folder','MODULE_STS_TEMPLATES_FOLDER','includes/sts_templates/','Base folder where the templates folders are located. Relative to your catalog folder. Should end with a slash',6,2,NULL,'2007-06-13 16:12:04',NULL,NULL),(172,'Template folder','MODULE_STS_TEMPLATE_FOLDER','swisscart','This is the template folder in use, located inside the previous parameter. Do not start nor end with a slash',6,2,NULL,'2007-06-13 16:12:04',NULL,NULL),(173,'Default template file','MODULE_STS_TEMPLATE_FILE','sts_template.html','Name of the default template file',6,2,NULL,'2007-06-13 16:12:04',NULL,NULL),(174,'Use template for infoboxes','MODULE_STS_INFOBOX_STATUS','true','Do you want to use templates for infoboxes?',6,1,NULL,'2007-06-13 16:12:04',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(168,'Use Templates?','MODULE_STS_DEFAULT_STATUS','true','Do you want to use Simple Template System?',6,1,NULL,'2007-06-13 16:12:04',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
UNLOCK TABLES;
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL auto_increment,
  `configuration_group_title` varchar(64) collate latin1_general_ci NOT NULL,
  `configuration_group_description` varchar(255) collate latin1_general_ci NOT NULL,
  `sort_order` int(5) default NULL,
  `visible` int(1) default '1',
  PRIMARY KEY  (`configuration_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `configuration_group`
--


/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
LOCK TABLES `configuration_group` WRITE;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing    configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(16,'SEO URLs','Options for Ultimate SEO URLs by Chemo',16,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `startdate` char(8) collate latin1_general_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `counter`
--


/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
LOCK TABLES `counter` WRITE;
INSERT INTO `counter` VALUES ('20070612',594);
UNLOCK TABLES;
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
CREATE TABLE `counter_history` (
  `month` char(8) collate latin1_general_ci default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `counter_history`
--


/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
LOCK TABLES `counter_history` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL auto_increment,
  `countries_name` varchar(64) collate latin1_general_ci NOT NULL,
  `countries_iso_code_2` char(2) collate latin1_general_ci NOT NULL,
  `countries_iso_code_3` char(3) collate latin1_general_ci NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY  (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `countries`
--


/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
LOCK TABLES `countries` WRITE;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(74,'France, Metropolitan','FX','FXX',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) collate latin1_general_ci NOT NULL,
  `code` char(3) collate latin1_general_ci NOT NULL,
  `symbol_left` varchar(12) collate latin1_general_ci default NULL,
  `symbol_right` varchar(12) collate latin1_general_ci default NULL,
  `decimal_point` char(1) collate latin1_general_ci default NULL,
  `thousands_point` char(1) collate latin1_general_ci default NULL,
  `decimal_places` char(1) collate latin1_general_ci default NULL,
  `value` float(13,8) default NULL,
  `last_updated` datetime default NULL,
  PRIMARY KEY  (`currencies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `currencies`
--


/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
LOCK TABLES `currencies` WRITE;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$','','.',',','2',0.80669999,'2007-06-13 02:03:21'),(2,'Euro','EUR','','EUR','.',',','2',0.60439998,'2007-06-13 02:03:22'),(3,'Schweizer Franken','CHF','CHF','','.',',','2',1.00000000,'2007-06-13 02:03:23');
UNLOCK TABLES;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL auto_increment,
  `customers_gender` char(1) collate latin1_general_ci NOT NULL,
  `customers_firstname` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_lastname` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_dob` datetime NOT NULL default '0000-00-00 00:00:00',
  `customers_email_address` varchar(96) collate latin1_general_ci NOT NULL,
  `customers_default_address_id` int(11) default NULL,
  `customers_telephone` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_fax` varchar(32) collate latin1_general_ci default NULL,
  `customers_password` varchar(40) collate latin1_general_ci NOT NULL,
  `customers_newsletter` char(1) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers`
--


/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
LOCK TABLES `customers` WRITE;
INSERT INTO `customers` VALUES (1,'m','John','doe','2001-01-01 00:00:00','root@localhost',1,'12345','','d95e8fa7f20a009372eb3477473fcd34:1c','0'),(2,'m','Nick','Weisser','1970-05-21 00:00:00','nick@openstream.ch',2,'0445007878','','4b0bb070a6ffa89de54e062da0c29936:d9','1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate latin1_general_ci NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) default NULL,
  `customers_basket_date_added` char(8) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`customers_basket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_basket`
--


/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
LOCK TABLES `customers_basket` WRITE;
INSERT INTO `customers_basket` VALUES (1,2,'16',1,NULL,'20070705'),(2,2,'4',1,NULL,'20070705');
UNLOCK TABLES;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext collate latin1_general_ci NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  `products_options_value_text` text collate latin1_general_ci,
  PRIMARY KEY  (`customers_basket_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_basket_attributes`
--


/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
LOCK TABLES `customers_basket_attributes` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime default NULL,
  `customers_info_number_of_logons` int(5) default NULL,
  `customers_info_date_account_created` datetime default NULL,
  `customers_info_date_account_last_modified` datetime default NULL,
  `global_product_notifications` int(1) default '0',
  PRIMARY KEY  (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers_info`
--


/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
LOCK TABLES `customers_info` WRITE;
INSERT INTO `customers_info` VALUES (1,NULL,0,'2007-06-12 22:50:01',NULL,0),(2,'2007-07-05 16:30:34',1,'2007-07-05 01:00:50',NULL,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `geo_zone_name` varchar(32) collate latin1_general_ci NOT NULL,
  `geo_zone_description` varchar(255) collate latin1_general_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `geo_zones`
--


/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
LOCK TABLES `geo_zones` WRITE;
INSERT INTO `geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2007-06-12 22:50:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `information_id` tinyint(3) unsigned NOT NULL auto_increment,
  `information_group_id` int(11) unsigned NOT NULL default '0',
  `information_title` varchar(255) NOT NULL default '',
  `information_description` text NOT NULL,
  `parent_id` int(11) default NULL,
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `visible` enum('1','0') NOT NULL default '1',
  `language_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `information`
--


/*!40000 ALTER TABLE `information` DISABLE KEYS */;
LOCK TABLES `information` WRITE;
INSERT INTO `information` VALUES (1,2,'HEADING_TITLE','What\'s New Here?',0,1,'1',1),(2,2,'TEXT_GREETING_PERSONAL','Welcome back <span class=\"greetUser\">%s!</span> Would you like to see which <a href=\"%s\"><u>new products</u></a> are available to purchase?',0,2,'1',1),(3,2,'TEXT_GREETING_PERSONAL_RELOGON','<small>If you are not %s, please <a href=\"%s\"><u>log yourself in</u></a> with your account information.</small>',0,3,'1',1),(4,2,'TEXT_GREETING_GUEST','Welcome <span class=\"greetUser\">Guest!</span> Would you like to <a href=\"%s\"><u>log yourself in</u></a>? Or would you prefer to <a href=\"%s\"><u>create an account</u></a>?',0,4,'1',1),(5,2,'TEXT_MAIN','This is a default text. This can be changed in the admin panel\'s info manager.',0,5,'1',1),(1,2,'HEADING_TITLE','Unser Angebot',0,1,'1',2),(2,2,'TEXT_GREETING_PERSONAL','Sch&ouml;n das Sie wieder da sind <span class=\"greetUser\">%s!</span> M&ouml;chten Sie die <a href=\"%s\"><u>neue Produkte</u></a> ansehen?',0,2,'1',2),(3,2,'TEXT_GREETING_PERSONAL_RELOGON','<small>Wenn Sie nicht %s sind, melden Sie sich bitte <a href=\"%s\"><u>hier</u></a> mit Ihrem Kundenkonto an.</small>',0,3,'1',2),(4,2,'TEXT_GREETING_GUEST','Herzlich Willkommen <span class=\"greetUser\">Gast!</span> M&ouml;chten Sie sich <a href=\"%s\"><u>anmelden</u></a>? Oder wollen Sie ein <a href=\"%s\"><u>Kundenkonto</u></a> er&ouml;ffnen?',0,4,'1',2),(5,2,'TEXT_MAIN','Diesen Text k&ouml;nnen Sie im Admin unter Info-Manager &auml;ndern.',0,5,'1',2),(1,2,'HEADING_TITLE','A ver que tenemos aqui',0,1,'1',3),(2,2,'TEXT_GREETING_PERSONAL','Bienvenido de nuevo <span class=\"greetUser\">%s!</span> &iquest;Le gustaria ver que <a href=\"%s\"><u>nuevos productos</u></a> hay disponibles?',0,2,'1',3),(3,2,'TEXT_GREETING_PERSONAL_RELOGON','<small>Si no es %s, por favor <a href=\"%s\"><u>entre aqui</u></a> e introduzca sus datos.</small>',0,3,'1',3),(4,2,'TEXT_GREETING_GUEST','Bienvenido <span class=\"greetUser\">Invitado!</span> &iquest;Le gustaria <a href=\"%s\"><u>entrar en su cuenta</u></a> o preferiria <a href=\"%s\"><u>crear una cuenta nueva</u></a>?',0,4,'1',3),(5,2,'TEXT_MAIN','Este text se puede cambiar en el info manager de la administracion.',0,5,'1',3),(1,2,'HEADING_TITLE','Vediamo cose c\'è qui',0,1,'1',4),(2,2,'TEXT_GREETING_PERSONAL','Bentornato <span class=\"greetUser\">%s!</span> Vuoi vedere i <a href=\"%s\"><u>nouvi prodotti</u></a> che sono disponibili?',0,2,'1',4),(3,2,'TEXT_GREETING_PERSONAL_RELOGON','<small>Se tu non sei %s, <a href=\"%s\"><u>effettua il log-in</u></a> con i dati del tuo accout.</small>',0,3,'1',4),(4,2,'TEXT_GREETING_GUEST','Benvenuto <span class=\"greetUser\">!</span> Puoi effettuare qui <a href=\"%s\"><u>il log-in</u></a>? Oppure puoi creare qui <a href=\"%s\"><u>un account</u></a>?',0,4,'1',4),(5,2,'TEXT_MAIN','This is a default text. This can be changed in the admim panel\'s info manager.',0,5,'1',4),(1,2,'HEADING_TITLE','Voyons ce que nous avons-l&agrave;',0,1,'1',5),(2,2,'TEXT_GREETING_PERSONAL','Bienvenue &agrave; nouveau <span class=\"greetUser\">%s&nbsp;!</span> Voudriez-vous voir quels <a href=\"%s\"><u>nouveaux produits</u></a> sont disponibles&nbsp;?',0,2,'1',5),(3,2,'TEXT_GREETING_PERSONAL_RELOGON','<small>Si vous n\'&ecirc;tes pas %s, veuillez <a href=\"%s\"><u>vous indentifier</u></a> avec vos param&egrave;tres de compte.</small>',0,3,'1',5),(4,2,'TEXT_GREETING_GUEST','Bienvenue <span class=\"greetUser\">cher visiteur&nbsp;!</span> Voulez-vous <a href=\"%s\"><u>vous identifier</u></a>? Ou pr&eacute;f&eacute;rez-vous <a href=\"%s\"><u>cr&eacute;er un compte</u></a>&nbsp;?',0,4,'1',5),(5,2,'TEXT_MAIN','Ce text peut être changé avec le info manager dans l\'administration',0,5,'1',5),(6,1,'Versand','F&uuml;gen Sie hier Ihre Informationen &uuml;ber Liefer- und Versandkosten ein.',0,1,'1',2),(6,1,'Shipping','Put here your Shipping &amp; Returns information.',0,1,'1',1),(6,1,'Livraison','Mettez ici vous informations sur les livraison &amp; retour.',0,1,'1',5),(6,1,'Spedizione','Inserisci qui le tue informazioni sulla spedizione e consegna.',0,1,'1',4),(6,1,'Envíos','Ponga aqui informacion sobre los Envios y Devoluciones',0,1,'1',3),(7,1,'Unsere AGBs','F&uuml;gen Sie hier Ihre allgemeinen Gesch&auml;ftsbedingungen ein.',0,2,'1',2),(7,1,'Conditions of Use','Put here your Conditions of Use information.',0,2,'1',1),(7,1,'Conditions d\'utilisation','Mettez ici les informations concernant vos conditions d\'utilisation.',0,2,'1',5),(7,1,'Condizioni per l\'uso','Inserisci qui le condizioni di informazione sull\' uso.',0,2,'1',4),(7,1,'Condiciones de Uso','Ponga aqui sus condiciones de uso.',0,2,'1',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `information` ENABLE KEYS */;

--
-- Table structure for table `information_group`
--

DROP TABLE IF EXISTS `information_group`;
CREATE TABLE `information_group` (
  `information_group_id` int(11) NOT NULL auto_increment,
  `information_group_title` varchar(64) NOT NULL default '',
  `information_group_description` varchar(255) NOT NULL default '',
  `sort_order` int(5) default NULL,
  `visible` int(1) default '1',
  `locked` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`information_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `information_group`
--


/*!40000 ALTER TABLE `information_group` DISABLE KEYS */;
LOCK TABLES `information_group` WRITE;
INSERT INTO `information_group` VALUES (1,'Infobox','Diese Seiten werden in der Infobox angezeigt',1,1,''),(2,'Startseite','Zum Ändern des Text auf der Startseite Ihres Shops',2,1,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `information_group` ENABLE KEYS */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate latin1_general_ci NOT NULL,
  `code` char(2) collate latin1_general_ci NOT NULL,
  `image` varchar(64) collate latin1_general_ci default NULL,
  `directory` varchar(32) collate latin1_general_ci default NULL,
  `sort_order` int(3) default NULL,
  PRIMARY KEY  (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `languages`
--


/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
LOCK TABLES `languages` WRITE;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',10),(2,'Deutsch','de','icon.gif','german',5),(3,'Español','es','icon.gif','espanol',25),(4,'Italiano','it','icon.gif','italian',20),(5,'Français','fr','icon.gif','french',15);
UNLOCK TABLES;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL auto_increment,
  `manufacturers_name` varchar(32) collate latin1_general_ci NOT NULL,
  `manufacturers_image` varchar(64) collate latin1_general_ci default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `manufacturers`
--


/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
LOCK TABLES `manufacturers` WRITE;
INSERT INTO `manufacturers` VALUES (1,'Matrox','manufacturer_matrox.gif','2007-06-12 22:50:01',NULL),(2,'Microsoft','manufacturer_microsoft.gif','2007-06-12 22:50:01',NULL),(3,'Warner','manufacturer_warner.gif','2007-06-12 22:50:01',NULL),(4,'Fox','manufacturer_fox.gif','2007-06-12 22:50:01',NULL),(5,'Logitech','manufacturer_logitech.gif','2007-06-12 22:50:01',NULL),(6,'Canon','manufacturer_canon.gif','2007-06-12 22:50:01',NULL),(7,'Sierra','manufacturer_sierra.gif','2007-06-12 22:50:01',NULL),(8,'GT Interactive','manufacturer_gt_interactive.gif','2007-06-12 22:50:01',NULL),(9,'Hewlett Packard','manufacturer_hewlett_packard.gif','2007-06-12 22:50:01',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) collate latin1_general_ci NOT NULL,
  `url_clicked` int(5) NOT NULL default '0',
  `date_last_click` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `manufacturers_info`
--


/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
LOCK TABLES `manufacturers_info` WRITE;
INSERT INTO `manufacturers_info` VALUES (1,1,'http://www.matrox.com',0,NULL),(1,2,'http://www.matrox.de',0,NULL),(1,3,'http://www.matrox.com',0,NULL),(2,1,'http://www.microsoft.com',0,NULL),(2,2,'http://www.microsoft.de',0,NULL),(2,3,'http://www.microsoft.es',0,NULL),(3,1,'http://www.warner.com',0,NULL),(3,2,'http://www.warner.de',0,NULL),(3,3,'http://www.warner.com',0,NULL),(4,1,'http://www.fox.com',0,NULL),(4,2,'http://www.fox.de',0,NULL),(4,3,'http://www.fox.com',0,NULL),(5,1,'http://www.logitech.com',0,NULL),(5,2,'http://www.logitech.com',0,NULL),(5,3,'http://www.logitech.com',0,NULL),(6,1,'http://www.canon.com',0,NULL),(6,2,'http://www.canon.de',0,NULL),(6,3,'http://www.canon.es',0,NULL),(7,1,'http://www.sierra.com',0,NULL),(7,2,'http://www.sierra.de',0,NULL),(7,3,'http://www.sierra.com',0,NULL),(8,1,'http://www.infogrames.com',0,NULL),(8,2,'http://www.infogrames.de',0,NULL),(8,3,'http://www.infogrames.com',0,NULL),(9,1,'http://www.hewlettpackard.com',0,NULL),(9,2,'http://www.hewlettpackard.de',0,NULL),(9,3,'http://welcome.hp.com/country/es/spa/welcome.htm',0,NULL),(1,4,'http://www.matrox.de',0,NULL),(2,4,'http://www.microsoft.de',0,NULL),(3,4,'http://www.warner.de',0,NULL),(4,4,'http://www.fox.de',0,NULL),(5,4,'http://www.logitech.com',0,NULL),(6,4,'http://www.canon.de',0,NULL),(7,4,'http://www.sierra.de',0,NULL),(8,4,'http://www.infogrames.de',0,NULL),(9,4,'http://www.hewlettpackard.de',0,NULL),(1,5,'http://www.matrox.de',0,NULL),(2,5,'http://www.microsoft.de',0,NULL),(3,5,'http://www.warner.de',0,NULL),(4,5,'http://www.fox.de',0,NULL),(5,5,'http://www.logitech.com',0,NULL),(6,5,'http://www.canon.de',0,NULL),(7,5,'http://www.sierra.de',0,NULL),(8,5,'http://www.infogrames.de',0,NULL),(9,5,'http://www.hewlettpackard.de',0,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) collate latin1_general_ci NOT NULL,
  `content` text collate latin1_general_ci NOT NULL,
  `module` varchar(255) collate latin1_general_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime default NULL,
  `status` int(1) default NULL,
  `locked` int(1) default '0',
  PRIMARY KEY  (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `newsletters`
--


/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
LOCK TABLES `newsletters` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(64) collate latin1_general_ci NOT NULL,
  `customers_company` varchar(32) collate latin1_general_ci default NULL,
  `customers_street_address` varchar(64) collate latin1_general_ci NOT NULL,
  `customers_suburb` varchar(32) collate latin1_general_ci default NULL,
  `customers_city` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_postcode` varchar(10) collate latin1_general_ci NOT NULL,
  `customers_state` varchar(32) collate latin1_general_ci default NULL,
  `customers_country` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_telephone` varchar(32) collate latin1_general_ci NOT NULL,
  `customers_email_address` varchar(96) collate latin1_general_ci NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(64) collate latin1_general_ci NOT NULL,
  `delivery_company` varchar(32) collate latin1_general_ci default NULL,
  `delivery_street_address` varchar(64) collate latin1_general_ci NOT NULL,
  `delivery_suburb` varchar(32) collate latin1_general_ci default NULL,
  `delivery_city` varchar(32) collate latin1_general_ci NOT NULL,
  `delivery_postcode` varchar(10) collate latin1_general_ci NOT NULL,
  `delivery_state` varchar(32) collate latin1_general_ci default NULL,
  `delivery_country` varchar(32) collate latin1_general_ci NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(64) collate latin1_general_ci NOT NULL,
  `billing_company` varchar(32) collate latin1_general_ci default NULL,
  `billing_street_address` varchar(64) collate latin1_general_ci NOT NULL,
  `billing_suburb` varchar(32) collate latin1_general_ci default NULL,
  `billing_city` varchar(32) collate latin1_general_ci NOT NULL,
  `billing_postcode` varchar(10) collate latin1_general_ci NOT NULL,
  `billing_state` varchar(32) collate latin1_general_ci default NULL,
  `billing_country` varchar(32) collate latin1_general_ci NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(32) collate latin1_general_ci NOT NULL,
  `cc_type` varchar(20) collate latin1_general_ci default NULL,
  `cc_owner` varchar(64) collate latin1_general_ci default NULL,
  `cc_number` varchar(32) collate latin1_general_ci default NULL,
  `cc_expires` varchar(4) collate latin1_general_ci default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) collate latin1_general_ci default NULL,
  `currency_value` decimal(14,6) default NULL,
  PRIMARY KEY  (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--


/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
LOCK TABLES `orders` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) collate latin1_general_ci default NULL,
  `products_name` varchar(64) collate latin1_general_ci NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY  (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_products`
--


/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
LOCK TABLES `orders_products` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) collate latin1_general_ci NOT NULL,
  `products_options_values` varchar(32) collate latin1_general_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`orders_products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_products_attributes`
--


/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
LOCK TABLES `orders_products_attributes` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL default '0',
  `orders_products_id` int(11) NOT NULL default '0',
  `orders_products_filename` varchar(255) collate latin1_general_ci NOT NULL default '',
  `download_maxdays` int(2) NOT NULL default '0',
  `download_count` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_products_download`
--


/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
LOCK TABLES `orders_products_download` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `orders_status_name` varchar(32) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_status`
--


/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
LOCK TABLES `orders_status` WRITE;
INSERT INTO `orders_status` VALUES (1,1,'Pending'),(1,2,'Offen'),(1,3,'Pendiente'),(2,1,'Processing'),(2,2,'In Bearbeitung'),(2,3,'Proceso'),(3,1,'Delivered'),(3,2,'Versendet'),(3,3,'Entregado'),(1,4,'Offen'),(2,4,'In Bearbeitung'),(3,4,'Versendet'),(1,5,'Offen'),(2,5,'In Bearbeitung'),(3,5,'Versendet');
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) default '0',
  `comments` text collate latin1_general_ci,
  PRIMARY KEY  (`orders_status_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_status_history`
--


/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
LOCK TABLES `orders_status_history` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) collate latin1_general_ci NOT NULL,
  `text` varchar(255) collate latin1_general_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) collate latin1_general_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders_total`
--


/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
LOCK TABLES `orders_total` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL auto_increment,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) collate latin1_general_ci default NULL,
  `products_image` varchar(64) collate latin1_general_ci default NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime default NULL,
  `products_date_available` datetime default NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) default NULL,
  `products_ordered` int(11) NOT NULL default '0',
  PRIMARY KEY  (`products_id`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products`
--


/*!40000 ALTER TABLE `products` DISABLE KEYS */;
LOCK TABLES `products` WRITE;
INSERT INTO `products` VALUES (1,32,'MG200MMS','matrox/mg200mms.gif','299.9900','2007-06-12 22:50:01',NULL,NULL,'23.00',1,1,1,0),(2,32,'MG400-32MB','matrox/mg400-32mb.gif','499.9900','2007-06-12 22:50:01',NULL,NULL,'23.00',1,1,1,0),(3,2,'MSIMPRO','microsoft/msimpro.gif','49.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(4,13,'DVD-RPMK','dvd/replacement_killers.gif','42.0000','2007-06-12 22:50:01',NULL,NULL,'23.00',1,1,2,0),(5,17,'DVD-BLDRNDC','dvd/blade_runner.gif','35.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(6,10,'DVD-MATR','dvd/the_matrix.gif','39.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(7,10,'DVD-YGEM','dvd/youve_got_mail.gif','34.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(8,10,'DVD-ABUG','dvd/a_bugs_life.gif','35.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(9,10,'DVD-UNSG','dvd/under_siege.gif','29.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(10,10,'DVD-UNSG2','dvd/under_siege2.gif','29.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(11,10,'DVD-FDBL','dvd/fire_down_below.gif','29.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(12,10,'DVD-DHWV','dvd/die_hard_3.gif','39.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,4,0),(13,10,'DVD-LTWP','dvd/lethal_weapon.gif','34.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(14,10,'DVD-REDC','dvd/red_corner.gif','32.0000','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(15,10,'DVD-FRAN','dvd/frantic.gif','35.0000','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(16,10,'DVD-CUFI','dvd/courage_under_fire.gif','38.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,4,0),(17,10,'DVD-SPEED','dvd/speed.gif','39.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,4,0),(18,10,'DVD-SPEED2','dvd/speed_2.gif','42.0000','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,4,0),(19,10,'DVD-TSAB','dvd/theres_something_about_mary.gif','49.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,4,0),(20,10,'DVD-BELOVED','dvd/beloved.gif','54.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,3,0),(21,16,'PC-SWAT3','sierra/swat_3.gif','79.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,7,0),(22,13,'PC-UNTM','gt_interactive/unreal_tournament.gif','89.9900','2007-06-12 22:50:01',NULL,NULL,'7.00',1,1,8,0),(23,16,'PC-TWOF','gt_interactive/wheel_of_time.gif','99.9900','2007-06-12 22:50:01',NULL,NULL,'10.00',1,1,8,0),(24,17,'PC-DISC','gt_interactive/disciples.gif','90.0000','2007-06-12 22:50:01',NULL,NULL,'8.00',1,1,8,0),(25,16,'MSINTKB','microsoft/intkeyboardps2.gif','69.9900','2007-06-12 22:50:01',NULL,NULL,'8.00',1,1,2,0),(26,10,'MSIMEXP','microsoft/imexplorer.gif','64.9500','2007-06-12 22:50:01',NULL,NULL,'8.00',1,1,2,0),(27,8,'HPLJ1100XI','hewlett_packard/lj1100xi.gif','499.9900','2007-06-12 22:50:01',NULL,NULL,'45.00',1,1,9,0),(28,100,'20007','opensource.png','100.0000','2007-07-06 22:55:16','2007-07-06 23:01:38',NULL,'0.00',1,0,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_attributes`
--


/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
LOCK TABLES `products_attributes` WRITE;
INSERT INTO `products_attributes` VALUES (1,1,4,1,'0.0000','+'),(2,1,4,2,'50.0000','+'),(3,1,4,3,'70.0000','+'),(4,1,3,5,'0.0000','+'),(5,1,3,6,'100.0000','+'),(6,2,4,3,'10.0000','-'),(7,2,4,4,'0.0000','+'),(8,2,3,6,'0.0000','+'),(9,2,3,7,'120.0000','+'),(10,26,3,8,'0.0000','+'),(11,26,3,9,'6.0000','+'),(26,22,5,10,'0.0000','+'),(27,22,5,13,'0.0000','+'),(28,28,6,0,'0.0000','+'),(29,28,4,1,'0.0000','+'),(30,28,4,2,'50.0000','+'),(31,28,5,6,'0.0000','+'),(32,28,5,7,'100.0000','+'),(33,28,7,14,'0.0000','+');
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) collate latin1_general_ci NOT NULL default '',
  `products_attributes_maxdays` int(2) default '0',
  `products_attributes_maxcount` int(2) default '0',
  PRIMARY KEY  (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_attributes_download`
--


/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
LOCK TABLES `products_attributes_download` WRITE;
INSERT INTO `products_attributes_download` VALUES (26,'unreal.zip',7,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '1',
  `products_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `products_description` text collate latin1_general_ci,
  `products_url` varchar(255) collate latin1_general_ci default NULL,
  `products_viewed` int(5) default '0',
  `products_seo_url` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_description`
--


/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
LOCK TABLES `products_description` WRITE;
INSERT INTO `products_description` VALUES (1,1,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0,''),(2,1,'Matrox G400 32MB','<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0,''),(3,1,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0,''),(4,1,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0,''),(5,1,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0,''),(6,1,'The Matrix','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0,''),(7,1,'You\'ve Got Mail','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0,''),(8,1,'A Bug\'s Life','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0,''),(9,1,'Under Siege','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(10,1,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(11,1,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(12,1,'Die Hard With A Vengeance','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(13,1,'Lethal Weapon','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(14,1,'Red Corner','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(15,1,'Frantic','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(16,1,'Courage Under Fire','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(17,1,'Speed','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(18,1,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(19,1,'There\'s Something About Mary','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(20,1,'Beloved','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(21,1,'SWAT 3: Close Quarters Battle','<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0,''),(22,1,'Unreal Tournament','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0,''),(23,1,'The Wheel Of Time','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0,''),(24,1,'Disciples: Sacred Lands','A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.','',0,''),(25,1,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0,''),(26,1,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0,''),(27,1,'Hewlett Packard LaserJet 1100Xi','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0,''),(1,2,'Matrox G200 MMS','<b>Unterstützung für zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie führt die bewährte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche Lösungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink® DVI Flachbildschirm Ausgang zur Verfügung. Mit den optional erhältlichen TV Tuner und Video-Capture Möglichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-Lösung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekrönter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterstützung für bis zu 16 Bildschirme über 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterstützung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekanäle pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlußmöglichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baulänge</li>\r\n<li>Treiberunterstützung: Windows® 2000, Windows NT® und Windows® 98</li>\r\n<li>Anwendungsbereiche: Börsenumgebung mit zeitgleich großem Visualisierungsbedarf, Videoüberwachung, Video-Conferencing</li>\r\n</ul>','www.matrox.com/mga/deutsch/products/g200_mms/home.cfm',9,''),(2,2,'Matrox G400 32 MB','<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingeführten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine überragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality² (VCQ²)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschließend festzustellen, daß die Matrox Millennium G400 Max als Allroundkarte für den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere wärmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>','www.matrox.com/mga/deutsch/products/mill_g400/home.cfm',0,''),(3,2,'Microsoft IntelliMouse Pro','Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gewölbte Oberseite paßt sich natürlich in die Handfläche ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl für Rechts- wie auch für Linkshänder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> weiß</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>','',0,''),(4,2,'Die Ersatzkiller','Originaltitel: &quot;The Replacement Killers&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 80 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Til Schweiger schießt auf Hongkong-Star Chow Yun-Fat (&quot;Anna und der König&quot;) ­ ein Fehler ...','www.replacement-killers.com',1,''),(5,2,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Sci-Fi-Klassiker, USA 1983, 112 Min.</b><br><br>\r\nLos Angeles ist im Jahr 2019 ein Hexenkessel. Dauerregen und Smog tauchen den überbevölkerten Moloch in ewige Dämmerung. Polizeigleiter schwirren durch die Luft und überwachen das grelle Ethnogemisch, das sich am Fuße 400stöckiger Stahlbeton-Pyramiden tummelt. Der abgehalfterte Ex-Cop und \"Blade Runner\" Rick Deckard ist Spezialist für die Beseitigung von Replikanten, künstlichen Menschen, geschaffen für harte Arbeit auf fremden Planeten. Nur ihm kann es gelingen, vier flüchtige, hochintelligente \"Nexus 6\"-Spezialmodelle zu stellen. Die sind mit ihrem starken und brandgefährlichen Anführer Batty auf der Suche nach ihrem Schöpfer. Er soll ihnen eine längere Lebenszeit schenken. Das muß Rick Deckard verhindern.  Als sich der eiskalte Jäger in Rachel, die Sekretärin seines Auftraggebers, verliebt, gerät sein Weltbild jedoch ins Wanken. Er entdeckt, daß sie - vielleicht wie er selbst - ein Replikant ist ...<br><br>\r\nDie Konfrontation des Menschen mit \"Realität\" und \"Virtualität\" und das verstrickte Spiel mit getürkten Erinnerungen zieht sich als roter Faden durch das Werk von Autor Philip K. Dick (\"Die totale Erinnerung\"). Sein Roman \"Träumen Roboter von elektrischen Schafen?\" liefert die Vorlage für diesen doppelbödigen Thriller, der den Zuschauer mit faszinierenden\r\nZukunftsvisionen und der gigantischen Kulisse des Großstadtmolochs gefangen nimmt.','www.bladerunner.com',1,''),(6,2,'Matrix','Originaltitel: &quot;The Matrix&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 136 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1999) Der Geniestreich der Wachowski-Brüder. In dieser technisch perfekten Utopie kämpft Hacker Keanu Reeves gegen die Diktatur der Maschinen...','www.whatisthematrix.com',22,''),(7,2,'e-m@il für Dich','Original: &quot;You\'ve got mail&quot;<br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998) von Nora Ephron (&qout;Schlaflos in Seattle&quot;). Meg Ryan und Tom Hanks knüpfen per E-Mail zarte Bande. Dass sie sich schon kennen, ahnen sie nicht ...','www.youvegotmail.com',0,''),(8,2,'Das Große Krabbeln','Originaltitel: &quot;A Bug\'s Life&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Ameise Flik zettelt einen Aufstand gegen gefräßige Grashüpfer an ... Eine fantastische Computeranimation des \"Toy Story\"-Teams. ','www.abugslife.com',0,''),(9,2,'Alarmstufe: Rot','Originaltitel: &quot;Under Siege&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Actionthriller. Smutje Steven Seagal versalzt Schurke Tommy Lee Jones die Suppe</b><br><br>\r\nKatastrophe ahoi: Kurz vor Ausmusterung der \"U.S.S. Missouri\" kapert die High-tech-Bande von Ex-CIA-Agent Strannix (Tommy Lee Jones) das Schlachtschiff. Strannix will die Nuklearraketen des Kreuzers klauen und verscherbeln. Mit Hilfe des irren Ersten Offiziers Krill (lustig: Gary Busey) killen die Gangster den Käptn und sperren seine Crew unter Deck. Blöd, dass sie dabei Schiffskoch Rybak (Steven Seagal) vergessen. Der Ex-Elitekämpfer knipst einen Schurken nach dem anderen aus. Eine Verbündete findet er in Stripperin Jordan (Ex-\"Baywatch\"-Biene Erika Eleniak). Die sollte eigentlich aus Käptns Geburtstagstorte hüpfen ... Klar: Seagal ist kein Edelmime. Dafür ist Regisseur Andrew Davis (\"Auf der Flucht\") ein Könner: Er würzt die Action-Orgie mit Ironie und nutzt die imposante Schiffskulisse voll aus. Für Effekte und Ton gab es 1993 Oscar-Nominierungen. ','',0,''),(10,2,'Alarmstufe: Rot 2','Originaltitel: &quot;Under Siege 2: Dark Territory&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 95). Von einem gekaperten Zug aus übernimmt Computerspezi Dane die Kontrolle über einen Kampfsatelliten und erpresst das Pentagon. Aber auch Ex-Offizier Ryback (Steven Seagal) ist im Zug ...\r\n','',0,''),(11,2,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin mysteriöser Mordfall führt den Bundesmarschall Jack Taggert in eine Kleinstadt im US-Staat Kentucky. Doch bei seinen Ermittlungen stößt er auf eine Mauer des Schweigens. Angst beherrscht die Stadt, und alle Spuren führen zu dem undurchsichtigen Minen-Tycoon Orin Hanner. Offenbar werden in der friedlichen Berglandschaft gigantische Mengen Giftmülls verschoben, mit unkalkulierbaren Risiken. Um eine Katastrophe zu verhindern, räumt Taggert gnadenlos auf ...','',0,''),(12,2,'Stirb Langsam - Jetzt Erst Recht','Originaltitel: &quot;Die Hard With A Vengeance&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSo explosiv, so spannend, so rasant wie nie zuvor: Bruce Willis als Detectiv John McClane in einem Action-Thriller der Superlative! Das ist heute nicht McClanes Tag. Seine Frau hat ihn verlassen, sein Boß hat ihn vom Dienst suspendiert und irgendein Verrückter hat ihn gerade zum Gegenspieler in einem teuflischen Spiel erkoren - und der Einsatz ist New York selbst. Ein Kaufhaus ist explodiert, doch das ist nur der Auftakt. Der geniale Superverbrecher Simon droht, die ganze Stadt Stück für Stück in die Luft zu sprengen, wenn McClane und sein Partner wider Willen seine explosiven\" Rätsel nicht lösen. Eine mörderische Hetzjagd quer durch New York beginnt - bis McClane merkt, daß der Bombenterror eigentlich nur ein brillantes Ablenkungsmanöver ist...!<br><i>\"Perfekt gemacht und stark besetzt. Das Action-Highlight des Jahres!\"</i> <b>(Bild)</b>','',0,''),(13,2,'Zwei stahlharte Profis','Originaltitel: &quot;Lethal Weapon&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSie sind beide Cops in L.A.. Sie haben beide in Vietnam für eine Spezialeinheit gekämpft. Und sie hassen es beide, mit einem Partner arbeiten zu müssen. Aber sie sind Partner: Martin Riggs, der Mann mit dem Todeswunsch, für wen auch immer. Und Roger Murtaugh, der besonnene Polizist. Gemeinsam enttarnen sie einen gigantischen Heroinschmuggel, hinter dem sich eine Gruppe ehemaliger CIA-Söldner verbirgt. Eine Killerbande gegen zwei Profis ...','',0,''),(14,2,'Labyrinth ohne Ausweg','Originaltitel: &quot;Red Corner&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDem Amerikaner Jack Moore wird in China der bestialische Mord an einem Fotomodel angehängt. Brutale Gefängnisschergen versuchen, ihn durch Folter zu einem Geständnis zu zwingen. Vor Gericht fordert die Anklage die Todesstrafe - Moore\'s Schicksal scheint besiegelt. Durch einen Zufall gelingt es ihm, aus der Haft zu fliehen, doch aus der feindseligen chinesischen Hauptstadt gibt es praktisch kein Entkommen ...','',0,''),(15,2,'Frantic','Originaltitel: &quot;Frantic&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin romantischer Urlaub in Paris, der sich in einen Alptraum verwandelt. Ein Mann auf der verzweifelten Suche nach seiner entführten Frau. Ein düster-bedrohliches Paris, in dem nur ein Mensch Licht in die tödliche Affäre bringen kann.','',0,''),(16,2,'Mut Zur Wahrheit','Originaltitel: &quot;Courage Under Fire&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nLieutenant Colonel Nathaniel Serling (Denzel Washington) lässt während einer Schlacht im Golfkrieg versehentlich auf einen US-Panzer schießen, dessen Mannschaft dabei ums Leben kommt. Ein Jahr nach diesem Vorfall wird Serling, der mittlerweile nach Washington D.C. versetzt wurde, die Aufgabe übertragen, sich um einen Kandidaten zu kümmern, der während des Krieges starb und dem der höchste militärische Orden zuteil werden soll. Allerdings sind sowohl der Fall und als auch der betreffende Soldat ein politisch heißes Eisen -- Captain Karen Walden (Meg Ryan) ist Amerikas erster weiblicher Soldat, der im Kampf getötet wurde.<br><br>\r\nSerling findet schnell heraus, dass es im Fall des im felsigen Gebiet von Kuwait abgestürzten Rettungshubschraubers Diskrepanzen gibt. In Flashbacks werden von unterschiedlichen Personen verschiedene Versionen von Waldens Taktik, die Soldaten zu retten und den Absturz zu überleben, dargestellt (à la Kurosawas Rashomon). Genau wie in Glory erweist sich Regisseur Edward Zwicks Zusammenstellung von bekannten und unbekannten Schauspielern als die richtige Mischung. Waldens Crew ist besonders überzeugend. Matt Damon als der Sanitäter kommt gut als der leichtfertige Typ rüber, als er Washington seine Geschichte erzählt. Im Kampf ist er ein mit Fehlern behafteter, humorvoller Soldat.<br><br>\r\nDie erstaunlichste Arbeit in Mut zur Wahrheit leistet Lou Diamond Phillips (als der Schütze der Gruppe), dessen Karriere sich auf dem Weg in die direkt für den Videomarkt produzierten Filme befand. Und dann ist da noch Ryan. Sie hat sich in dramatischen Filmen in der Vergangenheit gut behauptet (Eine fast perfekte Liebe, Ein blutiges Erbe), es aber nie geschafft, ihrem Image zu entfliehen, das sie in die Ecke der romantischen Komödie steckte. Mit gefärbtem Haar, einem leichten Akzent und der von ihr geforderten Darstellungskunst hat sie endlich einen langlebigen dramatischen Film. Obwohl sie nur halb so oft wie Washington im Film zu sehen ist, macht ihre mutige und beeindruckend nachhaltige Darstellung Mut zur Wahrheit zu einem speziellen Film bis hin zu dessen seltsamer, aber lohnender letzter Szene.','',2,''),(17,2,'Speed','Originaltitel: &quot;Speed&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEr ist ein Cop aus der Anti-Terror-Einheit von Los Angeles. Und so ist der Alarm für Jack Traven nichts Ungewöhnliches: Ein Terrorist will drei Millionen Dollar erpressen, oder die zufälligen Geiseln in einem Aufzug fallen 35 Stockwerke in die Tiefe. Doch Jack schafft das Unmögliche - die Geiseln werden gerettet und der Terrorist stirbt an seiner eigenen Bombe. Scheinbar. Denn schon wenig später steht Jack (Keanu Reeves) dem Bombenexperten Payne erneut gegenüber. Diesmal hat sich der Erpresser eine ganz perfide Mordwaffe ausgedacht: Er plaziert eine Bombe in einem öffentlichen Bus. Der Mechanismus der Sprengladung schaltet sich automatisch ein, sobald der Bus schneller als 50 Meilen in der Stunde fährt und detoniert sofort, sobald die Geschwindigkeit sinkt. Plötzlich wird für eine Handvoll ahnungsloser Durchschnittsbürger der Weg zur Arbeit zum Höllentrip - und nur Jack hat ihr Leben in der Hand. Als der Busfahrer verletzt wird, übernimmt Fahrgast Annie (Sandra Bullock) das Steuer. Doch wohin mit einem Bus, der nicht bremsen kann in der Stadt der Staus? Doch es kommt noch schlimmer: Payne (Dennis Hopper) will jetzt nicht nur seine drei Millionen Dollar. Er will Jack. Um jeden Preis.','',0,''),(18,2,'Speed 2: Cruise Control','Originaltitel: &quot;Speed 2 - Cruise Control&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nHalten Sie ihre Schwimmwesten bereit, denn die actiongeladene Fortsetzung von Speed begibt sich auf Hochseekurs. Erleben Sie Sandra Bullock erneut in ihrer Star-Rolle als Annie Porter. Die Karibik-Kreuzfahrt mit ihrem Freund Alex entwickelt sich unaufhaltsam zur rasenden Todesfahrt, als ein wahnsinniger Computer-Spezialist den Luxusliner in seine Gewalt bringt und auf einen mörderischen Zerstörungskurs programmiert. Eine hochexplosive Reise, bei der kein geringerer als Action-Spezialist Jan De Bont das Ruder in die Hand nimmt. Speed 2: Cruise Controll läßt ihre Adrenalin-Wellen in rasender Geschwindigkeit ganz nach oben schnellen.','',1,''),(19,2,'Verrückt nach Mary','Originaltitel: &quot;There\'s Something About Mary&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n13 Jahre nachdem Teds Rendezvous mit seiner angebeteten Mary in einem peinlichen Fiasko endete, träumt er immer noch von ihr und engagiert den windigen Privatdetektiv Healy um sie aufzuspüren. Der findet Mary in Florida und verliebt sich auf den ersten Blick in die atemberaubende Traumfrau. Um Ted als Nebenbuhler auszuschalten, tischt er ihm dicke Lügen über Mary auf. Ted läßt sich jedoch nicht abschrecken, eilt nach Miami und versucht nun alles, um Healy die Balztour zu vermasseln. Doch nicht nur Healy ist verrückt nach Mary und Ted bekommt es mit einer ganzen Legion liebeskranker Konkurrenten zu tun ...','',0,''),(20,2,'Menschenkind','Originaltitel: &quot;Beloved&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDieser vielschichtige Film ist eine Arbeit, die Regisseur Jonathan Demme und dem amerikanischen Talkshow-Star Oprah Winfrey sehr am Herzen lag. Der Film deckt im Verlauf seiner dreistündigen Spielzeit viele Bereiche ab. Menschenkind ist teils Sklavenepos, teils Mutter-Tochter-Drama und teils Geistergeschichte.<br><br>\r\nDer Film fordert vom Publikum höchste Aufmerksamkeit, angefangen bei seiner dramatischen und etwas verwirrenden Eingangssequenz, in der die Bewohner eines Hauses von einem niederträchtigen übersinnlichen Angriff heimgesucht werden. Aber Demme und seine talentierte Besetzung bereiten denen, die dabei bleiben ein unvergessliches Erlebnis. Der Film folgt den Spuren von Sethe (in ihren mittleren Jahren von Oprah Winfrey dargestellt), einer ehemaligen Sklavin, die sich scheinbar ein friedliches und produktives Leben in Ohio aufgebaut hat. Aber durch den erschreckenden und sparsamen Einsatz von Rückblenden deckt Demme, genau wie das literarische Meisterwerk von Toni Morrison, auf dem der Film basiert, langsam die Schrecken von Sethes früherem Leben auf und das schreckliche Ereignis, dass dazu führte, dass Sethes Haus von Geistern heimgesucht wird.<br><br>\r\nWährend die Gräuel der Sklaverei und das blutige Ereignis in Sethes Familie unleugbar tief beeindrucken, ist die Qualität des Film auch in kleineren, genauso befriedigenden Details sichtbar. Die geistlich beeinflusste Musik von Rachel Portman ist gleichzeitig befreiend und bedrückend, und der Einblick in die afro-amerikanische Gemeinschaft nach der Sklaverei -- am Beispiel eines Familienausflugs zu einem Jahrmarkt, oder dem gospelsingenden Nähkränzchen -- machen diesen Film zu einem speziellen Vergnügen sowohl für den Geist als auch für das Herz. Die Schauspieler, besonders Kimberley Elise als Sethes kämpfende Tochter und Thandie Newton als der mysteriöse Titelcharakter, sind sehr rührend. Achten Sie auch auf Danny Glover (Lethal Weapon) als Paul D.','',0,''),(21,2,'SWAT 3: Elite Edition','<b>KEINE KOMPROMISSE!</b><br><i>Kämpfen Sie Seite an Seite mit Ihren LAPD SWAT-Kameraden gegen das organisierte Verbrechen!</i><br><br>\r\nEine der realistischsten 3D-Taktiksimulationen der letzten Zeit jetzt mit Multiplayer-Modus, 5 neuen Missionen und jede Menge nützliche Tools!<br><br>\r\nLos Angeles, 2005. In wenigen Tagen steht die Unterzeichnung des Abkommens der Vereinten Nationen zur Atom-Ächtung durch Vertreter aller Nationen der Welt an. Radikale terroristische Vereinigungen machen sich in der ganzen Stadt breit. Verantwortlich für die Sicherheit der Delegierten zeichnet sich eine Eliteeinheit der LAPD: das SWAT-Team. Das Schicksal der Stadt liegt in Ihren Händen.<br><br>\r\n<b>Neue Features:</b>\r\n<ul>\r\n<li>Multiplayer-Modus (Co op-Modus, Deathmatch in den bekannten Variationen)</li>\r\n<li>5 neue Missionen an original Örtlichkeiten Las (U-Bahn, Whitman Airport, etc.)</li>\r\n<li>neue Charakter</li>\r\n<li>neue Skins</li>\r\n<li>neue Waffen</li>\r\n<li>neue Sounds</li>\r\n<li>verbesserte KI</li>\r\n<li>Tools-Package</li>\r\n<li>Scenario-Editor</li>\r\n<li>Level-Editor</li>\r\n</ul>\r\nDie dritte Folge der Bestseller-Reihe im Bereich der 3D-Echtzeit-Simulationen präsentiert sich mit einer neuen Spielengine mit extrem ausgeprägtem Realismusgrad. Der Spieler übernimmt das Kommando über eine der besten Polizei-Spezialeinheiten oder einer der übelsten Terroristen-Gangs der Welt. Er durchläuft - als \"Guter\" oder \"Böser\" - eine der härtesten und elitärsten Kampfausbildungen, in der er lernt, mit jeder Art von Krisensituationen umzugehen. Bei diesem Action-Abenteuer geht es um das Leben prominenter Vertreter der Vereinten Nationen und bei 16 Missionen an Originalschauplätzen in LA gibt die \"lebensechte\" KI den Protagonisten jeder Seite so einige harte Nüsse zu knacken.','www.swat3.com',0,''),(22,2,'Unreal Tournament','2341: Die Gewalt ist eine Lebensweise, die sich ihren Weg durch die dunklen Risse der Gesellschaft bahnt. Sie bedroht die Macht und den Einfluss der regierenden Firmen, die schnellstens ein Mittel finden müssen, die tobenden Massen zu besänftigen - ein profitables Mittel ... Gladiatorenkämpfe sind die Lösung. Sie sollen den Durst der Menschen nach Blut stillen und sind die perfekte Gelegenheit, die Aufständischen, Kriminellen und Aliens zu beseitigen, die die Firmenelite bedrohen.<br><br>\r\nDas Turnier war geboren - ein Kampf auf Leben und Tod. Galaxisweit live und in Farbe! Kämpfen Sie für Freiheit, Ruhm und Ehre. Sie müssen stark, schnell und geschickt sein ... oder Sie bleiben auf der Strecke.<br><br>\r\nKämpfen Sie allein oder kommandieren Sie ein Team gegen Armeen unbarmherziger Krieger, die alle nur ein Ziel vor Augen haben: Die Arenen lebend zu verlassen und sich dem Grand Champion zu stellen ... um ihn dann zu bezwingen!<br><br>\r\n<b>Features:</b>\r\n<ul>\r\n<li>Auf dem PC mehrfach als Spiel des Jahres ausgezeichnet!</li>\r\n<li>Mehr als 50 faszinierende Level - verlassene Raumstationen, gotische Kathedralen und graffitibedeckte Großstädte.</li>\r\n<li>Vier actionreiche Spielmodi - Deathmatch, Capture the Flag, Assault und Domination werden Ihren Adrenalinpegel in die Höhe schnellen lassen.</li>\r\n<li>Dramatische Mehrspieler-Kämpfe mit 2, 3 und 4 Spielern, auch über das Netzwerk</li>\r\n<li>Gnadenlos aggressive Computergegner verlangen Ihnen das Äußerste ab.</li>\r\n<li>Neuartiges Benutzerinterface und verbesserte Steuerung - auch mit USB-Maus und -Tastatur spielbar.</li>\r\n</ul>\r\nDer Nachfolger des Actionhits \"Unreal\" verspricht ein leichtes, intuitives Interface, um auch Einsteigern schnellen Zugang zu den Duellen gegen die Bots zu ermöglichen. Mit diesen KI-Kriegern kann man auch Teams bilden und im umfangreichen Multiplayermodus ohne Onlinekosten in den Kampf ziehen. 35 komplett neue Arenen und das erweiterte Waffenangebot bilden dazu den würdigen Rahmen.','www.unrealtournament.net',0,''),(23,2,'The Wheel Of Time','<b><i>\"Wheel Of Time\"(Das Rad der Zeit)</i></b> basiert auf den Fantasy-Romanen von Kultautor Robert Jordan und stellt einen einzigartigen Mix aus Strategie-, Action- und Rollenspielelementen dar. Obwohl die Welt von \"Wheel of Time\" eng an die literarische Vorlage der Romane angelehnt ist, erzählt das Spiel keine lineare Geschichte. Die Story entwickelt sich abhängig von den Aktionen der Spieler, die jeweils die Rollen der Hauptcharaktere aus dem Roman übernehmen. Jede Figur hat den Oberbefehl über eine große Gefolgschaft, militärische Einheiten und Ländereien. Die Spieler können ihre eigenen Festungen konstruieren, individuell ausbauen, von dort aus das umliegende Land erforschen, magische Gegenstände sammeln oder die gegnerischen Zitadellen erstürmen. Selbstverständlich kann man sich auch über LAN oder Internet gegenseitig Truppen auf den Hals hetzen und die Festungen seiner Mitspieler in Schutt und Asche legen. Dreh- und Anlegepunkt von \"Wheel of Time\" ist der Kampf um die finstere Macht \"The Dark One\", die vor langer Zeit die Menschheit beinahe ins Verderben stürzte und nur mit Hilfe gewaltiger magischer Energie verbannt werden konnte. \"The Amyrlin Seat\" und \"The Children of the Night\" kämpfen nur gegen \"The Forsaken\" und \"The Hound\" um den Besitz des Schlüssels zu \"Shayol Ghul\" - dem magischen Siegel, mit dessen Hilfe \"The Dark One\" seinerzeit gebannt werden konnte.<br><br>\r\n<b>Features:</b> \r\n<ul>\r\n<li>Ego-Shooter mit Strategie-Elementen</li>\r\n<li>Spielumgebung in Echtzeit-3D</li>\r\n<li>Konstruktion aud Ausbau der eigenen Festung</li>\r\n<li>Einsatz von über 100 Artefakten und Zaubersprüchen</li>\r\n<li>Single- und Multiplayermodus</li>\r\n</ul>\r\nIm Mittelpunkt steht der Kampf gegen eine finstere Macht namens The Dark One. Deren Schergen müssen mit dem Einsatz von über 100 Artefakten und Zaubereien wie Blitzschlag oder Teleportation aus dem Weg geräumt werden. Die opulente 3D-Grafik verbindet Strategie- und Rollenspielelemente. \r\n\r\n<b>Voraussetzungen</b>\r\nmind. P200, 32MB RAM, 4x CD-Rom, Win95/98, DirectX 5.0 komp.Grafikkarte und Soundkarte. ','www.wheeloftime.com',46,''),(24,2,'Disciples: Sacred Land','Rundenbasierende Fantasy/RTS-Strategie mit gutem Design (vor allem die Levels, 4 versch. Rassen, tolle Einheiten), fantastischer Atmosphäre und exzellentem Soundtrack. Grafisch leider auf das Niveau von 1990.','www.strategyfirst.com/disciples/welcome.html',5,''),(25,2,'Microsoft Internet Tastatur PS/2','<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zusätzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verfügt über 10 zusätzliche Abkürzungstasten auf einer benutzerfreundlichen Standardtastatur, die darüber hinaus eine abnehmbare Handballenauflage aufweist. Über die Abkürzungstasten können Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software ermöglicht außerdem das individuelle Belegen der Tasten.','',1,''),(26,2,'Microsof IntelliMouse Explorer','Die IntelliMouse Explorer überzeugt durch ihr modernes Design mit silberfarbenem Gehäuse, sowie rot schimmernder Unter- und Rückseite. Die neuartige IntelliEye-Technologie sorgt für eine noch nie dagewesene Präzision, da statt der beweglichen Teile (zum Abtasten der Bewegungsänderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfaßt. Das Herzstück der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enthält.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen können, verzichtet wurde, muß die IntelliMouse Explorer nicht mehr gereinigt werden. Darüber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfläche, so daß kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zusätzlichen Maustasten ermöglicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempfänger benutzt wird.</i>','',0,''),(27,2,'Hewlett-Packard LaserJet 1100Xi','<b>HP LaserJet für mehr Produktivität und Flexibilität am Arbeitsplatz</b><br><br>\r\nDer HP LaserJet 1100Xi Drucker verbindet exzellente Laserdruckqualität mit hoher Geschwindigkeit für mehr Effizienz.<br><br>\r\n<b>Zielkunden</b>\r\n<ul><li>Einzelanwender, die Wert auf professionelle Ausdrucke in Laserqualität legen und schnelle Ergebnisse auch bei komplexen Dokumenten erwarten.</li>\r\n<li>Der HP LaserJet 1100 sorgt mit gestochen scharfen Texten und Grafiken für ein professionelles Erscheinungsbild Ihrer Arbeit und Ihres Unternehmens. Selbst bei komplexen Dokumenten liefert er schnelle Ergebnisse. Andere Medien - wie z.B. Transparentfolien und Briefumschläge, etc. - lassen sich problemlos bedrucken. Somit ist der HP LaserJet 1100 ein Multifunktionstalent im Büroalltag.</li>\r\n</ul>\r\n<b>Eigenschaften</b>\r\n<ul>\r\n<li><b>Druckqualität</b> Schwarzweiß: 600 x 600 dpi</li>\r\n<li><b>Monatliche Druckleistung</b> Bis zu 7000 Seiten</li>\r\n<li><b>Speicher</b> 2 MB Standardspeicher, erweiterbar auf 18 MB</li>\r\n<li><b>Schnittstelle/gemeinsame Nutzung</b> Parallel, IEEE 1284-kompatibel</li>\r\n<li><b>Softwarekompatibilität</b> DOS/Win 3.1x/9x/NT 4.0</li>\r\n<li><b>Papierzuführung</b> 125-Blatt-Papierzuführung</li>\r\n<li><b>Druckmedien</b> Normalpapier, Briefumschläge, Transparentfolien, kartoniertes Papier, Postkarten und Etiketten</li>\r\n<li><b>Netzwerkfähig</b> Über HP JetDirect PrintServer</li>\r\n<li><b>Lieferumfang</b> HP LaserJet 1100Xi Drucker (Lieferumfang: Drucker, Tonerkassette, 2 m Parallelkabel, Netzkabel, Kurzbedienungsanleitung, Benutzerhandbuch, CD-ROM, 3,5\"-Disketten mit Windows® 3.1x, 9x, NT 4.0 Treibern und DOS-Dienstprogrammen)</li>\r\n<li><b>Gewährleistung</b> Ein Jahr</li>\r\n</ul>\r\n','www.hp.com',7,''),(1,3,'Matrox G200 MMS','Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.','www.matrox.com/mga/products/g200_mms/home.cfm',0,''),(2,3,'Matrox G400 32MB','<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>','www.matrox.com/mga/products/mill_g400/home.htm',0,''),(3,3,'Microsoft IntelliMouse Pro','Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.','www.microsoft.com/hardware/mouse/intellimouse.asp',0,''),(4,3,'The Replacement Killers','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.replacement-killers.com',0,''),(5,3,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.bladerunner.com',0,''),(6,3,'The Matrix','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.','www.thematrix.com',0,''),(7,3,'You\'ve Got Mail','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.youvegotmail.com',0,''),(8,3,'A Bug\'s Life','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','www.abugslife.com',0,''),(9,3,'Under Siege','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(10,3,'Under Siege 2 - Dark Territory','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(11,3,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(12,3,'Die Hard With A Vengeance','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(13,3,'Lethal Weapon','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(14,3,'Red Corner','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(15,3,'Frantic','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(16,3,'Courage Under Fire','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(17,3,'Speed','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(18,3,'Speed 2: Cruise Control','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(19,3,'There\'s Something About Mary','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(20,3,'Beloved','Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).','',0,''),(21,3,'SWAT 3: Close Quarters Battle','<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!','www.swat3.com',0,''),(22,3,'Unreal Tournament','From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.','www.unrealtournament.net',0,''),(23,3,'The Wheel Of Time','The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.','www.wheeloftime.com',0,''),(24,3,'Disciples: Sacred Lands','A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.','',0,''),(25,3,'Microsoft Internet Keyboard PS/2','The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!','',0,''),(26,3,'Microsoft IntelliMouse Explorer','Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!','www.microsoft.com/hardware/mouse/explorer.asp',0,''),(27,3,'Hewlett Packard LaserJet 1100Xi','HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).','www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100',0,''),(1,4,'Matrox G200 MMS','<b>Unterstützung für zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie führt die bewährte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche Lösungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink® DVI Flachbildschirm Ausgang zur Verfügung. Mit den optional erhältlichen TV Tuner und Video-Capture Möglichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-Lösung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekrönter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterstützung für bis zu 16 Bildschirme über 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterstützung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekanäle pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlußmöglichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baulänge</li>\r\n<li>Treiberunterstützung: Windows® 2000, Windows NT® und Windows® 98</li>\r\n<li>Anwendungsbereiche: Börsenumgebung mit zeitgleich großem Visualisierungsbedarf, Videoüberwachung, Video-Conferencing</li>\r\n</ul>','www.matrox.com/mga/deutsch/products/g200_mms/home.cfm',0,''),(2,4,'Matrox G400 32 MB','<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingeführten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine überragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality² (VCQ²)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschließend festzustellen, daß die Matrox Millennium G400 Max als Allroundkarte für den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere wärmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>','www.matrox.com/mga/deutsch/products/mill_g400/home.cfm',0,''),(3,4,'Microsoft IntelliMouse Pro','Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gewölbte Oberseite paßt sich natürlich in die Handfläche ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl für Rechts- wie auch für Linkshänder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> weiß</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>','',0,''),(4,4,'Die Ersatzkiller','Originaltitel: &quot;The Replacement Killers&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 80 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Til Schweiger schießt auf Hongkong-Star Chow Yun-Fat (&quot;Anna und der König&quot;) ­ ein Fehler ...','www.replacement-killers.com',0,''),(5,4,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Sci-Fi-Klassiker, USA 1983, 112 Min.</b><br><br>\r\nLos Angeles ist im Jahr 2019 ein Hexenkessel. Dauerregen und Smog tauchen den überbevölkerten Moloch in ewige Dämmerung. Polizeigleiter schwirren durch die Luft und überwachen das grelle Ethnogemisch, das sich am Fuße 400stöckiger Stahlbeton-Pyramiden tummelt. Der abgehalfterte Ex-Cop und \"Blade Runner\" Rick Deckard ist Spezialist für die Beseitigung von Replikanten, künstlichen Menschen, geschaffen für harte Arbeit auf fremden Planeten. Nur ihm kann es gelingen, vier flüchtige, hochintelligente \"Nexus 6\"-Spezialmodelle zu stellen. Die sind mit ihrem starken und brandgefährlichen Anführer Batty auf der Suche nach ihrem Schöpfer. Er soll ihnen eine längere Lebenszeit schenken. Das muß Rick Deckard verhindern.  Als sich der eiskalte Jäger in Rachel, die Sekretärin seines Auftraggebers, verliebt, gerät sein Weltbild jedoch ins Wanken. Er entdeckt, daß sie - vielleicht wie er selbst - ein Replikant ist ...<br><br>\r\nDie Konfrontation des Menschen mit \"Realität\" und \"Virtualität\" und das verstrickte Spiel mit getürkten Erinnerungen zieht sich als roter Faden durch das Werk von Autor Philip K. Dick (\"Die totale Erinnerung\"). Sein Roman \"Träumen Roboter von elektrischen Schafen?\" liefert die Vorlage für diesen doppelbödigen Thriller, der den Zuschauer mit faszinierenden\r\nZukunftsvisionen und der gigantischen Kulisse des Großstadtmolochs gefangen nimmt.','www.bladerunner.com',0,''),(6,4,'Matrix','Originaltitel: &quot;The Matrix&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 136 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1999) Der Geniestreich der Wachowski-Brüder. In dieser technisch perfekten Utopie kämpft Hacker Keanu Reeves gegen die Diktatur der Maschinen...','www.whatisthematrix.com',0,''),(7,4,'e-m@il für Dich','Original: &quot;You\'ve got mail&quot;<br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998) von Nora Ephron (&qout;Schlaflos in Seattle&quot;). Meg Ryan und Tom Hanks knüpfen per E-Mail zarte Bande. Dass sie sich schon kennen, ahnen sie nicht ...','www.youvegotmail.com',0,''),(8,4,'Das Große Krabbeln','Originaltitel: &quot;A Bug\'s Life&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Ameise Flik zettelt einen Aufstand gegen gefräßige Grashüpfer an ... Eine fantastische Computeranimation des \"Toy Story\"-Teams. ','www.abugslife.com',0,''),(9,4,'Alarmstufe: Rot','Originaltitel: &quot;Under Siege&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Actionthriller. Smutje Steven Seagal versalzt Schurke Tommy Lee Jones die Suppe</b><br><br>\r\nKatastrophe ahoi: Kurz vor Ausmusterung der \"U.S.S. Missouri\" kapert die High-tech-Bande von Ex-CIA-Agent Strannix (Tommy Lee Jones) das Schlachtschiff. Strannix will die Nuklearraketen des Kreuzers klauen und verscherbeln. Mit Hilfe des irren Ersten Offiziers Krill (lustig: Gary Busey) killen die Gangster den Käptn und sperren seine Crew unter Deck. Blöd, dass sie dabei Schiffskoch Rybak (Steven Seagal) vergessen. Der Ex-Elitekämpfer knipst einen Schurken nach dem anderen aus. Eine Verbündete findet er in Stripperin Jordan (Ex-\"Baywatch\"-Biene Erika Eleniak). Die sollte eigentlich aus Käptns Geburtstagstorte hüpfen ... Klar: Seagal ist kein Edelmime. Dafür ist Regisseur Andrew Davis (\"Auf der Flucht\") ein Könner: Er würzt die Action-Orgie mit Ironie und nutzt die imposante Schiffskulisse voll aus. Für Effekte und Ton gab es 1993 Oscar-Nominierungen. ','',0,''),(10,4,'Alarmstufe: Rot 2','Originaltitel: &quot;Under Siege 2: Dark Territory&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 95). Von einem gekaperten Zug aus übernimmt Computerspezi Dane die Kontrolle über einen Kampfsatelliten und erpresst das Pentagon. Aber auch Ex-Offizier Ryback (Steven Seagal) ist im Zug ...\r\n','',0,''),(11,4,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin mysteriöser Mordfall führt den Bundesmarschall Jack Taggert in eine Kleinstadt im US-Staat Kentucky. Doch bei seinen Ermittlungen stößt er auf eine Mauer des Schweigens. Angst beherrscht die Stadt, und alle Spuren führen zu dem undurchsichtigen Minen-Tycoon Orin Hanner. Offenbar werden in der friedlichen Berglandschaft gigantische Mengen Giftmülls verschoben, mit unkalkulierbaren Risiken. Um eine Katastrophe zu verhindern, räumt Taggert gnadenlos auf ...','',0,''),(12,4,'Stirb Langsam - Jetzt Erst Recht','Originaltitel: &quot;Die Hard With A Vengeance&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSo explosiv, so spannend, so rasant wie nie zuvor: Bruce Willis als Detectiv John McClane in einem Action-Thriller der Superlative! Das ist heute nicht McClanes Tag. Seine Frau hat ihn verlassen, sein Boß hat ihn vom Dienst suspendiert und irgendein Verrückter hat ihn gerade zum Gegenspieler in einem teuflischen Spiel erkoren - und der Einsatz ist New York selbst. Ein Kaufhaus ist explodiert, doch das ist nur der Auftakt. Der geniale Superverbrecher Simon droht, die ganze Stadt Stück für Stück in die Luft zu sprengen, wenn McClane und sein Partner wider Willen seine explosiven\" Rätsel nicht lösen. Eine mörderische Hetzjagd quer durch New York beginnt - bis McClane merkt, daß der Bombenterror eigentlich nur ein brillantes Ablenkungsmanöver ist...!<br><i>\"Perfekt gemacht und stark besetzt. Das Action-Highlight des Jahres!\"</i> <b>(Bild)</b>','',0,''),(13,4,'Zwei stahlharte Profis','Originaltitel: &quot;Lethal Weapon&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSie sind beide Cops in L.A.. Sie haben beide in Vietnam für eine Spezialeinheit gekämpft. Und sie hassen es beide, mit einem Partner arbeiten zu müssen. Aber sie sind Partner: Martin Riggs, der Mann mit dem Todeswunsch, für wen auch immer. Und Roger Murtaugh, der besonnene Polizist. Gemeinsam enttarnen sie einen gigantischen Heroinschmuggel, hinter dem sich eine Gruppe ehemaliger CIA-Söldner verbirgt. Eine Killerbande gegen zwei Profis ...','',0,''),(14,4,'Labyrinth ohne Ausweg','Originaltitel: &quot;Red Corner&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDem Amerikaner Jack Moore wird in China der bestialische Mord an einem Fotomodel angehängt. Brutale Gefängnisschergen versuchen, ihn durch Folter zu einem Geständnis zu zwingen. Vor Gericht fordert die Anklage die Todesstrafe - Moore\'s Schicksal scheint besiegelt. Durch einen Zufall gelingt es ihm, aus der Haft zu fliehen, doch aus der feindseligen chinesischen Hauptstadt gibt es praktisch kein Entkommen ...','',0,''),(15,4,'Frantic','Originaltitel: &quot;Frantic&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin romantischer Urlaub in Paris, der sich in einen Alptraum verwandelt. Ein Mann auf der verzweifelten Suche nach seiner entführten Frau. Ein düster-bedrohliches Paris, in dem nur ein Mensch Licht in die tödliche Affäre bringen kann.','',0,''),(16,4,'Mut Zur Wahrheit','Originaltitel: &quot;Courage Under Fire&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nLieutenant Colonel Nathaniel Serling (Denzel Washington) lässt während einer Schlacht im Golfkrieg versehentlich auf einen US-Panzer schießen, dessen Mannschaft dabei ums Leben kommt. Ein Jahr nach diesem Vorfall wird Serling, der mittlerweile nach Washington D.C. versetzt wurde, die Aufgabe übertragen, sich um einen Kandidaten zu kümmern, der während des Krieges starb und dem der höchste militärische Orden zuteil werden soll. Allerdings sind sowohl der Fall und als auch der betreffende Soldat ein politisch heißes Eisen -- Captain Karen Walden (Meg Ryan) ist Amerikas erster weiblicher Soldat, der im Kampf getötet wurde.<br><br>\r\nSerling findet schnell heraus, dass es im Fall des im felsigen Gebiet von Kuwait abgestürzten Rettungshubschraubers Diskrepanzen gibt. In Flashbacks werden von unterschiedlichen Personen verschiedene Versionen von Waldens Taktik, die Soldaten zu retten und den Absturz zu überleben, dargestellt (à la Kurosawas Rashomon). Genau wie in Glory erweist sich Regisseur Edward Zwicks Zusammenstellung von bekannten und unbekannten Schauspielern als die richtige Mischung. Waldens Crew ist besonders überzeugend. Matt Damon als der Sanitäter kommt gut als der leichtfertige Typ rüber, als er Washington seine Geschichte erzählt. Im Kampf ist er ein mit Fehlern behafteter, humorvoller Soldat.<br><br>\r\nDie erstaunlichste Arbeit in Mut zur Wahrheit leistet Lou Diamond Phillips (als der Schütze der Gruppe), dessen Karriere sich auf dem Weg in die direkt für den Videomarkt produzierten Filme befand. Und dann ist da noch Ryan. Sie hat sich in dramatischen Filmen in der Vergangenheit gut behauptet (Eine fast perfekte Liebe, Ein blutiges Erbe), es aber nie geschafft, ihrem Image zu entfliehen, das sie in die Ecke der romantischen Komödie steckte. Mit gefärbtem Haar, einem leichten Akzent und der von ihr geforderten Darstellungskunst hat sie endlich einen langlebigen dramatischen Film. Obwohl sie nur halb so oft wie Washington im Film zu sehen ist, macht ihre mutige und beeindruckend nachhaltige Darstellung Mut zur Wahrheit zu einem speziellen Film bis hin zu dessen seltsamer, aber lohnender letzter Szene.','',0,''),(17,4,'Speed','Originaltitel: &quot;Speed&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEr ist ein Cop aus der Anti-Terror-Einheit von Los Angeles. Und so ist der Alarm für Jack Traven nichts Ungewöhnliches: Ein Terrorist will drei Millionen Dollar erpressen, oder die zufälligen Geiseln in einem Aufzug fallen 35 Stockwerke in die Tiefe. Doch Jack schafft das Unmögliche - die Geiseln werden gerettet und der Terrorist stirbt an seiner eigenen Bombe. Scheinbar. Denn schon wenig später steht Jack (Keanu Reeves) dem Bombenexperten Payne erneut gegenüber. Diesmal hat sich der Erpresser eine ganz perfide Mordwaffe ausgedacht: Er plaziert eine Bombe in einem öffentlichen Bus. Der Mechanismus der Sprengladung schaltet sich automatisch ein, sobald der Bus schneller als 50 Meilen in der Stunde fährt und detoniert sofort, sobald die Geschwindigkeit sinkt. Plötzlich wird für eine Handvoll ahnungsloser Durchschnittsbürger der Weg zur Arbeit zum Höllentrip - und nur Jack hat ihr Leben in der Hand. Als der Busfahrer verletzt wird, übernimmt Fahrgast Annie (Sandra Bullock) das Steuer. Doch wohin mit einem Bus, der nicht bremsen kann in der Stadt der Staus? Doch es kommt noch schlimmer: Payne (Dennis Hopper) will jetzt nicht nur seine drei Millionen Dollar. Er will Jack. Um jeden Preis.','',0,''),(18,4,'Speed 2: Cruise Control','Originaltitel: &quot;Speed 2 - Cruise Control&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nHalten Sie ihre Schwimmwesten bereit, denn die actiongeladene Fortsetzung von Speed begibt sich auf Hochseekurs. Erleben Sie Sandra Bullock erneut in ihrer Star-Rolle als Annie Porter. Die Karibik-Kreuzfahrt mit ihrem Freund Alex entwickelt sich unaufhaltsam zur rasenden Todesfahrt, als ein wahnsinniger Computer-Spezialist den Luxusliner in seine Gewalt bringt und auf einen mörderischen Zerstörungskurs programmiert. Eine hochexplosive Reise, bei der kein geringerer als Action-Spezialist Jan De Bont das Ruder in die Hand nimmt. Speed 2: Cruise Controll läßt ihre Adrenalin-Wellen in rasender Geschwindigkeit ganz nach oben schnellen.','',0,''),(19,4,'Verrückt nach Mary','Originaltitel: &quot;There\'s Something About Mary&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n13 Jahre nachdem Teds Rendezvous mit seiner angebeteten Mary in einem peinlichen Fiasko endete, träumt er immer noch von ihr und engagiert den windigen Privatdetektiv Healy um sie aufzuspüren. Der findet Mary in Florida und verliebt sich auf den ersten Blick in die atemberaubende Traumfrau. Um Ted als Nebenbuhler auszuschalten, tischt er ihm dicke Lügen über Mary auf. Ted läßt sich jedoch nicht abschrecken, eilt nach Miami und versucht nun alles, um Healy die Balztour zu vermasseln. Doch nicht nur Healy ist verrückt nach Mary und Ted bekommt es mit einer ganzen Legion liebeskranker Konkurrenten zu tun ...','',0,''),(20,4,'Menschenkind','Originaltitel: &quot;Beloved&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDieser vielschichtige Film ist eine Arbeit, die Regisseur Jonathan Demme und dem amerikanischen Talkshow-Star Oprah Winfrey sehr am Herzen lag. Der Film deckt im Verlauf seiner dreistündigen Spielzeit viele Bereiche ab. Menschenkind ist teils Sklavenepos, teils Mutter-Tochter-Drama und teils Geistergeschichte.<br><br>\r\nDer Film fordert vom Publikum höchste Aufmerksamkeit, angefangen bei seiner dramatischen und etwas verwirrenden Eingangssequenz, in der die Bewohner eines Hauses von einem niederträchtigen übersinnlichen Angriff heimgesucht werden. Aber Demme und seine talentierte Besetzung bereiten denen, die dabei bleiben ein unvergessliches Erlebnis. Der Film folgt den Spuren von Sethe (in ihren mittleren Jahren von Oprah Winfrey dargestellt), einer ehemaligen Sklavin, die sich scheinbar ein friedliches und produktives Leben in Ohio aufgebaut hat. Aber durch den erschreckenden und sparsamen Einsatz von Rückblenden deckt Demme, genau wie das literarische Meisterwerk von Toni Morrison, auf dem der Film basiert, langsam die Schrecken von Sethes früherem Leben auf und das schreckliche Ereignis, dass dazu führte, dass Sethes Haus von Geistern heimgesucht wird.<br><br>\r\nWährend die Gräuel der Sklaverei und das blutige Ereignis in Sethes Familie unleugbar tief beeindrucken, ist die Qualität des Film auch in kleineren, genauso befriedigenden Details sichtbar. Die geistlich beeinflusste Musik von Rachel Portman ist gleichzeitig befreiend und bedrückend, und der Einblick in die afro-amerikanische Gemeinschaft nach der Sklaverei -- am Beispiel eines Familienausflugs zu einem Jahrmarkt, oder dem gospelsingenden Nähkränzchen -- machen diesen Film zu einem speziellen Vergnügen sowohl für den Geist als auch für das Herz. Die Schauspieler, besonders Kimberley Elise als Sethes kämpfende Tochter und Thandie Newton als der mysteriöse Titelcharakter, sind sehr rührend. Achten Sie auch auf Danny Glover (Lethal Weapon) als Paul D.','',0,''),(21,4,'SWAT 3: Elite Edition','<b>KEINE KOMPROMISSE!</b><br><i>Kämpfen Sie Seite an Seite mit Ihren LAPD SWAT-Kameraden gegen das organisierte Verbrechen!</i><br><br>\r\nEine der realistischsten 3D-Taktiksimulationen der letzten Zeit jetzt mit Multiplayer-Modus, 5 neuen Missionen und jede Menge nützliche Tools!<br><br>\r\nLos Angeles, 2005. In wenigen Tagen steht die Unterzeichnung des Abkommens der Vereinten Nationen zur Atom-Ächtung durch Vertreter aller Nationen der Welt an. Radikale terroristische Vereinigungen machen sich in der ganzen Stadt breit. Verantwortlich für die Sicherheit der Delegierten zeichnet sich eine Eliteeinheit der LAPD: das SWAT-Team. Das Schicksal der Stadt liegt in Ihren Händen.<br><br>\r\n<b>Neue Features:</b>\r\n<ul>\r\n<li>Multiplayer-Modus (Co op-Modus, Deathmatch in den bekannten Variationen)</li>\r\n<li>5 neue Missionen an original Örtlichkeiten Las (U-Bahn, Whitman Airport, etc.)</li>\r\n<li>neue Charakter</li>\r\n<li>neue Skins</li>\r\n<li>neue Waffen</li>\r\n<li>neue Sounds</li>\r\n<li>verbesserte KI</li>\r\n<li>Tools-Package</li>\r\n<li>Scenario-Editor</li>\r\n<li>Level-Editor</li>\r\n</ul>\r\nDie dritte Folge der Bestseller-Reihe im Bereich der 3D-Echtzeit-Simulationen präsentiert sich mit einer neuen Spielengine mit extrem ausgeprägtem Realismusgrad. Der Spieler übernimmt das Kommando über eine der besten Polizei-Spezialeinheiten oder einer der übelsten Terroristen-Gangs der Welt. Er durchläuft - als \"Guter\" oder \"Böser\" - eine der härtesten und elitärsten Kampfausbildungen, in der er lernt, mit jeder Art von Krisensituationen umzugehen. Bei diesem Action-Abenteuer geht es um das Leben prominenter Vertreter der Vereinten Nationen und bei 16 Missionen an Originalschauplätzen in LA gibt die \"lebensechte\" KI den Protagonisten jeder Seite so einige harte Nüsse zu knacken.','www.swat3.com',0,''),(22,4,'Unreal Tournament','2341: Die Gewalt ist eine Lebensweise, die sich ihren Weg durch die dunklen Risse der Gesellschaft bahnt. Sie bedroht die Macht und den Einfluss der regierenden Firmen, die schnellstens ein Mittel finden müssen, die tobenden Massen zu besänftigen - ein profitables Mittel ... Gladiatorenkämpfe sind die Lösung. Sie sollen den Durst der Menschen nach Blut stillen und sind die perfekte Gelegenheit, die Aufständischen, Kriminellen und Aliens zu beseitigen, die die Firmenelite bedrohen.<br><br>\r\nDas Turnier war geboren - ein Kampf auf Leben und Tod. Galaxisweit live und in Farbe! Kämpfen Sie für Freiheit, Ruhm und Ehre. Sie müssen stark, schnell und geschickt sein ... oder Sie bleiben auf der Strecke.<br><br>\r\nKämpfen Sie allein oder kommandieren Sie ein Team gegen Armeen unbarmherziger Krieger, die alle nur ein Ziel vor Augen haben: Die Arenen lebend zu verlassen und sich dem Grand Champion zu stellen ... um ihn dann zu bezwingen!<br><br>\r\n<b>Features:</b>\r\n<ul>\r\n<li>Auf dem PC mehrfach als Spiel des Jahres ausgezeichnet!</li>\r\n<li>Mehr als 50 faszinierende Level - verlassene Raumstationen, gotische Kathedralen und graffitibedeckte Großstädte.</li>\r\n<li>Vier actionreiche Spielmodi - Deathmatch, Capture the Flag, Assault und Domination werden Ihren Adrenalinpegel in die Höhe schnellen lassen.</li>\r\n<li>Dramatische Mehrspieler-Kämpfe mit 2, 3 und 4 Spielern, auch über das Netzwerk</li>\r\n<li>Gnadenlos aggressive Computergegner verlangen Ihnen das Äußerste ab.</li>\r\n<li>Neuartiges Benutzerinterface und verbesserte Steuerung - auch mit USB-Maus und -Tastatur spielbar.</li>\r\n</ul>\r\nDer Nachfolger des Actionhits \"Unreal\" verspricht ein leichtes, intuitives Interface, um auch Einsteigern schnellen Zugang zu den Duellen gegen die Bots zu ermöglichen. Mit diesen KI-Kriegern kann man auch Teams bilden und im umfangreichen Multiplayermodus ohne Onlinekosten in den Kampf ziehen. 35 komplett neue Arenen und das erweiterte Waffenangebot bilden dazu den würdigen Rahmen.','www.unrealtournament.net',0,''),(23,4,'The Wheel Of Time','<b><i>\"Wheel Of Time\"(Das Rad der Zeit)</i></b> basiert auf den Fantasy-Romanen von Kultautor Robert Jordan und stellt einen einzigartigen Mix aus Strategie-, Action- und Rollenspielelementen dar. Obwohl die Welt von \"Wheel of Time\" eng an die literarische Vorlage der Romane angelehnt ist, erzählt das Spiel keine lineare Geschichte. Die Story entwickelt sich abhängig von den Aktionen der Spieler, die jeweils die Rollen der Hauptcharaktere aus dem Roman übernehmen. Jede Figur hat den Oberbefehl über eine große Gefolgschaft, militärische Einheiten und Ländereien. Die Spieler können ihre eigenen Festungen konstruieren, individuell ausbauen, von dort aus das umliegende Land erforschen, magische Gegenstände sammeln oder die gegnerischen Zitadellen erstürmen. Selbstverständlich kann man sich auch über LAN oder Internet gegenseitig Truppen auf den Hals hetzen und die Festungen seiner Mitspieler in Schutt und Asche legen. Dreh- und Anlegepunkt von \"Wheel of Time\" ist der Kampf um die finstere Macht \"The Dark One\", die vor langer Zeit die Menschheit beinahe ins Verderben stürzte und nur mit Hilfe gewaltiger magischer Energie verbannt werden konnte. \"The Amyrlin Seat\" und \"The Children of the Night\" kämpfen nur gegen \"The Forsaken\" und \"The Hound\" um den Besitz des Schlüssels zu \"Shayol Ghul\" - dem magischen Siegel, mit dessen Hilfe \"The Dark One\" seinerzeit gebannt werden konnte.<br><br>\r\n<b>Features:</b> \r\n<ul>\r\n<li>Ego-Shooter mit Strategie-Elementen</li>\r\n<li>Spielumgebung in Echtzeit-3D</li>\r\n<li>Konstruktion aud Ausbau der eigenen Festung</li>\r\n<li>Einsatz von über 100 Artefakten und Zaubersprüchen</li>\r\n<li>Single- und Multiplayermodus</li>\r\n</ul>\r\nIm Mittelpunkt steht der Kampf gegen eine finstere Macht namens The Dark One. Deren Schergen müssen mit dem Einsatz von über 100 Artefakten und Zaubereien wie Blitzschlag oder Teleportation aus dem Weg geräumt werden. Die opulente 3D-Grafik verbindet Strategie- und Rollenspielelemente. \r\n\r\n<b>Voraussetzungen</b>\r\nmind. P200, 32MB RAM, 4x CD-Rom, Win95/98, DirectX 5.0 komp.Grafikkarte und Soundkarte. ','www.wheeloftime.com',0,''),(24,4,'Disciples: Sacred Land','Rundenbasierende Fantasy/RTS-Strategie mit gutem Design (vor allem die Levels, 4 versch. Rassen, tolle Einheiten), fantastischer Atmosphäre und exzellentem Soundtrack. Grafisch leider auf das Niveau von 1990.','www.strategyfirst.com/disciples/welcome.html',0,''),(25,4,'Microsoft Internet Tastatur PS/2','<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zusätzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verfügt über 10 zusätzliche Abkürzungstasten auf einer benutzerfreundlichen Standardtastatur, die darüber hinaus eine abnehmbare Handballenauflage aufweist. Über die Abkürzungstasten können Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software ermöglicht außerdem das individuelle Belegen der Tasten.','',0,''),(26,4,'Microsof IntelliMouse Explorer','Die IntelliMouse Explorer überzeugt durch ihr modernes Design mit silberfarbenem Gehäuse, sowie rot schimmernder Unter- und Rückseite. Die neuartige IntelliEye-Technologie sorgt für eine noch nie dagewesene Präzision, da statt der beweglichen Teile (zum Abtasten der Bewegungsänderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfaßt. Das Herzstück der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enthält.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen können, verzichtet wurde, muß die IntelliMouse Explorer nicht mehr gereinigt werden. Darüber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfläche, so daß kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zusätzlichen Maustasten ermöglicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempfänger benutzt wird.</i>','',0,''),(27,4,'Hewlett-Packard LaserJet 1100Xi','<b>HP LaserJet für mehr Produktivität und Flexibilität am Arbeitsplatz</b><br><br>\r\nDer HP LaserJet 1100Xi Drucker verbindet exzellente Laserdruckqualität mit hoher Geschwindigkeit für mehr Effizienz.<br><br>\r\n<b>Zielkunden</b>\r\n<ul><li>Einzelanwender, die Wert auf professionelle Ausdrucke in Laserqualität legen und schnelle Ergebnisse auch bei komplexen Dokumenten erwarten.</li>\r\n<li>Der HP LaserJet 1100 sorgt mit gestochen scharfen Texten und Grafiken für ein professionelles Erscheinungsbild Ihrer Arbeit und Ihres Unternehmens. Selbst bei komplexen Dokumenten liefert er schnelle Ergebnisse. Andere Medien - wie z.B. Transparentfolien und Briefumschläge, etc. - lassen sich problemlos bedrucken. Somit ist der HP LaserJet 1100 ein Multifunktionstalent im Büroalltag.</li>\r\n</ul>\r\n<b>Eigenschaften</b>\r\n<ul>\r\n<li><b>Druckqualität</b> Schwarzweiß: 600 x 600 dpi</li>\r\n<li><b>Monatliche Druckleistung</b> Bis zu 7000 Seiten</li>\r\n<li><b>Speicher</b> 2 MB Standardspeicher, erweiterbar auf 18 MB</li>\r\n<li><b>Schnittstelle/gemeinsame Nutzung</b> Parallel, IEEE 1284-kompatibel</li>\r\n<li><b>Softwarekompatibilität</b> DOS/Win 3.1x/9x/NT 4.0</li>\r\n<li><b>Papierzuführung</b> 125-Blatt-Papierzuführung</li>\r\n<li><b>Druckmedien</b> Normalpapier, Briefumschläge, Transparentfolien, kartoniertes Papier, Postkarten und Etiketten</li>\r\n<li><b>Netzwerkfähig</b> Über HP JetDirect PrintServer</li>\r\n<li><b>Lieferumfang</b> HP LaserJet 1100Xi Drucker (Lieferumfang: Drucker, Tonerkassette, 2 m Parallelkabel, Netzkabel, Kurzbedienungsanleitung, Benutzerhandbuch, CD-ROM, 3,5\"-Disketten mit Windows® 3.1x, 9x, NT 4.0 Treibern und DOS-Dienstprogrammen)</li>\r\n<li><b>Gewährleistung</b> Ein Jahr</li>\r\n</ul>\r\n','www.hp.com',0,''),(1,5,'Matrox G200 MMS','<b>Unterstützung für zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie führt die bewährte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche Lösungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink® DVI Flachbildschirm Ausgang zur Verfügung. Mit den optional erhältlichen TV Tuner und Video-Capture Möglichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-Lösung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekrönter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterstützung für bis zu 16 Bildschirme über 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterstützung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekanäle pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlußmöglichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baulänge</li>\r\n<li>Treiberunterstützung: Windows® 2000, Windows NT® und Windows® 98</li>\r\n<li>Anwendungsbereiche: Börsenumgebung mit zeitgleich großem Visualisierungsbedarf, Videoüberwachung, Video-Conferencing</li>\r\n</ul>','www.matrox.com/mga/deutsch/products/g200_mms/home.cfm',0,''),(2,5,'Matrox G400 32 MB','<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingeführten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine überragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality² (VCQ²)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschließend festzustellen, daß die Matrox Millennium G400 Max als Allroundkarte für den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere wärmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>','www.matrox.com/mga/deutsch/products/mill_g400/home.cfm',0,''),(3,5,'Microsoft IntelliMouse Pro','Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gewölbte Oberseite paßt sich natürlich in die Handfläche ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl für Rechts- wie auch für Linkshänder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> weiß</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>','',0,''),(4,5,'Die Ersatzkiller','Originaltitel: &quot;The Replacement Killers&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 80 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Til Schweiger schießt auf Hongkong-Star Chow Yun-Fat (&quot;Anna und der König&quot;) ­ ein Fehler ...','www.replacement-killers.com',0,''),(5,5,'Blade Runner - Director\'s Cut','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Sci-Fi-Klassiker, USA 1983, 112 Min.</b><br><br>\r\nLos Angeles ist im Jahr 2019 ein Hexenkessel. Dauerregen und Smog tauchen den überbevölkerten Moloch in ewige Dämmerung. Polizeigleiter schwirren durch die Luft und überwachen das grelle Ethnogemisch, das sich am Fuße 400stöckiger Stahlbeton-Pyramiden tummelt. Der abgehalfterte Ex-Cop und \"Blade Runner\" Rick Deckard ist Spezialist für die Beseitigung von Replikanten, künstlichen Menschen, geschaffen für harte Arbeit auf fremden Planeten. Nur ihm kann es gelingen, vier flüchtige, hochintelligente \"Nexus 6\"-Spezialmodelle zu stellen. Die sind mit ihrem starken und brandgefährlichen Anführer Batty auf der Suche nach ihrem Schöpfer. Er soll ihnen eine längere Lebenszeit schenken. Das muß Rick Deckard verhindern.  Als sich der eiskalte Jäger in Rachel, die Sekretärin seines Auftraggebers, verliebt, gerät sein Weltbild jedoch ins Wanken. Er entdeckt, daß sie - vielleicht wie er selbst - ein Replikant ist ...<br><br>\r\nDie Konfrontation des Menschen mit \"Realität\" und \"Virtualität\" und das verstrickte Spiel mit getürkten Erinnerungen zieht sich als roter Faden durch das Werk von Autor Philip K. Dick (\"Die totale Erinnerung\"). Sein Roman \"Träumen Roboter von elektrischen Schafen?\" liefert die Vorlage für diesen doppelbödigen Thriller, der den Zuschauer mit faszinierenden\r\nZukunftsvisionen und der gigantischen Kulisse des Großstadtmolochs gefangen nimmt.','www.bladerunner.com',0,''),(6,5,'Matrix','Originaltitel: &quot;The Matrix&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 136 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1999) Der Geniestreich der Wachowski-Brüder. In dieser technisch perfekten Utopie kämpft Hacker Keanu Reeves gegen die Diktatur der Maschinen...','www.whatisthematrix.com',0,''),(7,5,'e-m@il für Dich','Original: &quot;You\'ve got mail&quot;<br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998) von Nora Ephron (&qout;Schlaflos in Seattle&quot;). Meg Ryan und Tom Hanks knüpfen per E-Mail zarte Bande. Dass sie sich schon kennen, ahnen sie nicht ...','www.youvegotmail.com',0,''),(8,5,'Das Große Krabbeln','Originaltitel: &quot;A Bug\'s Life&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Ameise Flik zettelt einen Aufstand gegen gefräßige Grashüpfer an ... Eine fantastische Computeranimation des \"Toy Story\"-Teams. ','www.abugslife.com',0,''),(9,5,'Alarmstufe: Rot','Originaltitel: &quot;Under Siege&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Actionthriller. Smutje Steven Seagal versalzt Schurke Tommy Lee Jones die Suppe</b><br><br>\r\nKatastrophe ahoi: Kurz vor Ausmusterung der \"U.S.S. Missouri\" kapert die High-tech-Bande von Ex-CIA-Agent Strannix (Tommy Lee Jones) das Schlachtschiff. Strannix will die Nuklearraketen des Kreuzers klauen und verscherbeln. Mit Hilfe des irren Ersten Offiziers Krill (lustig: Gary Busey) killen die Gangster den Käptn und sperren seine Crew unter Deck. Blöd, dass sie dabei Schiffskoch Rybak (Steven Seagal) vergessen. Der Ex-Elitekämpfer knipst einen Schurken nach dem anderen aus. Eine Verbündete findet er in Stripperin Jordan (Ex-\"Baywatch\"-Biene Erika Eleniak). Die sollte eigentlich aus Käptns Geburtstagstorte hüpfen ... Klar: Seagal ist kein Edelmime. Dafür ist Regisseur Andrew Davis (\"Auf der Flucht\") ein Könner: Er würzt die Action-Orgie mit Ironie und nutzt die imposante Schiffskulisse voll aus. Für Effekte und Ton gab es 1993 Oscar-Nominierungen. ','',0,''),(10,5,'Alarmstufe: Rot 2','Originaltitel: &quot;Under Siege 2: Dark Territory&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 95). Von einem gekaperten Zug aus übernimmt Computerspezi Dane die Kontrolle über einen Kampfsatelliten und erpresst das Pentagon. Aber auch Ex-Offizier Ryback (Steven Seagal) ist im Zug ...\r\n','',0,''),(11,5,'Fire Down Below','Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin mysteriöser Mordfall führt den Bundesmarschall Jack Taggert in eine Kleinstadt im US-Staat Kentucky. Doch bei seinen Ermittlungen stößt er auf eine Mauer des Schweigens. Angst beherrscht die Stadt, und alle Spuren führen zu dem undurchsichtigen Minen-Tycoon Orin Hanner. Offenbar werden in der friedlichen Berglandschaft gigantische Mengen Giftmülls verschoben, mit unkalkulierbaren Risiken. Um eine Katastrophe zu verhindern, räumt Taggert gnadenlos auf ...','',0,''),(12,5,'Stirb Langsam - Jetzt Erst Recht','Originaltitel: &quot;Die Hard With A Vengeance&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSo explosiv, so spannend, so rasant wie nie zuvor: Bruce Willis als Detectiv John McClane in einem Action-Thriller der Superlative! Das ist heute nicht McClanes Tag. Seine Frau hat ihn verlassen, sein Boß hat ihn vom Dienst suspendiert und irgendein Verrückter hat ihn gerade zum Gegenspieler in einem teuflischen Spiel erkoren - und der Einsatz ist New York selbst. Ein Kaufhaus ist explodiert, doch das ist nur der Auftakt. Der geniale Superverbrecher Simon droht, die ganze Stadt Stück für Stück in die Luft zu sprengen, wenn McClane und sein Partner wider Willen seine explosiven\" Rätsel nicht lösen. Eine mörderische Hetzjagd quer durch New York beginnt - bis McClane merkt, daß der Bombenterror eigentlich nur ein brillantes Ablenkungsmanöver ist...!<br><i>\"Perfekt gemacht und stark besetzt. Das Action-Highlight des Jahres!\"</i> <b>(Bild)</b>','',0,''),(13,5,'Zwei stahlharte Profis','Originaltitel: &quot;Lethal Weapon&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSie sind beide Cops in L.A.. Sie haben beide in Vietnam für eine Spezialeinheit gekämpft. Und sie hassen es beide, mit einem Partner arbeiten zu müssen. Aber sie sind Partner: Martin Riggs, der Mann mit dem Todeswunsch, für wen auch immer. Und Roger Murtaugh, der besonnene Polizist. Gemeinsam enttarnen sie einen gigantischen Heroinschmuggel, hinter dem sich eine Gruppe ehemaliger CIA-Söldner verbirgt. Eine Killerbande gegen zwei Profis ...','',0,''),(14,5,'Labyrinth ohne Ausweg','Originaltitel: &quot;Red Corner&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDem Amerikaner Jack Moore wird in China der bestialische Mord an einem Fotomodel angehängt. Brutale Gefängnisschergen versuchen, ihn durch Folter zu einem Geständnis zu zwingen. Vor Gericht fordert die Anklage die Todesstrafe - Moore\'s Schicksal scheint besiegelt. Durch einen Zufall gelingt es ihm, aus der Haft zu fliehen, doch aus der feindseligen chinesischen Hauptstadt gibt es praktisch kein Entkommen ...','',0,''),(15,5,'Frantic','Originaltitel: &quot;Frantic&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin romantischer Urlaub in Paris, der sich in einen Alptraum verwandelt. Ein Mann auf der verzweifelten Suche nach seiner entführten Frau. Ein düster-bedrohliches Paris, in dem nur ein Mensch Licht in die tödliche Affäre bringen kann.','',0,''),(16,5,'Mut Zur Wahrheit','Originaltitel: &quot;Courage Under Fire&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nLieutenant Colonel Nathaniel Serling (Denzel Washington) lässt während einer Schlacht im Golfkrieg versehentlich auf einen US-Panzer schießen, dessen Mannschaft dabei ums Leben kommt. Ein Jahr nach diesem Vorfall wird Serling, der mittlerweile nach Washington D.C. versetzt wurde, die Aufgabe übertragen, sich um einen Kandidaten zu kümmern, der während des Krieges starb und dem der höchste militärische Orden zuteil werden soll. Allerdings sind sowohl der Fall und als auch der betreffende Soldat ein politisch heißes Eisen -- Captain Karen Walden (Meg Ryan) ist Amerikas erster weiblicher Soldat, der im Kampf getötet wurde.<br><br>\r\nSerling findet schnell heraus, dass es im Fall des im felsigen Gebiet von Kuwait abgestürzten Rettungshubschraubers Diskrepanzen gibt. In Flashbacks werden von unterschiedlichen Personen verschiedene Versionen von Waldens Taktik, die Soldaten zu retten und den Absturz zu überleben, dargestellt (à la Kurosawas Rashomon). Genau wie in Glory erweist sich Regisseur Edward Zwicks Zusammenstellung von bekannten und unbekannten Schauspielern als die richtige Mischung. Waldens Crew ist besonders überzeugend. Matt Damon als der Sanitäter kommt gut als der leichtfertige Typ rüber, als er Washington seine Geschichte erzählt. Im Kampf ist er ein mit Fehlern behafteter, humorvoller Soldat.<br><br>\r\nDie erstaunlichste Arbeit in Mut zur Wahrheit leistet Lou Diamond Phillips (als der Schütze der Gruppe), dessen Karriere sich auf dem Weg in die direkt für den Videomarkt produzierten Filme befand. Und dann ist da noch Ryan. Sie hat sich in dramatischen Filmen in der Vergangenheit gut behauptet (Eine fast perfekte Liebe, Ein blutiges Erbe), es aber nie geschafft, ihrem Image zu entfliehen, das sie in die Ecke der romantischen Komödie steckte. Mit gefärbtem Haar, einem leichten Akzent und der von ihr geforderten Darstellungskunst hat sie endlich einen langlebigen dramatischen Film. Obwohl sie nur halb so oft wie Washington im Film zu sehen ist, macht ihre mutige und beeindruckend nachhaltige Darstellung Mut zur Wahrheit zu einem speziellen Film bis hin zu dessen seltsamer, aber lohnender letzter Szene.','',0,''),(17,5,'Speed','Originaltitel: &quot;Speed&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEr ist ein Cop aus der Anti-Terror-Einheit von Los Angeles. Und so ist der Alarm für Jack Traven nichts Ungewöhnliches: Ein Terrorist will drei Millionen Dollar erpressen, oder die zufälligen Geiseln in einem Aufzug fallen 35 Stockwerke in die Tiefe. Doch Jack schafft das Unmögliche - die Geiseln werden gerettet und der Terrorist stirbt an seiner eigenen Bombe. Scheinbar. Denn schon wenig später steht Jack (Keanu Reeves) dem Bombenexperten Payne erneut gegenüber. Diesmal hat sich der Erpresser eine ganz perfide Mordwaffe ausgedacht: Er plaziert eine Bombe in einem öffentlichen Bus. Der Mechanismus der Sprengladung schaltet sich automatisch ein, sobald der Bus schneller als 50 Meilen in der Stunde fährt und detoniert sofort, sobald die Geschwindigkeit sinkt. Plötzlich wird für eine Handvoll ahnungsloser Durchschnittsbürger der Weg zur Arbeit zum Höllentrip - und nur Jack hat ihr Leben in der Hand. Als der Busfahrer verletzt wird, übernimmt Fahrgast Annie (Sandra Bullock) das Steuer. Doch wohin mit einem Bus, der nicht bremsen kann in der Stadt der Staus? Doch es kommt noch schlimmer: Payne (Dennis Hopper) will jetzt nicht nur seine drei Millionen Dollar. Er will Jack. Um jeden Preis.','',0,''),(18,5,'Speed 2: Cruise Control','Originaltitel: &quot;Speed 2 - Cruise Control&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nHalten Sie ihre Schwimmwesten bereit, denn die actiongeladene Fortsetzung von Speed begibt sich auf Hochseekurs. Erleben Sie Sandra Bullock erneut in ihrer Star-Rolle als Annie Porter. Die Karibik-Kreuzfahrt mit ihrem Freund Alex entwickelt sich unaufhaltsam zur rasenden Todesfahrt, als ein wahnsinniger Computer-Spezialist den Luxusliner in seine Gewalt bringt und auf einen mörderischen Zerstörungskurs programmiert. Eine hochexplosive Reise, bei der kein geringerer als Action-Spezialist Jan De Bont das Ruder in die Hand nimmt. Speed 2: Cruise Controll läßt ihre Adrenalin-Wellen in rasender Geschwindigkeit ganz nach oben schnellen.','',0,''),(19,5,'Verrückt nach Mary','Originaltitel: &quot;There\'s Something About Mary&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n13 Jahre nachdem Teds Rendezvous mit seiner angebeteten Mary in einem peinlichen Fiasko endete, träumt er immer noch von ihr und engagiert den windigen Privatdetektiv Healy um sie aufzuspüren. Der findet Mary in Florida und verliebt sich auf den ersten Blick in die atemberaubende Traumfrau. Um Ted als Nebenbuhler auszuschalten, tischt er ihm dicke Lügen über Mary auf. Ted läßt sich jedoch nicht abschrecken, eilt nach Miami und versucht nun alles, um Healy die Balztour zu vermasseln. Doch nicht nur Healy ist verrückt nach Mary und Ted bekommt es mit einer ganzen Legion liebeskranker Konkurrenten zu tun ...','',0,''),(20,5,'Menschenkind','Originaltitel: &quot;Beloved&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDieser vielschichtige Film ist eine Arbeit, die Regisseur Jonathan Demme und dem amerikanischen Talkshow-Star Oprah Winfrey sehr am Herzen lag. Der Film deckt im Verlauf seiner dreistündigen Spielzeit viele Bereiche ab. Menschenkind ist teils Sklavenepos, teils Mutter-Tochter-Drama und teils Geistergeschichte.<br><br>\r\nDer Film fordert vom Publikum höchste Aufmerksamkeit, angefangen bei seiner dramatischen und etwas verwirrenden Eingangssequenz, in der die Bewohner eines Hauses von einem niederträchtigen übersinnlichen Angriff heimgesucht werden. Aber Demme und seine talentierte Besetzung bereiten denen, die dabei bleiben ein unvergessliches Erlebnis. Der Film folgt den Spuren von Sethe (in ihren mittleren Jahren von Oprah Winfrey dargestellt), einer ehemaligen Sklavin, die sich scheinbar ein friedliches und produktives Leben in Ohio aufgebaut hat. Aber durch den erschreckenden und sparsamen Einsatz von Rückblenden deckt Demme, genau wie das literarische Meisterwerk von Toni Morrison, auf dem der Film basiert, langsam die Schrecken von Sethes früherem Leben auf und das schreckliche Ereignis, dass dazu führte, dass Sethes Haus von Geistern heimgesucht wird.<br><br>\r\nWährend die Gräuel der Sklaverei und das blutige Ereignis in Sethes Familie unleugbar tief beeindrucken, ist die Qualität des Film auch in kleineren, genauso befriedigenden Details sichtbar. Die geistlich beeinflusste Musik von Rachel Portman ist gleichzeitig befreiend und bedrückend, und der Einblick in die afro-amerikanische Gemeinschaft nach der Sklaverei -- am Beispiel eines Familienausflugs zu einem Jahrmarkt, oder dem gospelsingenden Nähkränzchen -- machen diesen Film zu einem speziellen Vergnügen sowohl für den Geist als auch für das Herz. Die Schauspieler, besonders Kimberley Elise als Sethes kämpfende Tochter und Thandie Newton als der mysteriöse Titelcharakter, sind sehr rührend. Achten Sie auch auf Danny Glover (Lethal Weapon) als Paul D.','',0,''),(21,5,'SWAT 3: Elite Edition','<b>KEINE KOMPROMISSE!</b><br><i>Kämpfen Sie Seite an Seite mit Ihren LAPD SWAT-Kameraden gegen das organisierte Verbrechen!</i><br><br>\r\nEine der realistischsten 3D-Taktiksimulationen der letzten Zeit jetzt mit Multiplayer-Modus, 5 neuen Missionen und jede Menge nützliche Tools!<br><br>\r\nLos Angeles, 2005. In wenigen Tagen steht die Unterzeichnung des Abkommens der Vereinten Nationen zur Atom-Ächtung durch Vertreter aller Nationen der Welt an. Radikale terroristische Vereinigungen machen sich in der ganzen Stadt breit. Verantwortlich für die Sicherheit der Delegierten zeichnet sich eine Eliteeinheit der LAPD: das SWAT-Team. Das Schicksal der Stadt liegt in Ihren Händen.<br><br>\r\n<b>Neue Features:</b>\r\n<ul>\r\n<li>Multiplayer-Modus (Co op-Modus, Deathmatch in den bekannten Variationen)</li>\r\n<li>5 neue Missionen an original Örtlichkeiten Las (U-Bahn, Whitman Airport, etc.)</li>\r\n<li>neue Charakter</li>\r\n<li>neue Skins</li>\r\n<li>neue Waffen</li>\r\n<li>neue Sounds</li>\r\n<li>verbesserte KI</li>\r\n<li>Tools-Package</li>\r\n<li>Scenario-Editor</li>\r\n<li>Level-Editor</li>\r\n</ul>\r\nDie dritte Folge der Bestseller-Reihe im Bereich der 3D-Echtzeit-Simulationen präsentiert sich mit einer neuen Spielengine mit extrem ausgeprägtem Realismusgrad. Der Spieler übernimmt das Kommando über eine der besten Polizei-Spezialeinheiten oder einer der übelsten Terroristen-Gangs der Welt. Er durchläuft - als \"Guter\" oder \"Böser\" - eine der härtesten und elitärsten Kampfausbildungen, in der er lernt, mit jeder Art von Krisensituationen umzugehen. Bei diesem Action-Abenteuer geht es um das Leben prominenter Vertreter der Vereinten Nationen und bei 16 Missionen an Originalschauplätzen in LA gibt die \"lebensechte\" KI den Protagonisten jeder Seite so einige harte Nüsse zu knacken.','www.swat3.com',0,''),(22,5,'Unreal Tournament','2341: Die Gewalt ist eine Lebensweise, die sich ihren Weg durch die dunklen Risse der Gesellschaft bahnt. Sie bedroht die Macht und den Einfluss der regierenden Firmen, die schnellstens ein Mittel finden müssen, die tobenden Massen zu besänftigen - ein profitables Mittel ... Gladiatorenkämpfe sind die Lösung. Sie sollen den Durst der Menschen nach Blut stillen und sind die perfekte Gelegenheit, die Aufständischen, Kriminellen und Aliens zu beseitigen, die die Firmenelite bedrohen.<br><br>\r\nDas Turnier war geboren - ein Kampf auf Leben und Tod. Galaxisweit live und in Farbe! Kämpfen Sie für Freiheit, Ruhm und Ehre. Sie müssen stark, schnell und geschickt sein ... oder Sie bleiben auf der Strecke.<br><br>\r\nKämpfen Sie allein oder kommandieren Sie ein Team gegen Armeen unbarmherziger Krieger, die alle nur ein Ziel vor Augen haben: Die Arenen lebend zu verlassen und sich dem Grand Champion zu stellen ... um ihn dann zu bezwingen!<br><br>\r\n<b>Features:</b>\r\n<ul>\r\n<li>Auf dem PC mehrfach als Spiel des Jahres ausgezeichnet!</li>\r\n<li>Mehr als 50 faszinierende Level - verlassene Raumstationen, gotische Kathedralen und graffitibedeckte Großstädte.</li>\r\n<li>Vier actionreiche Spielmodi - Deathmatch, Capture the Flag, Assault und Domination werden Ihren Adrenalinpegel in die Höhe schnellen lassen.</li>\r\n<li>Dramatische Mehrspieler-Kämpfe mit 2, 3 und 4 Spielern, auch über das Netzwerk</li>\r\n<li>Gnadenlos aggressive Computergegner verlangen Ihnen das Äußerste ab.</li>\r\n<li>Neuartiges Benutzerinterface und verbesserte Steuerung - auch mit USB-Maus und -Tastatur spielbar.</li>\r\n</ul>\r\nDer Nachfolger des Actionhits \"Unreal\" verspricht ein leichtes, intuitives Interface, um auch Einsteigern schnellen Zugang zu den Duellen gegen die Bots zu ermöglichen. Mit diesen KI-Kriegern kann man auch Teams bilden und im umfangreichen Multiplayermodus ohne Onlinekosten in den Kampf ziehen. 35 komplett neue Arenen und das erweiterte Waffenangebot bilden dazu den würdigen Rahmen.','www.unrealtournament.net',0,''),(23,5,'The Wheel Of Time','<b><i>\"Wheel Of Time\"(Das Rad der Zeit)</i></b> basiert auf den Fantasy-Romanen von Kultautor Robert Jordan und stellt einen einzigartigen Mix aus Strategie-, Action- und Rollenspielelementen dar. Obwohl die Welt von \"Wheel of Time\" eng an die literarische Vorlage der Romane angelehnt ist, erzählt das Spiel keine lineare Geschichte. Die Story entwickelt sich abhängig von den Aktionen der Spieler, die jeweils die Rollen der Hauptcharaktere aus dem Roman übernehmen. Jede Figur hat den Oberbefehl über eine große Gefolgschaft, militärische Einheiten und Ländereien. Die Spieler können ihre eigenen Festungen konstruieren, individuell ausbauen, von dort aus das umliegende Land erforschen, magische Gegenstände sammeln oder die gegnerischen Zitadellen erstürmen. Selbstverständlich kann man sich auch über LAN oder Internet gegenseitig Truppen auf den Hals hetzen und die Festungen seiner Mitspieler in Schutt und Asche legen. Dreh- und Anlegepunkt von \"Wheel of Time\" ist der Kampf um die finstere Macht \"The Dark One\", die vor langer Zeit die Menschheit beinahe ins Verderben stürzte und nur mit Hilfe gewaltiger magischer Energie verbannt werden konnte. \"The Amyrlin Seat\" und \"The Children of the Night\" kämpfen nur gegen \"The Forsaken\" und \"The Hound\" um den Besitz des Schlüssels zu \"Shayol Ghul\" - dem magischen Siegel, mit dessen Hilfe \"The Dark One\" seinerzeit gebannt werden konnte.<br><br>\r\n<b>Features:</b> \r\n<ul>\r\n<li>Ego-Shooter mit Strategie-Elementen</li>\r\n<li>Spielumgebung in Echtzeit-3D</li>\r\n<li>Konstruktion aud Ausbau der eigenen Festung</li>\r\n<li>Einsatz von über 100 Artefakten und Zaubersprüchen</li>\r\n<li>Single- und Multiplayermodus</li>\r\n</ul>\r\nIm Mittelpunkt steht der Kampf gegen eine finstere Macht namens The Dark One. Deren Schergen müssen mit dem Einsatz von über 100 Artefakten und Zaubereien wie Blitzschlag oder Teleportation aus dem Weg geräumt werden. Die opulente 3D-Grafik verbindet Strategie- und Rollenspielelemente. \r\n\r\n<b>Voraussetzungen</b>\r\nmind. P200, 32MB RAM, 4x CD-Rom, Win95/98, DirectX 5.0 komp.Grafikkarte und Soundkarte. ','www.wheeloftime.com',0,''),(24,5,'Disciples: Sacred Land','Rundenbasierende Fantasy/RTS-Strategie mit gutem Design (vor allem die Levels, 4 versch. Rassen, tolle Einheiten), fantastischer Atmosphäre und exzellentem Soundtrack. Grafisch leider auf das Niveau von 1990.','www.strategyfirst.com/disciples/welcome.html',0,''),(25,5,'Microsoft Internet Tastatur PS/2','<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zusätzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verfügt über 10 zusätzliche Abkürzungstasten auf einer benutzerfreundlichen Standardtastatur, die darüber hinaus eine abnehmbare Handballenauflage aufweist. Über die Abkürzungstasten können Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software ermöglicht außerdem das individuelle Belegen der Tasten.','',0,''),(26,5,'Microsof IntelliMouse Explorer','Die IntelliMouse Explorer überzeugt durch ihr modernes Design mit silberfarbenem Gehäuse, sowie rot schimmernder Unter- und Rückseite. Die neuartige IntelliEye-Technologie sorgt für eine noch nie dagewesene Präzision, da statt der beweglichen Teile (zum Abtasten der Bewegungsänderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfaßt. Das Herzstück der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enthält.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen können, verzichtet wurde, muß die IntelliMouse Explorer nicht mehr gereinigt werden. Darüber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfläche, so daß kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zusätzlichen Maustasten ermöglicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempfänger benutzt wird.</i>','',0,''),(27,5,'Hewlett-Packard LaserJet 1100Xi','<b>HP LaserJet für mehr Produktivität und Flexibilität am Arbeitsplatz</b><br><br>\r\nDer HP LaserJet 1100Xi Drucker verbindet exzellente Laserdruckqualität mit hoher Geschwindigkeit für mehr Effizienz.<br><br>\r\n<b>Zielkunden</b>\r\n<ul><li>Einzelanwender, die Wert auf professionelle Ausdrucke in Laserqualität legen und schnelle Ergebnisse auch bei komplexen Dokumenten erwarten.</li>\r\n<li>Der HP LaserJet 1100 sorgt mit gestochen scharfen Texten und Grafiken für ein professionelles Erscheinungsbild Ihrer Arbeit und Ihres Unternehmens. Selbst bei komplexen Dokumenten liefert er schnelle Ergebnisse. Andere Medien - wie z.B. Transparentfolien und Briefumschläge, etc. - lassen sich problemlos bedrucken. Somit ist der HP LaserJet 1100 ein Multifunktionstalent im Büroalltag.</li>\r\n</ul>\r\n<b>Eigenschaften</b>\r\n<ul>\r\n<li><b>Druckqualität</b> Schwarzweiß: 600 x 600 dpi</li>\r\n<li><b>Monatliche Druckleistung</b> Bis zu 7000 Seiten</li>\r\n<li><b>Speicher</b> 2 MB Standardspeicher, erweiterbar auf 18 MB</li>\r\n<li><b>Schnittstelle/gemeinsame Nutzung</b> Parallel, IEEE 1284-kompatibel</li>\r\n<li><b>Softwarekompatibilität</b> DOS/Win 3.1x/9x/NT 4.0</li>\r\n<li><b>Papierzuführung</b> 125-Blatt-Papierzuführung</li>\r\n<li><b>Druckmedien</b> Normalpapier, Briefumschläge, Transparentfolien, kartoniertes Papier, Postkarten und Etiketten</li>\r\n<li><b>Netzwerkfähig</b> Über HP JetDirect PrintServer</li>\r\n<li><b>Lieferumfang</b> HP LaserJet 1100Xi Drucker (Lieferumfang: Drucker, Tonerkassette, 2 m Parallelkabel, Netzkabel, Kurzbedienungsanleitung, Benutzerhandbuch, CD-ROM, 3,5\"-Disketten mit Windows® 3.1x, 9x, NT 4.0 Treibern und DOS-Dienstprogrammen)</li>\r\n<li><b>Gewährleistung</b> Ein Jahr</li>\r\n</ul>\r\n','www.hp.com',0,''),(28,2,'Option Type Demo','<p>Dieser Artikel demonstriert verschiedene Darstellungsarten von Produktoptionen (siehe unten).</p>\r\n<ul>\r\n  <li>Text Fields</li>\r\n  <li>Radio Buttons</li>\r\n  <li>Checkboxes</li>\r\n  <li>Textarea Fields</li>\r\n</ul>\r\n<p>This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.</p>','www.openstoresolutions.com/option_type_contribution.php',12,''),(28,1,'Option Type Demo','<p>This article demonstrates different ways to display product attributes (see below).</p>\r\n<p>This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.</p>','www.openstoresolutions.com/option_type_contribution.php',3,''),(28,5,'Option Type Demo','<p>This article demonstrates different ways to display product attributes (see below).</p>\r\n<p>This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.</p>','www.openstoresolutions.com/option_type_contribution.php',0,''),(28,4,'Option Type Demo','<p>This article demonstrates different ways to display product attributes (see below).</p>\r\n<p>This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.</p>','www.openstoresolutions.com/option_type_contribution.php',0,''),(28,3,'Option Type Demo','<p>This article demonstrates different ways to display product attributes (see below).</p>\r\n<p>This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.This contribution allows the use of various option types when setting up product attributes.  With the current milestone of osCommerce, all options are displayed as select lists.  This contribution specifically adds Text Options, Radio Buttons, Checkboxes and Textarea fields.  It is written so that it can be extended with other option types as well.</p>','www.openstoresolutions.com/option_type_contribution.php',0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_notifications`
--


/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
LOCK TABLES `products_notifications` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_name` varchar(32) collate latin1_general_ci NOT NULL default '',
  `products_options_type` int(5) NOT NULL,
  `products_options_length` smallint(2) NOT NULL default '32',
  `products_options_comment` varchar(64) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`products_options_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options`
--


/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
LOCK TABLES `products_options` WRITE;
INSERT INTO `products_options` VALUES (1,1,'Color',0,32,NULL),(2,1,'Size',0,32,NULL),(3,1,'Model',2,32,''),(4,1,'Memory',2,32,''),(1,2,'Farbe',0,32,NULL),(2,2,'Größe',0,32,NULL),(3,2,'Modell',2,32,''),(4,2,'Speicher',2,32,''),(1,3,'Color',0,32,NULL),(2,3,'Talla',0,32,NULL),(3,3,'Modelo',2,32,''),(4,3,'Memoria',2,32,''),(5,3,'Version',0,32,NULL),(5,2,'Version',0,32,NULL),(5,1,'Version',0,32,NULL),(1,4,'Farbe',0,32,NULL),(2,4,'Größe',0,32,NULL),(3,4,'Modell',2,32,''),(4,4,'Speicher',2,32,''),(5,4,'Version',0,32,NULL),(1,5,'Farbe',0,32,NULL),(2,5,'Größe',0,32,NULL),(3,5,'Modell',2,32,''),(4,5,'Speicher',2,32,''),(5,5,'Version',0,32,NULL),(6,2,'Text',1,32,'z.B. für einen Kartentext'),(6,1,'Text',1,32,'e.g. for a greeting card text'),(6,5,'Text',1,32,'e.g. for a greeting card text'),(6,4,'Text',1,32,'e.g. for a greeting card text'),(6,3,'Text',1,32,'e.g. for a greeting card text'),(7,2,'Geschenkpapier',3,12,''),(7,1,'Gift Wrap',3,12,''),(7,5,'Gift Wrap',3,12,''),(7,4,'Gift Wrap',3,12,''),(7,3,'Gift Wrap',3,12,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_values_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`products_options_values_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options_values`
--


/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
LOCK TABLES `products_options_values` WRITE;
INSERT INTO `products_options_values` VALUES (1,1,'4 mb'),(2,1,'8 mb'),(3,1,'16 mb'),(4,1,'32 mb'),(5,1,'Value'),(6,1,'Premium'),(7,1,'Deluxe'),(8,1,'PS/2'),(9,1,'USB'),(1,2,'4 MB'),(2,2,'8 MB'),(3,2,'16 MB'),(4,2,'32 MB'),(5,2,'Value Ausgabe'),(6,2,'Premium Ausgabe'),(7,2,'Deluxe Ausgabe'),(8,2,'PS/2 Anschluss'),(9,2,'USB Anschluss'),(1,3,'4 mb'),(2,3,'8 mb'),(3,3,'16 mb'),(4,3,'32 mb'),(5,3,'Value'),(6,3,'Premium'),(7,3,'Deluxe'),(8,3,'PS/2'),(9,3,'USB'),(10,1,'Download: Windows - English'),(10,2,'Download: Windows - Englisch'),(10,3,'Download: Windows - Inglese'),(13,1,'Box: Windows - English'),(13,2,'Box: Windows - Englisch'),(13,3,'Box: Windows - Inglese'),(1,4,'4 MB'),(2,4,'8 MB'),(3,4,'16 MB'),(4,4,'32 MB'),(5,4,'Value Ausgabe'),(6,4,'Premium Ausgabe'),(7,4,'Deluxe Ausgabe'),(8,4,'PS/2 Anschluss'),(9,4,'USB Anschluss'),(10,4,'Download: Windows - Englisch'),(13,4,'Box: Windows - Englisch'),(1,5,'4 MB'),(2,5,'8 MB'),(3,5,'16 MB'),(4,5,'32 MB'),(5,5,'Value Ausgabe'),(6,5,'Premium Ausgabe'),(7,5,'Deluxe Ausgabe'),(8,5,'PS/2 Anschluss'),(9,5,'USB Anschluss'),(10,5,'Download: Windows - Englisch'),(13,5,'Box: Windows - Englisch'),(0,1,'TEXT'),(0,2,'TEXT'),(0,3,'TEXT'),(0,4,'TEXT'),(0,5,'TEXT'),(14,2,'ja'),(14,1,'yes'),(14,5,'oui'),(14,4,'si'),(14,3,'si');
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL auto_increment,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_options_values_to_products_options_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_options_values_to_products_options`
--


/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
LOCK TABLES `products_options_values_to_products_options` WRITE;
INSERT INTO `products_options_values_to_products_options` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,3,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9),(10,5,10),(13,5,13),(14,7,14);
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_id`,`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `products_to_categories`
--


/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
LOCK TABLES `products_to_categories` WRITE;
INSERT INTO `products_to_categories` VALUES (1,4),(2,4),(3,9),(4,10),(5,11),(6,10),(7,12),(8,13),(9,10),(10,10),(11,10),(12,10),(13,10),(14,15),(15,14),(16,15),(17,10),(18,10),(19,12),(20,15),(21,18),(22,19),(23,20),(24,20),(25,8),(26,9),(27,5),(28,19);
UNLOCK TABLES;
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) default NULL,
  `customers_name` varchar(64) collate latin1_general_ci NOT NULL,
  `reviews_rating` int(1) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  `reviews_read` int(5) NOT NULL default '0',
  PRIMARY KEY  (`reviews_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `reviews`
--


/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
LOCK TABLES `reviews` WRITE;
INSERT INTO `reviews` VALUES (1,19,1,'John doe',5,'2007-06-12 22:50:01',NULL,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `reviews_description`
--


/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
LOCK TABLES `reviews_description` WRITE;
INSERT INTO `reviews_description` VALUES (1,1,'this has to be one of the funniest movies released for 1999!');
UNLOCK TABLES;
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `sesskey` varchar(32) collate latin1_general_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `sessions`
--


/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime default NULL,
  `specials_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`specials_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `specials`
--


/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
LOCK TABLES `specials` WRITE;
INSERT INTO `specials` VALUES (1,3,'39.9900','2007-06-12 22:50:01',NULL,NULL,NULL,1),(2,5,'30.0000','2007-06-12 22:50:01',NULL,NULL,NULL,1),(3,6,'30.0000','2007-06-12 22:50:01',NULL,NULL,NULL,1),(4,16,'29.9900','2007-06-12 22:50:01',NULL,NULL,NULL,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `tax_class_title` varchar(32) collate latin1_general_ci NOT NULL,
  `tax_class_description` varchar(255) collate latin1_general_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tax_class`
--


/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
LOCK TABLES `tax_class` WRITE;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included non-food, services, etc','2007-06-12 22:50:01','2007-06-12 22:50:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL auto_increment,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) default '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) collate latin1_general_ci NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_rates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tax_rates`
--


/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
LOCK TABLES `tax_rates` WRITE;
INSERT INTO `tax_rates` VALUES (1,1,1,1,'7.0000','FL TAX 7.0%','2007-06-12 22:50:01','2007-06-12 22:50:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
CREATE TABLE `whos_online` (
  `customer_id` int(11) default NULL,
  `full_name` varchar(64) collate latin1_general_ci NOT NULL,
  `session_id` varchar(128) collate latin1_general_ci NOT NULL,
  `ip_address` varchar(15) collate latin1_general_ci NOT NULL,
  `time_entry` varchar(14) collate latin1_general_ci NOT NULL,
  `time_last_click` varchar(14) collate latin1_general_ci NOT NULL,
  `last_page_url` varchar(255) collate latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `whos_online`
--


/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
LOCK TABLES `whos_online` WRITE;
INSERT INTO `whos_online` VALUES (0,'Guest','c555a16e2f1aff49e67909c692541689','127.0.0.1','1183754094','1183756645','/swisscart/trunk/product_info.php?products_id=28&language=en&osCsid=c555a16e2f1aff49e67909c692541689');
UNLOCK TABLES;
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) collate latin1_general_ci NOT NULL,
  `zone_name` varchar(32) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `zones`
--


/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
LOCK TABLES `zones` WRITE;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubünden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');
UNLOCK TABLES;
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) default NULL,
  `geo_zone_id` int(11) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`association_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `zones_to_geo_zones`
--


/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
LOCK TABLES `zones_to_geo_zones` WRITE;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2007-06-12 22:50:01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

