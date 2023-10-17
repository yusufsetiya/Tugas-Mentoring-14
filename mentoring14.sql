-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table jwt.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jwt.category: ~5 rows (approximately)
INSERT INTO `category` (`category_id`, `category_name`) VALUES
	(1, 'Otomotif'),
	(2, 'Property'),
	(3, 'Makanan'),
	(4, 'bagaimana'),
	(6, 'bagaimanasss');

-- Dumping structure for table jwt.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jwt.ci_sessions: ~0 rows (approximately)

-- Dumping structure for table jwt.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `FK_products_category` (`category_id`),
  CONSTRAINT `FK_products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Dumping data for table jwt.products: ~17 rows (approximately)
INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `price`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
	(3, 'aku kamu dan', 3, 200000.00, 3, 'mencoba saja', '2023-10-16 03:06:23', '2023-10-16 03:06:23'),
	(5, 'Burger', 2, 100000.00, 50, 'ini ikan nirwana', '2023-10-16 03:08:52', '2023-10-16 03:08:52'),
	(6, 'Burger', 2, 100000.00, 50, 'ini ikan nirwana', '2023-10-16 03:09:30', '2023-10-16 03:09:30'),
	(7, 'Makanan', 2, 100000.00, 50, 'ini ikan nirwana', '2023-10-16 03:10:11', '2023-10-16 03:10:11'),
	(8, '', 2, 100000.00, 50, 'ini ikan nirwana', '2023-10-16 03:23:33', '2023-10-16 03:23:33'),
	(9, 'Kamu siapa', 2, 100000.00, 50, 'ini ikan nirwana', '2023-10-16 03:51:10', '2023-10-16 03:51:10'),
	(10, 'Coba dong ss', 4, 200000.00, 3, 'Okedah', '2023-10-16 04:26:26', '2023-10-16 04:26:26'),
	(11, 'aku kamu dan saya', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:33:58', '2023-10-16 04:33:58'),
	(12, 'aku kamu dan saya', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:35:47', '2023-10-16 04:35:47'),
	(13, 'aku kamu dan saya', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:36:06', '2023-10-16 04:36:06'),
	(14, 'aku kamu dan saya', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:36:09', '2023-10-16 04:36:09'),
	(15, 'aku kamu dan saya', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:36:24', '2023-10-16 04:36:24'),
	(16, 'aku kamu dan saya', 2, 200000.00, 3, 'mencoba saja', '2023-10-16 04:37:40', '2023-10-16 04:37:40'),
	(17, 'aku kamu dan saya', 2, 200000.00, 3, 'mencoba saja', '2023-10-16 04:39:37', '2023-10-16 04:39:37'),
	(18, 'aku kamu dan saya', 2, 200000.00, 3, 'mencoba saja', '2023-10-16 04:39:39', '2023-10-16 04:39:39'),
	(19, 'Coba ini', 1, 200000.00, 3, 'mencoba saja', '2023-10-16 04:39:55', '2023-10-16 04:39:55'),
	(21, 'Coba dong ss', 4, 200000.00, 3, 'Okedah', '2023-10-16 06:42:29', '2023-10-16 06:42:29');

-- Dumping structure for table jwt.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default.jpg',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_admin` tinyint unsigned NOT NULL DEFAULT '0',
  `is_confirmed` tinyint unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table jwt.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `created_at`, `updated_at`, `is_admin`, `is_confirmed`, `is_deleted`) VALUES
	(1, 'newUser1', 'user1@example.com', '$2y$10$onLGA.58zZ.Xx.niroHS9u1v4TEEQz3pXOUTWqO.YZnXTckMTWmnK', 'default.jpg', '2023-10-13 13:18:27', NULL, 0, 0, 0),
	(2, 'coba', 'coba@example.com', '$2y$10$qXYyQJeykcSH0s8u7TPCCeMnS07lMbHvRRWNFw3i1/vggyFsehpAy', 'default.jpg', '2023-10-16 01:25:18', NULL, 0, 0, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
