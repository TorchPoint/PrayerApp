-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2021 at 01:04 PM
-- Server version: 5.7.36
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serverap_prayer`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reciever_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calls`
--

INSERT INTO `calls` (`id`, `sender_id`, `group_id`, `reciever_id`, `channel_name`, `status`, `created_at`, `updated_at`) VALUES
(4, 47, NULL, 48, 'prayer_app+km1633589406870', NULL, NULL, NULL),
(5, 47, NULL, 48, 'prayer_app+km1633589522155', NULL, NULL, NULL),
(6, 47, NULL, 48, 'prayer_app+km1633589864319', NULL, NULL, NULL),
(7, 47, NULL, 48, 'prayer_app+km1633590007674', NULL, NULL, NULL),
(8, 47, NULL, 48, 'prayer_app+km1633611614581', NULL, NULL, NULL),
(9, 48, NULL, 47, 'prayer_app+km1633611819497', NULL, NULL, NULL),
(10, 48, NULL, 47, 'prayer_app+km1633612005970', NULL, NULL, NULL),
(11, 47, NULL, 48, 'prayer_app+km1633612072497', NULL, NULL, NULL),
(12, 47, NULL, 48, 'prayer_app+km1633612132416', NULL, NULL, NULL),
(13, 47, NULL, 48, 'prayer_app+km1633612150540', NULL, NULL, NULL),
(14, 47, NULL, 48, 'prayer_app+km1633612302194', NULL, NULL, NULL),
(15, 47, NULL, 48, 'prayer_app+km1633612350104', NULL, NULL, NULL),
(16, 48, NULL, 47, 'prayer_app+km1633612570591', NULL, NULL, NULL),
(17, 48, NULL, 47, 'prayer_app+km1633612820771', NULL, NULL, NULL),
(18, 48, NULL, 47, 'prayer_app+km1633613079676', NULL, NULL, NULL),
(19, 48, NULL, 47, 'prayer_app+km1633613169478', NULL, NULL, NULL),
(20, 48, NULL, 47, 'prayer_app+km1633613182433', NULL, NULL, NULL),
(21, 48, NULL, 47, 'prayer_app+km1633613223233', NULL, NULL, NULL),
(22, 48, NULL, 47, 'prayer_app+km1633613237078', NULL, NULL, NULL),
(23, 48, NULL, 47, 'prayer_app+km1633613263084', NULL, NULL, NULL),
(24, 47, NULL, 48, 'prayer_app+km1633613263538', NULL, NULL, NULL),
(25, 48, NULL, 47, 'prayer_app+km1633613277162', NULL, NULL, NULL),
(26, 48, NULL, 47, 'prayer_app+km1633613290497', NULL, NULL, NULL),
(27, 48, NULL, 47, 'prayer_app+km1633613306087', NULL, NULL, NULL),
(28, 48, NULL, 47, 'prayer_app+km1633613335049', NULL, NULL, NULL),
(29, 48, NULL, 47, 'prayer_app+km1633613352800', NULL, NULL, NULL),
(30, 48, NULL, 47, 'prayer_app+km1633613366485', NULL, NULL, NULL),
(31, 48, NULL, 47, 'prayer_app+km1633613376620', NULL, NULL, NULL),
(32, 48, NULL, 47, 'prayer_app+km1633613383895', NULL, NULL, NULL),
(33, 48, NULL, 47, 'prayer_app+km1633613435906', NULL, NULL, NULL),
(34, 48, NULL, 47, 'prayer_app+km1633613498706', NULL, NULL, NULL),
(35, 48, NULL, 47, 'prayer_app+km1633613524284', NULL, NULL, NULL),
(36, 48, NULL, 47, 'prayer_app+km1633613546449', NULL, NULL, NULL),
(37, 48, NULL, 47, 'prayer_app+km1633613563181', NULL, NULL, NULL),
(38, 48, NULL, 47, 'prayer_app+km1633613582530', NULL, NULL, NULL),
(39, 48, NULL, 47, 'prayer_app+km1633613598661', NULL, NULL, NULL),
(40, 47, NULL, 48, 'prayer_app+km1633613626509', NULL, NULL, NULL),
(41, 47, NULL, 48, 'prayer_app+km1633613638884', NULL, NULL, NULL),
(42, 47, NULL, 48, 'prayer_app+km1633613655496', NULL, NULL, NULL),
(43, 48, NULL, 47, 'prayer_app+km1633613679008', NULL, NULL, NULL),
(44, 47, NULL, 48, 'prayer_app+km1633614423072', NULL, NULL, NULL),
(45, 47, NULL, 48, 'prayer_app+km1633614438014', NULL, NULL, NULL),
(46, 47, NULL, 48, 'prayer_app+km1633614550729', NULL, NULL, NULL),
(47, 47, NULL, 48, 'prayer_app+km1633614561074', NULL, NULL, NULL),
(48, 47, NULL, 48, 'prayer_app+km1633614584225', NULL, NULL, NULL),
(49, 47, NULL, 48, 'prayer_app+km1633614599693', NULL, NULL, NULL),
(50, 47, NULL, 48, 'prayer_app+km1633614638860', NULL, NULL, NULL),
(51, 47, NULL, NULL, 'prayer_app+km1633615052706', NULL, NULL, NULL),
(52, 47, NULL, NULL, 'prayer_app+km1633615153229', NULL, NULL, NULL),
(53, 47, NULL, NULL, 'prayer_app+km1633615262007', NULL, NULL, NULL),
(54, 47, NULL, NULL, 'prayer_app+km1633615276666', NULL, NULL, NULL),
(55, 47, NULL, 48, 'prayer_app+km1633615628802', NULL, NULL, NULL),
(56, 47, NULL, 48, 'prayer_app+km1633615762684', NULL, NULL, NULL),
(57, 47, NULL, 48, 'prayer_app+km1633615780717', NULL, NULL, NULL),
(58, 47, NULL, 48, 'prayer_app+km1633615797486', NULL, NULL, NULL),
(59, 47, NULL, 48, 'prayer_app+km1633615809381', NULL, NULL, NULL),
(60, 47, NULL, 48, 'prayer_app+km1633615831602', NULL, NULL, NULL),
(61, 49, NULL, 48, 'prayer_app+km1633616948774', NULL, NULL, NULL),
(62, 49, NULL, 47, 'prayer_app+km1633617012265', NULL, NULL, NULL),
(63, 49, NULL, 47, 'prayer_app+km1633617031514', NULL, NULL, NULL),
(64, 47, NULL, 49, 'prayer_app+km1633617048958', NULL, NULL, NULL),
(65, 49, NULL, 47, 'prayer_app+km1633617064705', NULL, NULL, NULL),
(66, 49, NULL, 47, 'prayer_app+km1633617081076', NULL, NULL, NULL),
(67, 47, NULL, 49, 'prayer_app+km1633617105121', NULL, NULL, NULL),
(68, 47, NULL, 49, 'prayer_app+km1633617146496', NULL, NULL, NULL),
(69, 49, NULL, 47, 'prayer_app+km1633617164226', NULL, NULL, NULL),
(70, 49, NULL, 47, 'prayer_app+km1633617173749', NULL, NULL, NULL),
(71, 47, NULL, 49, 'prayer_app+km1633617413564', NULL, NULL, NULL),
(72, 47, NULL, NULL, 'prayer_app+km1633618227721', NULL, NULL, NULL),
(73, 49, NULL, 47, 'prayer_app+km1633673069223', NULL, NULL, NULL),
(74, 49, NULL, 47, 'prayer_app+km1633673260899', NULL, NULL, NULL),
(75, 49, NULL, 47, 'prayer_app+km1633673304916', NULL, NULL, NULL),
(76, 49, NULL, 47, 'prayer_app+km1633673326915', NULL, NULL, NULL),
(77, 49, NULL, 47, 'prayer_app+km1633673355909', NULL, NULL, NULL),
(78, 49, NULL, 47, 'prayer_app+km1633673397996', NULL, NULL, NULL),
(79, 49, NULL, 47, 'prayer_app+km1633673411301', NULL, NULL, NULL),
(80, 49, NULL, 47, 'prayer_app+km1633673767699', NULL, NULL, NULL),
(81, 49, NULL, 47, 'prayer_app+km1633673802725', NULL, NULL, NULL),
(82, 49, NULL, 47, 'prayer_app+km1633674058212', NULL, NULL, NULL),
(83, 49, NULL, 47, 'prayer_app+km1633674138972', NULL, NULL, NULL),
(84, 49, NULL, 47, 'prayer_app+km1633674159552', NULL, NULL, NULL),
(85, 49, NULL, 47, 'prayer_app+km1633674203467', NULL, NULL, NULL),
(86, 49, NULL, 47, 'prayer_app+km1633674296053', NULL, NULL, NULL),
(87, 47, NULL, 49, 'prayer_app+km1633674602554', NULL, NULL, NULL),
(88, 47, NULL, 49, 'prayer_app+km1633674621698', NULL, NULL, NULL),
(89, 47, NULL, 49, 'prayer_app+km1633674700453', NULL, NULL, NULL),
(90, 47, NULL, 49, 'prayer_app+km1633674813000', NULL, NULL, NULL),
(91, 47, NULL, 49, 'prayer_app+km1633674861334', NULL, NULL, NULL),
(92, 47, NULL, 49, 'prayer_app+km1633674905571', NULL, NULL, NULL),
(93, 47, NULL, 49, 'prayer_app+km1633674932153', NULL, NULL, NULL),
(94, 47, NULL, 49, 'prayer_app+km1633675265257', NULL, NULL, NULL),
(95, 47, NULL, 49, 'prayer_app+km1633675436457', NULL, NULL, NULL),
(96, 47, NULL, 49, 'prayer_app+km1633675543748', NULL, NULL, NULL),
(97, 47, NULL, 49, 'prayer_app+km1633675676076', NULL, NULL, NULL),
(98, 47, NULL, 49, 'prayer_app+km1633675692598', NULL, NULL, NULL),
(99, 47, NULL, 49, 'prayer_app+km1633675763543', NULL, NULL, NULL),
(100, 47, NULL, 49, 'prayer_app+km1633675779175', NULL, NULL, NULL),
(101, 47, NULL, 49, 'prayer_app+km1633675804849', NULL, NULL, NULL),
(102, 47, NULL, 49, 'prayer_app+km1633675952412', NULL, NULL, NULL),
(103, 47, NULL, 49, 'prayer_app+km1633675983895', NULL, NULL, NULL),
(104, 47, NULL, 49, 'prayer_app+km1633676124362', NULL, NULL, NULL),
(105, 47, NULL, 49, 'prayer_app+km1633676258016', NULL, NULL, NULL),
(106, 47, NULL, 49, 'prayer_app+km1633676278196', NULL, NULL, NULL),
(107, 47, NULL, 49, 'prayer_app+km1633676311075', NULL, NULL, NULL),
(108, 47, NULL, 49, 'prayer_app+km1633676469918', NULL, NULL, NULL),
(109, 47, NULL, 49, 'prayer_app+km1633677231459', NULL, NULL, NULL),
(110, 47, NULL, 49, 'prayer_app+km1633677243705', NULL, NULL, NULL),
(111, 47, NULL, 49, 'prayer_app+km1633677255589', NULL, NULL, NULL),
(112, 47, NULL, 49, 'prayer_app+km1633677400765', NULL, NULL, NULL),
(113, 47, NULL, 49, 'prayer_app+km1633677546660', NULL, NULL, NULL),
(114, 49, NULL, 47, 'prayer_app+km1633677704697', NULL, NULL, NULL),
(115, 49, NULL, 47, 'prayer_app+km1633678026292', NULL, NULL, NULL),
(116, 49, NULL, 47, 'prayer_app+km1633678114758', NULL, NULL, NULL),
(117, 47, NULL, 49, 'prayer_app+km1633678281953', NULL, NULL, NULL),
(118, 47, NULL, 49, 'prayer_app+km1633678297811', NULL, NULL, NULL),
(119, 49, NULL, 47, 'prayer_app+km1633678364003', NULL, NULL, NULL),
(120, 49, NULL, 47, 'prayer_app+km1633678422377', NULL, NULL, NULL),
(121, 49, NULL, 47, 'prayer_app+km1633678484823', NULL, NULL, NULL),
(122, 47, NULL, 49, 'prayer_app+km1633678879119', NULL, NULL, NULL),
(123, 49, NULL, 47, 'prayer_app+km1633678931020', NULL, NULL, NULL),
(124, 47, NULL, 49, 'prayer_app+km1633678991604', NULL, NULL, NULL),
(125, 49, NULL, 47, 'prayer_app+km1633679029629', NULL, NULL, NULL),
(126, 49, NULL, 47, 'prayer_app+km1633679049556', NULL, NULL, NULL),
(127, 47, NULL, 49, 'prayer_app+km1633679349602', NULL, NULL, NULL),
(128, 47, NULL, 49, 'prayer_app+km1633679377839', NULL, NULL, NULL),
(129, 47, NULL, 49, 'prayer_app+km1633679428364', NULL, NULL, NULL),
(130, 51, NULL, 49, 'prayer_app+km1633688386872', NULL, NULL, NULL),
(131, 49, NULL, 51, 'prayer_app+km1633688418177', NULL, NULL, NULL),
(132, 49, NULL, 51, 'prayer_app+km1633688441023', NULL, NULL, NULL),
(133, 51, NULL, 56, 'prayer_app+km1633953015703', NULL, NULL, NULL),
(134, 56, NULL, 51, 'prayer_app+km1633953030847', NULL, NULL, NULL),
(135, 56, NULL, 51, 'prayer_app+km1633953041710', NULL, NULL, NULL),
(136, 51, NULL, 56, 'prayer_app+km1633953049968', NULL, NULL, NULL),
(137, 56, NULL, 51, 'prayer_app+km1633953067123', NULL, NULL, NULL),
(138, 51, NULL, 56, 'prayer_app+km1633953077821', NULL, NULL, NULL),
(139, 56, NULL, 65, 'prayer_app+km1634124212966', NULL, NULL, NULL),
(140, 56, NULL, 65, 'prayer_app+km1634124237481', NULL, NULL, NULL),
(141, 56, NULL, 65, 'prayer_app+km1634124257855', NULL, NULL, NULL),
(142, 56, NULL, NULL, 'prayer_app+km1634124387264', NULL, NULL, NULL),
(143, 51, NULL, 65, 'prayer_app+km1634126499765', NULL, NULL, NULL),
(144, 51, NULL, 65, 'prayer_app+km1634126530808', NULL, NULL, NULL),
(145, 51, NULL, 65, 'prayer_app+km1634126549057', NULL, NULL, NULL),
(146, 51, NULL, 65, 'prayer_app+km1634126592550', NULL, NULL, NULL),
(147, 51, NULL, 65, 'prayer_app+km1634126644954', NULL, NULL, NULL),
(148, 51, NULL, 65, 'prayer_app+km1634126663095', NULL, NULL, NULL),
(149, 54, NULL, 48, 'prayer_app+km1634127111114', NULL, NULL, NULL),
(150, 54, NULL, 48, 'prayer_app+km1634127256515', NULL, NULL, NULL),
(151, 51, NULL, 58, 'prayer_app+km1634127453770', NULL, NULL, NULL),
(152, 51, NULL, 58, 'prayer_app+km1634127470885', NULL, NULL, NULL),
(153, 51, NULL, 58, 'prayer_app+km1634127494320', NULL, NULL, NULL),
(154, 51, NULL, 58, 'prayer_app+km1634127510653', NULL, NULL, NULL),
(155, 51, NULL, 58, 'prayer_app+km1634127555548', NULL, NULL, NULL),
(156, 51, NULL, 58, 'prayer_app+km1634127569356', NULL, NULL, NULL),
(157, 51, NULL, 58, 'prayer_app+km1634127589657', NULL, NULL, NULL),
(158, 51, NULL, 58, 'prayer_app+km1634127599343', NULL, NULL, NULL),
(159, 58, NULL, 51, 'prayer_app+km1634127634657', NULL, NULL, NULL),
(160, 58, NULL, 51, 'prayer_app+km1634127650426', NULL, NULL, NULL),
(161, 58, NULL, 51, 'prayer_app+km1634127732704', NULL, NULL, NULL),
(162, 58, NULL, 51, 'prayer_app+km1634127769272', NULL, NULL, NULL),
(163, 58, NULL, 51, 'prayer_app+km1634127812001', NULL, NULL, NULL),
(164, 58, NULL, 51, 'prayer_app+km1634127872579', NULL, NULL, NULL),
(165, 58, NULL, 51, 'prayer_app+km1634128001295', NULL, NULL, NULL),
(166, 58, NULL, 51, 'prayer_app+km1634128088422', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `call_users`
--

CREATE TABLE `call_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `joiner_id` bigint(20) UNSIGNED NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_status` enum('joined','left') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `call_users`
--

INSERT INTO `call_users` (`id`, `joiner_id`, `channel`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 47, 'prayer_app+km1633589406870', 'left', NULL, NULL),
(2, 47, 'prayer_app+km1633589522155', 'joined', NULL, NULL),
(3, 56, 'prayer_app+km1633589522155', 'joined', NULL, NULL),
(4, 47, 'prayer_app+km1633611614581', 'joined', NULL, NULL),
(5, 48, 'prayer_app+km1633611819497', 'joined', NULL, NULL),
(6, 48, 'prayer_app+km1633612005970', 'joined', NULL, NULL),
(7, 47, 'prayer_app+km1633612072497', 'joined', NULL, NULL),
(8, 47, 'prayer_app+km1633612132416', 'joined', NULL, NULL),
(9, 47, 'prayer_app+km1633612150540', 'joined', NULL, NULL),
(10, 47, 'prayer_app+km1633612302194', 'joined', NULL, NULL),
(11, 47, 'prayer_app+km1633612350104', 'joined', NULL, NULL),
(12, 48, 'prayer_app+km1633612570591', 'joined', NULL, NULL),
(13, 48, 'prayer_app+km1633612820771', 'joined', NULL, NULL),
(14, 48, 'prayer_app+km1633613079676', 'left', NULL, NULL),
(15, 48, 'prayer_app+km1633613169478', 'left', NULL, NULL),
(16, 48, 'prayer_app+km1633613182433', 'left', NULL, NULL),
(17, 48, 'prayer_app+km1633613223233', 'left', NULL, NULL),
(18, 48, 'prayer_app+km1633613237078', 'left', NULL, NULL),
(19, 48, 'prayer_app+km1633613263084', 'left', NULL, NULL),
(20, 47, 'prayer_app+km1633613263538', 'left', NULL, NULL),
(21, 48, 'prayer_app+km1633613277162', 'left', NULL, NULL),
(22, 48, 'prayer_app+km1633613290497', 'joined', NULL, NULL),
(23, 48, 'prayer_app+km1633613306087', 'left', NULL, NULL),
(24, 48, 'prayer_app+km1633613335049', 'joined', NULL, NULL),
(25, 48, 'prayer_app+km1633613352800', 'left', NULL, NULL),
(26, 48, 'prayer_app+km1633613366485', 'left', NULL, NULL),
(27, 48, 'prayer_app+km1633613376620', 'left', NULL, NULL),
(28, 48, 'prayer_app+km1633613383895', 'joined', NULL, NULL),
(29, 48, 'prayer_app+km1633613435906', 'joined', NULL, NULL),
(30, 48, 'prayer_app+km1633613498706', 'left', NULL, NULL),
(31, 48, 'prayer_app+km1633613524284', 'left', NULL, NULL),
(32, 48, 'prayer_app+km1633613546449', 'joined', NULL, NULL),
(33, 48, 'prayer_app+km1633613563181', 'joined', NULL, NULL),
(34, 48, 'prayer_app+km1633613582530', 'left', NULL, NULL),
(35, 48, 'prayer_app+km1633613598661', 'left', NULL, NULL),
(36, 47, 'prayer_app+km1633613626509', 'left', NULL, NULL),
(37, 47, 'prayer_app+km1633613638884', 'left', NULL, NULL),
(38, 47, 'prayer_app+km1633613655496', 'left', NULL, NULL),
(39, 48, 'prayer_app+km1633613679008', 'left', NULL, NULL),
(40, 47, 'prayer_app+km1633614423072', 'left', NULL, NULL),
(41, 47, 'prayer_app+km1633614438014', 'left', NULL, NULL),
(42, 47, 'prayer_app+km1633614550729', 'left', NULL, NULL),
(43, 47, 'prayer_app+km1633614561074', 'left', NULL, NULL),
(44, 47, 'prayer_app+km1633614584225', 'joined', NULL, NULL),
(45, 47, 'prayer_app+km1633614599693', 'left', NULL, NULL),
(46, 47, 'prayer_app+km1633614638860', 'left', NULL, NULL),
(47, 47, 'prayer_app+km1633615052706', 'joined', NULL, NULL),
(48, 47, 'prayer_app+km1633615153229', 'joined', NULL, NULL),
(49, 47, 'prayer_app+km1633615262007', 'left', NULL, NULL),
(50, 47, 'prayer_app+km1633615276666', 'joined', NULL, NULL),
(51, 47, 'prayer_app+km1633615628802', 'left', NULL, NULL),
(52, 47, 'prayer_app+km1633615762684', 'left', NULL, NULL),
(53, 47, 'prayer_app+km1633615780717', 'left', NULL, NULL),
(54, 47, 'prayer_app+km1633615797486', 'left', NULL, NULL),
(55, 47, 'prayer_app+km1633615809381', 'left', NULL, NULL),
(56, 47, 'prayer_app+km1633615831602', 'left', NULL, NULL),
(57, 49, 'prayer_app+km1633616948774', 'left', NULL, NULL),
(58, 49, 'prayer_app+km1633617012265', 'left', NULL, NULL),
(59, 49, 'prayer_app+km1633617031514', 'left', NULL, NULL),
(60, 47, 'prayer_app+km1633617048958', 'left', NULL, NULL),
(61, 49, 'prayer_app+km1633617064705', 'left', NULL, NULL),
(62, 49, 'prayer_app+km1633617081076', 'left', NULL, NULL),
(63, 47, 'prayer_app+km1633617105121', 'left', NULL, NULL),
(64, 47, 'prayer_app+km1633617146496', 'left', NULL, NULL),
(65, 49, 'prayer_app+km1633617164226', 'left', NULL, NULL),
(66, 49, 'prayer_app+km1633617173749', 'left', NULL, NULL),
(67, 47, 'prayer_app+km1633617413564', 'left', NULL, NULL),
(68, 47, 'prayer_app+km1633618227721', 'joined', NULL, NULL),
(69, 49, 'prayer_app+km1633673069223', 'left', NULL, NULL),
(70, 49, 'prayer_app+km1633673260899', 'left', NULL, NULL),
(71, 49, 'prayer_app+km1633673304916', 'left', NULL, NULL),
(72, 49, 'prayer_app+km1633673326915', 'left', NULL, NULL),
(73, 49, 'prayer_app+km1633673355909', 'left', NULL, NULL),
(74, 49, 'prayer_app+km1633673397996', 'left', NULL, NULL),
(75, 49, 'prayer_app+km1633673411301', 'left', NULL, NULL),
(76, 49, 'prayer_app+km1633673767699', 'left', NULL, NULL),
(77, 49, 'prayer_app+km1633673802725', 'left', NULL, NULL),
(78, 49, 'prayer_app+km1633674058212', 'joined', NULL, NULL),
(79, 49, 'prayer_app+km1633674138972', 'joined', NULL, NULL),
(80, 49, 'prayer_app+km1633674159552', 'joined', NULL, NULL),
(81, 49, 'prayer_app+km1633674203467', 'joined', NULL, NULL),
(82, 49, 'prayer_app+km1633674296053', 'left', NULL, NULL),
(83, 47, 'prayer_app+km1633674602554', 'left', NULL, NULL),
(84, 47, 'prayer_app+km1633674621698', 'left', NULL, NULL),
(85, 47, 'prayer_app+km1633674700453', 'left', NULL, NULL),
(86, 47, 'prayer_app+km1633674813000', 'left', NULL, NULL),
(87, 47, 'prayer_app+km1633674861334', 'left', NULL, NULL),
(88, 47, 'prayer_app+km1633674905571', 'left', NULL, NULL),
(89, 47, 'prayer_app+km1633674932153', 'left', NULL, NULL),
(90, 47, 'prayer_app+km1633675265257', 'left', NULL, NULL),
(91, 47, 'prayer_app+km1633675436457', 'left', NULL, NULL),
(92, 47, 'prayer_app+km1633675543748', 'left', NULL, NULL),
(93, 47, 'prayer_app+km1633675676076', 'left', NULL, NULL),
(94, 47, 'prayer_app+km1633675692598', 'left', NULL, NULL),
(95, 47, 'prayer_app+km1633675763543', 'left', NULL, NULL),
(96, 47, 'prayer_app+km1633675779175', 'left', NULL, NULL),
(97, 47, 'prayer_app+km1633675804849', 'left', NULL, NULL),
(98, 47, 'prayer_app+km1633675952412', 'left', NULL, NULL),
(99, 47, 'prayer_app+km1633675983895', 'left', NULL, NULL),
(100, 47, 'prayer_app+km1633676124362', 'left', NULL, NULL),
(101, 47, 'prayer_app+km1633676258016', 'left', NULL, NULL),
(102, 47, 'prayer_app+km1633676278196', 'left', NULL, NULL),
(103, 47, 'prayer_app+km1633676311075', 'left', NULL, NULL),
(104, 47, 'prayer_app+km1633676469918', 'left', NULL, NULL),
(105, 47, 'prayer_app+km1633677231459', 'left', NULL, NULL),
(106, 47, 'prayer_app+km1633677243705', 'left', NULL, NULL),
(107, 47, 'prayer_app+km1633677255589', 'left', NULL, NULL),
(108, 47, 'prayer_app+km1633677400765', 'left', NULL, NULL),
(109, 47, 'prayer_app+km1633677546660', 'left', NULL, NULL),
(110, 49, 'prayer_app+km1633677704697', 'left', NULL, NULL),
(111, 49, 'prayer_app+km1633678026292', 'left', NULL, NULL),
(112, 49, 'prayer_app+km1633678114758', 'left', NULL, NULL),
(113, 47, 'prayer_app+km1633678281953', 'left', NULL, NULL),
(114, 47, 'prayer_app+km1633678297811', 'left', NULL, NULL),
(115, 49, 'prayer_app+km1633678364003', 'left', NULL, NULL),
(116, 49, 'prayer_app+km1633678422377', 'left', NULL, NULL),
(117, 49, 'prayer_app+km1633678484823', 'left', NULL, NULL),
(118, 47, 'prayer_app+km1633678879119', 'left', NULL, NULL),
(119, 49, 'prayer_app+km1633678931020', 'left', NULL, NULL),
(120, 47, 'prayer_app+km1633678991604', 'left', NULL, NULL),
(121, 49, 'prayer_app+km1633679029629', 'left', NULL, NULL),
(122, 49, 'prayer_app+km1633679049556', 'left', NULL, NULL),
(123, 47, 'prayer_app+km1633679349602', 'left', NULL, NULL),
(124, 47, 'prayer_app+km1633679377839', 'left', NULL, NULL),
(125, 47, 'prayer_app+km1633679428364', 'left', NULL, NULL),
(126, 51, 'prayer_app+km1633688386872', 'left', NULL, NULL),
(127, 49, 'prayer_app+km1633688418177', 'left', NULL, NULL),
(128, 49, 'prayer_app+km1633688441023', 'left', NULL, NULL),
(129, 51, 'prayer_app+km1633953015703', 'left', NULL, NULL),
(130, 56, 'prayer_app+km1633953030847', 'left', NULL, NULL),
(131, 56, 'prayer_app+km1633953041710', 'left', NULL, NULL),
(132, 51, 'prayer_app+km1633953049968', 'left', NULL, NULL),
(133, 56, 'prayer_app+km1633953067123', 'left', NULL, NULL),
(134, 51, 'prayer_app+km1633953077821', 'left', NULL, NULL),
(135, 56, 'prayer_app+km1634124212966', 'left', NULL, NULL),
(136, 56, 'prayer_app+km1634124237481', 'left', NULL, NULL),
(137, 56, 'prayer_app+km1634124257855', 'left', NULL, NULL),
(138, 56, 'prayer_app+km1634124387264', 'left', NULL, NULL),
(139, 51, 'prayer_app+km1634126499765', 'left', NULL, NULL),
(140, 51, 'prayer_app+km1634126530808', 'left', NULL, NULL),
(141, 51, 'prayer_app+km1634126549057', 'left', NULL, NULL),
(142, 51, 'prayer_app+km1634126592550', 'left', NULL, NULL),
(143, 51, 'prayer_app+km1634126644954', 'left', NULL, NULL),
(144, 51, 'prayer_app+km1634126663095', 'left', NULL, NULL),
(145, 54, 'prayer_app+km1634127111114', 'left', NULL, NULL),
(146, 54, 'prayer_app+km1634127256515', 'left', NULL, NULL),
(147, 51, 'prayer_app+km1634127453770', 'left', NULL, NULL),
(148, 51, 'prayer_app+km1634127470885', 'left', NULL, NULL),
(149, 51, 'prayer_app+km1634127494320', 'left', NULL, NULL),
(150, 51, 'prayer_app+km1634127510653', 'left', NULL, NULL),
(151, 51, 'prayer_app+km1634127555548', 'left', NULL, NULL),
(152, 51, 'prayer_app+km1634127569356', 'left', NULL, NULL),
(153, 51, 'prayer_app+km1634127589657', 'left', NULL, NULL),
(154, 51, 'prayer_app+km1634127599343', 'left', NULL, NULL),
(155, 58, 'prayer_app+km1634127634657', 'left', NULL, NULL),
(156, 58, 'prayer_app+km1634127650426', 'left', NULL, NULL),
(157, 58, 'prayer_app+km1634127732704', 'left', NULL, NULL),
(158, 58, 'prayer_app+km1634127769272', 'left', NULL, NULL),
(159, 58, 'prayer_app+km1634127812001', 'left', NULL, NULL),
(160, 58, 'prayer_app+km1634127872579', 'left', NULL, NULL),
(161, 58, 'prayer_app+km1634128001295', 'left', NULL, NULL),
(162, 58, 'prayer_app+km1634128088422', 'left', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Education', 1, '2021-09-09 15:10:12', '2021-09-09 15:10:12'),
(2, 'Wedding', 1, '2021-09-09 15:10:12', '2021-09-09 15:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `reciever_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` time DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `sender_id`, `reciever_id`, `group_id`, `message`, `read_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 53, 49, NULL, 'HELLO?', NULL, NULL, NULL, NULL),
(2, 49, 53, NULL, 'HEllo?', NULL, NULL, NULL, NULL),
(3, 53, 49, NULL, 'HI/', NULL, NULL, NULL, NULL),
(4, 49, 53, NULL, 'LOL/', NULL, NULL, NULL, NULL),
(5, 53, 49, NULL, 'NO?', NULL, NULL, NULL, NULL),
(6, 53, 49, NULL, 'LOL?', NULL, NULL, NULL, NULL),
(7, 53, 49, NULL, 'lol?', NULL, NULL, NULL, NULL),
(8, 53, 49, NULL, 'lol?', NULL, NULL, NULL, NULL),
(9, 53, 49, NULL, 'nice?', NULL, NULL, NULL, NULL),
(10, 49, 53, NULL, 'ok?', NULL, NULL, NULL, NULL),
(11, 49, 53, NULL, 'ok?', NULL, NULL, NULL, NULL),
(12, 49, 53, NULL, 'ok?', NULL, NULL, NULL, NULL),
(13, 49, 53, NULL, '?????', NULL, NULL, NULL, NULL),
(14, 53, 49, NULL, '?????', NULL, NULL, NULL, NULL),
(15, 53, 49, NULL, 'asdklansdasdasd', NULL, NULL, NULL, NULL),
(16, 53, 49, NULL, '454545156', NULL, NULL, NULL, NULL),
(17, 53, 49, NULL, '0351561561', NULL, NULL, NULL, NULL),
(18, 49, 53, NULL, 'asdasdas', NULL, NULL, NULL, NULL),
(19, 49, 53, NULL, 'dasdasd', NULL, NULL, NULL, NULL),
(20, 49, 53, NULL, '123466', NULL, NULL, NULL, NULL),
(21, 53, 49, NULL, '1236458', NULL, NULL, NULL, NULL),
(22, 49, NULL, 26, 'HELOO?', NULL, NULL, NULL, NULL),
(23, 53, NULL, 26, '????', NULL, NULL, NULL, NULL),
(24, 53, NULL, 26, '2315615614', NULL, NULL, NULL, NULL),
(25, 49, NULL, 26, 'dasdasd', NULL, NULL, NULL, NULL),
(26, 62, NULL, 26, 'HELLO GUYS I AM ALSO HERE', NULL, NULL, NULL, NULL),
(27, 49, NULL, 26, 'WOW COOL', NULL, NULL, NULL, NULL),
(28, 53, NULL, 26, 'COOL', NULL, NULL, NULL, NULL),
(29, 62, NULL, 26, 'PRAYER TIME!!!', NULL, NULL, NULL, NULL),
(30, 49, NULL, 26, 'START', NULL, NULL, NULL, NULL),
(31, 53, NULL, 26, 'LET GO', NULL, NULL, NULL, NULL),
(32, 49, 53, NULL, 'PRAYER TIME', NULL, NULL, NULL, NULL),
(33, 53, 49, NULL, 'GO', NULL, NULL, NULL, NULL),
(34, 53, 49, NULL, 'HIII I AM BACK', NULL, NULL, NULL, NULL),
(35, 53, 49, NULL, 'R U?', NULL, NULL, NULL, NULL),
(36, 53, 49, NULL, 'NICE', NULL, NULL, NULL, NULL),
(37, 53, 49, NULL, '……', NULL, NULL, NULL, NULL),
(38, 49, 53, NULL, 'HEllo', NULL, NULL, NULL, NULL),
(39, 53, 49, NULL, 'HI', NULL, NULL, NULL, NULL),
(40, 53, 49, NULL, 'dfvdsf', NULL, NULL, NULL, NULL),
(41, 53, 49, NULL, 'fdsfd', NULL, NULL, NULL, NULL),
(42, 49, 53, NULL, 'dsfdsf', NULL, NULL, NULL, NULL),
(43, 53, 49, NULL, 'fdsf', NULL, NULL, NULL, NULL),
(44, 49, 53, NULL, 'dsfdsf', NULL, NULL, NULL, NULL),
(45, 53, 49, NULL, 'dsfdsf', NULL, NULL, NULL, NULL),
(46, 49, 53, NULL, 'fdsfdsf', NULL, NULL, NULL, NULL),
(47, 53, 49, NULL, 'fdsfdsf', NULL, NULL, NULL, NULL),
(48, 49, 53, NULL, 'fdsfdsfd', NULL, NULL, NULL, NULL),
(49, 53, 49, NULL, 'fdsfdsf', NULL, NULL, NULL, NULL),
(50, 53, 49, NULL, 'hello', NULL, NULL, NULL, NULL),
(51, 48, 49, NULL, 'hello', NULL, NULL, NULL, NULL),
(52, 49, 48, NULL, 'yea', NULL, NULL, NULL, NULL),
(53, 48, 49, NULL, 'hhhhhh', NULL, NULL, NULL, NULL),
(54, 49, 48, NULL, 'fff', NULL, NULL, NULL, NULL),
(55, 48, 49, NULL, 'hello there???', NULL, NULL, NULL, NULL),
(56, 49, 48, NULL, 'yes', NULL, NULL, NULL, NULL),
(57, 48, 49, NULL, ' gghh', NULL, NULL, NULL, NULL),
(58, 49, 48, NULL, 'fgrgfffrgrg3h', NULL, NULL, NULL, NULL),
(59, 48, 49, NULL, 'can we call? if possible?', NULL, NULL, NULL, NULL),
(60, 49, 48, NULL, 'yes we can calling it minute', NULL, NULL, NULL, NULL),
(61, 49, 48, NULL, 'agbabababababa', NULL, NULL, NULL, NULL),
(62, 48, 49, NULL, ' what happened??', NULL, NULL, NULL, NULL),
(63, 49, 48, NULL, 'ababa????', NULL, NULL, NULL, NULL),
(64, 48, 49, NULL, 'abq chbaa!!!!!', NULL, NULL, NULL, NULL),
(65, 49, 48, NULL, 'ok', NULL, NULL, NULL, NULL),
(66, 48, 49, NULL, 'nice', NULL, NULL, NULL, NULL),
(67, 47, 48, NULL, 'hello', NULL, NULL, NULL, NULL),
(68, 47, 48, NULL, 'nice', NULL, NULL, NULL, NULL),
(69, 48, 50, NULL, 'hhhhh', NULL, NULL, NULL, NULL),
(70, 50, 48, NULL, 'ghgghh', NULL, NULL, NULL, NULL),
(71, 48, 47, NULL, 'gello', NULL, NULL, NULL, NULL),
(72, 47, 48, NULL, 'rrt', NULL, NULL, NULL, NULL),
(73, 47, 48, NULL, 'bffggcyh', NULL, NULL, NULL, NULL),
(74, 51, 49, NULL, 'hi', NULL, NULL, NULL, NULL),
(75, 51, NULL, 40, 'hi', NULL, NULL, NULL, NULL),
(76, 49, NULL, 21, 'Abc', NULL, NULL, NULL, NULL),
(77, 49, 51, NULL, 'by', NULL, NULL, NULL, NULL),
(78, 51, 49, NULL, 'hey', NULL, NULL, NULL, NULL),
(79, 51, 50, NULL, 'hey', NULL, NULL, NULL, NULL),
(80, 54, 51, NULL, 'HELLO?', NULL, NULL, NULL, NULL),
(81, 54, 51, NULL, '??', NULL, NULL, NULL, NULL),
(82, 54, 51, NULL, '???', NULL, NULL, NULL, NULL),
(83, 51, 56, NULL, 'hey', NULL, NULL, NULL, NULL),
(84, 51, 56, NULL, '???', NULL, NULL, NULL, NULL),
(85, 56, 51, NULL, 'hrllo', NULL, NULL, NULL, NULL),
(86, 51, 56, NULL, 'ggg', NULL, NULL, NULL, NULL),
(87, 56, 51, NULL, 'gggggg', NULL, NULL, NULL, NULL),
(88, 51, NULL, 40, ' hhhh', NULL, NULL, NULL, NULL),
(89, 51, NULL, 40, 'hello everyone', NULL, NULL, NULL, NULL),
(90, 56, NULL, 42, 'yyyuuu', NULL, NULL, NULL, NULL),
(91, 56, 64, NULL, 'fffggh', NULL, NULL, NULL, NULL),
(92, 64, 56, NULL, 'ffff', NULL, NULL, NULL, NULL),
(93, 56, 65, NULL, 'hi', NULL, NULL, NULL, NULL),
(94, 51, 58, NULL, 'hi', NULL, NULL, NULL, NULL),
(95, 58, 51, NULL, 'e', NULL, NULL, NULL, NULL),
(96, 58, 51, NULL, 'hshehe', NULL, NULL, NULL, NULL),
(97, 58, 51, NULL, 'hzhz', NULL, NULL, NULL, NULL),
(98, 58, 51, NULL, 'hzhshs', NULL, NULL, NULL, NULL),
(99, 58, 51, NULL, 'gzhshs', NULL, NULL, NULL, NULL),
(100, 58, 51, NULL, 'yzusys', NULL, NULL, NULL, NULL),
(101, 58, 51, NULL, 'nnsjsshh', NULL, NULL, NULL, NULL),
(102, 58, 51, NULL, 'haya', NULL, NULL, NULL, NULL),
(103, 58, 51, NULL, 'baya', NULL, NULL, NULL, NULL),
(104, 58, 51, NULL, 'hzhsh', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_attachments`
--

CREATE TABLE `chat_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `type`, `body`, `created_at`, `updated_at`) VALUES
(1, 'terms-and-conditions', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.', NULL, NULL),
(2, 'privacy-policy', 'Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It\'s not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.”\r\n', NULL, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `user_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 48, 'Group ONE 1', NULL, '2021-09-20 13:07:04', '2021-09-20 13:19:03'),
(14, 48, 'Group 2', NULL, '2021-09-22 11:35:42', '2021-09-22 11:35:42'),
(15, 48, 'Group 3', NULL, '2021-09-22 11:36:13', '2021-09-22 11:36:13'),
(17, 54, 'Group 1', NULL, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(18, 53, 'Group 2', NULL, '2021-09-23 12:24:58', '2021-09-23 12:24:58'),
(19, 45, 'Group 4', NULL, '2021-09-27 07:05:21', '2021-09-27 07:05:21'),
(20, 45, 'Group 5', NULL, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(21, 49, 'Group 4', NULL, '2021-09-27 10:10:07', '2021-09-27 10:10:07'),
(22, 48, 'Group 6', NULL, '2021-09-27 10:11:42', '2021-09-27 10:11:42'),
(23, 49, 'Notification Tesst', NULL, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(24, 48, 'TEST', NULL, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(25, 49, 'CHAT GROUP', NULL, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(26, 49, 'CHATS', NULL, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(27, 45, 'Notification Group', NULL, '2021-10-05 15:56:23', '2021-10-05 15:56:23'),
(28, 52, 'First', NULL, '2021-10-05 11:06:47', '2021-10-05 11:06:47'),
(29, 52, 'First', NULL, '2021-10-05 11:08:32', '2021-10-05 11:08:32'),
(30, 52, 'First', NULL, '2021-10-05 11:11:51', '2021-10-05 11:11:51'),
(31, 52, 'First', NULL, '2021-10-05 11:12:29', '2021-10-05 11:12:29'),
(32, 52, 'First', NULL, '2021-10-05 11:12:52', '2021-10-05 11:12:52'),
(33, 52, 'First', NULL, '2021-10-05 11:13:47', '2021-10-05 11:13:47'),
(34, 52, 'First', NULL, '2021-10-05 11:15:08', '2021-10-05 11:15:08'),
(35, 52, 'First', NULL, '2021-10-05 11:15:41', '2021-10-05 11:15:41'),
(36, 52, 'First', NULL, '2021-10-05 11:19:06', '2021-10-05 11:19:06'),
(37, 52, 'First', NULL, '2021-10-05 11:19:56', '2021-10-05 11:19:56'),
(38, 52, 'First', NULL, '2021-10-05 11:20:56', '2021-10-05 11:20:56'),
(39, 47, 'sasas', NULL, '2021-10-07 13:35:35', '2021-10-07 13:35:35'),
(40, 51, 'twstttstsgs', NULL, '2021-10-08 10:10:15', '2021-10-08 10:10:15'),
(49, 56, 'haal', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `group_users`
--

CREATE TABLE `group_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_users`
--

INSERT INTO `group_users` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 48, '2021-09-20 13:07:04', '2021-09-20 13:07:04'),
(4, 1, 45, '2021-09-20 13:07:45', '2021-09-20 13:07:45'),
(5, 2, 48, '2021-09-20 13:07:45', '2021-09-20 13:07:45'),
(6, 3, 45, '2021-09-20 13:08:05', '2021-09-20 13:08:05'),
(7, 3, 58, '2021-09-20 13:08:05', '2021-09-20 13:08:05'),
(8, 2, 58, '2021-09-20 13:19:45', '2021-09-20 13:19:45'),
(9, 3, 48, '2021-09-20 13:20:08', '2021-09-20 13:20:08'),
(10, 1, 53, '2021-09-20 13:26:23', '2021-09-20 13:26:23'),
(11, 4, 45, '2021-09-20 13:41:53', '2021-09-20 13:41:53'),
(12, 4, 53, '2021-09-20 13:41:53', '2021-09-20 13:41:53'),
(13, 4, 58, '2021-09-20 13:41:53', '2021-09-20 13:41:53'),
(14, 5, 45, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(15, 5, 48, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(16, 5, 53, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(17, 5, 58, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(19, 6, 51, '2021-09-21 08:13:35', '2021-09-21 08:13:35'),
(20, 7, 51, '2021-09-21 09:32:03', '2021-09-21 09:32:03'),
(21, 7, 50, '2021-09-21 09:32:03', '2021-09-21 09:32:03'),
(22, 8, 54, '2021-09-21 09:34:21', '2021-09-21 09:34:21'),
(23, 8, 51, '2021-09-21 09:34:21', '2021-09-21 09:34:21'),
(24, 9, 54, '2021-09-21 09:34:47', '2021-09-21 09:34:47'),
(25, 9, 51, '2021-09-21 09:34:47', '2021-09-21 09:34:47'),
(26, 10, 54, '2021-09-21 09:36:06', '2021-09-21 09:36:06'),
(27, 10, 51, '2021-09-21 09:36:06', '2021-09-21 09:36:06'),
(28, 11, 54, '2021-09-21 09:36:17', '2021-09-21 09:36:17'),
(29, 11, 51, '2021-09-21 09:36:17', '2021-09-21 09:36:17'),
(30, 12, 54, '2021-09-21 09:46:58', '2021-09-21 09:46:58'),
(31, 12, 51, '2021-09-21 09:46:58', '2021-09-21 09:46:58'),
(32, 13, 56, '2021-09-22 11:15:50', '2021-09-22 11:15:50'),
(33, 13, 51, '2021-09-22 11:15:50', '2021-09-22 11:15:50'),
(34, 14, 48, '2021-09-22 11:35:42', '2021-09-22 11:35:42'),
(35, 14, 45, '2021-09-22 11:35:42', '2021-09-22 11:35:42'),
(36, 14, 58, '2021-09-22 11:35:42', '2021-09-22 11:35:42'),
(37, 15, 48, '2021-09-22 11:36:13', '2021-09-22 11:36:13'),
(38, 15, 45, '2021-09-22 11:36:13', '2021-09-22 11:36:13'),
(39, 16, 49, '2021-09-22 11:45:12', '2021-09-22 11:45:12'),
(40, 16, 58, '2021-09-22 11:45:12', '2021-09-22 11:45:12'),
(41, 17, 54, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(42, 17, 49, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(43, 17, 51, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(44, 18, 53, '2021-09-23 12:24:58', '2021-09-23 12:24:58'),
(45, 18, 45, '2021-09-23 12:24:58', '2021-09-23 12:24:58'),
(46, 18, 49, '2021-09-23 12:24:58', '2021-09-23 12:24:58'),
(47, 19, 45, '2021-09-27 07:05:21', '2021-09-27 07:05:21'),
(48, 19, 48, '2021-09-27 07:05:21', '2021-09-27 07:05:21'),
(49, 20, 45, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(50, 20, 48, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(51, 20, 53, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(52, 20, 58, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(53, 21, 49, '2021-09-27 10:10:07', '2021-09-27 10:10:07'),
(54, 21, 54, '2021-09-27 10:10:07', '2021-09-27 10:10:07'),
(55, 22, 48, '2021-09-27 10:11:42', '2021-09-27 10:11:42'),
(56, 22, 45, '2021-09-27 10:11:42', '2021-09-27 10:11:42'),
(57, 23, 49, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(58, 23, 53, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(59, 23, 58, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(60, 24, 48, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(61, 24, 49, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(62, 24, 58, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(63, 24, 45, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(64, 1, 62, '2021-09-20 13:07:04', '2021-09-20 13:07:04'),
(65, 25, 49, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(66, 25, 62, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(67, 25, 53, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(68, 26, 49, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(69, 26, 62, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(70, 26, 53, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(71, 28, 52, '2021-10-05 11:06:47', '2021-10-05 11:06:47'),
(72, 29, 52, '2021-10-05 11:08:32', '2021-10-05 11:08:32'),
(73, 29, 48, '2021-10-05 11:08:32', '2021-10-05 11:08:32'),
(74, 29, 47, '2021-10-05 11:08:32', '2021-10-05 11:08:32'),
(75, 30, 52, '2021-10-05 11:11:51', '2021-10-05 11:11:51'),
(76, 30, 48, '2021-10-05 11:11:51', '2021-10-05 11:11:51'),
(77, 31, 52, '2021-10-05 11:12:30', '2021-10-05 11:12:30'),
(78, 31, 48, '2021-10-05 11:12:30', '2021-10-05 11:12:30'),
(79, 32, 52, '2021-10-05 11:12:52', '2021-10-05 11:12:52'),
(80, 32, 48, '2021-10-05 11:12:52', '2021-10-05 11:12:52'),
(81, 32, 47, '2021-10-05 11:12:52', '2021-10-05 11:12:52'),
(82, 33, 52, '2021-10-05 11:13:47', '2021-10-05 11:13:47'),
(83, 33, 48, '2021-10-05 11:13:47', '2021-10-05 11:13:47'),
(84, 34, 52, '2021-10-05 11:15:08', '2021-10-05 11:15:08'),
(85, 34, 48, '2021-10-05 11:15:08', '2021-10-05 11:15:08'),
(86, 35, 52, '2021-10-05 11:15:41', '2021-10-05 11:15:41'),
(87, 35, 48, '2021-10-05 11:15:41', '2021-10-05 11:15:41'),
(88, 36, 52, '2021-10-05 11:19:06', '2021-10-05 11:19:06'),
(89, 36, 48, '2021-10-05 11:19:06', '2021-10-05 11:19:06'),
(90, 37, 52, '2021-10-05 11:19:56', '2021-10-05 11:19:56'),
(91, 37, 48, '2021-10-05 11:19:56', '2021-10-05 11:19:56'),
(92, 38, 52, '2021-10-05 11:20:56', '2021-10-05 11:20:56'),
(93, 38, 48, '2021-10-05 11:20:56', '2021-10-05 11:20:56'),
(94, 39, 47, '2021-10-07 13:35:35', '2021-10-07 13:35:35'),
(95, 39, 48, '2021-10-07 13:35:35', '2021-10-07 13:35:35'),
(96, 40, 51, '2021-10-08 10:10:15', '2021-10-08 10:10:15'),
(97, 40, 49, '2021-10-08 10:10:15', '2021-10-08 10:10:15'),
(98, 23, 51, '2021-10-08 10:12:14', '2021-10-08 10:12:14'),
(99, 40, 56, '2021-10-11 11:55:34', '2021-10-11 11:55:34'),
(100, 41, 56, '2021-10-11 12:00:10', '2021-10-11 12:00:10'),
(101, 41, 51, '2021-10-11 12:00:10', '2021-10-11 12:00:10'),
(102, 42, 56, '2021-10-11 12:07:43', '2021-10-11 12:07:43'),
(103, 42, 51, '2021-10-11 12:07:43', '2021-10-11 12:07:43'),
(104, 43, 56, '2021-10-11 12:10:55', '2021-10-11 12:10:55'),
(105, 43, 51, '2021-10-11 12:10:55', '2021-10-11 12:10:55'),
(106, 44, 56, '2021-10-11 12:12:24', '2021-10-11 12:12:24'),
(107, 44, 51, '2021-10-11 12:12:24', '2021-10-11 12:12:24'),
(108, 45, 56, '2021-10-11 12:13:31', '2021-10-11 12:13:31'),
(109, 45, 51, '2021-10-11 12:13:31', '2021-10-11 12:13:31'),
(110, 46, 56, '2021-10-11 12:14:38', '2021-10-11 12:14:38'),
(111, 46, 51, '2021-10-11 12:14:38', '2021-10-11 12:14:38'),
(112, 47, 56, '2021-10-11 12:15:58', '2021-10-11 12:15:58'),
(113, 47, 51, '2021-10-11 12:15:58', '2021-10-11 12:15:58'),
(114, 48, 56, '2021-10-11 12:17:11', '2021-10-11 12:17:11'),
(115, 48, 51, '2021-10-11 12:17:11', '2021-10-11 12:17:11'),
(116, 48, 64, '2021-10-11 12:20:09', '2021-10-11 12:20:09'),
(117, 49, 56, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(118, 49, 51, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(119, 49, 64, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(120, 49, 65, '2021-10-13 11:26:22', '2021-10-13 11:26:22');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2021_07_14_132423_create_contents_table', 1),
(11, '2021_07_14_135400_create_feedback_table', 1),
(12, '2021_09_02_115335_create_prayers_table', 2),
(13, '2021_09_02_120336_create_categories_table', 3),
(14, '2021_09_02_142514_create_reminders_table', 3),
(15, '2021_09_08_124533_create_partners_table', 3),
(16, '2021_09_08_133452_create_chats_table', 3),
(17, '2021_09_08_133745_create_groups_table', 3),
(18, '2021_09_08_134706_create_group_users_table', 3),
(19, '2021_09_08_135206_create_chat_attachments_table', 3),
(20, '2021_09_20_103135_create_addresses_table', 4),
(21, '2021_09_27_062741_create_notifications_table', 4),
(22, '2021_09_27_083434_create_admins_table', 5),
(23, '2021_10_06_152402_create_calls_table', 5),
(24, '2021_10_06_152433_create_call_users_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reciever_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `reciever_id`, `sender_id`, `group_id`, `type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
(52, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-08 18:04:02', '2021-10-08 18:04:02'),
(53, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-08 18:06:01', '2021-10-08 18:06:01'),
(54, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-08 18:06:01', '2021-10-08 18:06:01'),
(55, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-08 18:08:02', '2021-10-08 18:08:02'),
(56, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-08 18:13:02', '2021-10-08 18:13:02'),
(57, 56, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:52:18\"}', '33', '2021-10-08 19:02:02', '2021-10-08 19:02:02'),
(58, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:04:01\"}', '34', '2021-10-08 19:04:02', '2021-10-08 19:04:02'),
(59, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:06:33\"}', '35', '2021-10-08 19:05:03', '2021-10-08 19:05:03'),
(60, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-08 19:06:02', '2021-10-08 19:06:02'),
(61, 56, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:08:22\"}', '37', '2021-10-08 19:08:01', '2021-10-08 19:08:01'),
(62, 56, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:10:43\"}', '38', '2021-10-08 19:09:01', '2021-10-08 19:09:01'),
(63, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-09 00:00:02', '2021-10-09 00:00:02'),
(64, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-09 00:00:02', '2021-10-09 00:00:02'),
(65, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-09 00:00:03', '2021-10-09 00:00:03'),
(66, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-09 01:00:02', '2021-10-09 01:00:02'),
(67, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-09 01:00:02', '2021-10-09 01:00:02'),
(68, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-10 00:00:02', '2021-10-10 00:00:02'),
(69, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-10 00:00:02', '2021-10-10 00:00:02'),
(70, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-10 00:00:02', '2021-10-10 00:00:02'),
(71, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-10 01:00:02', '2021-10-10 01:00:02'),
(72, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-10 01:00:02', '2021-10-10 01:00:02'),
(73, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-11 00:00:02', '2021-10-11 00:00:02'),
(74, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-11 00:00:02', '2021-10-11 00:00:02'),
(75, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-11 00:00:02', '2021-10-11 00:00:02'),
(76, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-11 01:00:02', '2021-10-11 01:00:02'),
(77, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-11 01:00:02', '2021-10-11 01:00:02'),
(78, 56, 51, 40, 'group', '{\"name\":\"abc xyz\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1631710008.jpg\",\"message\":\"Your Are Added in twstttstsgs Group By  xyz\"}', NULL, '2021-10-11 11:55:34', '2021-10-11 11:55:34'),
(79, 51, 56, 41, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in help Group By  Aijaz\"}', NULL, '2021-10-11 12:00:10', '2021-10-11 12:00:10'),
(80, 51, 56, 42, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in group x Group By  Aijaz\"}', NULL, '2021-10-11 12:07:43', '2021-10-11 12:07:43'),
(81, 51, 56, 43, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in happy Group By  Aijaz\"}', NULL, '2021-10-11 12:10:55', '2021-10-11 12:10:55'),
(82, 51, 56, 44, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in abcd Group By  Aijaz\"}', NULL, '2021-10-11 12:12:24', '2021-10-11 12:12:24'),
(83, 51, 56, 45, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in happy Group By  Aijaz\"}', NULL, '2021-10-11 12:13:31', '2021-10-11 12:13:31'),
(84, 51, 56, 46, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in abcdefg Group By  Aijaz\"}', NULL, '2021-10-11 12:14:38', '2021-10-11 12:14:38'),
(85, 51, 56, 47, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in anclrr Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:15:58', '2021-10-11 12:15:58'),
(86, 51, 56, 48, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in hhahgha Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:17:11', '2021-10-11 12:17:11'),
(87, 64, 56, 48, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in hhahgha Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:20:09', '2021-10-11 12:20:09'),
(88, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-12 00:00:02', '2021-10-12 00:00:02'),
(89, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-12 00:00:02', '2021-10-12 00:00:02'),
(90, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-12 00:00:02', '2021-10-12 00:00:02'),
(91, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-12 01:00:02', '2021-10-12 01:00:02'),
(92, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-12 01:00:03', '2021-10-12 01:00:03'),
(93, 56, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"09:39:49\"}', '39', '2021-10-12 09:38:01', '2021-10-12 09:38:01'),
(94, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-13 00:00:02', '2021-10-13 00:00:02'),
(95, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-13 00:00:03', '2021-10-13 00:00:03'),
(96, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-13 00:00:03', '2021-10-13 00:00:03'),
(97, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-13 01:00:02', '2021-10-13 01:00:02'),
(98, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-13 01:00:03', '2021-10-13 01:00:03'),
(99, 51, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(100, 64, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(101, 65, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(102, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-14 00:00:02', '2021-10-14 00:00:02'),
(103, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-14 00:00:02', '2021-10-14 00:00:02'),
(104, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-14 00:00:02', '2021-10-14 00:00:02'),
(105, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-14 01:00:02', '2021-10-14 01:00:02'),
(106, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-14 01:00:03', '2021-10-14 01:00:03'),
(107, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-15 00:00:02', '2021-10-15 00:00:02'),
(108, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-15 00:00:02', '2021-10-15 00:00:02'),
(109, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-15 00:00:03', '2021-10-15 00:00:03'),
(110, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-15 01:00:02', '2021-10-15 01:00:02'),
(111, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-15 01:00:03', '2021-10-15 01:00:03'),
(112, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-16 00:00:02', '2021-10-16 00:00:02'),
(113, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-16 00:00:02', '2021-10-16 00:00:02'),
(114, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-16 00:00:02', '2021-10-16 00:00:02'),
(115, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-16 01:00:02', '2021-10-16 01:00:02'),
(116, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-16 01:00:02', '2021-10-16 01:00:02'),
(117, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-17 00:00:03', '2021-10-17 00:00:03'),
(118, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-17 00:00:03', '2021-10-17 00:00:03'),
(119, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-17 00:00:03', '2021-10-17 00:00:03'),
(120, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-17 01:00:03', '2021-10-17 01:00:03'),
(121, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-17 01:00:03', '2021-10-17 01:00:03'),
(122, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-18 00:00:03', '2021-10-18 00:00:03'),
(123, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-18 00:00:03', '2021-10-18 00:00:03'),
(124, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-18 00:00:03', '2021-10-18 00:00:03'),
(125, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-18 01:00:03', '2021-10-18 01:00:03'),
(126, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-18 01:00:03', '2021-10-18 01:00:03'),
(127, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-19 00:00:02', '2021-10-19 00:00:02'),
(128, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-19 00:00:02', '2021-10-19 00:00:02'),
(129, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-19 00:00:02', '2021-10-19 00:00:02'),
(130, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-19 01:00:02', '2021-10-19 01:00:02'),
(131, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-19 01:00:02', '2021-10-19 01:00:02'),
(132, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:05 pm\"}', '26', '2021-10-20 00:00:02', '2021-10-20 00:00:02'),
(133, 48, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '27', '2021-10-20 00:00:03', '2021-10-20 00:00:03'),
(134, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:07 pm\"}', '28', '2021-10-20 00:00:03', '2021-10-20 00:00:03'),
(135, 47, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"06:14:44\"}', '29', '2021-10-20 01:00:02', '2021-10-20 01:00:02'),
(136, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-20 01:00:03', '2021-10-20 01:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('013ecc902c20e33555268e2146fe0570fbb9e1290dfa8bc0dee1ef9bf601973b1bed1e4457471d7f', 65, 3, 'authToken', '[]', 0, '2021-10-13 11:13:43', '2021-10-13 11:13:43', '2022-10-13 11:13:43'),
('0579fea82bf6dde0fd7b72b1caa342f7ed4d75dda646c5a08a7eeb91d76e0b66dab82b8ebe4b1d43', 44, 3, 'authToken', '[]', 0, '2021-09-10 06:56:54', '2021-09-10 06:56:54', '2022-09-10 06:56:54'),
('05a33c4a8ff2455606a2a0ebd7aa035e8a51c196a595db800257d0d5275a54d4becedff7c9a686f2', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:19:50', '2021-09-09 07:19:50', '2022-09-09 07:19:50'),
('06f1900b5b66515a9bfc5b9bd5cd94304a4fa00a1350e6b0890f01805c25dd4bc1f77246968e5a94', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:10:59', '2021-09-03 13:10:59', '2022-09-03 13:10:59'),
('0a26b7dede06040a853e3fd9c311fe0aa141bd6c2f1ae902efe5036e4253c5d8b22b80fb89225a83', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:59:09', '2021-09-03 12:59:09', '2022-09-03 12:59:09'),
('0cb635b69ffa161277d328f25d491acd31fff5821eff6a656b7a003fcfac2009a5c63f5c51c29fbb', 58, 3, 'authToken', '[]', 0, '2021-10-13 12:15:22', '2021-10-13 12:15:22', '2022-10-13 12:15:22'),
('0d275aff6f220f08beaf508998127745906be54743459941e189b9e70b9bc85a631a68f023f5700b', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:28', '2021-09-03 13:03:28', '2022-09-03 13:03:28'),
('11aa4b2b47e030d7203cd2a10e5752eade83c7bd8363b99caaefbf8a0de6bd7afdd91c1b5a226acf', 21, 3, 'authToken', '[]', 0, '2021-09-08 07:51:18', '2021-09-08 07:51:18', '2022-09-08 07:51:18'),
('12e32adca3047543861d4cba126b04367bb4c1f8a108ba3fadb1d660613cdf8d7cc90d4c3e388468', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:54:31', '2021-09-09 06:54:31', '2022-09-09 06:54:31'),
('1698aaf73314c8bd8c02f35dac34f70e86b5d34f1d580a4f6e9149251e1111b13859aeeebeeb275b', 7, 3, 'authToken', '[]', 0, '2021-09-03 08:04:21', '2021-09-03 08:04:21', '2022-09-03 08:04:21'),
('181f7a653e4818788733704cfe7fb02521357b7cb382bf97d0f68c15c9238ad72991baa2fa5b7218', 44, 3, 'authToken', '[]', 0, '2021-09-10 07:01:18', '2021-09-10 07:01:18', '2022-09-10 07:01:18'),
('1a29296961d168c4f4e549c3c7237b8630cb279856e92c4d2df8f87a5c0fe62db87d595c03eaa958', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:57:40', '2021-09-03 12:57:40', '2022-09-03 12:57:40'),
('1b6bcc5d7f8968de7ef5840de7be009568b80161ec0c60ee762be16265cbe157baa0f200108e8176', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:50:26', '2021-09-10 06:50:26', '2022-09-10 06:50:26'),
('1becf88730365fa61f64824878bfbfa06375ca827209aeea8dbee612831e618cda154cc533fc47c4', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:14', '2021-09-03 13:12:14', '2022-09-03 13:12:14'),
('241c66165f4141a2388598ff7e0952642ab3bb74824ab8c8daeb04562904007b01a93562e9c5632a', NULL, 3, 'authToken', '[]', 0, '2021-09-09 10:21:39', '2021-09-09 10:21:39', '2022-09-09 10:21:39'),
('25026c1b090722016f77dadf282081a1624459329a46637b3ab6b43622d7e710f8da919c5650c7a6', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:49:10', '2021-09-08 07:49:10', '2022-09-08 07:49:10'),
('265a0afca55b02e44bdc3575c4f457e299d801f7ffc7fa66eb924b133d6049c72c28fe9377bf62c6', 7, 3, 'authToken', '[]', 0, '2021-09-07 06:00:20', '2021-09-07 06:00:20', '2022-09-07 06:00:20'),
('2a360457f8150bfaa3680b1110e7f5a9fbf185436c41c35c2523f445135322a8783b120f2d9e12f2', 18, 3, 'authToken', '[]', 0, '2021-09-08 06:50:47', '2021-09-08 06:50:47', '2022-09-08 06:50:47'),
('2bdb967425f9da8f6c40a15ea7efa21760a57ad087c1e526f6cc138455324f6ea69f07d34ead734d', 22, 3, 'authToken', '[]', 0, '2021-09-09 07:17:05', '2021-09-09 07:17:05', '2022-09-09 07:17:05'),
('3260fcb1899f5103ee5d05e62eeecb9f66bc1e71013c1d10e6ae0ab794b8cddd65c5c74397451bda', 12, 3, 'authToken', '[]', 0, '2021-09-07 10:16:35', '2021-09-07 10:16:35', '2022-09-07 10:16:35'),
('336e58b75e98f495bb166e7436a4077bab98f88b998f40c213804d62789e6cb6bed0af4ce99521f6', 6, 3, 'authToken', '[]', 0, '2021-09-09 12:39:52', '2021-09-09 12:39:52', '2022-09-09 12:39:52'),
('34f1e0bc7b5691c6854cf1fdc1cf8a9a5564981791030a8ce4dc0f94ea5b073be4051471305a7dd9', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:23:15', '2021-09-09 07:23:15', '2022-09-09 07:23:15'),
('3c9c75d7eed458cb200064e9a24e252837a7ba408c43cda4c77e903eeb179e7a02c8cbfe89c9492e', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:59', '2021-09-03 13:11:59', '2022-09-03 13:11:59'),
('43e562d23bf46c7ca894b66cfe599db86e3aa8ccaf64b431d848f9bf483a5c14c5f5c2380a916145', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:47:29', '2021-09-08 07:47:29', '2022-09-08 07:47:29'),
('44e6f6ed475156f800de925a4d5fe2b3ca864a4bc12d8d269f02fe694c3893b7dec348bab2ba4d67', 15, 3, 'authToken', '[]', 0, '2021-09-07 11:54:19', '2021-09-07 11:54:19', '2022-09-07 11:54:19'),
('45c90dae959632a7632229fbb69aeb9d2987302a8db49df0554af820b99e730818a7ae2f44ef4047', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:54', '2021-09-03 13:03:54', '2022-09-03 13:03:54'),
('494d67e6e032077d9fec26f563d6573029d47198831c99698a56b0b49832874b4453cc37fe6d0c4e', 11, 3, 'authToken', '[]', 0, '2021-09-07 10:11:38', '2021-09-07 10:11:38', '2022-09-07 10:11:38'),
('4ce0b4facbd80859dfdb2d376d8be903e9ad5dd5b90fba583a58ecd7b8ae2b6cdceabbc15ee3ce73', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:08:20', '2021-09-09 06:08:20', '2022-09-09 06:08:20'),
('4e85251995558a1f5a162bed9414488e21a3accf0c1f513928c7eaf8b604dabd354b5d77ee1ef492', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:50', '2021-09-03 13:03:50', '2022-09-03 13:03:50'),
('4ff61d18e7f7325635f8a51168e4ed93b4dd3cf3b111c0b12e0406fb3e29fdc01154a1404b6b0898', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:58:58', '2021-09-03 12:58:58', '2022-09-03 12:58:58'),
('5350d922176948894b7845513991aee6e491ad69bfc66e3d1347047699f3d355ae846c922dadf99c', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:05:11', '2021-09-03 13:05:11', '2022-09-03 13:05:11'),
('5594a339ea7685c2888fc0ab70ad5236be390c8dbea102eecd04e763ba907482315ae81ec1b90c00', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:27:44', '2021-09-09 06:27:44', '2022-09-09 06:27:44'),
('565947163e6b24ba689d23608954f89b5ecd29cc3ec3950616e4a7a046e96440f7d8c332b573efd7', 44, 3, 'authToken', '[]', 0, '2021-09-10 06:58:58', '2021-09-10 06:58:58', '2022-09-10 06:58:58'),
('5c4bae6b9f371200058c04af40e807046169033347a75575931b158e7f1e4c7695e984101dc1781d', NULL, 3, 'authToken', '[]', 0, '2021-09-09 05:49:25', '2021-09-09 05:49:25', '2022-09-09 05:49:25'),
('5caaf41f3075e49f6d042e65fa437c8ea03f740ac9bb6e716afe9d57f1a38450a3d2b15a201bc8eb', 7, 3, 'authToken', '[]', 0, '2021-09-03 08:04:39', '2021-09-03 08:04:39', '2022-09-03 08:04:39'),
('600c92d6e138bcaca8fa9dca839d5513b4a2431fd3cf5efcbc6bf7c4182c463239f52d31eed6f666', 17, 3, 'authToken', '[]', 0, '2021-09-08 06:47:26', '2021-09-08 06:47:26', '2022-09-08 06:47:26'),
('6669051d6d2cb91c201d9d6d4eb2fabd20bdbc589874dcf27beed9b5c8f4920b6b5fd863be9c3e0f', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:59:49', '2021-09-09 06:59:49', '2022-09-09 06:59:49'),
('675c019387feba8e7e80e20b3ac5e0dc173834fc9d1a71cd177c4d2f93fbb70e42c7f988481453bb', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:33:48', '2021-09-03 13:33:48', '2022-09-03 13:33:48'),
('6837670ddbccb112756bad0d4b0532f0de2bf57d5b87830293de7a77bd204955b5f84c7dffbac8cc', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:15:07', '2021-09-09 07:15:07', '2022-09-09 07:15:07'),
('695ac642116efbe070fe5c7c5861dde4ad6fde5ab9c117afd13e8de0a940bce3959a383998d58457', 15, 3, 'authToken', '[]', 0, '2021-09-07 11:46:03', '2021-09-07 11:46:03', '2022-09-07 11:46:03'),
('6d3541384fc3fd7c47ea70a2fddc26d880bca905bac5da7483744acd94371e8d8f72872098499b29', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:17:46', '2021-09-03 12:17:46', '2022-09-03 12:17:46'),
('7657a915c8b359497757c1df23e047607a5a44d82f4d3a7fcbd8505ec5628befdb031b51b83fdce8', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:50:04', '2021-09-10 06:50:04', '2022-09-10 06:50:04'),
('84e90d6d4e90019a3bc4430e1162d621c5b59730277dd4e1ee0f400e3f2213000e2c3961e65b596b', 65, 3, 'authToken', '[]', 0, '2021-10-13 11:12:39', '2021-10-13 11:12:39', '2022-10-13 11:12:39'),
('8b69f8675ad3f0610f64fabc608a390606e05dd60845fd65a8a4ef6039e219e270b12ddb0a197f93', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:56:14', '2021-09-09 07:56:14', '2022-09-09 07:56:14'),
('8c8e89d0d1b7aca79c06e0e0f4d2d047ffa8ac2f8d4eb63eb3ef1bf53aa1ecfa1ac7acdac2856db3', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:20', '2021-09-03 13:03:20', '2022-09-03 13:03:20'),
('90e932d2d25f662f755171a1af3647c7afc9d27789dabfa901275e6ce51f5f0e498b2dbc6a28cfa6', 17, 3, 'authToken', '[]', 0, '2021-09-08 06:46:46', '2021-09-08 06:46:46', '2022-09-08 06:46:46'),
('939efaddb858cffe2f7f0cbb0541539c535670900cb06fa9e46a80f4257c53935e4b19c310cb3d32', 46, 3, 'authToken', '[]', 0, '2021-09-10 12:29:46', '2021-09-10 12:29:46', '2022-09-10 12:29:46'),
('968463a4a817cf363f66665af9c1998bfc4c24a395195bc890e7982f2031669a24aa0459b03bc74d', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:22', '2021-09-03 13:12:22', '2022-09-03 13:12:22'),
('99531b25734a92de0949d707942824e9119a4dbcfad18247e370ef0273fb7ff4a440dd9f64a7d168', 18, 3, 'authToken', '[]', 0, '2021-09-08 06:51:02', '2021-09-08 06:51:02', '2022-09-08 06:51:02'),
('9aad9ca843ed6342a7aff02750f48934fa3cde43bb7625e58f722750668b74bf10487c7753c56d6c', 51, 3, 'authToken', '[]', 0, '2021-10-13 11:58:18', '2021-10-13 11:58:18', '2022-10-13 11:58:18'),
('9b42219a0456224cc2846cb5aa4700bc2517c7bb2b5f337f9212e7234efd2764d1f907f9efc3cf40', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:46:49', '2021-09-08 07:46:49', '2022-09-08 07:46:49'),
('9b45a1efe0b2b804ca1caab998713a7a941071a11b41fed3ad733ceb71094e0f0b2d871a02fd052a', 15, 3, 'authToken', '[]', 0, '2021-09-07 11:53:23', '2021-09-07 11:53:23', '2022-09-07 11:53:23'),
('9d3738c6cf7908c937144e86caded3e6fda6683b2345a8534a36952240ab70b670bf7991d4cc9be8', 37, 3, 'authToken', '[]', 0, '2021-09-09 12:51:38', '2021-09-09 12:51:38', '2022-09-09 12:51:38'),
('9e5aebbd99921c2af5ea2f967e19c15b2caa5b0f965bed29e2c110a436f8bc398acf1d4b7c55e8cd', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:27', '2021-09-03 13:12:27', '2022-09-03 13:12:27'),
('a2bae5b2e5e785760b648cea5d323e937f5361ab57b6e3b725519bcbe94ff31d820f9bf7c1910dea', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:43:24', '2021-09-10 06:43:24', '2022-09-10 06:43:24'),
('a3363dcd4a4e3ec50232a163ad179592dffb574e6fa3668df8561ec817c06727e4cbbefdb3b79ca5', 5, 3, 'authToken', '[]', 0, '2021-09-03 06:42:48', '2021-09-03 06:42:48', '2022-09-03 06:42:48'),
('a5ea16eee260fcb18c8ce7a8f43f57e6eb6bdd62e64e9032d270dd9b36f825bee805d84375e8c5a1', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:53', '2021-09-03 13:11:53', '2022-09-03 13:11:53'),
('a91494cd9d59c73481a5b3c7d8873a91916f52f7ababf04444ccccf9a0aa5087716956caa2a4d130', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:44:22', '2021-09-08 07:44:22', '2022-09-08 07:44:22'),
('aa4de39fb867d704179048528a5586941261f8186c2c0c2966665232a11d3fb2f3d9bb3bcb56d656', 52, 3, 'authToken', '[]', 0, '2021-09-13 06:56:52', '2021-09-13 06:56:52', '2022-09-13 06:56:52'),
('aff55fb6dfb8529988ce3a29b5c9d9a311f7c8e6fc1df785830b7fdec4e5f808d690c7d8fa88895c', 7, 3, 'authToken', '[]', 0, '2021-09-03 07:59:07', '2021-09-03 07:59:07', '2022-09-03 07:59:07'),
('b5d70ee41c4c7bb44a8d4db61c75d16f57ab0b543e58228eea3057bde1655f414f928ac6be425939', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:01:58', '2021-09-09 07:01:58', '2022-09-09 07:01:58'),
('b7f59e0150b08d4eeeae2e164ace1facb39176de58f98377691c23d58c7c6699487ee595c6edd719', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:50', '2021-09-03 13:11:50', '2022-09-03 13:11:50'),
('bc5db0a329a0cd354bad8729c40946a36718055ac511713e0412f4f7406ad6c45d0fd91ec215f322', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:15:48', '2021-09-03 12:15:48', '2022-09-03 12:15:48'),
('befff541c2dc4cd7fa36c2edefa8e7c728308d8904da109f8b42c9ea0d976026cd595568807d95fe', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:50:11', '2021-09-10 06:50:11', '2022-09-10 06:50:11'),
('bff6a5b3cf114b4d7a6af5b8bbfc7dbbea3ea2ad39bd601219ac737524f5959d5c444fdd18d5f4b4', 44, 3, 'authToken', '[]', 0, '2021-09-10 06:55:03', '2021-09-10 06:55:03', '2022-09-10 06:55:03'),
('c06517bffffa950a13b564048fed4ecdc757d4085f87995a5c545306b674685d4cd26f71860a1d4d', 14, 3, 'authToken', '[]', 0, '2021-09-08 11:37:24', '2021-09-08 11:37:24', '2022-09-08 11:37:24'),
('c7bb836ef4cddb9a7a9504a9ccb8602962f6569e083dd6ba494e64b68d101f3be48fd4f25d91175b', 47, 3, 'authToken', '[]', 0, '2021-10-08 07:26:47', '2021-10-08 07:26:47', '2022-10-08 07:26:47'),
('c992e90c7b14b0dbc6f793517033512af1ab2365ac355326505ce1ca29b31baf9a431f57a2c857cb', 14, 3, 'authToken', '[]', 0, '2021-09-09 09:39:18', '2021-09-09 09:39:18', '2022-09-09 09:39:18'),
('c9d50d3701e2128a88da75ebaffa22d957226c725ffba355af4cde13476fa8f26da15ef9b153a326', 48, 3, 'authToken', '[]', 0, '2021-10-01 12:30:49', '2021-10-01 12:30:49', '2022-10-01 12:30:49'),
('cae642e68cef1943ac999c0478f52537dcff9b67f8572243e99197661d9f85773ec9c86ad40f67db', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:14:45', '2021-09-03 12:14:45', '2022-09-03 12:14:45'),
('ce16fc77ecf3290beda36d27b3bc1da48444c8058e1ff58cb30cc99d67122400c4328387679914b7', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:50:29', '2021-09-09 06:50:29', '2022-09-09 06:50:29'),
('d20a94a5bb7dcc2b3a9a9358b892d8dbeb17e5452c1bd775e3870eb3e9ee788385d6c3fbe846dd0f', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:51:12', '2021-09-08 07:51:12', '2022-09-08 07:51:12'),
('d33b09f2f090deb0d31bb96328a57065840ce4987996a5b15e50b0febf6fd3558e119e13a1aa8a32', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:54', '2021-09-03 13:11:54', '2022-09-03 13:11:54'),
('d5e6578efc115b70be0ffb13d04e79b03ca2b36ab94255a82143d0bc248661cbf159a3fdf9b3aaad', 7, 3, 'authToken', '[]', 0, '2021-09-03 10:41:47', '2021-09-03 10:41:47', '2022-09-03 10:41:47'),
('d78e5436553971563ebbce5344e538a0501738ff6640edcbc7293ab35333cf540a09cf4ca5f35326', 41, 3, 'authToken', '[]', 0, '2021-09-09 13:26:23', '2021-09-09 13:26:23', '2022-09-09 13:26:23'),
('da9d8f5659f6916b57e72a55d597b7753587cfec08274e148db3a12d31434eb3335b9df9719b8849', 8, 3, 'authToken', '[]', 0, '2021-09-03 14:01:53', '2021-09-03 14:01:53', '2022-09-03 14:01:53'),
('dd30cfdf23ec924aa8c815b6a215c890496d14fb81e68c587ef74f97ae4fa7ca2dcfb79860f55e74', 5, 3, 'authToken', '[]', 0, '2021-09-03 06:34:58', '2021-09-03 06:34:58', '2022-09-03 06:34:58'),
('dee7cbf8f06834a03f39ca9384ec45f09570abe406a20eb29a6665680193c4ab7a8db7c9448cc359', 59, 3, 'authToken', '[]', 0, '2021-09-15 15:08:49', '2021-09-15 15:08:49', '2022-09-15 15:08:49'),
('e07af36ec1cc333f589d79aa9a3e5a4f8187742d03ba8bdc79a5353f17d086723f0588b27c05c0d0', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:40:16', '2021-09-09 06:40:16', '2022-09-09 06:40:16'),
('e195ccacce3254eab81bcf9c81ecb7858e389d6fceb1dcd1499b8c2546b78d376304223cef2f074a', NULL, 3, 'authToken', '[]', 0, '2021-09-09 08:01:35', '2021-09-09 08:01:35', '2022-09-09 08:01:35'),
('e2f69846df740c117d8b4330978e32c4c9477c2385efbf4f19dab28b6ae3d42320393c79ca67ba1b', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:04:21', '2021-09-03 13:04:21', '2022-09-03 13:04:21'),
('e57deb38be6a40cb80a2bccba3f61e7fa4473d16eda44f87c8c92bd094c211693a92be54eecaa9f5', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:09', '2021-09-03 13:12:09', '2022-09-03 13:12:09'),
('e6ff985a1b5e897481087cde2a8f460aea7de46713dc73df5c1bdb86ab0b0bfc9b82a8518e716af2', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:04:42', '2021-09-03 13:04:42', '2022-09-03 13:04:42'),
('ea2abcc0a37ee1c767d70afebe501fe924e236105b287c8fbaad6ac7624a01c68145287df5dd7df2', 64, 3, 'authToken', '[]', 0, '2021-10-13 11:10:23', '2021-10-13 11:10:23', '2022-10-13 11:10:23'),
('ebee857ca59ddfb65b185d3bffefc2766a2e337cd2e05fceecc1afd10740febc52d3194c561d9526', 43, 3, 'authToken', '[]', 0, '2021-09-10 06:50:43', '2021-09-10 06:50:43', '2022-09-10 06:50:43'),
('ec5a87ec635b7230631c829a9779af7220d72d4244549e1b101197b4da7882acd3484bb55c26308b', 10, 3, 'authToken', '[]', 0, '2021-09-07 09:58:37', '2021-09-07 09:58:37', '2022-09-07 09:58:37'),
('ecbcb0c2be571175195764582c3e89274dec5d5f97490a516c8895e4c637441f89b98cceccdf9682', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:05:01', '2021-09-03 13:05:01', '2022-09-03 13:05:01'),
('ee1ecdea6f584e9058cb3246f96bb6db6a2265d02e11f1bb2125f258546e54fd62149608eccafd34', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:15:34', '2021-09-03 12:15:34', '2022-09-03 12:15:34'),
('f3ce48fafe46ff9423f449022f056f4611f1eca0d911f75240812863069a2714513d43b1a1c53c71', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:09:22', '2021-09-09 07:09:22', '2022-09-09 07:09:22'),
('f454ff1d0812ec54a20673401b1eee257013bb756b66652d1fa33650b7093afb891cfff324f62361', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:59:13', '2021-09-09 07:59:13', '2022-09-09 07:59:13'),
('fac24a9417c9db9682d162a0a5f75d028d9a954e5e62eebef9101ed62fdbb93ee6a88467cdc86c02', 44, 3, 'authToken', '[]', 0, '2021-09-10 07:01:10', '2021-09-10 07:01:10', '2022-09-10 07:01:10'),
('fe5056388339b6372c929289db027d2f94bb3ef19eb4f7e3edfc116d34e121994fc8a3e39137d762', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:49:40', '2021-09-08 07:49:40', '2022-09-08 07:49:40'),
('fea232e6b2a41311c0650ba95b19e33092cb47c104bc58e07309e2140e1106abf0216aeeec80acfd', 5, 3, 'authToken', '[]', 0, '2021-09-03 06:38:41', '2021-09-03 06:38:41', '2022-09-03 06:38:41'),
('feb89a8361876c6da157dfc0e93069283370eb2d3d24b9751ae76a73309cdf535fe08ff0efd12463', 50, 3, 'authToken', '[]', 0, '2021-10-04 10:55:38', '2021-10-04 10:55:38', '2022-10-04 10:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'UJk50W19u5MNq0jGyqDFHDraXjHWiSsAPj7SOuqe', NULL, 'http://localhost', 1, 0, 0, '2021-09-03 06:34:27', '2021-09-03 06:34:27'),
(2, NULL, 'Laravel Password Grant Client', 'zAzbjY4I0efV1WEqclKvznSmMzqIDJdiGLXFdwg9', 'users', 'http://localhost', 0, 1, 0, '2021-09-03 06:34:27', '2021-09-03 06:34:27'),
(3, NULL, 'Laravel Personal Access Client', 'YaHCWWeJBKyyjh4gMIUUUJZ9FC9iq5XHdWkuCE5G', NULL, 'http://localhost', 1, 0, 0, '2021-09-03 06:34:43', '2021-09-03 06:34:43'),
(4, NULL, 'Laravel Password Grant Client', 'v6cRxdWif1cFI6F8I5NfZXxzGsn3sxbW1HdnSnbo', 'users', 'http://localhost', 0, 1, 0, '2021-09-03 06:34:43', '2021-09-03 06:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-09-03 06:34:27', '2021-09-03 06:34:27'),
(2, 3, '2021-09-03 06:34:43', '2021-09-03 06:34:43');

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
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `reciever_id` bigint(20) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `sender_id`, `reciever_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 51, 50, '0', '2021-09-13 06:11:13', '2021-09-13 06:11:13'),
(2, 45, 58, '0', '2021-09-16 06:50:44', '2021-09-16 06:50:44'),
(3, 45, 58, '0', '2021-09-16 06:50:58', '2021-09-16 06:50:58'),
(4, 48, 58, '0', '2021-09-16 07:56:00', '2021-09-16 07:56:00'),
(5, 48, 58, '0', '2021-09-16 07:56:30', '2021-09-16 07:56:30'),
(6, 48, 45, '0', '2021-09-16 07:59:50', '2021-09-16 07:59:50'),
(7, 53, 45, '0', '2021-09-20 13:25:44', '2021-09-20 13:25:44'),
(8, 51, 54, '0', '2021-09-21 09:33:13', '2021-09-21 09:33:13'),
(9, 56, 51, '0', '2021-09-22 11:14:09', '2021-09-22 11:14:09'),
(10, 49, 58, '0', '2021-09-22 11:44:04', '2021-09-22 11:44:04'),
(11, 49, 54, '0', '2021-09-22 12:04:57', '2021-09-22 12:04:57'),
(12, 49, 53, '0', '2021-09-22 12:23:52', '2021-09-22 12:23:52'),
(13, 47, 58, '0', '2021-09-24 07:09:53', '2021-09-24 07:09:53'),
(14, 48, 54, '0', '2021-09-24 12:12:06', '2021-09-24 12:12:06'),
(15, 48, 49, '0', '2021-09-27 10:16:44', '2021-09-27 10:16:44'),
(16, 62, 45, '0', '2021-09-29 10:54:11', '2021-09-29 10:54:11'),
(17, 49, 62, '0', '2021-09-29 13:59:30', '2021-09-29 13:59:30'),
(18, 50, 49, '0', '2021-10-01 11:03:08', '2021-10-01 11:03:08'),
(19, 48, 47, '0', '2021-10-04 10:32:55', '2021-10-04 10:32:55'),
(20, 50, 48, '0', '2021-10-04 10:56:15', '2021-10-04 10:56:15'),
(21, 47, 49, '0', '2021-10-07 14:29:47', '2021-10-07 14:29:47'),
(22, 51, 49, '0', '2021-10-08 10:08:11', '2021-10-08 10:08:11'),
(23, 56, 64, '0', '2021-10-11 12:19:26', '2021-10-11 12:19:26'),
(24, 56, 65, '0', '2021-10-13 11:23:10', '2021-10-13 11:23:10'),
(25, 54, 65, '0', '2021-10-13 11:35:07', '2021-10-13 11:35:07'),
(26, 51, 65, '0', '2021-10-13 12:01:05', '2021-10-13 12:01:05'),
(27, 51, 58, '0', '2021-10-13 12:16:40', '2021-10-13 12:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('abc@getnada.com', '880727', '2021-09-03 06:47:07'),
('abc@getnada.com', '674211', '2021-09-03 12:40:57'),
('userbhai@getnada.com', '298872', '2021-09-08 09:06:46'),
('userbhai@getnada.com', '154959', '2021-09-08 09:09:12'),
('userbhai@getnada.com', '143028', '2021-09-08 09:14:42'),
('userbhai@getnada.com', '874211', '2021-09-08 09:22:08'),
('userbhai@getnada.com', '909379', '2021-09-08 09:28:37'),
('userbhai@getnada.com', '656258', '2021-09-08 09:46:17'),
('userbhai@getnada.com', '299567', '2021-09-08 10:29:27'),
('userbhai@getnada.com', '222735', '2021-09-09 12:35:48'),
('userbhai@getnada.com', '329133', '2021-09-09 12:37:06'),
('abc@getnada.com', '181510', '2021-09-09 12:37:55'),
('userbhai@getnada.com', '206491', '2021-09-09 13:24:52'),
('userbhai@getnada.com', '374745', '2021-09-09 13:25:11'),
('userbhai@getnada.com', '222441', '2021-09-09 13:25:43'),
('userbhai@getnada.com', '280443', '2021-09-09 14:30:48'),
('userbhai@getnada.com', '611876', '2021-09-09 14:31:34'),
('userbhai@getnada.com', '743444', '2021-09-10 13:49:23'),
('abc@getnada.com', '172330', '2021-09-15 12:36:56');

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prayers`
--

CREATE TABLE `prayers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('prayer','praise') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prayer_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prayers`
--

INSERT INTO `prayers` (`id`, `category_id`, `user_id`, `title`, `name`, `type`, `prayer_duration`, `description`, `created_at`, `updated_at`) VALUES
(11, 1, 52, 'dfd', 'dfdfdfd', 'praise', NULL, 'dfdfd', '2021-09-13 12:37:51', '2021-09-13 12:37:51'),
(67, 1, 45, 'dasd', 'dasdasd', 'praise', '00:00:00', 'asdasd', '2021-09-14 12:44:03', '2021-09-14 12:44:06'),
(69, 1, 54, 'AA', 'AAA', 'praise', '00:23:07', 'asdasd', '2021-09-14 12:50:21', '2021-09-22 09:30:04'),
(70, 1, 53, 'A', 'AAA', 'praise', '00:00:00', 'sasd', '2021-09-14 13:09:16', '2021-09-14 13:09:19'),
(71, 1, 54, 'cccc', 'ccccc', 'prayer', '00:00:00', 'asdasdas', '2021-09-14 13:09:45', '2021-09-21 09:50:54'),
(73, 1, 54, 'AAA', 'AAA', 'prayer', '00:00:00', 'asdasd', '2021-09-14 13:16:42', '2021-09-21 09:51:13'),
(74, 1, 54, 'asdasd', 'dasdas', 'praise', '00:00:05', 'dasdasd', '2021-09-14 13:17:05', '2021-09-14 13:17:17'),
(75, 1, 50, 'Prayer1', 'PRAYER ONE', 'prayer', NULL, 'AAAAAA', '2021-09-16 09:24:09', '2021-09-16 09:24:09'),
(76, 1, 48, 'Prayer 1', 'Prayer 1', 'prayer', NULL, 'noun. a devout petition to God or an object of worship. a spiritual communion with God or an object of worship, as in supplication, thanksgiving, adoration, or confession. the act or practice of praying to God or an object of worship. a formula or sequence of words used in or appointed for praying: the Lord\'s Prayer.noun. a devout petition to God or an object of worship. a spiritual communion with God or an object of worship, as in supplication, thanksgiving, adoration, or confession. the act or practice of praying to God or an object of worship. a formula or sequence of words used in or appointed for praying: the Lord\'s Prayer.', '2021-09-16 10:09:40', '2021-09-16 10:09:40'),
(77, 1, 48, 'Prayer 2', 'Prayer 2', 'prayer', NULL, 'noun. a devout petition to God or an object of worship. a spiritual communion with God or an object of worship, as in supplication, thanksgiving, adoration, or confession. the act or practice of praying to God or an object of worship. a formula or sequence of words used in or appointed for praying: the Lord\'s Prayer.', '2021-09-16 10:10:00', '2021-09-16 10:10:00'),
(78, 1, 48, 'Praise 1', 'Prasie 1', 'praise', NULL, 'dasdasd', '2021-09-16 10:10:16', '2021-09-16 10:10:16'),
(79, 1, 45, 'Prayer1', 'Prayer One', 'praise', '00:00:00', 'prayer-search', '2021-09-16 10:11:59', '2021-09-17 07:13:54'),
(80, 1, 45, 'BIG DATA', 'DATA', 'praise', '00:00:00', 'dasdas', '2021-09-16 11:20:11', '2021-09-17 07:14:29'),
(81, 1, 45, 'AB', 'AB NA KRO', 'praise', NULL, 'sdasd', '2021-09-16 11:32:00', '2021-09-16 11:32:00'),
(82, 1, 45, 'abc', 'qvc', 'praise', '00:00:27', 'yshshsag', '2021-09-17 07:15:37', '2021-09-17 16:57:21'),
(83, 1, 48, 'ABC', 'AAA', 'praise', '00:00:00', 'sdasasd', '2021-09-17 07:39:42', '2021-09-17 07:39:47'),
(85, 1, 45, 'TEST PRAYER', 'PRAYER', 'prayer', NULL, 'sdfsdf', '2021-09-20 12:14:03', '2021-09-20 12:14:03'),
(90, 1, 49, 'ADDING', 'ADD', 'prayer', '00:00:00', 'dasdasdas', '2021-09-27 07:39:42', '2021-10-08 09:55:11'),
(91, 1, 49, 'demo', 'qwe', 'praise', NULL, 'done', '2021-10-08 09:58:45', '2021-10-08 09:58:45'),
(92, 2, 51, 'happy', 'marriage', 'praise', '00:00:25', 'have to attend today', '2021-10-08 09:59:26', '2021-10-08 10:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reminder_date` date NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('once','weekly','monthly','daily') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reminder_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `user_id`, `reminder_date`, `title`, `type`, `reminder_time`, `created_at`, `updated_at`) VALUES
(26, 48, '2021-10-08', 'Reminder TEST', 'daily', '06:05 pm', '2021-10-08 18:00:05', '2021-10-08 18:00:05'),
(27, 48, '2021-10-08', 'Second Reminder', 'daily', '06:07 pm', '2021-10-08 18:00:05', '2021-10-08 18:00:05'),
(28, 47, '2021-10-08', 'Second Reminder', 'daily', '06:07 pm', '2021-10-08 18:00:05', '2021-10-08 18:00:05'),
(29, 47, '2021-10-08', 'test@reminder', 'daily', '06:14:44', '2021-10-08 13:12:53', '2021-10-08 13:12:53'),
(36, 63, '2021-10-08', 'testing again', 'daily', '07:05:37', '2021-10-08 14:05:40', '2021-10-08 14:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete_profile` tinyint(4) NOT NULL DEFAULT '0',
  `account_verified` tinyint(4) NOT NULL DEFAULT '0',
  `is_social` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_social_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_social_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `contact_no`, `email`, `email_verified_at`, `password`, `otp`, `profile_image`, `complete_profile`, `account_verified`, `is_social`, `user_social_token`, `user_social_type`, `user_device_type`, `user_device_token`, `time_zone`, `remember_token`, `created_at`, `updated_at`) VALUES
(45, 'Charles', 'Martin', '03312564321', 'userbhai@getnada.com', '2021-09-10 07:13:32', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '852012', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1632915161.jpg', 1, 1, NULL, NULL, NULL, 'ios', 'e20AJFWHekvjngABEbJmka:APA91bFEjRY9Rx0a1Lq2JeNzWqTr9jBxj49EUJZxeaSrNBGPqkihBVZeY0dhvGycX2yiRn434L0_mVx8AQXHmBuj6X1_2fFw9EWbDlU7yrgBtULKy0XiiUWucDx7Irzq_6YG7OA8Xw4t', 'Asia/Karachi', '769QVRGR7HevpIjeh10bE2MdqD7MmOLuyc8Sk342o5A8lBBKZXJC1OMMuSqc', '2021-09-10 07:03:07', '2021-10-08 12:35:41'),
(47, 'Dev', 'nads', '03222222222', 'dev.technado@gmail.com', '2021-09-10 07:36:45', NULL, NULL, NULL, 1, 1, NULL, '000887.39d32605000548c98539d9d01a199e10.1117', 'apple', 'ios', 'eXNwHbw0l0-bnVCOB5xEz0:APA91bEDOdTGF6rmV6NikwuaHUCEiwMLO3IaUPEeUX9fc-XJg7uClTdyVWSnz6aFe7_y-tHh2Cu6nRV8bCONAPGQwMNi2UloYGeXY2og4DAg4P5oenqT6V9xFpbYSGLUKscldkXhP-t0', 'Asia/Karachi', 'tMHeZOtGrHrkruhwpiw66Hbw44eJJrrOhzx8KAMOmJ2d3UVBEytpcmfPDcVW', '2021-09-10 07:36:45', '2021-10-08 07:26:47'),
(48, 'Mark', 'Miller', '03312578714', 'testing01.appsnado@gmail.com', '2021-09-10 12:37:53', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631785881.jpg', 1, 1, 'yes', '1008173360002346', 'facebook', 'android', 'cJinTfGYS0-3_XcMy85QkC:APA91bFHpzLsTR98RRnCCLjbVijWNAVqI7XrBQDq6I1W9A1Pxw78f3gYmMM6LQUNsUK8TfRqNTB95-oCkjlfCcefWmE6vgslQenrFYtIiiU0ov_zuAtkZNgaZ8-7vt-r4DcpTJo79p3q', 'Asia/Karachi', 'jqhRSVGAswPmibn4bUPCalDYLBn56m5gjQgxv5jBMGHTDbekPQZd6ggHItFg', '2021-09-10 12:37:53', '2021-10-01 12:30:49'),
(49, 'Martin', 'Bro', '03111111111', 'testing01.appsnado@gmail.com', '2021-09-10 13:08:41', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1633088406.jpg', 1, 1, 'yes', '102240342765355032897', 'google', 'ios', 'e20AJFWHekvjngABEbJmka:APA91bFEjRY9Rx0a1Lq2JeNzWqTr9jBxj49EUJZxeaSrNBGPqkihBVZeY0dhvGycX2yiRn434L0_mVx8AQXHmBuj6X1_2fFw9EWbDlU7yrgBtULKy0XiiUWucDx7Irzq_6YG7OA8Xw4t', 'Asia/Karachi', '4G5WbwjJNeqGE9M1xFy5u91vLzUsGafJ1wB1WSSrziRllmoFKYAq8WZvxvof', '2021-09-10 13:08:41', '2021-10-08 12:28:55'),
(50, 'Apps2', 'Nado', '0331258987', 'testing02.appsnado@gmail.com', '2021-09-10 13:09:50', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1633088470.jpg', 1, 1, 'yes', '112892646234063228620', 'google', 'ios', 'dK3IQ7ey7k79mnboB_O25G:APA91bG01SpGoSDT7n7AAjZ7lC6ovCPqciaWm0dBseQqZMQUzpdpvBosIO_Hrl-gwJjqBdTRl6ud68yF8JEDkykA239Oc__D64r1nsLWs-pqGsZIFZ5iT50Yk1l7inAI7E5rd_HUlIX3', NULL, 'WRFH9F92iQp5RhdG9b2yJrEwnlcQI0ZmTnenTxAR8S93lt045AMle0gDQiKz', '2021-09-10 13:09:50', '2021-10-04 10:55:38'),
(51, 'abc', 'xyz', '111111111111', 'abc@getnada.com', '2021-09-13 05:59:17', '$2y$10$sWxWL6A05W9RGzVlGIWVZ.v5X00wxEeSD6x0NkKPOex5BNzl9mHXS', '497111', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631710008.jpg', 1, 1, NULL, NULL, NULL, 'android', 'd_ADqWZxQv-z7l9fMcYO0P:APA91bEiDbA6wWyQpdMxI5evigVc0z0NGnD6U9VVsaLoj5yMUG2M0FsrZZROXBixsorMAA5R-Xp3kMg_5cM1wtMt32yxIhnyNsXMF1xWwZ943mPf-wFx6yphUFMIYQ2BfheLHsbm9qSq', 'Asia/Karachi', 'NIQljIwZXK', '2021-09-13 05:58:14', '2021-10-13 11:58:18'),
(52, NULL, NULL, NULL, 'userbhai2@getnada.com', '2021-09-13 06:56:52', NULL, NULL, NULL, 0, 1, 'yes', 'dsfsdfs6565hgfgfdg5', 'apple', 'ios', '45564454', NULL, NULL, '2021-09-13 06:56:52', '2021-09-13 06:56:52'),
(53, 'APPS', 'NADO', '03312478785', 'testing03.appsnado@gmail.com', '2021-09-14 12:32:15', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1633079396.jpg', 1, 1, 'yes', '113584058949264360136', 'google', 'ios', 'e20AJFWHekvjngABEbJmka:APA91bFEjRY9Rx0a1Lq2JeNzWqTr9jBxj49EUJZxeaSrNBGPqkihBVZeY0dhvGycX2yiRn434L0_mVx8AQXHmBuj6X1_2fFw9EWbDlU7yrgBtULKy0XiiUWucDx7Irzq_6YG7OA8Xw4t', 'Asia/Karachi', 'AXVg6Gc0DYqgFoRyUPH2hDZKYCa5TQXTpAutI73TN1RmQERByuXWcNTjuQEZ', '2021-09-14 12:32:15', '2021-10-08 12:35:06'),
(54, 'Henry', 'Miers', '0331247859', 'testing03.appsnado@gmail.com', '2021-09-14 12:46:50', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631625253.jpg', 1, 1, 'yes', '1020374712114745', 'facebook', 'ios', 'e20AJFWHekvjngABEbJmka:APA91bFEjRY9Rx0a1Lq2JeNzWqTr9jBxj49EUJZxeaSrNBGPqkihBVZeY0dhvGycX2yiRn434L0_mVx8AQXHmBuj6X1_2fFw9EWbDlU7yrgBtULKy0XiiUWucDx7Irzq_6YG7OA8Xw4t', 'Asia/Karachi', 'TfCTHjxQ9xDzjvQbkUwXAHEAh4EwtK4SbE4yyOWnCzjA7J9TGRGWpDQtc2Nj', '2021-09-14 12:46:50', '2021-10-08 12:34:32'),
(55, 'User One', 'One', '03312457898', 'user1@getnada.com', '2021-09-14 13:08:21', '$2y$10$ESQIQGBKV46mEgJj8vhdueLFcxLzAtbCi/eCgha/5kTQ7QM6.H3y.', '744822', NULL, 0, 1, NULL, NULL, NULL, 'ios', 'testing', NULL, 'FONqBFDgrB', '2021-09-14 13:08:03', '2021-09-14 13:08:21'),
(56, 'Ammar', 'Aijaz', NULL, 'ammar.aijaz.1020@gmail.com', '2021-09-15 12:27:00', NULL, NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw', 0, 1, 'yes', '2898844243700202', 'facebook', 'android', 'eS4ZX_-DQ6KWwRNVKUUGZ8:APA91bFdr3rmo4v-4q2Jg4DZNNfI7vghhmljIznilR_IS7juOdv0ELgx1HGyu5vijE2zxw17ECtDZTCTbhk-td0eTKjesE5re61kobQJFzGRnuNeEYMlfRz84vypXofNVrQk5UhOuXa6', 'Asia/Karachi', 'gt33dtIZrmmfmUibxl9WfMWQ1ecup80ZqIXDe5yMzxrV49r6BbnRzM5dPPuV', '2021-09-15 12:27:00', '2021-10-08 13:47:21'),
(57, 'Ammar', 'Aijaz', NULL, 'ammar.aijaz.1020@gmail.com', '2021-09-15 12:27:23', NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14Gj8-prDks1HkkPboA0kjbwjbvq85fMGC7QKLk_P_A=s96-c', 0, 1, 'yes', '117249898641514115894', 'google', 'android', 'dnegMHz9QhyQq9Wq_iio5V:APA91bHVINStkKBMYUvsNCOdtuLIcl9b5GRYD4leMOoB3EQmSG07a_sdzoRh6aIr1bCHqmcj6Te2Uz3qRm6wQUJ40F-t5aOav-QyoMmZiStOmT4seW7kGg8YXc3RtspKdrSEhL9i9FEJ', NULL, 'Mbe4vu1Tg6LvQF7oxOENUQw8j568lfY5A80xZFwOr1cr1sWGp8NAb32GRtnG', '2021-09-15 12:27:23', '2021-10-08 11:26:39'),
(58, 'alex', 'kyle', '03123456789', 'abcd@getnada.com', '2021-09-15 12:42:36', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '995644', NULL, 1, 1, NULL, NULL, NULL, 'android', 'fhCZ-GxVReKsaplH9mAWGZ:APA91bFPIJe7lFx4c5sVKuggf4a3efcwuH8s3rIulroQ33Hb-QT7Cwxjjdvg8iEMf1zCifm73kLFgl5IT0ymN9vuZWIDDoU78zMp58W3Dxlr74ZfiFw0N3ysne4OTpgop-Mvxjj39zIN', 'Asia/Karachi', '3faGNaCWOJ', '2021-09-15 12:41:04', '2021-10-13 12:17:14'),
(59, 'Lois', 'Walters', NULL, 'loiswalters.51750@gmail.com', '2021-09-15 15:08:49', NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJyreaQnp-i9UOwkeeN4kghLufMknm570hm-TFmD=s96-c', 0, 1, 'yes', '116236071211851184020', 'google', 'android', 'testing', NULL, NULL, '2021-09-15 15:08:49', '2021-09-15 15:08:49'),
(60, 'alex', 'kyle', '03000000000', 'abcd@getnada1.com', '2021-09-15 12:42:36', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '995644', NULL, 0, 1, NULL, NULL, NULL, 'android', 'testing', NULL, '3faGNaCWOJ', '2021-09-15 12:41:04', '2021-09-15 12:42:36'),
(61, 'Steve', 'Robertson', NULL, 'testing02.appsnado@gmail.com', '2021-09-24 06:57:12', NULL, NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1009106673244553&height=800&width=800&ext=1635058632&hash=AeRkq-RYj8DZjg8hBSA', 0, 1, 'yes', '1009106673244553', 'facebook', 'ios', 'testing', NULL, 'Dc4zJDpzdH3tjRWigTxBBjRKF3ykAYoxtG8IcHskDOONnKVvaCHyRxK5cLqe', '2021-09-24 06:57:12', '2021-09-24 06:57:12'),
(62, 'James', 'Martin', '03312564322', 'userbhai1@getnada.com', '2021-09-10 07:13:32', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '852012', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631276649.jpg', 1, 1, NULL, NULL, NULL, 'ios', 'fZsga6jIFUo6rStDfL1RyC:APA91bG9w2aH-5wV0_Cg8x42-dL7a_ejNCHGK1YBNPPXiAWxDKUOy4NCQgWSpaC7MZO-1tCP1rk21dmgABWAC3hlLnmYBSRuiluEhqKfVoUSoDUzQ41NlYlyRt_P7i8DUzp4LkOE757a', NULL, 'lFi0B5eC7c', '2021-09-10 07:03:07', '2021-09-29 10:55:07'),
(63, 'Ammar', 'Khan', NULL, 'ammaraijaz29@gmail.com', '2021-10-08 14:02:03', NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJxNf3b_GQ5Eme65dsHEsVj6NsqgaavdX4Evl740=s96-c', 0, 1, 'yes', '111186295989095319099', 'google', 'android', 'eS4ZX_-DQ6KWwRNVKUUGZ8:APA91bFdr3rmo4v-4q2Jg4DZNNfI7vghhmljIznilR_IS7juOdv0ELgx1HGyu5vijE2zxw17ECtDZTCTbhk-td0eTKjesE5re61kobQJFzGRnuNeEYMlfRz84vypXofNVrQk5UhOuXa6', 'Asia/Karachi', NULL, '2021-10-08 14:02:03', '2021-10-08 14:02:03'),
(64, 'abc', 'xyz', '33161221548', 'alex@getnada.com', '2021-10-11 12:11:46', '$2y$10$WK52UZThN1WQBmdOg8.STe55QXO9xtojITVWAj7NnP8Hr.KAsakUG', '492235', NULL, 0, 1, NULL, NULL, NULL, 'android', 'e70PtD7YTX-hHTctPMRPyh:APA91bG7FmLM3kgfiGsw7Q1i8xjZq0ZnOnzkFF9C42Wz8yQo_BD84wg1MkFFuCUyNyk_QwoIoK2TSDFvEwe0-DlFVf82fjIgoF4Z-i8qG-JlITYEpYV85qeqDU5i-CjuhrAd9fTRB8zd', 'Asia/Karachi', 'qXfVf4M2gq', '2021-10-11 12:11:01', '2021-10-13 11:10:23'),
(65, 'alexa', 'alex', '03333333333', 'alexa@getnada.com', '2021-10-13 11:13:43', '$2y$10$Cos0MCIi.naXUGfRKot0y.EhwK/zBgd3hIvj/gsye5LVRZwGWJf0q', '741722', NULL, 0, 1, NULL, NULL, NULL, 'android', 'cTHSZ_3XT4O8qTFZzkrrst:APA91bHxnZ5CpQbkZXFUoqtXpi-Zi-g6ce32--jXsViSFjyig_MfGGwGUiX31-IdB9z1z7XEGus_NfR-HQ2eVyFbDgAH4StHZkXwV--NX33ThuzroyptvoNIYwCMwNqdWSZ7Dlk1qtKH', NULL, 'OBdm8vSy6p', '2021-10-13 11:12:39', '2021-10-13 11:13:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_users`
--
ALTER TABLE `call_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_attachments`
--
ALTER TABLE `chat_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prayers`
--
ALTER TABLE `prayers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `call_users`
--
ALTER TABLE `call_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `chat_attachments`
--
ALTER TABLE `chat_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prayers`
--
ALTER TABLE `prayers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
