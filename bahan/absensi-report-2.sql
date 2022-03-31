-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 04:18 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi-report-2`
--

-- --------------------------------------------------------

--
-- Table structure for table `izins`
--

CREATE TABLE `izins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `alasan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rentang` datetime NOT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `izins`
--

INSERT INTO `izins` (`id`, `user_id`, `alasan`, `rentang`, `bukti`, `created_at`, `updated_at`) VALUES
(9, 45, 'laptop', '2022-04-07 00:00:00', 'img/izin/1728700830397492.png', NULL, NULL),
(10, 45, 'panas', '2022-04-07 00:00:00', 'img/izin/1728705014703784.PNG', NULL, NULL),
(11, 46, 'sakit', '2022-03-31 00:00:00', NULL, NULL, NULL);

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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_02_20_000001_create_permissions_table', 1),
(8, '2020_02_20_000002_create_roles_table', 1),
(9, '2020_02_20_000003_create_users_table', 1),
(10, '2020_02_20_000004_create_time_entries_table', 1),
(11, '2020_02_20_000005_create_permission_role_pivot_table', 1),
(12, '2020_02_20_000006_create_role_user_pivot_table', 1),
(13, '2020_02_20_000007_add_relationship_fields_to_time_entries_table', 1),
(14, '2022_03_29_025139_create_izins_table', 2),
(15, '2022_03_30_162249_create_shifts_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'time_entry_create', NULL, NULL, NULL),
(18, 'time_entry_edit', NULL, NULL, NULL),
(19, 'time_entry_show', NULL, NULL, NULL),
(20, 'time_entry_delete', NULL, NULL, NULL),
(21, 'time_entry_access', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(2, 19),
(2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'Employee', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `masuk` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pulang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `nama_shift`, `masuk`, `pulang`, `created_at`, `updated_at`) VALUES
(1, 'Shift Pagi Head Office', '09:00', '17:00', NULL, NULL),
(2, 'Shift Pagi Outlet', '10:00', '18:00', NULL, NULL),
(3, 'Shift Pagi Jam 11', '11:00', '20:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_entries`
--

INSERT INTO `time_entries` (`id`, `time_start`, `time_end`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(1, '2022-03-09 09:37:35', '2022-03-09 17:22:57', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(2, '2022-03-25 09:54:34', '2022-03-25 14:38:44', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(3, '2022-03-04 08:23:04', '2022-03-04 10:28:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(4, '2022-03-23 09:33:44', '2022-03-23 16:59:58', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(5, '2022-02-26 08:41:27', '2022-02-26 12:30:59', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(6, '2022-03-14 08:03:21', '2022-03-14 17:38:46', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(7, '2022-03-24 08:51:50', '2022-03-24 17:35:33', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(8, '2022-03-20 09:28:28', '2022-03-20 17:56:15', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(9, '2022-03-18 09:36:41', '2022-03-18 15:54:58', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(10, '2022-03-05 09:51:06', '2022-03-05 14:24:52', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 2),
(11, '2022-03-19 09:28:20', '2022-03-19 15:33:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(12, '2022-03-21 08:22:30', '2022-03-21 15:32:37', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(13, '2022-03-23 09:13:08', '2022-03-23 11:16:25', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(14, '2022-02-26 09:23:43', '2022-02-26 14:34:13', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(15, '2022-02-27 08:00:46', '2022-02-27 17:59:56', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(16, '2022-03-15 09:54:42', '2022-03-15 15:38:33', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(17, '2022-03-04 09:00:02', '2022-03-04 12:18:45', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(18, '2022-03-16 09:21:12', '2022-03-16 11:47:48', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(19, '2022-03-25 09:49:58', '2022-03-25 16:22:43', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(20, '2022-03-17 09:36:43', '2022-03-17 16:06:11', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 3),
(21, '2022-03-27 08:32:29', '2022-03-27 17:31:04', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(22, '2022-03-18 09:17:35', '2022-03-18 12:38:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(23, '2022-03-17 08:41:32', '2022-03-17 13:26:30', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(24, '2022-03-20 09:45:05', '2022-03-20 14:13:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(25, '2022-03-16 08:06:44', '2022-03-16 13:25:10', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(26, '2022-03-26 08:21:40', '2022-03-26 15:15:12', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(27, '2022-03-14 08:51:37', '2022-03-14 13:32:23', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(28, '2022-03-21 09:08:34', '2022-03-21 11:22:46', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(29, '2022-03-19 08:47:35', '2022-03-19 13:01:52', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(30, '2022-03-03 09:56:31', '2022-03-03 16:58:14', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 4),
(31, '2022-02-28 09:06:07', '2022-02-28 11:17:33', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(32, '2022-03-25 09:25:11', '2022-03-25 12:30:54', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(33, '2022-03-11 09:42:22', '2022-03-11 14:26:22', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(34, '2022-03-19 08:58:26', '2022-03-19 11:08:00', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(35, '2022-03-21 08:41:08', '2022-03-21 11:04:27', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(36, '2022-03-09 08:40:46', '2022-03-09 16:10:41', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(37, '2022-03-22 08:28:05', '2022-03-22 13:03:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(38, '2022-03-14 09:10:35', '2022-03-14 11:37:46', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(39, '2022-03-23 09:09:59', '2022-03-23 13:03:47', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(40, '2022-03-13 08:22:36', '2022-03-13 16:56:31', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 5),
(41, '2022-03-26 09:13:19', '2022-03-26 12:25:59', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(42, '2022-03-14 09:07:26', '2022-03-14 17:02:12', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(43, '2022-02-27 09:01:44', '2022-02-27 17:12:03', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(44, '2022-03-07 09:46:30', '2022-03-07 13:44:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(45, '2022-02-28 09:00:58', '2022-02-28 14:24:11', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(46, '2022-03-19 09:10:42', '2022-03-19 13:23:42', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(47, '2022-03-10 09:12:45', '2022-03-10 14:06:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(48, '2022-02-26 08:34:10', '2022-02-26 13:00:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(49, '2022-03-17 09:52:09', '2022-03-17 16:56:20', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(50, '2022-03-04 08:49:08', '2022-03-04 16:19:14', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 6),
(51, '2022-03-24 08:56:04', '2022-03-24 13:18:44', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(52, '2022-03-25 09:06:39', '2022-03-25 14:33:16', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(53, '2022-03-09 08:21:06', '2022-03-09 17:29:16', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(54, '2022-02-27 08:22:28', '2022-02-27 13:43:43', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(55, '2022-03-05 09:58:59', '2022-03-05 12:33:59', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(56, '2022-03-06 09:02:53', '2022-03-06 12:55:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(57, '2022-03-21 09:11:10', '2022-03-21 16:01:02', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(58, '2022-03-10 08:23:26', '2022-03-10 17:21:25', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(59, '2022-03-07 09:49:47', '2022-03-07 15:45:42', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(60, '2022-02-26 09:06:47', '2022-02-26 15:30:23', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 7),
(61, '2022-03-22 08:44:53', '2022-03-22 17:59:04', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(62, '2022-03-19 09:47:02', '2022-03-19 15:53:44', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(63, '2022-03-04 08:21:49', '2022-03-04 15:47:19', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(64, '2022-03-06 09:42:52', '2022-03-06 15:01:01', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(65, '2022-03-26 08:45:49', '2022-03-26 15:38:30', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(66, '2022-03-21 08:54:05', '2022-03-21 14:23:54', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(67, '2022-03-15 09:59:30', '2022-03-15 12:48:57', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(68, '2022-03-08 08:56:06', '2022-03-08 17:06:31', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(69, '2022-03-27 08:43:04', '2022-03-27 13:09:51', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(70, '2022-03-24 09:21:01', '2022-03-24 11:24:27', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 8),
(71, '2022-03-26 08:34:53', '2022-03-26 17:45:10', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(72, '2022-03-04 08:12:28', '2022-03-04 15:59:24', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(73, '2022-03-02 09:40:24', '2022-03-02 13:28:45', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(74, '2022-03-15 09:08:14', '2022-03-15 14:26:53', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(75, '2022-03-12 08:04:31', '2022-03-12 14:01:26', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(76, '2022-03-17 08:41:23', '2022-03-17 14:10:42', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(77, '2022-02-26 08:17:58', '2022-02-26 13:28:29', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(78, '2022-03-06 08:56:10', '2022-03-06 15:31:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(79, '2022-03-24 08:42:20', '2022-03-24 15:23:46', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(80, '2022-03-13 08:08:33', '2022-03-13 11:21:02', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 9),
(81, '2022-03-05 09:44:12', '2022-03-05 14:45:03', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(82, '2022-02-28 08:52:04', '2022-02-28 12:58:50', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(83, '2022-03-27 08:06:37', '2022-03-27 15:53:51', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(84, '2022-03-20 08:45:52', '2022-03-20 11:22:54', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(85, '2022-03-11 08:58:28', '2022-03-11 15:06:09', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(86, '2022-03-02 09:58:05', '2022-03-02 12:34:45', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(87, '2022-03-03 09:59:30', '2022-03-03 12:12:49', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(88, '2022-03-22 09:11:09', '2022-03-22 13:40:49', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(89, '2022-03-26 08:27:08', '2022-03-26 14:41:07', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(90, '2022-03-23 09:32:32', '2022-03-23 17:28:24', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 10),
(91, '2022-03-09 08:23:42', '2022-03-09 11:29:21', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(92, '2022-03-11 08:18:41', '2022-03-11 15:30:14', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(93, '2022-03-03 08:56:17', '2022-03-03 17:38:02', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(94, '2022-03-02 09:39:31', '2022-03-02 17:45:11', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(95, '2022-03-10 08:46:16', '2022-03-10 16:44:35', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(96, '2022-03-05 09:02:24', '2022-03-05 13:44:16', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(97, '2022-03-14 09:17:03', '2022-03-14 12:33:30', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(98, '2022-03-06 09:57:32', '2022-03-06 11:58:15', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(99, '2022-02-26 09:52:35', '2022-02-26 15:06:16', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(100, '2022-03-15 09:05:06', '2022-03-15 14:54:46', '2022-03-28 07:31:02', '2022-03-28 07:31:02', NULL, 11),
(101, '2022-03-28 09:33:44', '2022-03-28 09:44:43', '2022-03-28 02:33:44', '2022-03-28 02:44:43', NULL, 45),
(102, '2022-03-28 09:53:58', '2022-03-28 10:01:32', '2022-03-28 02:53:58', '2022-03-28 03:01:32', NULL, 45),
(103, '2022-03-28 10:02:33', '2022-03-28 10:07:55', '2022-03-28 03:02:33', '2022-03-28 03:07:55', NULL, 45),
(104, '2022-03-29 02:27:44', '2022-03-29 02:29:10', '2022-03-28 19:27:44', '2022-03-28 19:29:10', NULL, 45),
(105, '2022-03-29 02:30:42', '2022-03-29 02:31:45', '2022-03-28 19:30:42', '2022-03-28 19:31:45', NULL, 45),
(106, '2022-03-29 03:06:05', '2022-03-29 03:17:03', '2022-03-28 20:06:05', '2022-03-28 20:17:03', NULL, 45),
(107, '2022-03-29 03:36:01', '2022-03-29 03:36:01', '2022-03-28 20:36:01', '2022-03-28 20:36:01', NULL, 45),
(108, '2022-03-29 03:36:02', '2022-03-29 03:36:02', '2022-03-28 20:36:02', '2022-03-28 20:36:02', NULL, 45),
(109, '2022-03-29 03:36:10', '2022-03-29 03:51:33', '2022-03-28 20:36:10', '2022-03-28 20:51:33', NULL, 45),
(110, '2022-03-29 03:52:02', '2022-03-29 04:23:14', '2022-03-28 20:52:02', '2022-03-28 21:23:14', NULL, 45),
(111, '2022-03-29 04:52:13', '2022-03-29 05:03:50', '2022-03-28 21:52:13', '2022-03-28 22:03:50', NULL, 45),
(112, '2022-03-29 05:04:46', '2022-03-29 08:03:23', '2022-03-28 22:04:46', '2022-03-29 01:03:23', NULL, 45),
(113, '2022-03-29 08:19:33', '2022-03-29 08:19:33', '2022-03-29 01:19:33', '2022-03-29 01:19:33', NULL, 45),
(114, '2022-03-29 08:19:37', '2022-03-29 08:19:38', '2022-03-29 01:19:37', '2022-03-29 01:19:38', NULL, 45),
(115, '2022-03-29 08:19:42', '2022-03-29 08:19:42', '2022-03-29 01:19:42', '2022-03-29 01:19:42', NULL, 45),
(116, '2022-03-29 08:20:01', '2022-03-29 08:21:12', '2022-03-29 01:20:01', '2022-03-29 01:21:12', NULL, 45),
(117, '2022-03-29 08:21:12', '2022-03-29 08:21:22', '2022-03-29 01:21:12', '2022-03-29 01:21:22', NULL, 45),
(118, '2022-03-29 09:01:51', '2022-03-29 09:03:10', '2022-03-29 02:01:51', '2022-03-29 02:03:10', NULL, 45),
(119, '2022-03-29 09:03:22', '2022-03-29 09:03:22', '2022-03-29 02:03:22', '2022-03-29 02:03:22', NULL, 45),
(120, '2022-03-29 09:03:26', '2022-03-29 09:03:26', '2022-03-29 02:03:26', '2022-03-29 02:03:26', NULL, 45),
(121, '2022-03-29 09:03:42', '2022-03-29 09:03:42', '2022-03-29 02:03:42', '2022-03-29 02:03:42', NULL, 45),
(122, '2022-03-29 09:09:00', '2022-03-29 09:09:01', '2022-03-29 02:09:00', '2022-03-29 02:09:01', NULL, 45),
(123, '2022-03-29 09:09:40', '2022-03-29 09:09:41', '2022-03-29 02:09:40', '2022-03-29 02:09:41', NULL, 45),
(124, '2022-03-29 09:10:22', '2022-03-29 09:10:35', '2022-03-29 02:10:22', '2022-03-29 02:10:35', NULL, 45),
(125, '2022-03-29 09:11:14', '2022-03-29 09:11:22', '2022-03-29 02:11:14', '2022-03-29 02:11:22', NULL, 45),
(126, '2022-03-29 09:12:49', '2022-03-29 09:17:39', '2022-03-29 02:12:49', '2022-03-29 02:17:39', NULL, 45),
(127, '2022-03-29 09:17:44', '2022-03-29 15:07:37', '2022-03-29 02:17:44', '2022-03-29 08:07:37', NULL, 45),
(128, '2022-03-29 15:07:51', '2022-03-29 15:07:55', '2022-03-29 08:07:51', '2022-03-29 08:07:55', NULL, 45),
(129, '2022-03-30 02:28:01', '2022-03-30 11:10:20', '2022-03-29 19:28:01', '2022-03-30 04:10:20', NULL, 45),
(130, '2022-03-30 11:10:25', '2022-03-30 14:15:50', '2022-03-30 04:10:25', '2022-03-30 07:15:50', NULL, 45),
(131, '2022-03-30 15:06:21', '2022-03-31 00:54:44', '2022-03-30 08:06:21', '2022-03-30 17:54:44', NULL, 46),
(132, '2022-03-30 15:34:05', '2022-03-31 00:00:22', '2022-03-30 08:34:05', '2022-03-30 17:00:22', NULL, 45),
(133, '2022-03-31 00:22:00', '2022-03-31 12:28:12', '2022-03-30 17:22:00', '2022-03-31 05:28:12', NULL, 45),
(134, '2022-03-31 10:08:10', '2022-03-31 10:44:08', '2022-03-31 03:08:10', '2022-03-31 03:44:08', NULL, 46),
(135, '2022-03-31 12:49:20', '2022-03-31 14:48:17', '2022-03-31 05:49:20', '2022-03-31 07:48:17', NULL, 46),
(136, '2022-03-31 14:53:22', '2022-03-31 15:08:38', '2022-03-31 07:53:22', '2022-03-31 08:08:38', NULL, 47),
(137, '2022-03-31 15:09:20', '2022-03-31 15:13:09', '2022-03-31 08:09:20', '2022-03-31 08:13:09', NULL, 47),
(138, '2022-03-31 15:13:32', '2022-03-31 15:14:45', '2022-03-31 08:13:32', '2022-03-31 08:14:45', NULL, 47),
(139, '2022-03-31 15:15:41', '2022-03-31 15:17:22', '2022-03-31 08:15:41', '2022-03-31 08:17:22', NULL, 47),
(140, '2022-03-31 15:18:02', '2022-03-31 16:18:31', '2022-03-31 08:18:02', '2022-03-31 09:18:31', NULL, 47),
(141, '2022-03-31 16:18:41', '2022-03-31 16:51:41', '2022-03-31 09:18:41', '2022-03-31 09:51:41', NULL, 47),
(142, '2022-03-31 17:01:26', '2022-03-31 17:09:57', '2022-03-31 10:01:26', '2022-03-31 10:09:57', NULL, 47),
(143, '2022-03-31 17:10:27', '2022-03-31 17:55:22', '2022-03-31 10:10:27', '2022-03-31 10:55:22', NULL, 47),
(144, '2022-03-31 17:56:03', '2022-03-31 18:05:30', '2022-03-31 10:56:03', '2022-03-31 11:05:30', NULL, 46),
(145, '2022-03-31 22:15:13', '2022-03-31 22:17:08', '2022-03-31 15:15:13', '2022-03-31 15:17:08', NULL, 46);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outlet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `jabatan`, `outlet`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UMMY', 'HRD & CS', 'Head Office', 'hrd@top.com', NULL, '$2y$10$Vr/mYRcIkhXVoBryt538Au/B/X64uDT91KtDJVrbIQc5IRp2IdPVS', NULL, '2022-03-28 07:31:02', '2022-03-28 07:49:36', NULL),
(2, 'ANDI SULO', 'Pegawai', 'Head Office', 'karyawan@top.com', NULL, '$2y$10$Vr/mYRcIkhXVoBryt538Au/B/X64uDT91KtDJVrbIQc5IRp2IdPVS', NULL, '2022-03-28 07:31:02', '2022-03-28 07:44:43', '2022-03-28 07:44:43'),
(3, 'DEWI SARTIKA', 'Admin Pajak & Accounting', 'Head Office', 'dewisartika@top.com', NULL, '$2y$10$Xw/URySJsw1u5xSrAUDVyeIyEVkd/Tvmephz1uRyFHgKyTonuLsDi', NULL, '2022-03-28 07:31:02', '2022-03-28 07:46:07', NULL),
(4, 'LANNY', 'Admin Penjualan', 'Head Office', 'lanny@top.com', NULL, '$2y$10$/GQPj/DKGkwlHETbn6HlFuBmEMIi1JsnB3H7053zWbJp6h3jEl91S', NULL, '2022-03-28 07:31:02', '2022-03-28 08:33:51', NULL),
(5, 'MAUDY', 'Sales Online', 'Head Office', 'maudy@top.com', NULL, '$2y$10$FekExk1vvkKqc3NVjfpvauwIDJMca9mPXiNEhTPkBsThdPBwzepGi', NULL, '2022-03-28 07:31:02', '2022-03-28 08:36:41', NULL),
(6, 'MEILIN', 'Manager Area', 'Head Office', 'meilin@top.com', NULL, '$2y$10$dgoCmPMnyQsJkIjeNDW5RuyuSAb7WhhoA.VhGKWDybxfOb6ivLmi6', NULL, '2022-03-28 07:31:02', '2022-03-28 08:38:47', NULL),
(7, 'SAHRIANI/SARI', 'Admin General', 'Head Office', 'sahriani@top.com', NULL, '$2y$10$tr6xaPj/4ULZb2/B4ePGkeLzbzyeQUZQY11QP/9Ua9dPRA7X7.ieG', NULL, '2022-03-28 07:31:02', '2022-03-28 08:47:39', NULL),
(8, 'MELI', 'Sales Online', 'Head Office', 'meli@top.com', NULL, '$2y$10$PD7B9eKRYswkCnb3nBLlKecSoKUXhrp8HQruP4en.BJKICB/s33h6', NULL, '2022-03-28 07:31:02', '2022-03-28 08:48:16', NULL),
(9, 'AMHIE', 'Admin Logistik', 'Head Office', 'amhie@top.com', NULL, '$2y$10$h/cDk.B7Q7Uf60PiAJUXoOuBinNNToy2ek3GjXLRvOuBVX7KsK52u', NULL, '2022-03-28 07:31:02', '2022-03-28 08:53:17', NULL),
(10, 'PAK RANDI', 'Manager Area', 'Head Office', 'randi@top.com', NULL, '$2y$10$.xrBSSgWRHrX2mNJbWDXyOAFmCIzOV4Y.mX4hjgF0kYWVUHBd0p.G', NULL, '2022-03-28 07:31:02', '2022-03-28 08:54:28', NULL),
(11, 'ERNI', 'Audit Internal', 'Head Office', 'erni@top.com', NULL, '$2y$10$ZZTJzEB8zY4mGEdVp0zEUuZV9G5i8MJrdxiNYhlCj/BpEeTyhKRu2', NULL, '2022-03-28 07:31:02', '2022-03-28 08:32:58', NULL),
(12, 'ANDI SULO', 'Design Creator', 'Head Office', 'andisulo@top.com', NULL, '$2y$10$MkSPw1hBclMqvkNKXgCr8OAQF7yXfmMVMG8hN8tUslBAdBFGsBMFm', NULL, '2022-03-28 07:40:57', '2022-03-28 07:44:25', NULL),
(13, 'RATU', 'Admin Penjualan', 'Head Office', 'ratu@top.com', NULL, '$2y$10$SZJgDlbjdWN3nnnkkv7SVe0ta81WPPdSQAeJkxiHsrjgCK1OUNN3S', NULL, '2022-03-28 08:57:53', '2022-03-28 08:57:53', NULL),
(14, 'ANTO', 'Frontliner', 'TSM', 'anto@top.com', NULL, '$2y$10$UJ5WB5vH7Id/EamxVq/Q/.MuNSie7ibGW0En/v9V6i092Bz5gnk3m', NULL, '2022-03-28 08:59:19', '2022-03-28 08:59:19', NULL),
(15, 'CINTIA', 'Frontliner', 'Apple Store', 'cintia@top.com', NULL, '$2y$10$PHpclBRTcxk0ZU0QV47IYuIJTXm8Y0cjH10NtMIBCZ0Vu1JlE3/ly', NULL, '2022-03-28 09:03:49', '2022-03-28 09:03:49', NULL),
(16, 'ILOK', 'Teknisi', 'Rappocini', 'ilok@top.com', NULL, '$2y$10$MMaUvAgtsdi0/OFwx8s48.t8z7rybpAGCmDL.R0tg3cfMvxm9T2zi', NULL, '2022-03-28 09:11:50', '2022-03-28 09:11:50', NULL),
(17, 'MUSDALIPHA / IPHA', 'SPV', 'Mall Panakkukang & Panakkukang Square', 'ipha@top.com', NULL, '$2y$10$qMc1/DV5d/cdWZWIbYweju7An/Z3RxFXVkBB86wqx81gj6989r2/K', NULL, '2022-03-28 09:12:55', '2022-03-28 09:12:55', NULL),
(18, 'PANDU', 'SPV', 'Bulusaraung', 'pandu@top.com', NULL, '$2y$10$gbSyKUZTfl3JvrpU72ABwOgU/gwsAVRl5ftQ58Te2IAkTkAYzFJ0.', NULL, '2022-03-28 09:19:26', '2022-03-28 09:19:26', NULL),
(19, 'REZA', 'Teknisi', 'Top Asia', 'reza@top.com', NULL, '$2y$10$qlu.zTUU2N8I7WFLDJKv1.voUJnKQfBMhIZV9kwlszU7u2WgfuNti', NULL, '2022-03-28 09:23:41', '2022-03-28 09:23:41', NULL),
(20, 'ROSDIANA IRWAN', 'Frontliner', 'Rappocini', 'rosdiana@top.com', NULL, '$2y$10$4Ms5ORH3wGtDo2NAw9WabOwSyxmINzcmIPdx4i2kvuv.9A2a7Cteq', NULL, '2022-03-28 09:24:40', '2022-03-28 09:24:40', NULL),
(21, 'SARINA', 'SPV', 'Grand Grup & Rappocini', 'sarina@top.com', NULL, '$2y$10$EPPuGDZFciAWiEkqNOqA6.O6LMnGh446QFeEuTj/jGVmwuXQhXJNu', NULL, '2022-03-28 09:26:21', '2022-03-28 09:26:21', NULL),
(22, 'SEPTIA DWI MANDA', 'Frontliner', 'Top Asia', 'septia@top.com', NULL, '$2y$10$G8j5nJCLFHbHaYVOrq7spOGXuqu0l2UmuR/0MjjyNN190GxjJ2qpS', NULL, '2022-03-28 09:27:29', '2022-03-28 09:27:29', NULL),
(23, 'SIAMA', 'Frontliner', 'Top Asia', 'siama@top.com', NULL, '$2y$10$hG4l0sHauv3ZalchKOp7XumhK75HvfQgmIw41l6k7cT7yBv1CYxXq', NULL, '2022-03-28 09:30:06', '2022-03-28 09:30:06', NULL),
(24, 'IBU EVI', 'SPV', 'YOU & Nail Art', 'evi@top.com', NULL, '$2y$10$V3Ce50AdrbXhgJu5FPuR0.0/gSP1n/7DHfC0pYom1zGCoNRl3vkja', NULL, '2022-03-28 10:05:43', '2022-03-28 10:05:43', NULL),
(25, 'RESTY', 'Frontliner', 'Nail Art Top Asia', 'resty@top.com', NULL, '$2y$10$49HhARV8ckGXdwJGQEIKRerdAyhyM4.m76i8btkF.ouOD4rOQc8xe', NULL, '2022-03-28 10:16:00', '2022-03-28 10:16:00', NULL),
(26, 'NUR HIKMAH', 'Frontliner', 'Nail Art Maros', 'hikmah@top.com', NULL, '$2y$10$XbwW7KvcT3TFbW4DBYLS9.ksD2trqttsE1OUgLc1dQ4g06ENGxG.S', NULL, '2022-03-28 10:17:13', '2022-03-28 10:17:13', NULL),
(27, 'FADILLAH', 'Frontliner', 'Nail Art Mall Panakukkang', 'fadillah@top.com', NULL, '$2y$10$fdgR4hmNuqOySr7tY2yBkOdv/SxXhCpyB442vUqR.JY1/kmNBnlBm', NULL, '2022-03-28 01:36:44', '2022-03-28 01:36:44', NULL),
(28, 'JIHAN', 'Frontliner', 'Panakukkang Square', 'jihan@top.com', NULL, '$2y$10$jlT7AYBoQ3c5Jv9NgOFGKeCdcZMRVU8vd91miR9Rb.DzqQ4lKjnCy', NULL, '2022-03-28 01:37:47', '2022-03-28 01:37:47', NULL),
(29, 'M. RAHMATULLAH', 'Video Creator', 'Bulusaraung', 'rahmatullah@top.com', NULL, '$2y$10$CyJlovFN0xevHCWXDcLkJemdY30JpczBDALXXzLwlBWTR4aF4bs16', NULL, '2022-03-28 01:39:44', '2022-03-28 01:39:44', NULL),
(30, 'ASTRI', 'Frontliner', 'Nail Art Maros', 'astri@top.com', NULL, '$2y$10$9FEdhil0IVJ.rtyB6/V..u33DIzKeOaPzGMIFnahTTd96ejakEkOe', NULL, '2022-03-28 01:50:00', '2022-03-28 01:50:00', NULL),
(31, 'RINI TRIANI', 'Frontliner', 'Nail Art Top Asia', 'rini@top.com', NULL, '$2y$10$GQnKfmh5P1mwxww9F1d0iut6JWBQnLtPnwHpnH3HNwsFqFDtzZtlO', NULL, '2022-03-28 01:53:44', '2022-03-28 01:53:44', NULL),
(32, 'MAYA', 'Frontliner', 'Mall Panakukkang', 'maya@top.com', NULL, '$2y$10$rospF2JxAR0uR/ItogFxK.Vzk3iqL3U.YtvbmQqanqPYKcF0ga2AC', NULL, '2022-03-28 01:58:20', '2022-03-28 01:58:20', NULL),
(33, 'ZUL', 'Frontliner', 'Grand Toserba', 'zul@top.com', NULL, '$2y$10$BE0BQ51rHLExQE3gsY6hS.4HfZFW18NaBU/ZOHXoBs9xf9/gAPsg6', NULL, '2022-03-28 01:59:35', '2022-03-28 01:59:35', NULL),
(34, 'KIKI', 'Frontliner', 'Indomode', 'kiki@top.com', NULL, '$2y$10$qircRLlrfW09E5/0u5BcH.ob/cRI/FEkxUu1KbvLDox.mekV4eZkW', NULL, '2022-03-28 02:01:36', '2022-03-28 02:01:36', NULL),
(35, 'VIVI', 'Frontliner', 'Nail Art Top Asia', 'vivi@top.com', NULL, '$2y$10$KkTSsCFXlKx8mLn.KLHXpeAy0Z/GobhjuW0p07kbwzVZm4Xdnfzu6', NULL, '2022-03-28 02:05:09', '2022-03-28 02:05:09', NULL),
(36, 'IRA', 'Frontliner', 'Nail Art Mall Panakukkang', 'ira@top.com', NULL, '$2y$10$eKtgyIqVt9aqcb1EmYSWLOa.5AZKji4yvSOwtsmdW8WXlUSxKKqYS', NULL, '2022-03-28 02:05:45', '2022-03-28 02:05:45', NULL),
(37, 'PAK IHSAN', 'SPV', 'Top Asia', 'ihsan@top.com', NULL, '$2y$10$qRmGn92saDQnF.tDvXGzguOf.ONiTlhrC9oUDcwN56zqFyLIdW8L.', NULL, '2022-03-28 02:06:49', '2022-03-28 02:06:49', NULL),
(38, 'HERA', 'Frontliner', 'Grand Mode', 'hera@top.com', NULL, '$2y$10$hAWtHKszKvP3WUdcRdfSou3.v/Cq/eYZWy1g88hoVWWEdO8QNOThe', NULL, '2022-03-28 02:07:32', '2022-03-28 02:07:32', NULL),
(39, 'FIRA', 'Frontliner', 'Nail Art Mall Panakukkang', 'fira@top.com', NULL, '$2y$10$fcfE3/2tRr3xXUFiN9nUBuw2uiFDmvyGrGOus.qdgcObqIwgDNqiq', NULL, '2022-03-28 02:09:20', '2022-03-28 02:09:20', NULL),
(40, 'KASMIR/JNT', 'J&T', 'Head Office', 'kasmir@top.com', NULL, '$2y$10$FJ55G2Ku/P8nVag6YhAqJukDFkEhBdi97mpj1a9Qd0RQZgTIUB/6S', NULL, '2022-03-28 02:24:58', '2022-03-28 02:24:58', NULL),
(41, 'ASRUL/JNT', 'J&T', 'Head Office', 'asruljnt@top.com', NULL, '$2y$10$RmbtRo8C5atY4lN1BpxIOeIHOmM//WchOh3eXX5qw1fbeDzXsss2K', NULL, '2022-03-28 02:26:02', '2022-03-28 02:26:02', NULL),
(42, 'DEDI', 'Video Creator', 'Rappocini', 'dedi@top.com', NULL, '$2y$10$7O8DemZcrx31Ik89HPA7Su1mu8iEN6jZ/HoT3/nxAtly25f00ShIC', NULL, '2022-03-28 02:27:08', '2022-03-28 02:27:08', NULL),
(43, 'ASRUL', 'IT & Teknisi', 'Top Asia', 'asrul@top.com', NULL, '$2y$10$aJYexdAOH4/gOGYGA0IM3eiM9YfUGt1EgBwAGOpvBp6.3aY2PuBWa', NULL, '2022-03-28 02:28:54', '2022-03-28 02:28:54', NULL),
(44, 'ADEN', 'Frontliner', 'Apple Store', 'aden@top.com', NULL, '$2y$10$Ho1Gy/NYlW3aSO9oaF7MJuLrbtM7Jm.Cc1chDffI6c2fhyHeaBoCq', NULL, '2022-03-28 02:29:59', '2022-03-28 02:29:59', NULL),
(45, 'MASRUR', 'Admin Sales', 'Head Office', 'masrur@top.com', NULL, '$2y$10$t7jADqn3XoMkmbWWMWvAKuFB8jqVrxBgP0FOAwExHD3.URzGpH6xi', NULL, '2022-03-28 02:30:35', '2022-03-28 02:30:35', NULL),
(46, 'HADID', 'IT & Programmer', 'Head Office', 'hadid@top.com', NULL, '$2y$10$KNdnPg16QF0WQBBZSR2K7OpzmReObJ2HENvYEPSy4Th64K70.7lbG', NULL, '2022-03-28 02:31:36', '2022-03-30 08:05:37', NULL),
(47, 'UMMY', 'HRD & CS', 'Head Office', 'ummy@top.com', NULL, '$2y$10$LekaE.nDf2.Mx0FwN52Qre0UKEIgJ68DNS2.vXaGpYDXKabLDPTgq', NULL, '2022-03-29 19:21:01', '2022-03-29 19:21:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `izins`
--
ALTER TABLE `izins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_1028284` (`role_id`),
  ADD KEY `permission_id_fk_1028284` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_1028293` (`user_id`),
  ADD KEY `role_id_fk_1028293` (`role_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk_1028320` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `izins`
--
ALTER TABLE `izins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_1028284` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_1028284` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_1028293` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_1028293` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD CONSTRAINT `user_fk_1028320` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
