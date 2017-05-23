-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.59-community - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for shopify
CREATE DATABASE IF NOT EXISTS `shopify` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopify`;

-- Dumping structure for table shopify.app_coupon
CREATE TABLE IF NOT EXISTS `app_coupon` (
  `app_coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_from` datetime DEFAULT NULL,
  `active_to` datetime DEFAULT NULL,
  `coupon_code` varchar(20) NOT NULL DEFAULT '0',
  `public_description` varchar(200) NOT NULL DEFAULT '0',
  `free_trial_length` int(11) NOT NULL DEFAULT '7' COMMENT 'in days',
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`app_coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.app_coupon: ~0 rows (approximately)
/*!40000 ALTER TABLE `app_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_coupon` ENABLE KEYS */;

-- Dumping structure for table shopify.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.articles: ~1 rows (approximately)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `text`, `created_at`, `updated_at`, `slug`) VALUES
	(1, 'title', 'first blog', '2017-05-04 11:40:01', '2017-05-04 11:40:02', 'first-blog');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Dumping structure for table shopify.ar_internal_metadata
CREATE TABLE IF NOT EXISTS `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.ar_internal_metadata: ~1 rows (approximately)
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
	('environment', 'development', '2017-05-03 23:38:49', '2017-05-03 23:38:49');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;

-- Dumping structure for table shopify.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.cities: ~2 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `name`, `country_id`) VALUES
	(1, 'Auckland', 1),
	(2, 'Manila', 2);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table shopify.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `population` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.countries: ~2 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `population`) VALUES
	(1, 'New Zealand', 5000000),
	(2, 'Philippines', 1233123);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table shopify.examples
CREATE TABLE IF NOT EXISTS `examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) DEFAULT NULL,
  `custname` varchar(50) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longtitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.examples: ~15 rows (approximately)
/*!40000 ALTER TABLE `examples` DISABLE KEYS */;
INSERT INTO `examples` (`id`, `city`, `custname`, `latitude`, `longtitude`) VALUES
	(1, 'Auckland', 'Ling', -36.8539, 174.76),
	(2, 'London', 'Geoff', 51.4964, -0.139872),
	(3, 'Ponsonby ', 'Leo', -36.8488, 174.738),
	(4, 'Hamilton', 'Stuart', -37.787, 175.279),
	(5, 'Rotorua', 'Yang', -38.1368, 176.25),
	(6, 'Wellington', 'Willy', -41.2865, 174.776),
	(7, 'Dunedin', 'Dundy', -45.8788, 170.503),
	(8, 'Whangarei', 'Fang', -35.7251, 174.324),
	(9, 'Palmestorn North', 'Palmy', -40.3523, 175.608),
	(10, 'Taupo', 'Tapo', -38.6857, 176.07),
	(11, 'Tauranga', 'Rango', -37.7024, 176.141),
	(12, 'Pukekohe', 'Koi', -37.2272, 174.982),
	(13, 'New York', 'John', 40.7128, -74.0059),
	(14, 'Washington', 'Willy', 38.9072, -77.0369),
	(15, 'Idaho', 'Dally', 44.0682, -114.742);
/*!40000 ALTER TABLE `examples` ENABLE KEYS */;

-- Dumping structure for table shopify.friendly_id_slugs
CREATE TABLE IF NOT EXISTS `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.friendly_id_slugs: ~0 rows (approximately)
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;

-- Dumping structure for table shopify.people
CREATE TABLE IF NOT EXISTS `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `favorite_color` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.people: ~0 rows (approximately)
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;

-- Dumping structure for table shopify.schema_migrations
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.schema_migrations: ~3 rows (approximately)
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES
	('20170324011854'),
	('20170509002440'),
	('20170509003650');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

-- Dumping structure for table shopify.selectxes
CREATE TABLE IF NOT EXISTS `selectxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) DEFAULT NULL,
  `custname` varchar(50) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longtitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.selectxes: ~16 rows (approximately)
/*!40000 ALTER TABLE `selectxes` DISABLE KEYS */;
INSERT INTO `selectxes` (`id`, `text`, `custname`, `latitude`, `longtitude`) VALUES
	(1, 'Auckland', 'Ling', -36.8539, 174.76),
	(2, 'London', 'Geoff', 51.4964, -0.139872),
	(3, 'Ponsonby ', 'Leo', -36.8488, 174.738),
	(4, 'Hamilton', 'Stuart', -37.787, 175.279),
	(5, 'Rotorua', 'Yang', -38.1368, 176.25),
	(6, 'Wellington', 'Willy', -41.2865, 174.776),
	(7, 'Dunedin', 'Dundy', -45.8788, 170.503),
	(8, 'Whangarei', 'Fang', -35.7251, 174.324),
	(9, 'Palmestorn North', 'Palmy', -40.3523, 175.608),
	(10, 'Taupo', 'Tapo', -38.6857, 176.07),
	(11, 'Tauranga', 'Rango', -37.7024, 176.141),
	(12, 'Pukekohe', 'Koi', -37.2272, 174.982),
	(13, 'New York', 'John', 40.7128, -74.0059),
	(14, 'Washington', 'Willy', 38.9072, -77.0369),
	(15, 'Idaho', 'Dally', 44.0682, -114.742),
	(16, 'Auckland', 'Ozi', NULL, NULL);
/*!40000 ALTER TABLE `selectxes` ENABLE KEYS */;

-- Dumping structure for table shopify.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopify_domain` varchar(255) NOT NULL,
  `shopify_token` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `google_maps_api_key` varchar(45) DEFAULT NULL,
  `popover_template_html` varchar(2000) DEFAULT NULL,
  `map_page_content_type` varchar(45) DEFAULT 'text/html',
  `google_maps_start_zoom` int(11) DEFAULT '11',
  `google_maps_start_lat` float DEFAULT '40.7128',
  `google_maps_start_lng` float DEFAULT '-74.0059',
  `map_control_zoomcontrol` int(1) DEFAULT '0',
  `map_control_maptype` int(1) DEFAULT '0',
  `orders_include_examples` int(1) DEFAULT '1',
  `map_height` int(3) DEFAULT '100',
  `include_shop_script` int(1) DEFAULT '0',
  `shopify_plan` varchar(50) DEFAULT NULL,
  `shopify_monthly_charge` decimal(6,2) DEFAULT '0.00',
  `deleted_at` datetime DEFAULT NULL,
  `order_display_time_secs` int(11) DEFAULT '3',
  `signup_app_coupon_id` int(11) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `password_enabled` varchar(50) DEFAULT NULL,
  `shop_owner` varchar(150) DEFAULT NULL,
  `setup_required` varchar(50) DEFAULT NULL,
  `shop_created_at` datetime DEFAULT NULL,
  `domain` varchar(80) DEFAULT NULL,
  `max_order_display_at_time` int(11) DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.shops: ~0 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table shopify.token_storages
CREATE TABLE IF NOT EXISTS `token_storages` (
  `expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.token_storages: ~0 rows (approximately)
/*!40000 ALTER TABLE `token_storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_storages` ENABLE KEYS */;

-- Dumping structure for table shopify.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table shopify.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'june', 'june-pogi', '2017-05-09 00:39:37', '2017-05-09 00:39:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
