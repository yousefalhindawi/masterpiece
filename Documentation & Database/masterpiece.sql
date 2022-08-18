-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2022 at 10:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masterpiece`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `sub_total` double UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `sub_total`, `created_at`, `updated_at`) VALUES
(58, 1, 4, 2, 2.6, '2022-07-27 07:40:32', '2022-07-27 07:42:44'),
(59, 1, 5, 1, 0.9, '2022-07-27 07:43:04', '2022-07-27 07:43:04'),
(61, 1, 7, 1, 2.35, '2022-07-27 07:43:11', '2022-07-27 07:43:11'),
(64, 1, 3, 4, 8, '2022-08-18 14:58:21', '2022-08-18 14:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_img`, `created_at`, `updated_at`) VALUES
(1, 'Fruits', 'categories\\July2022\\UkJ9HuzKyIl0M7q3Lsdf.jpg', '2022-07-12 08:13:07', '2022-07-12 08:13:07'),
(2, 'Vegetables', 'categories\\July2022\\1QJYKFX5DSt2uxJDqhLQ.jpg', '2022-07-12 08:13:37', '2022-07-12 08:13:37'),
(3, 'Herbs', 'categories\\July2022\\d7ipLfV1suF8DSWw2Ii8.jpg', '2022-07-12 08:13:49', '2022-07-12 08:13:49'),
(4, 'Dates', 'categories\\July2022\\J0FIGImdIKxiorkgwkCT.jpg', '2022-07-12 08:14:15', '2022-07-12 08:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent_off` double DEFAULT NULL,
  `value` double DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `percent_off`, `value`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 10, NULL, 2, '2022-07-12 08:19:29', '2022-07-12 08:19:29'),
(2, 'de456', NULL, 1, 1, '2022-07-12 08:20:01', '2022-07-12 08:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(22, 4, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'category_name', 'text', 'Category Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'category_img', 'image', 'Category Img', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
(26, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(27, 6, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(28, 6, 'name', 'text', 'Name', 1, 1, 1, 0, 1, 0, '{}', 2),
(29, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
(30, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(31, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 8, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 3),
(33, 8, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '{}', 4),
(34, 8, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '{}', 5),
(35, 8, 'type_id', 'select_dropdown', 'Type Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(36, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(37, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(38, 8, 'coupon_belongsto_type_relationship', 'relationship', 'types', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Type\",\"table\":\"types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(39, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(40, 9, 'name', 'text', 'Name', 1, 1, 1, 0, 1, 0, '{}', 2),
(41, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
(42, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(43, 10, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(44, 10, 'name', 'text', 'Name', 1, 1, 1, 0, 1, 0, '{}', 2),
(45, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
(46, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(47, 11, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(48, 11, 'product_name', 'text', 'Product Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(49, 11, 'product_description', 'rich_text_box', 'Product Description', 1, 1, 1, 1, 1, 1, '{}', 6),
(50, 11, 'product_img', 'image', 'Product Image', 1, 1, 1, 1, 1, 1, '{}', 7),
(51, 11, 'product_price', 'number', 'Product Price', 1, 1, 1, 1, 1, 1, '{}', 8),
(52, 11, 'product_price_on_sale', 'number', 'Product Price On Sale', 1, 1, 1, 1, 1, 1, '{}', 9),
(53, 11, 'product_quantity', 'number', 'Product Quantity', 1, 1, 1, 1, 1, 1, '{}', 10),
(54, 11, 'product_tags', 'text', 'Product Tags', 1, 1, 1, 1, 1, 1, '{}', 11),
(55, 11, 'category_id', 'select_dropdown', 'Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(56, 11, 'sale_status_id', 'select_dropdown', 'Sale Status Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(57, 11, 'product_feature_id', 'select_dropdown', 'Product Feature Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(58, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(59, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(60, 11, 'product_belongsto_category_relationship', 'relationship', 'categories', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"category_name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(61, 11, 'product_belongsto_status_relationship', 'relationship', 'statuses', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"sale_status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(62, 11, 'product_belongsto_feature_relationship', 'relationship', 'features', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Feature\",\"table\":\"features\",\"type\":\"belongsTo\",\"column\":\"product_feature_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(63, 12, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 12, 'user_id', 'number', 'User Id', 1, 1, 1, 0, 0, 0, '{}', 2),
(65, 12, 'product_id', 'number', 'Product Id', 1, 1, 1, 0, 0, 0, '{}', 3),
(66, 12, 'order_total_price', 'number', 'Order Total Price', 1, 1, 1, 0, 0, 0, '{}', 4),
(67, 12, 'product_quantity', 'number', 'Product Quantity', 1, 1, 1, 0, 0, 0, '{}', 5),
(68, 12, 'product_sub_total', 'number', 'Product Sub Total', 1, 1, 1, 0, 0, 0, '{}', 6),
(69, 12, 'address', 'text', 'Address', 1, 1, 1, 0, 0, 0, '{}', 7),
(70, 12, 'phone', 'text', 'Phone', 1, 1, 1, 0, 0, 0, '{}', 8),
(71, 12, 'order_status', 'text', 'Order Status', 1, 1, 1, 1, 0, 0, '{}', 9),
(72, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(73, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(78, 12, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(79, 12, 'order_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"product_name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(80, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 13, 'role_id', 'hidden', 'Role Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(82, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(83, 13, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(84, 13, 'avatar', 'text', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 5),
(85, 13, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 6),
(86, 13, 'password', 'hidden', 'Password', 1, 0, 0, 0, 0, 0, '{}', 7),
(87, 13, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 8),
(88, 13, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 9),
(89, 13, 'user_img', 'hidden', 'User Image', 1, 0, 0, 0, 0, 0, '{}', 10),
(90, 13, 'remember_token', 'hidden', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 11),
(91, 13, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(92, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13),
(93, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(94, 13, 'user_belongsto_role_relationship', 'relationship', 'roles', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"carts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(95, 13, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 0, 0, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-shop', 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-07-12 08:11:56', '2022-07-13 01:37:18'),
(6, 'types', 'types', 'Coupon Type', 'Coupon Types', 'voyager-credit-cards', 'App\\Models\\Type', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-07-12 08:15:47', '2022-07-13 01:28:11'),
(8, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-gift', 'App\\Models\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-07-12 08:18:15', '2022-07-13 01:34:03'),
(9, 'statuses', 'statuses', 'Product Status', 'Product Statuses', NULL, 'App\\Models\\Status', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(10, 'features', 'features', 'Product Feature', 'Product Features', NULL, 'App\\Models\\Feature', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(11, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-07-12 08:31:27', '2022-07-13 01:39:17'),
(12, 'orders', 'orders', 'Order', 'Orders', 'voyager-basket', 'App\\Models\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-07-12 09:27:52', '2022-07-13 01:40:10'),
(13, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-08-12 02:55:08', '2022-08-18 14:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'feature', '2022-07-12 08:29:08', '2022-07-12 08:29:08'),
(2, 'not feature', '2022-07-12 08:29:20', '2022-07-12 08:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-07-12 08:09:43', '2022-07-12 08:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-07-12 08:09:43', '2022-07-12 08:09:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 10, '2022-07-12 08:09:43', '2022-08-12 02:30:01', 'voyager.media.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 3, '2022-07-12 08:09:43', '2022-08-12 02:29:10', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 12, '2022-07-12 08:09:43', '2022-08-12 02:30:06', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-07-12 08:09:43', '2022-08-12 02:29:33', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-07-12 08:09:43', '2022-08-12 02:29:33', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-07-12 08:09:43', '2022-08-12 02:29:33', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-07-12 08:09:43', '2022-08-12 02:29:33', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 13, '2022-07-12 08:09:43', '2022-08-12 02:30:06', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-shop', '#000000', NULL, 4, '2022-07-12 08:11:56', '2022-08-12 02:29:24', 'voyager.categories.index', 'null'),
(12, 1, 'Coupon Types', '', '_self', 'voyager-credit-cards', '#000000', NULL, 9, '2022-07-12 08:15:47', '2022-08-12 02:30:01', 'voyager.types.index', 'null'),
(13, 1, 'Coupons', '', '_self', 'voyager-gift', '#000000', NULL, 8, '2022-07-12 08:18:15', '2022-08-12 02:29:57', 'voyager.coupons.index', 'null'),
(14, 1, 'Product Statuses', '', '_self', NULL, NULL, NULL, 6, '2022-07-12 08:26:13', '2022-08-12 02:29:41', 'voyager.statuses.index', NULL),
(15, 1, 'Product Features', '', '_self', NULL, NULL, NULL, 7, '2022-07-12 08:28:35', '2022-08-12 02:29:46', 'voyager.features.index', NULL),
(16, 1, 'Products', '', '_self', 'voyager-bag', '#000000', NULL, 5, '2022-07-12 08:31:27', '2022-08-12 02:29:33', 'voyager.products.index', 'null'),
(17, 1, 'Orders', '', '_self', 'voyager-basket', '#000000', NULL, 11, '2022-07-12 09:27:52', '2022-08-12 02:30:06', 'voyager.orders.index', 'null'),
(18, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2022-08-12 02:55:08', '2022-08-13 13:22:38', 'voyager.users.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(33, '2014_07_12_091615_create_statuses_table', 1),
(34, '2014_07_12_091750_create_features_table', 1),
(35, '2014_07_12_091902_create_types_table', 1),
(36, '2014_10_12_000000_create_users_table', 1),
(37, '2014_10_12_100000_create_password_resets_table', 1),
(38, '2016_01_01_000000_add_voyager_user_fields', 1),
(39, '2016_01_01_000000_create_data_types_table', 1),
(40, '2016_05_19_173453_create_menu_table', 1),
(41, '2016_10_21_190000_create_roles_table', 1),
(42, '2016_10_21_190000_create_settings_table', 1),
(43, '2016_11_30_135954_create_permission_table', 1),
(44, '2016_11_30_141208_create_permission_role_table', 1),
(45, '2016_12_26_201236_data_types__add__server_side', 1),
(46, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(47, '2017_01_14_005015_create_translations_table', 1),
(48, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(49, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(50, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(51, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(52, '2017_08_05_000000_add_group_to_settings_table', 1),
(53, '2017_11_26_013050_add_user_role_relationship', 1),
(54, '2017_11_26_015000_create_user_roles_table', 1),
(55, '2018_03_11_000000_add_user_settings', 1),
(56, '2018_03_14_000000_add_details_to_data_types_table', 1),
(57, '2018_03_16_000000_make_settings_value_nullable', 1),
(58, '2019_08_19_000000_create_failed_jobs_table', 1),
(59, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(60, '2022_07_02_055959_create_categories_table', 1),
(61, '2022_07_02_072007_create_products_table', 1),
(62, '2022_07_02_122310_create_orders_table', 1),
(63, '2022_07_02_123413_create_carts_table', 1),
(64, '2022_07_11_091506_create_coupons_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_total_price` double UNSIGNED NOT NULL,
  `product_quantity` bigint(20) UNSIGNED NOT NULL,
  `product_sub_total` double UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `order_total_price`, `product_quantity`, `product_sub_total`, `address`, `phone`, `order_status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 9, 5, 1, 'Irbid', '0790640416', 'pending', '2022-07-12 09:22:07', '2022-07-12 09:22:07'),
(4, 1, 2, 9, 10, 0.5, 'Irbid', '0790640416', 'pending', '2022-07-12 09:22:07', '2022-07-12 09:22:07'),
(5, 1, 7, 3.65, 1, 2.35, 'Irbid', '0790640416', 'pending', '2022-07-27 07:23:07', '2022-07-27 07:23:07'),
(6, 1, 4, 3.65, 1, 1.3, 'Irbid', '0790640416', 'pending', '2022-07-27 07:23:07', '2022-07-27 07:23:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(2, 'browse_bread', NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(3, 'browse_database', NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(4, 'browse_media', NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(5, 'browse_compass', NULL, '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(6, 'browse_menus', 'menus', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(7, 'read_menus', 'menus', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(8, 'edit_menus', 'menus', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(9, 'add_menus', 'menus', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(10, 'delete_menus', 'menus', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(11, 'browse_roles', 'roles', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(12, 'read_roles', 'roles', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(13, 'edit_roles', 'roles', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(14, 'add_roles', 'roles', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(15, 'delete_roles', 'roles', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(21, 'browse_settings', 'settings', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(22, 'read_settings', 'settings', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(23, 'edit_settings', 'settings', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(24, 'add_settings', 'settings', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(25, 'delete_settings', 'settings', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(26, 'browse_categories', 'categories', '2022-07-12 08:11:56', '2022-07-12 08:11:56'),
(27, 'read_categories', 'categories', '2022-07-12 08:11:56', '2022-07-12 08:11:56'),
(28, 'edit_categories', 'categories', '2022-07-12 08:11:56', '2022-07-12 08:11:56'),
(29, 'add_categories', 'categories', '2022-07-12 08:11:56', '2022-07-12 08:11:56'),
(30, 'delete_categories', 'categories', '2022-07-12 08:11:56', '2022-07-12 08:11:56'),
(31, 'browse_types', 'types', '2022-07-12 08:15:47', '2022-07-12 08:15:47'),
(32, 'read_types', 'types', '2022-07-12 08:15:47', '2022-07-12 08:15:47'),
(33, 'edit_types', 'types', '2022-07-12 08:15:47', '2022-07-12 08:15:47'),
(34, 'add_types', 'types', '2022-07-12 08:15:47', '2022-07-12 08:15:47'),
(35, 'delete_types', 'types', '2022-07-12 08:15:47', '2022-07-12 08:15:47'),
(36, 'browse_coupons', 'coupons', '2022-07-12 08:18:15', '2022-07-12 08:18:15'),
(37, 'read_coupons', 'coupons', '2022-07-12 08:18:15', '2022-07-12 08:18:15'),
(38, 'edit_coupons', 'coupons', '2022-07-12 08:18:15', '2022-07-12 08:18:15'),
(39, 'add_coupons', 'coupons', '2022-07-12 08:18:15', '2022-07-12 08:18:15'),
(40, 'delete_coupons', 'coupons', '2022-07-12 08:18:15', '2022-07-12 08:18:15'),
(41, 'browse_statuses', 'statuses', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(42, 'read_statuses', 'statuses', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(43, 'edit_statuses', 'statuses', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(44, 'add_statuses', 'statuses', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(45, 'delete_statuses', 'statuses', '2022-07-12 08:26:13', '2022-07-12 08:26:13'),
(46, 'browse_features', 'features', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(47, 'read_features', 'features', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(48, 'edit_features', 'features', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(49, 'add_features', 'features', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(50, 'delete_features', 'features', '2022-07-12 08:28:35', '2022-07-12 08:28:35'),
(51, 'browse_products', 'products', '2022-07-12 08:31:27', '2022-07-12 08:31:27'),
(52, 'read_products', 'products', '2022-07-12 08:31:27', '2022-07-12 08:31:27'),
(53, 'edit_products', 'products', '2022-07-12 08:31:27', '2022-07-12 08:31:27'),
(54, 'add_products', 'products', '2022-07-12 08:31:27', '2022-07-12 08:31:27'),
(55, 'delete_products', 'products', '2022-07-12 08:31:27', '2022-07-12 08:31:27'),
(56, 'browse_orders', 'orders', '2022-07-12 09:27:52', '2022-07-12 09:27:52'),
(57, 'read_orders', 'orders', '2022-07-12 09:27:52', '2022-07-12 09:27:52'),
(58, 'edit_orders', 'orders', '2022-07-12 09:27:52', '2022-07-12 09:27:52'),
(59, 'add_orders', 'orders', '2022-07-12 09:27:52', '2022-07-12 09:27:52'),
(60, 'delete_orders', 'orders', '2022-07-12 09:27:52', '2022-07-12 09:27:52'),
(61, 'browse_users', 'users', '2022-08-12 02:55:08', '2022-08-12 02:55:08'),
(62, 'read_users', 'users', '2022-08-12 02:55:08', '2022-08-12 02:55:08'),
(63, 'edit_users', 'users', '2022-08-12 02:55:08', '2022-08-12 02:55:08'),
(64, 'add_users', 'users', '2022-08-12 02:55:08', '2022-08-12 02:55:08'),
(65, 'delete_users', 'users', '2022-08-12 02:55:08', '2022-08-12 02:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `product_price_on_sale` double NOT NULL,
  `product_quantity` double NOT NULL,
  `product_tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sale_status_id` bigint(20) UNSIGNED NOT NULL,
  `product_feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_img`, `product_price`, `product_price_on_sale`, `product_quantity`, `product_tags`, `category_id`, `sale_status_id`, `product_feature_id`, `created_at`, `updated_at`) VALUES
(1, 'Blackberry', '<p>berries benefits: many colors and shapes of berries but characterized by multiple benefits of health of the body, because it contains large amounts of essential nutrients and antioxidants more than vegetables and fruits. nutritional values per 100 g</p>', 'products\\July2022\\1Gzlbot9qgXrHx4HUncq.png', 1, 0.75, 10, 'fruits', 1, 2, 1, '2022-07-12 08:39:00', '2022-07-12 08:53:07'),
(2, 'Potatoes', '<p>Jordan production - first class Potato benefits: Many believe that potatoes are nothing more than carbohydrates and starches and overlook the fact that they are rich in energy and many nutrients essential for health and immunity. These elements are: d.</p>', 'products\\July2022\\gvZPmSMYLfN9tvfJnfDN.png', 0.75, 0.5, 20, 'vegetables', 2, 2, 1, '2022-07-12 08:42:00', '2022-07-14 01:01:24'),
(3, 'Mushrooms White', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\"> Mushrooms Benefits: Mushrooms has several kinds, and the variety of mushrooms are in shape, taste and flavor. Mushrooms give the body vitamins and minerals important to strengthen the body, and prevention of many disease. Nutritional values per 100 g of Mushrooms: Energy (calories): 22 kcal Protein: 3.09 g Vitamin B-2: 0.402 mg Vitamin B-3: 3.607 mg Vitamin B-5: 1.497 mg Phosphorus: 86 mg Copper: 0.318 mg Selenium: 9.3 &micro;g </span></p>', 'products\\July2022\\jPpcCLMMwYoOPJ87BHAR.jpg', 2, 1.9, 10, 'vegetables', 2, 2, 1, '2022-07-14 00:28:47', '2022-07-14 00:28:47'),
(4, 'Black Grapes', '<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 0px; font-size: 18px; line-height: 26px; padding-top: 0px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Black grapes are small, sweet fruits &mdash; famous for their intense blueish-purple color that makes them look almost black.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 0px; font-size: 18px; line-height: 26px; padding-top: 0px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Their unique color comes from their high concentration of anthocyanins, an antioxidant responsible for the color of other black, purple, and blue fruits and veggies. Anthocyanins also give color to foods like blackberries, blueberries, eggplant, and purple cauliflower<a class=\"content-link css-5r4717\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; background-color: transparent; cursor: pointer; text-decoration-line: none; border-color: currentcolor; color: #02838d;\" href=\"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4689022/\" target=\"_blank\" rel=\"noopener noreferrer\"><span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Sou</span></span></a>.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Multiple varieties are available, including seeded and seedless types, most of which are primarily used to make red wine.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">However, black grapes can also make a nutritious snack or dessert.</p>', 'products\\July2022\\LCq4nRC5Ip4v6E1V414T.jpg', 1.4, 1.3, 15, 'fruits', 1, 1, 1, '2022-07-14 00:35:54', '2022-07-14 00:35:54'),
(5, 'Pumpkin', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\"> Imported From India Pumpkin Benefits: Scientific studies have shown that Pumpkin is very useful for health because it contains vitamins, minerals and fiber. Also prove that Pumpkin has proven effective in getting rid of many bacteria that are harmful to humans. The nutritional value of 100 grams of pumpkin: Energy: 34 calories Protein: 1.1 g Fat: 0.28 g Carbohydrates: 8.09 gm Fiber: 2.9 g Vitamin C: 4.2 mg Vitamin A: 15563 IU or 4668.9 &micro;g Copper: 0.107 mg </span></p>', 'products\\July2022\\js3rLB02yZ7nzwNR35zW.jpg', 1, 0.9, 20, 'vegetables', 2, 1, 2, '2022-07-14 01:00:35', '2022-07-14 01:00:35'),
(6, 'Carrots', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Carrots Benefits: Carrots are one of the most important and very useful vegetables for human health, because carrots contain a high amount of important nutrients such as mineral salts and vitamins, such as Vitamin A, Vitamin C. Nutritional values per 100 g of product Energy: 41 Kcal Protein: 0.93 g Carbohydrates: 9.58 g Vitamin C: 5.9 mg Vitamin A: 16706 IU equal 5011.8 &micro;g Vitamin K: 13.2 &micro;g Manganese: 0.143 mg </span></p>', 'products\\July2022\\oCcFTjDG8tZpStm85Bnu.jpg', 1.5, 1.4, 10, 'vegetables', 2, 1, 2, '2022-07-14 01:04:35', '2022-07-14 01:04:35'),
(7, 'Brown Mushroom', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\"> Mushrooms Benefits: Mushrooms has several kinds, and the variety of mushrooms are in shape, taste and flavor. Mushrooms give the body vitamins and minerals important to strengthen the body, and prevention of many disease. Nutritional values per 100 g of Mushrooms: Energy (calories): 22 kcal Protein: 3.09 g Vitamin B-2: 0.402 mg Vitamin B-3: 3.607 mg Vitamin B-5: 1.497 mg Phosphorus: 86 mg Copper: 0.318 mg Selenium: 9.3 &micro;g </span></p>', 'products\\July2022\\gCTpTzVmrGuumD7L50lW.png', 2.4, 2.35, 5, 'vegetables', 2, 1, 2, '2022-07-14 01:07:21', '2022-07-14 01:07:21'),
(8, 'Baby Onion', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Onions Benefits: Onions it is a natural defense to attacks bacteria and Germs and eliminates them completely. Onions contains large quantities of important vitamins to human health, and is a rich source of mineral salts, natural fibers and contain a few calories. Nutritional values per 100 g of Onions: Energy: 40 Kcal Protein: 1.1 g Carbohydrates: 9.34 g Vitamin C: 7.4 mg Vitamin B-6: 0.12 mg Manganese: 0.129 mg Fiber: 1.7 g </span></p>', 'products\\July2022\\KqiwhhW54KutcbqnvgQq.jpg', 0.5, 0.4, 20, 'vegetables', 2, 2, 1, '2022-07-14 01:10:08', '2022-07-14 01:10:08'),
(9, 'Tomatoes - Local', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Tomatoes are not only delicious, but contain many vitamins and nutrients that are useful and low in calories. It has many uses such as tomato paste, tomato sauce, tomato juice and fresh salad. It cannot be dispensed with. Tomatoes are used almost daily and are used in most of the main cooks. Nutritional values per 100 g of product: Calories: 18 Kcal Protein: 0.88 g Carbohydrates: 3.89 g Fat: 0.2 g Vitamin A: 833 IU Vitamin C: 13.7 mg</span></p>', 'products\\July2022\\XP1kZCIsUC5V7mm5hD4d.jpg', 0.3, 0.25, 15, 'vegetables', 2, 2, 1, '2022-07-14 01:12:09', '2022-07-14 01:12:09'),
(10, 'Green Hot Pepper', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Hot Pepper (Hot Chili) Benefits: The shapes of Hot Pepper (Hot Chili) are varied and vary in flavor, size and color. Chili contains many important nutrients, as it contains a high amount of vitamin C and vitamin A, and many minerals necessary for human health. </span></p>', 'products\\July2022\\rrKR7fTxfsp5kryzB2cS.png', 0.7, 0.5, 6, 'vegetables', 2, 1, 2, '2022-07-14 01:14:00', '2022-07-14 01:15:02'),
(11, 'Red Hot Pepper', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Hot Pepper (Hot Chili) Benefits: The shapes of Hot Pepper (Hot Chili) are varied and vary in flavor, size and color. Chili contains many important nutrients, as it contains a high amount of vitamin C and vitamin A, and many minerals necessary for human health. </span></p>', 'products\\July2022\\W8ivE5M7ZwjQxnF9ZI3h.jpg', 0.6, 0.5, 6, 'vegetables', 2, 1, 2, '2022-07-14 01:15:54', '2022-07-14 01:15:54'),
(12, 'Okra', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Hakama Production - First Class Okra Benefits: Okra has countless benefits, extends to the prevention of many diseases and maintains the body and strengthen its immunity. It is a treasure for vitamins C, B, A, K, and contains minerals such as magnesium, phosphorus, copper and manganese, as well as rich in dietary fiber. Nutritional values per 100 g of Okra: Energy (calories): 33 kcal Protein: 1.93 g Fiber: 3.2 g Vitamin C: 23 mg Folate: 60 &micro;g DFE Vitamin B-1: 0.2 mg Vitamin B-6: 0.215 mg Vitamin A: 716 IU or 214.8 &micro;g Vitamin K: 31.3 &micro;g Magnesium: 57 mg Phosphorus: 61 mg Potassium: 299 mg Copper: 0.109 mg </span></p>', 'products\\July2022\\CSe5JLxMOembCCJUH2Wd.jpg', 0.9, 0.7, 12, 'vegetables', 2, 2, 1, '2022-07-14 01:19:03', '2022-07-14 01:19:03'),
(13, 'Garlic', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Garlic Benefits: Garlic is rich in many essential chemical compounds that necessary for the human body. Studies have shown that garlic protects the body and is a true enemy of the flu and many serious diseases, where the compounds in garlic to give positive effects of the immune system. Nutritional values per 100 g of Garlic: Energy: 149 kcal Protein: 6.36 g Carbohydrates: 33.06 g Vitamin C: 31.2 mg Vitamin B-1: 0.2 mg Vitamin B-6: 1.235 mg Calcium: 181 mg Phosphorus: 153 mg Zinc: 1.16 mg Copper: 0.299 mg Selenium: 14.2 &micro;g Manganese: 1.672 mg </span></p>', 'products\\July2022\\y7CQmFwEIWRgjPUiNNRx.jpg', 0.3, 0.25, 10, 'vegetables', 2, 1, 2, '2022-07-14 01:21:31', '2022-07-14 01:21:31'),
(14, 'Turmeric', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Curcuma (Turmeric) Benefits: Turmeric (Curcuma) is rich in antioxidants, which fight viruses, bacteria and fungus. Turmeric (Curcuma) is useful for the body, skin and hair and is a cure for many diseases, God willing. Nutritional values per 100 g of Curcuma (Turmeric): Energy: 312 kcal Protein: 9.68 g Carbohydrates: 67.14 g Fiber: 22.7 g Vitamin B-2: 0.15 mg Vitamin E: 4.43 mg Vitamin K: 13.4 &micro;g Calcium: 168 mg Magnesium: 208 mg Phosphorus: 299 mg Iron: 55 mg Potassium: 2080 mg Zinc: 4.5 mg Copper: 1.3 mg Manganese: 19.8 mg Omega 6 (n-6): 1.771 g </span></p>', 'products\\July2022\\kBEQMGj1o9SGJLlJNRk9.png', 1.4, 1.3, 7, 'vegetables', 2, 1, 2, '2022-07-14 01:23:33', '2022-07-14 01:23:33'),
(15, 'Red Onion', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Onions Benefits: Onions it is a natural defense to attacks bacteria and Germs and eliminates them completely. Onions contains large quantities of important vitamins to human health, and is a rich source of mineral salts, natural fibers and contain a few calories. Nutritional values per 100 g of Onions: Energy: 40 Kcal Protein: 1.1 g Carbohydrates: 9.34 g Vitamin C: 7.4 mg Vitamin B-6: 0.12 mg Manganese: 0.129 mg Fiber: 1.7 g </span></p>', 'products\\July2022\\tz0vihAEhAvXKn19o9VC.jpg', 0.4, 0.35, 20, 'vegetables', 2, 2, 1, '2022-07-14 01:25:21', '2022-07-14 01:25:21'),
(16, 'Cauliflower', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Cauliflower Benefits: In the composition of the Cauliflower, many beneficial elements for the body, such as antioxidants, vitamin C, vitamin B, vitamin K and many minerals, and Cauliflower, which contain the phosphorus that helps strengthen the body. Nutritional values per 100 g of Cauliflower: Energy (calories): 25 kcal Protein: 1.92 g Carbohydrates: 4.97 g Vitamin C: 48.2 mg Folate: 57 &micro;g Vitamin B-5: 0.667 mg Vitamin B-6: 0.184 mg Vitamin K: 15.5 &micro;g Phosphorus: 44 mg Manganese: 0.155 mg </span></p>', 'products\\July2022\\ykmPMan69Rb70ADAcRB9.jpg', 0.7, 0.5, 16, 'vegetables', 2, 2, 1, '2022-07-14 01:26:57', '2022-07-14 01:26:57'),
(17, 'Cucumber', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Cucumber Benefits: Cucumber has a refreshing taste and can be eaten fresh or pickled. you can be enjoyed as a low calories snack or can be used to add flavor to a variety of dishes. The cucumber contains water and a lot of beneficial nutrients to the human body and a few calories, fat, cholesterol and sodium. The cucumber also contains dietary fiber that helps digestion and bowel function. Nutritional values per 100 g of Cucumber: Calories: 15 kcal Protein: 0.65 g Carbohydrates: 3.63 g Fat: 0.11g Vitamin K: 16.4 &micro;g Vitamin B-5: 0.259 mg </span></p>', 'products\\July2022\\uSYKtIO7Y0aC9edN45ul.jpg', 0.5, 0.45, 20, 'vegetables', 2, 2, 1, '2022-07-14 01:28:06', '2022-07-14 01:28:06'),
(18, 'Golden Onion Local', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Onions it is a natural defense to attacks bacteria and Germs and eliminates them completely. Onions contains large quantities of important vitamins to human health, and is a rich source of mineral salts, natural fibers and contain a few calories. Nutritional values per 100 g of Onions: Energy: 40 Kcal Protein: 1.1 g Carbohydrates: 9.34 g Vitamin C: 7.4 mg Vitamin B-6: 0.12 mg Manganese: 0.129 mg Fiber: 1.7 g </span></p>', 'products\\July2022\\vziku9NYFNXOZ8OlSqtl.jpg', 0.6, 0.5, 15, 'vegetables', 2, 2, 2, '2022-07-14 01:31:45', '2022-07-14 01:31:45'),
(19, 'Eggplant Black', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Eggplant Benefits: Several studies have indicated that increased consumption of plant foods such as eggplant reduces the risk of obesity and many diseases, and enhance human health. The eggplants containing an impressive array across the board of many vitamins and minerals and excellent amounts of fiber. Nutritional values per 100 g of Eggplant: Energy: 25 kcal Protein: 0.98 g Carbohydrates: 5.88 g Fat: 0.18 g Folate: 22 &micro;g DFE Vitamin B-5: 0.281 mg Vitamin B-6: 0.084 mg Fiber: 3 g </span></p>', 'products\\July2022\\TeW81eWKurlUraTsg26O.jpg', 0.55, 0.4, 25, 'vegetables', 2, 2, 1, '2022-07-14 01:33:31', '2022-07-14 01:33:31'),
(20, 'Zucchini', '<p><span style=\"color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; white-space: break-spaces;\">Zucchini Benefits: Zucchini is the most Famous and most important vegetable health benefit to humans, containing many food compounds beneficial to health, such as vitamins, minerals, fiber and antioxidants. The zucchini, due to its content of these food compounds, protects against many diseases. </span></p>', 'products\\July2022\\mwOiDNkMIXVQqFgMW0xJ.jpg', 0.9, 0.7, 23, 'vegetables', 2, 2, 1, '2022-07-14 01:34:56', '2022-07-14 01:34:56'),
(21, 'Bell Pepper Yellow', '<div class=\"d-flex align-items-center mb-4\" style=\"box-sizing: border-box; display: flex !important; align-items: center !important; margin-bottom: 20px !important; color: #212121; font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-v-6580def9=\"\">&nbsp;</div>\r\n<h3 class=\"text-capitalize fwSemibold\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Poppins, SFMono-Regular, Menlo, Monaco, Consolas, \'Liberation Mono\', \'Courier New\', monospace; font-weight: 600; line-height: 30px; color: #212121; font-size: 26px; text-transform: capitalize !important; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-v-6580def9=\"\"><span style=\"font-family: Roboto, -apple-system, BlinkMacSystemFont, \'Segoe UI\', \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 18px; font-weight: 400; text-transform: none; white-space: break-spaces;\">Bell Pepper Benefits: The benefits of Bell Pepper vary by color, but they all contain a high percentage of vitamin C, the highest percentage that can be found in vegetables, and contain other vitamins that fights oxidation and many minerals necessary for the human body, so it addresses many of the health problems. Nutritional values per 100 g of Yellow Bell Pepper: Energy: 27 Kcal Protein: 1 g Carbohydrates: 6.32 g Vitamin C: 183.5 mg Vitamin B-6: 0.168 mg Vitamin A: 200 IU or 60 &micro;g Copper: 0.107 mg </span></h3>', 'products\\July2022\\xpCv3ck0AN39PbiTBoTJ.jpg', 0.9, 0.8, 10, 'vegetables', 2, 1, 2, '2022-07-14 01:36:05', '2022-07-14 01:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-07-12 08:09:43', '2022-07-12 08:09:43'),
(2, 'user', 'Normal User', '2022-07-12 08:09:43', '2022-07-12 08:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '677113565848-l28eep7ofltemhkj6en93qm6fpe2clgi.apps.googleusercontent.com', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', '7isbeh', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '677113565848-l28eep7ofltemhkj6en93qm6fpe2clgi.apps.googleusercontent.com', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'on sale', '2022-07-12 08:26:43', '2022-07-12 08:26:43'),
(2, 'normal', '2022-07-12 08:26:53', '2022-07-12 08:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fixed', '2022-07-12 08:16:19', '2022-07-12 08:16:19'),
(2, 'percent', '2022-07-12 08:16:26', '2022-07-12 08:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT 2,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `phone`, `address`, `user_img`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'yousef alhindawi', 'yousefalhindawe@gmail.com', 'users/default.png', NULL, '$2y$10$gEVARivMMlIe4JdPWd.a1OudTk35nxRMbIWo8LpxSISZVQ86J0N5C', '0790640416', 'Irbid', 'avatar.png', NULL, NULL, '2022-07-12 08:09:23', '2022-07-12 08:09:23'),
(2, 2, 'sala fayiz alhindawi', 'sala@gmail.com', NULL, NULL, '$2y$10$lczPkSSzvsMtHz9Q66G2VOsOIxlkjgijiFfsToif0emU2Z9oL2hTC', '', '', '', NULL, '{\"locale\":\"en\"}', '2022-07-27 07:57:51', '2022-08-12 03:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_type_id_foreign` (`type_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_name_unique` (`product_name`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sale_status_id_foreign` (`sale_status_id`),
  ADD KEY `products_product_feature_id_foreign` (`product_feature_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_product_feature_id_foreign` FOREIGN KEY (`product_feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_sale_status_id_foreign` FOREIGN KEY (`sale_status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
