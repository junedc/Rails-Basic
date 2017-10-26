-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 26, 2017 at 03:20 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rails-basic`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_coupon`
--

CREATE TABLE `app_coupon` (
  `app_coupon_id` int(11) NOT NULL,
  `active_from` datetime DEFAULT NULL,
  `active_to` datetime DEFAULT NULL,
  `coupon_code` varchar(20) NOT NULL DEFAULT '0',
  `public_description` varchar(200) NOT NULL DEFAULT '0',
  `free_trial_length` int(11) NOT NULL DEFAULT '7' COMMENT 'in days',
  `date_created` datetime NOT NULL,
  `date_deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'title', 'first blog', '2017-05-04 11:40:01', '2017-05-04 11:40:02', 'first-blog');

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-05-03 23:38:49', '2017-05-03 23:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`) VALUES
(1, 'Auckland', 1),
(2, 'Manila', 2);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `population`) VALUES
(1, 'New Zealand', 5000000),
(2, 'Philippines', 1233123);

-- --------------------------------------------------------

--
-- Table structure for table `examples`
--

CREATE TABLE `examples` (
  `id` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `custname` varchar(50) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longtitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examples`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `expertises`
--

CREATE TABLE `expertises` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expertises`
--

INSERT INTO `expertises` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Coding', '2017-10-18 23:15:52', '2017-10-18 23:16:16'),
(2, 'Development', '2017-10-18 23:16:00', '2017-10-18 23:16:00'),
(3, 'Testing', '2017-10-18 23:16:07', '2017-10-18 23:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `expertises_professors`
--

CREATE TABLE `expertises_professors` (
  `expertise_id` int(11) NOT NULL,
  `professor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expertises_professors`
--

INSERT INTO `expertises_professors` (`expertise_id`, `professor_id`) VALUES
(1, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `friendly_id_slugs`
--

CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `account` varchar(10) NOT NULL,
  `number` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `notes` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `account`, `number`, `date`, `notes`, `created_at`, `updated_at`) VALUES
(1, '111', '111', '2017-10-19 00:00:00', 'test note', '2017-10-26 15:03:26', '2017-10-26 15:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `line_items`
--

CREATE TABLE `line_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `line_items`
--

INSERT INTO `line_items` (`id`, `quantity`, `product_id`, `invoice_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2017-10-27 00:00:00', '2017-10-27 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `favorite_color` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `item_number` varchar(10) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `description`, `item_number`, `price`, `created_at`, `updated_at`) VALUES
(1, 'This is my first product', '1', 111, '2017-10-20 00:00:00', '2017-10-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'june', '2017-10-18 23:15:38', '2017-10-18 23:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20170324011854'),
('20170509002440'),
('20170509003650');

-- --------------------------------------------------------

--
-- Table structure for table `selectxes`
--

CREATE TABLE `selectxes` (
  `id` int(11) NOT NULL,
  `text` varchar(50) DEFAULT NULL,
  `custname` varchar(50) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longtitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `selectxes`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
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
  `max_order_display_at_time` int(11) DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `token_storages`
--

CREATE TABLE `token_storages` (
  `expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'june', 'june-pogi', '2017-05-09 00:39:37', '2017-05-09 00:39:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_coupon`
--
ALTER TABLE `app_coupon`
  ADD PRIMARY KEY (`app_coupon_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examples`
--
ALTER TABLE `examples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expertises`
--
ALTER TABLE `expertises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendly_id_slugs`
--
ALTER TABLE `friendly_id_slugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  ADD KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  ADD KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  ADD KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line_items`
--
ALTER TABLE `line_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `selectxes`
--
ALTER TABLE `selectxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_users_on_slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_coupon`
--
ALTER TABLE `app_coupon`
  MODIFY `app_coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `examples`
--
ALTER TABLE `examples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `expertises`
--
ALTER TABLE `expertises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `friendly_id_slugs`
--
ALTER TABLE `friendly_id_slugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `line_items`
--
ALTER TABLE `line_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `selectxes`
--
ALTER TABLE `selectxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
