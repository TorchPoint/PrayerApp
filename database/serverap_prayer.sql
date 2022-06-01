-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2022 at 04:26 PM
-- Server version: 10.3.35-MariaDB
-- PHP Version: 7.4.29

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
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `profile_image`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Smith', 'admin@getnada.com', '$2y$10$/ysoXlhjXiHNr/z6vdO.buzMluovPKyFAaZOUcLgvqRjz/20A81Wq', 'admin', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1639045723.jpg', '2021-12-07 07:03:23', '2021-12-09 10:51:04'),
(2, 'John', 'Smith', 'admin1@getnada.com', '$2y$10$qtZcvtwQRROOFb8D3NT7ke7Ctjsn0YahbSxVBpH9ZQTKJzlMJPL82', 'admin', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1639045723.jpg', '2021-12-07 07:03:23', '2021-12-09 10:51:04');

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
(1, 47, NULL, 60, 'prayer_app+km1635754550019', NULL, NULL, NULL),
(2, 67, NULL, 61, 'prayer_app+km1635760988439', NULL, NULL, NULL),
(3, 67, NULL, 61, 'prayer_app+km1635761028209', NULL, NULL, NULL),
(4, 67, NULL, 61, 'prayer_app+km1635761133507', NULL, NULL, NULL),
(5, 67, NULL, 61, 'prayer_app+km1635761216900', NULL, NULL, NULL),
(6, 67, NULL, 61, 'prayer_app+km1635761349225', NULL, NULL, NULL),
(7, 67, NULL, 61, 'prayer_app+km1635761391309', NULL, NULL, NULL),
(8, 67, NULL, 61, 'prayer_app+km1635761435284', NULL, NULL, NULL),
(9, 67, NULL, 61, 'prayer_app+km1635761516890', NULL, NULL, NULL),
(10, 67, NULL, 61, 'prayer_app+km1635761608808', NULL, NULL, NULL),
(11, 67, NULL, 61, 'prayer_app+km1635761643643', NULL, NULL, NULL),
(12, 67, NULL, 61, 'prayer_app+km1635761850472', NULL, NULL, NULL),
(13, 67, NULL, 61, 'prayer_app+km1635761913490', NULL, NULL, NULL),
(14, 67, NULL, 61, 'prayer_app+km1635762059468', NULL, NULL, NULL),
(15, 67, NULL, 61, 'prayer_app+km1635762512580', NULL, NULL, NULL),
(16, 67, NULL, 61, 'prayer_app+km1635762597235', NULL, NULL, NULL),
(17, 67, NULL, 61, 'prayer_app+km1635762662625', NULL, NULL, NULL),
(18, 67, NULL, 61, 'prayer_app+km1635762953592', NULL, NULL, NULL),
(19, 67, NULL, 61, 'prayer_app+km1635762990529', NULL, NULL, NULL),
(20, 67, NULL, 61, 'prayer_app+km1635763267605', NULL, NULL, NULL),
(21, 67, NULL, 61, 'prayer_app+km1635763515667', NULL, NULL, NULL),
(22, 67, NULL, 61, 'prayer_app+km1635763534659', NULL, NULL, NULL),
(23, 67, NULL, 61, 'prayer_app+km1635763679894', NULL, NULL, NULL),
(24, 67, NULL, 61, 'prayer_app+km1635763818626', NULL, NULL, NULL),
(25, 67, NULL, 61, 'prayer_app+km1635763856575', NULL, NULL, NULL),
(26, 67, NULL, 61, 'prayer_app+km1635763958194', NULL, NULL, NULL),
(27, 67, NULL, 61, 'prayer_app+km1635764086505', NULL, NULL, NULL),
(28, 67, NULL, 61, 'prayer_app+km1635764145130', NULL, NULL, NULL),
(29, 67, NULL, 61, 'prayer_app+km1635764216846', NULL, NULL, NULL),
(30, 67, NULL, 61, 'prayer_app+km1635764324624', NULL, NULL, NULL),
(31, 67, NULL, NULL, 'prayer_app+km1635764653100', NULL, NULL, NULL),
(32, 67, NULL, 61, 'prayer_app+km1635765122699', NULL, NULL, NULL),
(33, 67, NULL, 61, 'prayer_app+km1635765142537', NULL, NULL, NULL),
(34, 67, NULL, 61, 'prayer_app+km1635765430624', NULL, NULL, NULL),
(35, 67, NULL, 61, 'prayer_app+km1635765452701', NULL, NULL, NULL),
(36, 67, NULL, 61, 'prayer_app+km1635765575970', NULL, NULL, NULL),
(37, 67, NULL, 61, 'prayer_app+km1635765792235', NULL, NULL, NULL),
(38, 67, NULL, 61, 'prayer_app+km1635765811829', NULL, NULL, NULL),
(39, 67, NULL, 61, 'prayer_app+km1635765883946', NULL, NULL, NULL),
(40, 67, NULL, 61, 'prayer_app+km1635765919589', NULL, NULL, NULL),
(41, 67, NULL, 61, 'prayer_app+km1635766038744', NULL, NULL, NULL),
(42, 67, NULL, 61, 'prayer_app+km1635766163606', NULL, NULL, NULL),
(43, 67, NULL, 61, 'prayer_app+km1635766172368', NULL, NULL, NULL),
(44, 67, NULL, 61, 'prayer_app+km1635766548135', NULL, NULL, NULL),
(45, 67, NULL, 61, 'prayer_app+km1635766573781', NULL, NULL, NULL),
(46, 67, NULL, 61, 'prayer_app+km1635766722103', NULL, NULL, NULL),
(47, 67, NULL, 61, 'prayer_app+km1635766747450', NULL, NULL, NULL),
(48, 67, NULL, 61, 'prayer_app+km1635766777176', NULL, NULL, NULL),
(49, 67, NULL, 61, 'prayer_app+km1635766812901', NULL, NULL, NULL),
(50, 67, NULL, 61, 'prayer_app+km1635766839622', NULL, NULL, NULL),
(51, 67, NULL, 61, 'prayer_app+km1635766898801', NULL, NULL, NULL),
(52, 67, NULL, 61, 'prayer_app+km1635766918609', NULL, NULL, NULL),
(53, 67, NULL, 61, 'prayer_app+km1635766950778', NULL, NULL, NULL),
(54, 67, NULL, 61, 'prayer_app+km1635767027392', NULL, NULL, NULL),
(55, 67, NULL, 61, 'prayer_app+km1635767100412', NULL, NULL, NULL),
(56, 67, NULL, 61, 'prayer_app+km1635767116074', NULL, NULL, NULL),
(57, 67, NULL, 61, 'prayer_app+km1635767152988', NULL, NULL, NULL),
(58, 67, NULL, 61, 'prayer_app+km1635767266926', NULL, NULL, NULL),
(59, 67, NULL, 61, 'prayer_app+km1635767290632', NULL, NULL, NULL),
(60, 67, NULL, 61, 'prayer_app+km1635767307683', NULL, NULL, NULL),
(61, 67, NULL, 61, 'prayer_app+km1635768350075', NULL, NULL, NULL),
(62, 67, NULL, 61, 'prayer_app+km1635768435585', NULL, NULL, NULL),
(63, 67, NULL, 61, 'prayer_app+km1635768649148', NULL, NULL, NULL),
(64, 67, NULL, 61, 'prayer_app+km1635769111950', NULL, NULL, NULL),
(65, 67, NULL, 61, 'prayer_app+km1635769171907', NULL, NULL, NULL),
(66, 67, NULL, 61, 'prayer_app+km1635769209337', NULL, NULL, NULL),
(67, 67, NULL, 61, 'prayer_app+km1635769307629', NULL, NULL, NULL),
(68, 67, NULL, 61, 'prayer_app+km1635769324456', NULL, NULL, NULL),
(69, 67, NULL, 61, 'prayer_app+km1635769341715', NULL, NULL, NULL),
(70, 67, NULL, 61, 'prayer_app+km1635769355210', NULL, NULL, NULL),
(71, 67, NULL, 61, 'prayer_app+km1635769525012', NULL, NULL, NULL),
(72, 67, NULL, 61, 'prayer_app+km1635769578246', NULL, NULL, NULL),
(73, 67, NULL, 61, 'prayer_app+km1635769650757', NULL, NULL, NULL),
(74, 67, NULL, 61, 'prayer_app+km1635769770668', NULL, NULL, NULL),
(75, 67, NULL, 61, 'prayer_app+km1635769813264', NULL, NULL, NULL),
(76, 67, NULL, 61, 'prayer_app+km1635769871230', NULL, NULL, NULL),
(77, 67, NULL, 61, 'prayer_app+km1635769952825', NULL, NULL, NULL),
(78, 67, NULL, 61, 'prayer_app+km1635770041836', NULL, NULL, NULL),
(79, 67, NULL, 61, 'prayer_app+km1635770098190', NULL, NULL, NULL),
(80, 67, NULL, 61, 'prayer_app+km1635770129474', NULL, NULL, NULL),
(81, 67, NULL, 61, 'prayer_app+km1635770354542', NULL, NULL, NULL),
(82, 67, NULL, 61, 'prayer_app+km1635770380780', NULL, NULL, NULL),
(83, 67, NULL, 61, 'prayer_app+km1635770517498', NULL, NULL, NULL),
(84, 67, NULL, 61, 'prayer_app+km1635770535351', NULL, NULL, NULL),
(85, 67, NULL, 61, 'prayer_app+km1635770954982', NULL, NULL, NULL),
(86, 67, NULL, 61, 'prayer_app+km1635771012381', NULL, NULL, NULL),
(87, 67, NULL, 61, 'prayer_app+km1635771126880', NULL, NULL, NULL),
(88, 67, NULL, 61, 'prayer_app+km1635771153075', NULL, NULL, NULL),
(89, 67, NULL, 61, 'prayer_app+km1635771180246', NULL, NULL, NULL),
(90, 67, NULL, 61, 'prayer_app+km1635771227963', NULL, NULL, NULL),
(91, 67, NULL, NULL, 'prayer_app+km1635771249117', NULL, NULL, NULL),
(92, 67, NULL, 61, 'prayer_app+km1635771329229', NULL, NULL, NULL),
(93, 67, NULL, NULL, 'prayer_app+km1635771362776', NULL, NULL, NULL),
(94, 67, NULL, NULL, 'prayer_app+km1635771396198', NULL, NULL, NULL),
(95, 67, NULL, 61, 'prayer_app+km1635771438613', NULL, NULL, NULL),
(96, 61, NULL, 67, 'prayer_app+km1635772021062', NULL, NULL, NULL),
(97, 67, NULL, NULL, 'prayer_app+km1635773056240', NULL, NULL, NULL),
(98, 67, NULL, NULL, 'prayer_app+km1635773104624', NULL, NULL, NULL),
(99, 67, NULL, NULL, 'prayer_app+km1635773215143', NULL, NULL, NULL),
(100, 67, NULL, NULL, 'prayer_app+km1635773390946', NULL, NULL, NULL),
(101, 67, NULL, NULL, 'prayer_app+km1635773460983', NULL, NULL, NULL),
(102, 61, NULL, NULL, 'prayer_app+km1635773519224', NULL, NULL, NULL),
(103, 67, NULL, NULL, 'prayer_app+km1635773604105', NULL, NULL, NULL),
(104, 67, NULL, NULL, 'prayer_app+km1635773654585', NULL, NULL, NULL),
(105, 67, NULL, NULL, 'prayer_app+km1635773718794', NULL, NULL, NULL),
(106, 67, NULL, NULL, 'prayer_app+km1635773838626', NULL, NULL, NULL),
(107, 67, NULL, NULL, 'prayer_app+km1635773868619', NULL, NULL, NULL),
(108, 61, NULL, NULL, 'prayer_app+km1635774174173', NULL, NULL, NULL),
(109, 61, NULL, NULL, 'prayer_app+km1635774214019', NULL, NULL, NULL),
(110, 61, NULL, NULL, 'prayer_app+km1635774246911', NULL, NULL, NULL),
(111, 61, NULL, NULL, 'prayer_app+km1635774311328', NULL, NULL, NULL),
(112, 61, NULL, NULL, 'prayer_app+km1635774345024', NULL, NULL, NULL),
(113, 61, NULL, NULL, 'prayer_app+km1635774380227', NULL, NULL, NULL),
(114, 61, NULL, NULL, 'prayer_app+km1635774450442', NULL, NULL, NULL),
(115, 61, NULL, NULL, 'prayer_app+km1635774500778', NULL, NULL, NULL),
(116, 61, NULL, NULL, 'prayer_app+km1635774572167', NULL, NULL, NULL),
(117, 61, NULL, NULL, 'prayer_app+km1635774642804', NULL, NULL, NULL),
(118, 61, NULL, NULL, 'prayer_app+km1635774859218', NULL, NULL, NULL),
(119, 61, NULL, NULL, 'prayer_app+km1635774926859', NULL, NULL, NULL),
(120, 61, NULL, NULL, 'prayer_app+km1635774960487', NULL, NULL, NULL),
(121, 61, NULL, NULL, 'prayer_app+km1635775038087', NULL, NULL, NULL),
(122, 61, NULL, NULL, 'prayer_app+km1635775097863', NULL, NULL, NULL),
(123, 61, NULL, NULL, 'prayer_app+km1635775218663', NULL, NULL, NULL),
(124, 61, NULL, NULL, 'prayer_app+km1635775270653', NULL, NULL, NULL),
(125, 61, NULL, NULL, 'prayer_app+km1635775327577', NULL, NULL, NULL),
(126, 61, NULL, NULL, 'prayer_app+km1635775679763', NULL, NULL, NULL),
(127, 61, NULL, NULL, 'prayer_app+km1635775707395', NULL, NULL, NULL),
(128, 61, NULL, NULL, 'prayer_app+km1635775822176', NULL, NULL, NULL),
(129, 61, NULL, NULL, 'prayer_app+km1635775926904', NULL, NULL, NULL),
(130, 61, NULL, NULL, 'prayer_app+km1635776155978', NULL, NULL, NULL),
(131, 61, NULL, NULL, 'prayer_app+km1635776310571', NULL, NULL, NULL),
(132, 61, NULL, NULL, 'prayer_app+km1635776327679', NULL, NULL, NULL),
(133, 61, NULL, NULL, 'prayer_app+km1635776355210', NULL, NULL, NULL),
(134, 67, NULL, 61, 'prayer_app+km1635776387734', NULL, NULL, NULL),
(135, 67, NULL, 61, 'prayer_app+km1635776423436', NULL, NULL, NULL),
(136, 67, NULL, 61, 'prayer_app+km1635776440954', NULL, NULL, NULL),
(137, 67, NULL, 61, 'prayer_app+km1635776457939', NULL, NULL, NULL),
(138, 67, NULL, 61, 'prayer_app+km1635776584260', NULL, NULL, NULL),
(139, 67, NULL, 61, 'prayer_app+km1635776655930', NULL, NULL, NULL),
(140, 67, NULL, 61, 'prayer_app+km1635776686204', NULL, NULL, NULL),
(141, 67, NULL, 61, 'prayer_app+km1635776818406', NULL, NULL, NULL),
(142, 67, NULL, 61, 'prayer_app+km1635776887413', NULL, NULL, NULL),
(143, 67, NULL, 61, 'prayer_app+km1635776907496', NULL, NULL, NULL),
(144, 67, NULL, 61, 'prayer_app+km1635776959989', NULL, NULL, NULL),
(145, 67, NULL, 61, 'prayer_app+km1635776977340', NULL, NULL, NULL),
(146, 67, NULL, 61, 'prayer_app+km1635777023983', NULL, NULL, NULL),
(147, 67, NULL, 61, 'prayer_app+km1635777048423', NULL, NULL, NULL),
(148, 48, NULL, 66, 'prayer_app+km1635833339046', NULL, NULL, NULL),
(149, 48, NULL, 66, 'prayer_app+km1635833369766', NULL, NULL, NULL),
(150, 48, NULL, 66, 'prayer_app+km1635833423993', NULL, NULL, NULL),
(151, 48, NULL, 66, 'prayer_app+km1635833500557', NULL, NULL, NULL),
(152, 48, NULL, 66, 'prayer_app+km1635833524177', NULL, NULL, NULL),
(153, 48, NULL, 66, 'prayer_app+km1635833591805', NULL, NULL, NULL),
(154, 48, NULL, 66, 'prayer_app+km1635833614456', NULL, NULL, NULL),
(155, 48, NULL, 66, 'prayer_app+km1635833671399', NULL, NULL, NULL),
(156, 48, NULL, 66, 'prayer_app+km1635833699135', NULL, NULL, NULL),
(157, 48, NULL, 66, 'prayer_app+km1635833791560', NULL, NULL, NULL),
(158, 48, NULL, 66, 'prayer_app+km1635833856345', NULL, NULL, NULL),
(159, 48, NULL, 66, 'prayer_app+km1635833896664', NULL, NULL, NULL),
(160, 48, NULL, 66, 'prayer_app+km1635833968310', NULL, NULL, NULL),
(161, 48, NULL, 66, 'prayer_app+km1635834081627', NULL, NULL, NULL),
(162, 48, NULL, 66, 'prayer_app+km1635834151548', NULL, NULL, NULL),
(163, 48, NULL, 66, 'prayer_app+km1635834222429', NULL, NULL, NULL),
(164, 48, NULL, 66, 'prayer_app+km1635834389627', NULL, NULL, NULL),
(165, 48, NULL, 66, 'prayer_app+km1635834476372', NULL, NULL, NULL),
(166, 48, NULL, 66, 'prayer_app+km1635834510928', NULL, NULL, NULL),
(167, 48, NULL, 66, 'prayer_app+km1635834597899', NULL, NULL, NULL),
(168, 48, NULL, 66, 'prayer_app+km1635834664124', NULL, NULL, NULL),
(169, 48, NULL, 66, 'prayer_app+km1635834743821', NULL, NULL, NULL),
(170, 48, NULL, 66, 'prayer_app+km1635834778061', NULL, NULL, NULL),
(171, 48, NULL, 66, 'prayer_app+km1635834817125', NULL, NULL, NULL),
(172, 48, NULL, 66, 'prayer_app+km1635834848064', NULL, NULL, NULL),
(173, 48, NULL, 66, 'prayer_app+km1635835008280', NULL, NULL, NULL),
(174, 48, NULL, 66, 'prayer_app+km1635835029213', NULL, NULL, NULL),
(175, 48, NULL, 66, 'prayer_app+km1635835052689', NULL, NULL, NULL),
(176, 48, NULL, 66, 'prayer_app+km1635835164326', NULL, NULL, NULL),
(177, 48, NULL, 66, 'prayer_app+km1635835187508', NULL, NULL, NULL),
(178, 48, NULL, 66, 'prayer_app+km1635835217956', NULL, NULL, NULL),
(179, 48, NULL, 66, 'prayer_app+km1635835321884', NULL, NULL, NULL),
(180, 48, NULL, 66, 'prayer_app+km1635835460885', NULL, NULL, NULL),
(181, 48, NULL, 66, 'prayer_app+km1635835488819', NULL, NULL, NULL),
(182, 48, NULL, 66, 'prayer_app+km1635835541597', NULL, NULL, NULL),
(183, 48, NULL, NULL, 'prayer_app+km1635835587809', NULL, NULL, NULL),
(184, 48, NULL, NULL, 'prayer_app+km1635835649771', NULL, NULL, NULL),
(185, 48, NULL, 66, 'prayer_app+km1635835751236', NULL, NULL, NULL),
(186, 48, NULL, 66, 'prayer_app+km1635835779778', NULL, NULL, NULL),
(187, 48, NULL, 66, 'prayer_app+km1635835822882', NULL, NULL, NULL),
(188, 48, NULL, 66, 'prayer_app+km1635835841751', NULL, NULL, NULL),
(189, 48, NULL, 66, 'prayer_app+km1635835910886', NULL, NULL, NULL),
(190, 48, NULL, 66, 'prayer_app+km1635835969686', NULL, NULL, NULL),
(191, 48, NULL, 66, 'prayer_app+km1635835988699', NULL, NULL, NULL),
(192, 48, NULL, 66, 'prayer_app+km1635836026004', NULL, NULL, NULL),
(193, 48, NULL, 66, 'prayer_app+km1635836051561', NULL, NULL, NULL),
(194, 48, NULL, 66, 'prayer_app+km1635836093263', NULL, NULL, NULL),
(195, 48, NULL, 66, 'prayer_app+km1635836168829', NULL, NULL, NULL),
(196, 48, NULL, 66, 'prayer_app+km1635836237376', NULL, NULL, NULL),
(197, 48, NULL, 66, 'prayer_app+km1635836667333', NULL, NULL, NULL),
(198, 48, NULL, 66, 'prayer_app+km1635836717548', NULL, NULL, NULL),
(199, 48, NULL, 66, 'prayer_app+km1635836781670', NULL, NULL, NULL),
(200, 48, NULL, 66, 'prayer_app+km1635836813540', NULL, NULL, NULL),
(201, 48, NULL, 66, 'prayer_app+km1635836839329', NULL, NULL, NULL),
(202, 48, NULL, 66, 'prayer_app+km1635836887283', NULL, NULL, NULL),
(203, 48, NULL, 66, 'prayer_app+km1635836909429', NULL, NULL, NULL),
(204, 48, NULL, 66, 'prayer_app+km1635837016461', NULL, NULL, NULL),
(205, 48, NULL, NULL, 'prayer_app+km1635837046813', NULL, NULL, NULL),
(206, 48, NULL, NULL, 'prayer_app+km1635837071792', NULL, NULL, NULL),
(207, 48, NULL, NULL, 'prayer_app+km1635837220613', NULL, NULL, NULL),
(208, 48, NULL, NULL, 'prayer_app+km1635837295757', NULL, NULL, NULL),
(209, 66, NULL, NULL, 'prayer_app+km1635837330548', NULL, NULL, NULL),
(210, 48, NULL, NULL, 'prayer_app+km1635837352841', NULL, NULL, NULL),
(211, 48, NULL, NULL, 'prayer_app+km1635837385881', NULL, NULL, NULL),
(212, 48, NULL, NULL, 'prayer_app+km1635837429054', NULL, NULL, NULL),
(213, 48, NULL, NULL, 'prayer_app+km1635837501178', NULL, NULL, NULL),
(214, 66, NULL, 48, 'prayer_app+km1635837651258', NULL, NULL, NULL),
(215, 66, NULL, 48, 'prayer_app+km1635837682186', NULL, NULL, NULL),
(216, 66, NULL, 48, 'prayer_app+km1635837921276', NULL, NULL, NULL),
(217, 66, NULL, 48, 'prayer_app+km1635837939438', NULL, NULL, NULL),
(218, 66, NULL, 48, 'prayer_app+km1635838059065', NULL, NULL, NULL),
(219, 67, NULL, 66, 'prayer_app+km1635838508669', NULL, NULL, NULL),
(220, 66, NULL, 67, 'prayer_app+km1635838673984', NULL, NULL, NULL),
(221, 66, NULL, 67, 'prayer_app+km1635838764699', NULL, NULL, NULL),
(222, 66, NULL, 67, 'prayer_app+km1635838780330', NULL, NULL, NULL),
(223, 66, NULL, 67, 'prayer_app+km1635838790869', NULL, NULL, NULL),
(224, 66, NULL, 67, 'prayer_app+km1635838806978', NULL, NULL, NULL),
(225, 66, NULL, NULL, 'prayer_app+km1635838835295', NULL, NULL, NULL),
(226, 66, NULL, NULL, 'prayer_app+km1635838868611', NULL, NULL, NULL),
(227, 66, NULL, NULL, 'prayer_app+km1635838911056', NULL, NULL, NULL),
(228, 67, NULL, 66, 'prayer_app+km1635838925952', NULL, NULL, NULL),
(229, 67, NULL, 66, 'prayer_app+km1635839560349', NULL, NULL, NULL),
(230, 67, NULL, 48, 'prayer_app+km1635840235199', NULL, NULL, NULL),
(231, 67, NULL, 48, 'prayer_app+km1635840262595', NULL, NULL, NULL),
(232, 67, NULL, 48, 'prayer_app+km1635840283878', NULL, NULL, NULL),
(233, 67, NULL, 48, 'prayer_app+km1635840306701', NULL, NULL, NULL),
(234, 67, NULL, 48, 'prayer_app+km1635840327483', NULL, NULL, NULL),
(235, 67, NULL, 48, 'prayer_app+km1635840345506', NULL, NULL, NULL),
(236, 67, NULL, 48, 'prayer_app+km1635840446595', NULL, NULL, NULL),
(237, 67, NULL, 48, 'prayer_app+km1635840507003', NULL, NULL, NULL),
(238, 67, NULL, 48, 'prayer_app+km1635855056649', NULL, NULL, NULL),
(239, 67, NULL, 48, 'prayer_app+km1635855077187', NULL, NULL, NULL),
(240, 67, NULL, 48, 'prayer_app+km1635855134668', NULL, NULL, NULL),
(241, 67, NULL, 48, 'prayer_app+km1635855166203', NULL, NULL, NULL),
(242, 67, NULL, 48, 'prayer_app+km1635855181842', NULL, NULL, NULL),
(243, 67, NULL, 48, 'prayer_app+km1635855198026', NULL, NULL, NULL),
(244, 67, NULL, 48, 'prayer_app+km1635855242873', NULL, NULL, NULL),
(245, 67, NULL, 48, 'prayer_app+km1635855286805', NULL, NULL, NULL),
(246, 48, NULL, 67, 'prayer_app+km1635855354390', NULL, NULL, NULL),
(247, 67, NULL, 48, 'prayer_app+km1635855402955', NULL, NULL, NULL),
(248, 67, NULL, 48, 'prayer_app+km1635856014560', NULL, NULL, NULL),
(249, 47, NULL, 60, 'prayer_app+km1636017422168', NULL, NULL, NULL),
(250, 70, NULL, NULL, 'prayer_app+km1636148161025', NULL, NULL, NULL),
(251, 48, NULL, 47, 'prayer_app+km1643268276891', NULL, NULL, NULL),
(252, 48, NULL, 47, 'prayer_app+km1643268280285', NULL, NULL, NULL),
(253, 48, NULL, 47, 'prayer_app+km1643268519364', NULL, NULL, NULL),
(254, 51, NULL, 64, 'prayer_app+km1643268949455', NULL, NULL, NULL),
(255, 64, NULL, 51, 'prayer_app+km1643268976536', NULL, NULL, NULL),
(256, 64, NULL, 51, 'prayer_app+km1643269001828', NULL, NULL, NULL),
(257, 64, NULL, 51, 'prayer_app+km1643269025438', NULL, NULL, NULL),
(258, 64, NULL, 51, 'prayer_app+km1643269044087', NULL, NULL, NULL),
(259, 51, NULL, 64, 'prayer_app+km1643269092972', NULL, NULL, NULL),
(260, 51, NULL, 64, 'prayer_app+km1643269133958', NULL, NULL, NULL),
(261, 51, NULL, 64, 'prayer_app+km1643269220929', NULL, NULL, NULL),
(262, 64, NULL, 51, 'prayer_app+km1643269232007', NULL, NULL, NULL),
(263, 51, NULL, 64, 'prayer_app+km1643269312330', NULL, NULL, NULL),
(264, 51, NULL, 64, 'prayer_app+km1643269361153', NULL, NULL, NULL),
(265, 64, NULL, 51, 'prayer_app+km1643269389936', NULL, NULL, NULL);

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
(1, 47, 'prayer_app+km1635754550019', 'left', NULL, NULL),
(2, 67, 'prayer_app+km1635760988439', 'left', NULL, NULL),
(3, 61, 'prayer_app+km1635760988439', 'left', NULL, NULL),
(4, 67, 'prayer_app+km1635761028209', 'left', NULL, NULL),
(5, 67, 'prayer_app+km1635761133507', 'left', NULL, NULL),
(6, 67, 'prayer_app+km1635761216900', 'left', NULL, NULL),
(7, 67, 'prayer_app+km1635761349225', 'left', NULL, NULL),
(8, 67, 'prayer_app+km1635761391309', 'left', NULL, NULL),
(9, 67, 'prayer_app+km1635761435284', 'left', NULL, NULL),
(10, 67, 'prayer_app+km1635761516890', 'left', NULL, NULL),
(11, 67, 'prayer_app+km1635761608808', 'left', NULL, NULL),
(12, 67, 'prayer_app+km1635761643643', 'left', NULL, NULL),
(13, 67, 'prayer_app+km1635761850472', 'left', NULL, NULL),
(14, 61, 'prayer_app+km1635761850472', 'left', NULL, NULL),
(15, 67, 'prayer_app+km1635761913490', 'left', NULL, NULL),
(16, 61, 'prayer_app+km1635761913490', 'left', NULL, NULL),
(17, 67, 'prayer_app+km1635762059468', 'left', NULL, NULL),
(18, 61, 'prayer_app+km1635762059468', 'left', NULL, NULL),
(19, 67, 'prayer_app+km1635762512580', 'left', NULL, NULL),
(20, 67, 'prayer_app+km1635762597235', 'left', NULL, NULL),
(21, 67, 'prayer_app+km1635762662625', 'left', NULL, NULL),
(22, 67, 'prayer_app+km1635762953592', 'left', NULL, NULL),
(23, 67, 'prayer_app+km1635762990529', 'left', NULL, NULL),
(24, 67, 'prayer_app+km1635763267605', 'left', NULL, NULL),
(25, 67, 'prayer_app+km1635763515667', 'left', NULL, NULL),
(26, 67, 'prayer_app+km1635763534659', 'left', NULL, NULL),
(27, 67, 'prayer_app+km1635763679894', 'left', NULL, NULL),
(28, 67, 'prayer_app+km1635763818626', 'left', NULL, NULL),
(29, 61, 'prayer_app+km1635763818626', 'left', NULL, NULL),
(30, 67, 'prayer_app+km1635763856575', 'left', NULL, NULL),
(31, 61, 'prayer_app+km1635763856575', 'left', NULL, NULL),
(32, 67, 'prayer_app+km1635763958194', 'left', NULL, NULL),
(33, 67, 'prayer_app+km1635764086505', 'left', NULL, NULL),
(34, 61, 'prayer_app+km1635764086505', 'left', NULL, NULL),
(35, 67, 'prayer_app+km1635764145130', 'left', NULL, NULL),
(36, 61, 'prayer_app+km1635764145130', 'left', NULL, NULL),
(37, 67, 'prayer_app+km1635764216846', 'left', NULL, NULL),
(38, 61, 'prayer_app+km1635764216846', 'left', NULL, NULL),
(39, 67, 'prayer_app+km1635764324624', 'left', NULL, NULL),
(40, 61, 'prayer_app+km1635764324624', 'left', NULL, NULL),
(41, 67, 'prayer_app+km1635764653100', 'left', NULL, NULL),
(42, 61, 'prayer_app+km1635764653100', 'left', NULL, NULL),
(43, 67, 'prayer_app+km1635765122699', 'left', NULL, NULL),
(44, 61, 'prayer_app+km1635765122699', 'left', NULL, NULL),
(45, 67, 'prayer_app+km1635765142537', 'left', NULL, NULL),
(46, 67, 'prayer_app+km1635765430624', 'left', NULL, NULL),
(47, 61, 'prayer_app+km1635765430624', 'left', NULL, NULL),
(48, 67, 'prayer_app+km1635765452701', 'left', NULL, NULL),
(49, 67, 'prayer_app+km1635765575970', 'left', NULL, NULL),
(50, 67, 'prayer_app+km1635765792235', 'left', NULL, NULL),
(51, 61, 'prayer_app+km1635765792235', 'left', NULL, NULL),
(52, 67, 'prayer_app+km1635765811829', 'left', NULL, NULL),
(53, 67, 'prayer_app+km1635765883946', 'left', NULL, NULL),
(54, 67, 'prayer_app+km1635765919589', 'left', NULL, NULL),
(55, 61, 'prayer_app+km1635765919589', 'left', NULL, NULL),
(56, 67, 'prayer_app+km1635766038744', 'left', NULL, NULL),
(57, 67, 'prayer_app+km1635766163606', 'left', NULL, NULL),
(58, 67, 'prayer_app+km1635766172368', 'left', NULL, NULL),
(59, 61, 'prayer_app+km1635766172368', 'left', NULL, NULL),
(60, 67, 'prayer_app+km1635766548135', 'left', NULL, NULL),
(61, 67, 'prayer_app+km1635766573781', 'left', NULL, NULL),
(62, 67, 'prayer_app+km1635766722103', 'left', NULL, NULL),
(63, 67, 'prayer_app+km1635766747450', 'left', NULL, NULL),
(64, 61, 'prayer_app+km1635766747450', 'left', NULL, NULL),
(65, 67, 'prayer_app+km1635766777176', 'left', NULL, NULL),
(66, 67, 'prayer_app+km1635766812901', 'left', NULL, NULL),
(67, 67, 'prayer_app+km1635766839622', 'left', NULL, NULL),
(68, 67, 'prayer_app+km1635766898801', 'left', NULL, NULL),
(69, 67, 'prayer_app+km1635766918609', 'left', NULL, NULL),
(70, 67, 'prayer_app+km1635766950778', 'left', NULL, NULL),
(71, 67, 'prayer_app+km1635767027392', 'left', NULL, NULL),
(72, 67, 'prayer_app+km1635767100412', 'left', NULL, NULL),
(73, 61, 'prayer_app+km1635767100412', 'left', NULL, NULL),
(74, 67, 'prayer_app+km1635767116074', 'left', NULL, NULL),
(75, 67, 'prayer_app+km1635767152988', 'left', NULL, NULL),
(76, 67, 'prayer_app+km1635767266926', 'left', NULL, NULL),
(77, 67, 'prayer_app+km1635767290632', 'left', NULL, NULL),
(78, 67, 'prayer_app+km1635767307683', 'left', NULL, NULL),
(79, 61, 'prayer_app+km1635767307683', 'left', NULL, NULL),
(80, 67, 'prayer_app+km1635768350075', 'left', NULL, NULL),
(81, 61, 'prayer_app+km1635768350075', 'left', NULL, NULL),
(82, 67, 'prayer_app+km1635768435585', 'left', NULL, NULL),
(83, 61, 'prayer_app+km1635768435585', 'left', NULL, NULL),
(84, 67, 'prayer_app+km1635768649148', 'left', NULL, NULL),
(85, 61, 'prayer_app+km1635768649148', 'left', NULL, NULL),
(86, 67, 'prayer_app+km1635769111950', 'left', NULL, NULL),
(87, 67, 'prayer_app+km1635769171907', 'left', NULL, NULL),
(88, 67, 'prayer_app+km1635769209337', 'left', NULL, NULL),
(89, 67, 'prayer_app+km1635769307629', 'left', NULL, NULL),
(90, 61, 'prayer_app+km1635769307629', 'left', NULL, NULL),
(91, 67, 'prayer_app+km1635769324456', 'left', NULL, NULL),
(92, 61, 'prayer_app+km1635769324456', 'left', NULL, NULL),
(93, 67, 'prayer_app+km1635769341715', 'left', NULL, NULL),
(94, 67, 'prayer_app+km1635769355210', 'left', NULL, NULL),
(95, 61, 'prayer_app+km1635769355210', 'left', NULL, NULL),
(96, 67, 'prayer_app+km1635769525012', 'left', NULL, NULL),
(97, 67, 'prayer_app+km1635769578246', 'left', NULL, NULL),
(98, 67, 'prayer_app+km1635769650757', 'left', NULL, NULL),
(99, 67, 'prayer_app+km1635769770668', 'left', NULL, NULL),
(100, 67, 'prayer_app+km1635769813264', 'left', NULL, NULL),
(101, 67, 'prayer_app+km1635769871230', 'left', NULL, NULL),
(102, 67, 'prayer_app+km1635769952825', 'left', NULL, NULL),
(103, 67, 'prayer_app+km1635770041836', 'left', NULL, NULL),
(104, 67, 'prayer_app+km1635770098190', 'left', NULL, NULL),
(105, 67, 'prayer_app+km1635770129474', 'left', NULL, NULL),
(106, 61, 'prayer_app+km1635770129474', 'left', NULL, NULL),
(107, 67, 'prayer_app+km1635770354542', 'left', NULL, NULL),
(108, 61, 'prayer_app+km1635770354542', 'left', NULL, NULL),
(109, 67, 'prayer_app+km1635770380780', 'left', NULL, NULL),
(110, 67, 'prayer_app+km1635770517498', 'left', NULL, NULL),
(111, 67, 'prayer_app+km1635770535351', 'left', NULL, NULL),
(112, 67, 'prayer_app+km1635770954982', 'left', NULL, NULL),
(113, 61, 'prayer_app+km1635770954982', 'left', NULL, NULL),
(114, 67, 'prayer_app+km1635771012381', 'left', NULL, NULL),
(115, 67, 'prayer_app+km1635771126880', 'left', NULL, NULL),
(116, 67, 'prayer_app+km1635771153075', 'left', NULL, NULL),
(117, 67, 'prayer_app+km1635771180246', 'left', NULL, NULL),
(118, 67, 'prayer_app+km1635771227963', 'left', NULL, NULL),
(119, 67, 'prayer_app+km1635771249117', 'left', NULL, NULL),
(120, 67, 'prayer_app+km1635771329229', 'left', NULL, NULL),
(121, 61, 'prayer_app+km1635771329229', 'left', NULL, NULL),
(122, 67, 'prayer_app+km1635771362776', 'left', NULL, NULL),
(123, 61, 'prayer_app+km1635771362776', 'left', NULL, NULL),
(124, 67, 'prayer_app+km1635771396198', 'joined', NULL, NULL),
(125, 67, 'prayer_app+km1635771438613', 'left', NULL, NULL),
(126, 61, 'prayer_app+km1635772021062', 'left', NULL, NULL),
(127, 67, 'prayer_app+km1635773056240', 'left', NULL, NULL),
(128, 67, 'prayer_app+km1635773104624', 'left', NULL, NULL),
(129, 61, 'prayer_app+km1635773104624', 'left', NULL, NULL),
(130, 67, 'prayer_app+km1635773215143', 'left', NULL, NULL),
(131, 67, 'prayer_app+km1635773390946', 'left', NULL, NULL),
(132, 67, 'prayer_app+km1635773460983', 'left', NULL, NULL),
(133, 61, 'prayer_app+km1635773519224', 'left', NULL, NULL),
(134, 67, 'prayer_app+km1635773519224', 'left', NULL, NULL),
(135, 67, 'prayer_app+km1635773604105', 'left', NULL, NULL),
(136, 61, 'prayer_app+km1635773604105', 'left', NULL, NULL),
(137, 67, 'prayer_app+km1635773654585', 'left', NULL, NULL),
(138, 61, 'prayer_app+km1635773654585', 'left', NULL, NULL),
(139, 67, 'prayer_app+km1635773718794', 'left', NULL, NULL),
(140, 61, 'prayer_app+km1635773718794', 'left', NULL, NULL),
(141, 67, 'prayer_app+km1635773838626', 'left', NULL, NULL),
(142, 61, 'prayer_app+km1635773838626', 'left', NULL, NULL),
(143, 67, 'prayer_app+km1635773868619', 'left', NULL, NULL),
(144, 61, 'prayer_app+km1635774174173', 'left', NULL, NULL),
(145, 67, 'prayer_app+km1635774174173', 'left', NULL, NULL),
(146, 61, 'prayer_app+km1635774214019', 'left', NULL, NULL),
(147, 67, 'prayer_app+km1635774214019', 'left', NULL, NULL),
(148, 61, 'prayer_app+km1635774246911', 'left', NULL, NULL),
(149, 61, 'prayer_app+km1635774311328', 'left', NULL, NULL),
(150, 61, 'prayer_app+km1635774345024', 'left', NULL, NULL),
(151, 61, 'prayer_app+km1635774380227', 'left', NULL, NULL),
(152, 67, 'prayer_app+km1635774380227', 'left', NULL, NULL),
(153, 61, 'prayer_app+km1635774450442', 'left', NULL, NULL),
(154, 61, 'prayer_app+km1635774500778', 'left', NULL, NULL),
(155, 67, 'prayer_app+km1635774500778', 'left', NULL, NULL),
(156, 61, 'prayer_app+km1635774572167', 'left', NULL, NULL),
(157, 67, 'prayer_app+km1635774572167', 'left', NULL, NULL),
(158, 61, 'prayer_app+km1635774642804', 'left', NULL, NULL),
(159, 61, 'prayer_app+km1635774859218', 'left', NULL, NULL),
(160, 61, 'prayer_app+km1635774926859', 'left', NULL, NULL),
(161, 61, 'prayer_app+km1635774960487', 'left', NULL, NULL),
(162, 61, 'prayer_app+km1635775038087', 'left', NULL, NULL),
(163, 67, 'prayer_app+km1635775038087', 'left', NULL, NULL),
(164, 61, 'prayer_app+km1635775097863', 'left', NULL, NULL),
(165, 61, 'prayer_app+km1635775218663', 'left', NULL, NULL),
(166, 61, 'prayer_app+km1635775270653', 'left', NULL, NULL),
(167, 61, 'prayer_app+km1635775327577', 'left', NULL, NULL),
(168, 61, 'prayer_app+km1635775679763', 'left', NULL, NULL),
(169, 61, 'prayer_app+km1635775707395', 'left', NULL, NULL),
(170, 67, 'prayer_app+km1635775707395', 'left', NULL, NULL),
(171, 61, 'prayer_app+km1635775822176', 'left', NULL, NULL),
(172, 61, 'prayer_app+km1635775926904', 'left', NULL, NULL),
(173, 61, 'prayer_app+km1635776155978', 'joined', NULL, NULL),
(174, 61, 'prayer_app+km1635776310571', 'left', NULL, NULL),
(175, 61, 'prayer_app+km1635776327679', 'left', NULL, NULL),
(176, 67, 'prayer_app+km1635776327679', 'left', NULL, NULL),
(177, 61, 'prayer_app+km1635776355210', 'left', NULL, NULL),
(178, 67, 'prayer_app+km1635776387734', 'left', NULL, NULL),
(179, 67, 'prayer_app+km1635776423436', 'left', NULL, NULL),
(180, 67, 'prayer_app+km1635776440954', 'left', NULL, NULL),
(181, 67, 'prayer_app+km1635776457939', 'left', NULL, NULL),
(182, 61, 'prayer_app+km1635776457939', 'left', NULL, NULL),
(183, 67, 'prayer_app+km1635776584260', 'left', NULL, NULL),
(184, 61, 'prayer_app+km1635776584260', 'left', NULL, NULL),
(185, 67, 'prayer_app+km1635776655930', 'left', NULL, NULL),
(186, 61, 'prayer_app+km1635776655930', 'left', NULL, NULL),
(187, 67, 'prayer_app+km1635776686204', 'left', NULL, NULL),
(188, 61, 'prayer_app+km1635776686204', 'left', NULL, NULL),
(189, 67, 'prayer_app+km1635776818406', 'left', NULL, NULL),
(190, 61, 'prayer_app+km1635776818406', 'left', NULL, NULL),
(191, 67, 'prayer_app+km1635776887413', 'left', NULL, NULL),
(192, 61, 'prayer_app+km1635776887413', 'left', NULL, NULL),
(193, 67, 'prayer_app+km1635776907496', 'left', NULL, NULL),
(194, 67, 'prayer_app+km1635776959989', 'left', NULL, NULL),
(195, 67, 'prayer_app+km1635776977340', 'left', NULL, NULL),
(196, 61, 'prayer_app+km1635776977340', 'left', NULL, NULL),
(197, 67, 'prayer_app+km1635777023983', 'left', NULL, NULL),
(198, 61, 'prayer_app+km1635777023983', 'left', NULL, NULL),
(199, 67, 'prayer_app+km1635777048423', 'left', NULL, NULL),
(200, 61, 'prayer_app+km1635777048423', 'left', NULL, NULL),
(201, 48, 'prayer_app+km1635833339046', 'left', NULL, NULL),
(202, 66, 'prayer_app+km1635833339046', 'left', NULL, NULL),
(203, 48, 'prayer_app+km1635833369766', 'left', NULL, NULL),
(204, 66, 'prayer_app+km1635833369766', 'left', NULL, NULL),
(205, 48, 'prayer_app+km1635833423993', 'left', NULL, NULL),
(206, 48, 'prayer_app+km1635833500557', 'left', NULL, NULL),
(207, 48, 'prayer_app+km1635833524177', 'left', NULL, NULL),
(208, 48, 'prayer_app+km1635833591805', 'left', NULL, NULL),
(209, 48, 'prayer_app+km1635833614456', 'left', NULL, NULL),
(210, 48, 'prayer_app+km1635833671399', 'left', NULL, NULL),
(211, 48, 'prayer_app+km1635833699135', 'left', NULL, NULL),
(212, 48, 'prayer_app+km1635833791560', 'left', NULL, NULL),
(213, 48, 'prayer_app+km1635833856345', 'left', NULL, NULL),
(214, 66, 'prayer_app+km1635833856345', 'left', NULL, NULL),
(215, 48, 'prayer_app+km1635833896664', 'left', NULL, NULL),
(216, 48, 'prayer_app+km1635833968310', 'left', NULL, NULL),
(217, 48, 'prayer_app+km1635834081627', 'left', NULL, NULL),
(218, 48, 'prayer_app+km1635834151548', 'left', NULL, NULL),
(219, 48, 'prayer_app+km1635834222429', 'left', NULL, NULL),
(220, 48, 'prayer_app+km1635834389627', 'left', NULL, NULL),
(221, 48, 'prayer_app+km1635834476372', 'left', NULL, NULL),
(222, 48, 'prayer_app+km1635834510928', 'left', NULL, NULL),
(223, 48, 'prayer_app+km1635834597899', 'left', NULL, NULL),
(224, 48, 'prayer_app+km1635834664124', 'left', NULL, NULL),
(225, 48, 'prayer_app+km1635834743821', 'left', NULL, NULL),
(226, 48, 'prayer_app+km1635834778061', 'left', NULL, NULL),
(227, 48, 'prayer_app+km1635834817125', 'left', NULL, NULL),
(228, 48, 'prayer_app+km1635834848064', 'left', NULL, NULL),
(229, 48, 'prayer_app+km1635835008280', 'left', NULL, NULL),
(230, 48, 'prayer_app+km1635835029213', 'left', NULL, NULL),
(231, 66, 'prayer_app+km1635835029213', 'left', NULL, NULL),
(232, 48, 'prayer_app+km1635835052689', 'left', NULL, NULL),
(233, 48, 'prayer_app+km1635835164326', 'left', NULL, NULL),
(234, 66, 'prayer_app+km1635835164326', 'left', NULL, NULL),
(235, 48, 'prayer_app+km1635835187508', 'left', NULL, NULL),
(236, 48, 'prayer_app+km1635835217956', 'left', NULL, NULL),
(237, 48, 'prayer_app+km1635835321884', 'left', NULL, NULL),
(238, 48, 'prayer_app+km1635835460885', 'left', NULL, NULL),
(239, 48, 'prayer_app+km1635835488819', 'left', NULL, NULL),
(240, 48, 'prayer_app+km1635835541597', 'left', NULL, NULL),
(241, 48, 'prayer_app+km1635835587809', 'left', NULL, NULL),
(242, 66, 'prayer_app+km1635835587809', 'left', NULL, NULL),
(243, 48, 'prayer_app+km1635835649771', 'left', NULL, NULL),
(244, 48, 'prayer_app+km1635835751236', 'left', NULL, NULL),
(245, 48, 'prayer_app+km1635835779778', 'left', NULL, NULL),
(246, 48, 'prayer_app+km1635835822882', 'left', NULL, NULL),
(247, 48, 'prayer_app+km1635835841751', 'left', NULL, NULL),
(248, 66, 'prayer_app+km1635835841751', 'left', NULL, NULL),
(249, 48, 'prayer_app+km1635835910886', 'left', NULL, NULL),
(250, 48, 'prayer_app+km1635835969686', 'left', NULL, NULL),
(251, 48, 'prayer_app+km1635835988699', 'left', NULL, NULL),
(252, 48, 'prayer_app+km1635836026004', 'left', NULL, NULL),
(253, 48, 'prayer_app+km1635836051561', 'left', NULL, NULL),
(254, 48, 'prayer_app+km1635836093263', 'left', NULL, NULL),
(255, 48, 'prayer_app+km1635836168829', 'left', NULL, NULL),
(256, 48, 'prayer_app+km1635836237376', 'left', NULL, NULL),
(257, 48, 'prayer_app+km1635836667333', 'left', NULL, NULL),
(258, 48, 'prayer_app+km1635836717548', 'left', NULL, NULL),
(259, 48, 'prayer_app+km1635836781670', 'left', NULL, NULL),
(260, 48, 'prayer_app+km1635836813540', 'left', NULL, NULL),
(261, 48, 'prayer_app+km1635836839329', 'left', NULL, NULL),
(262, 48, 'prayer_app+km1635836887283', 'left', NULL, NULL),
(263, 48, 'prayer_app+km1635836909429', 'left', NULL, NULL),
(264, 48, 'prayer_app+km1635837016461', 'left', NULL, NULL),
(265, 48, 'prayer_app+km1635837046813', 'left', NULL, NULL),
(266, 48, 'prayer_app+km1635837071792', 'left', NULL, NULL),
(267, 66, 'prayer_app+km1635837071792', 'left', NULL, NULL),
(268, 48, 'prayer_app+km1635837220613', 'left', NULL, NULL),
(269, 66, 'prayer_app+km1635837220613', 'left', NULL, NULL),
(270, 48, 'prayer_app+km1635837295757', 'left', NULL, NULL),
(271, 66, 'prayer_app+km1635837295757', 'left', NULL, NULL),
(272, 66, 'prayer_app+km1635837330548', 'left', NULL, NULL),
(273, 48, 'prayer_app+km1635837330548', 'left', NULL, NULL),
(274, 48, 'prayer_app+km1635837352841', 'left', NULL, NULL),
(275, 66, 'prayer_app+km1635837352841', 'left', NULL, NULL),
(276, 48, 'prayer_app+km1635837385881', 'left', NULL, NULL),
(277, 66, 'prayer_app+km1635837385881', 'left', NULL, NULL),
(278, 48, 'prayer_app+km1635837429054', 'left', NULL, NULL),
(279, 66, 'prayer_app+km1635837429054', 'left', NULL, NULL),
(280, 48, 'prayer_app+km1635837501178', 'left', NULL, NULL),
(281, 66, 'prayer_app+km1635837501178', 'left', NULL, NULL),
(282, 66, 'prayer_app+km1635837651258', 'left', NULL, NULL),
(283, 48, 'prayer_app+km1635837651258', 'left', NULL, NULL),
(284, 66, 'prayer_app+km1635837682186', 'left', NULL, NULL),
(285, 48, 'prayer_app+km1635837682186', 'left', NULL, NULL),
(286, 66, 'prayer_app+km1635837921276', 'left', NULL, NULL),
(287, 48, 'prayer_app+km1635837921276', 'left', NULL, NULL),
(288, 66, 'prayer_app+km1635837939438', 'left', NULL, NULL),
(289, 48, 'prayer_app+km1635837939438', 'left', NULL, NULL),
(290, 66, 'prayer_app+km1635838059065', 'left', NULL, NULL),
(291, 48, 'prayer_app+km1635838059065', 'left', NULL, NULL),
(292, 67, 'prayer_app+km1635838508669', 'left', NULL, NULL),
(293, 66, 'prayer_app+km1635838508669', 'left', NULL, NULL),
(294, 66, 'prayer_app+km1635838673984', 'left', NULL, NULL),
(295, 67, 'prayer_app+km1635838673984', 'left', NULL, NULL),
(296, 66, 'prayer_app+km1635838764699', 'left', NULL, NULL),
(297, 67, 'prayer_app+km1635838764699', 'left', NULL, NULL),
(298, 66, 'prayer_app+km1635838780330', 'left', NULL, NULL),
(299, 67, 'prayer_app+km1635838780330', 'left', NULL, NULL),
(300, 66, 'prayer_app+km1635838790869', 'left', NULL, NULL),
(301, 67, 'prayer_app+km1635838790869', 'left', NULL, NULL),
(302, 66, 'prayer_app+km1635838806978', 'left', NULL, NULL),
(303, 66, 'prayer_app+km1635838835295', 'joined', NULL, NULL),
(304, 67, 'prayer_app+km1635838835295', 'left', NULL, NULL),
(305, 66, 'prayer_app+km1635838868611', 'left', NULL, NULL),
(306, 67, 'prayer_app+km1635838868611', 'left', NULL, NULL),
(307, 66, 'prayer_app+km1635838911056', 'left', NULL, NULL),
(308, 67, 'prayer_app+km1635838911056', 'left', NULL, NULL),
(309, 67, 'prayer_app+km1635838925952', 'left', NULL, NULL),
(310, 66, 'prayer_app+km1635838925952', 'left', NULL, NULL),
(311, 67, 'prayer_app+km1635839560349', 'left', NULL, NULL),
(312, 66, 'prayer_app+km1635839560349', 'left', NULL, NULL),
(313, 67, 'prayer_app+km1635840235199', 'left', NULL, NULL),
(314, 67, 'prayer_app+km1635840262595', 'left', NULL, NULL),
(315, 48, 'prayer_app+km1635840262595', 'left', NULL, NULL),
(316, 67, 'prayer_app+km1635840283878', 'joined', NULL, NULL),
(317, 48, 'prayer_app+km1635840283878', 'left', NULL, NULL),
(318, 67, 'prayer_app+km1635840306701', 'left', NULL, NULL),
(319, 67, 'prayer_app+km1635840327483', 'left', NULL, NULL),
(320, 67, 'prayer_app+km1635840345506', 'joined', NULL, NULL),
(321, 48, 'prayer_app+km1635840345506', 'left', NULL, NULL),
(322, 67, 'prayer_app+km1635840446595', 'left', NULL, NULL),
(323, 67, 'prayer_app+km1635840507003', 'left', NULL, NULL),
(324, 67, 'prayer_app+km1635855056649', 'left', NULL, NULL),
(325, 48, 'prayer_app+km1635855056649', 'left', NULL, NULL),
(326, 67, 'prayer_app+km1635855077187', 'left', NULL, NULL),
(327, 48, 'prayer_app+km1635855077187', 'left', NULL, NULL),
(328, 67, 'prayer_app+km1635855134668', 'left', NULL, NULL),
(329, 67, 'prayer_app+km1635855166203', 'left', NULL, NULL),
(330, 67, 'prayer_app+km1635855181842', 'left', NULL, NULL),
(331, 67, 'prayer_app+km1635855198026', 'left', NULL, NULL),
(332, 48, 'prayer_app+km1635855198026', 'left', NULL, NULL),
(333, 67, 'prayer_app+km1635855242873', 'left', NULL, NULL),
(334, 67, 'prayer_app+km1635855286805', 'left', NULL, NULL),
(335, 48, 'prayer_app+km1635855354390', 'left', NULL, NULL),
(336, 67, 'prayer_app+km1635855402955', 'left', NULL, NULL),
(337, 67, 'prayer_app+km1635856014560', 'left', NULL, NULL),
(338, 47, 'prayer_app+km1636017422168', 'joined', NULL, NULL),
(339, 70, 'prayer_app+km1636148161025', 'joined', NULL, NULL),
(340, 48, 'prayer_app+km1643268276891', 'joined', NULL, NULL),
(341, 48, 'prayer_app+km1643268280285', 'joined', NULL, NULL),
(342, 48, 'prayer_app+km1643268519364', 'joined', NULL, NULL),
(343, 51, 'prayer_app+km1643268949455', 'left', NULL, NULL),
(344, 64, 'prayer_app+km1643268976536', 'left', NULL, NULL),
(345, 64, 'prayer_app+km1643269001828', 'left', NULL, NULL),
(346, 64, 'prayer_app+km1643269025438', 'left', NULL, NULL),
(347, 64, 'prayer_app+km1643269044087', 'left', NULL, NULL),
(348, 51, 'prayer_app+km1643269044087', 'left', NULL, NULL),
(349, 51, 'prayer_app+km1643269092972', 'left', NULL, NULL),
(350, 51, 'prayer_app+km1643269133958', 'left', NULL, NULL),
(351, 51, 'prayer_app+km1643269220929', 'left', NULL, NULL),
(352, 64, 'prayer_app+km1643269232007', 'left', NULL, NULL),
(353, 51, 'prayer_app+km1643269312330', 'left', NULL, NULL),
(354, 64, 'prayer_app+km1643269312330', 'left', NULL, NULL),
(355, 51, 'prayer_app+km1643269361153', 'left', NULL, NULL),
(356, 64, 'prayer_app+km1643269361153', 'left', NULL, NULL),
(357, 64, 'prayer_app+km1643269389936', 'left', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Education', 1, '2021-09-09 15:10:12', '2021-09-09 15:10:12'),
(2, 'Wedding', 0, '2021-09-09 15:10:12', '2022-05-24 16:24:29');

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
(23, 53, NULL, 26, '????', NULL, NULL, NULL, NULL),
(24, 53, NULL, 26, '2315615614', NULL, NULL, NULL, NULL),
(26, 62, NULL, 26, 'HELLO GUYS I AM ALSO HERE', NULL, NULL, NULL, NULL),
(28, 53, NULL, 26, 'COOL', NULL, NULL, NULL, NULL),
(29, 62, NULL, 26, 'PRAYER TIME!!!', NULL, NULL, NULL, NULL),
(31, 53, NULL, 26, 'LET GO', NULL, NULL, NULL, NULL),
(75, 51, NULL, 40, 'hi', NULL, NULL, NULL, NULL),
(80, 54, 51, NULL, 'HELLO?', NULL, NULL, NULL, NULL),
(81, 54, 51, NULL, '??', NULL, NULL, NULL, NULL),
(82, 54, 51, NULL, '???', NULL, NULL, NULL, NULL),
(88, 51, NULL, 40, ' hhhh', NULL, NULL, NULL, NULL),
(89, 51, NULL, 40, 'hello everyone', NULL, NULL, NULL, NULL),
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
(104, 58, 51, NULL, 'hzhsh', NULL, NULL, NULL, NULL),
(105, 66, 61, NULL, 'hello steve', NULL, NULL, NULL, NULL),
(106, 61, 66, NULL, 'hello testing', NULL, NULL, NULL, NULL),
(107, 61, 66, NULL, 'hiii', NULL, NULL, NULL, NULL),
(108, 61, 66, NULL, 'hoii', NULL, NULL, NULL, NULL),
(109, 61, 66, NULL, 'hhh', NULL, NULL, NULL, NULL),
(110, 61, 66, NULL, 'hhh', NULL, NULL, NULL, NULL),
(111, 66, 61, NULL, 'what??', NULL, NULL, NULL, NULL),
(112, 66, 61, NULL, '::5&-', NULL, NULL, NULL, NULL),
(113, 66, 61, NULL, 'ghhhg', NULL, NULL, NULL, NULL),
(114, 66, 61, NULL, 'hhhhh', NULL, NULL, NULL, NULL),
(115, 66, 61, NULL, 'hfjj', NULL, NULL, NULL, NULL),
(116, 66, 61, NULL, 'gzjgzjgzkgjzcnczjzj', NULL, NULL, NULL, NULL),
(117, 66, 61, NULL, 'hhh', NULL, NULL, NULL, NULL),
(118, 66, 61, NULL, 'hhhh', NULL, NULL, NULL, NULL),
(119, 66, 61, NULL, 'kkkkk', NULL, NULL, NULL, NULL),
(120, 66, 61, NULL, '???', NULL, NULL, NULL, NULL),
(121, 61, 66, NULL, 'mgmdgmd', NULL, NULL, NULL, NULL),
(122, 61, 66, NULL, 'nnfjfj', NULL, NULL, NULL, NULL),
(123, 66, 61, NULL, 'jiii?', NULL, NULL, NULL, NULL),
(124, 66, 61, NULL, ';--&&_', NULL, NULL, NULL, NULL),
(125, 66, 61, NULL, 'jtjsisi', NULL, NULL, NULL, NULL),
(126, 66, 61, NULL, 'nfjfj', NULL, NULL, NULL, NULL),
(127, 66, 61, NULL, 'ncjnn', NULL, NULL, NULL, NULL),
(128, 66, 61, NULL, 'ncnfjhd', NULL, NULL, NULL, NULL),
(129, 66, 61, NULL, 'jjfjfj', NULL, NULL, NULL, NULL),
(130, 66, 61, NULL, 'ncznnc', NULL, NULL, NULL, NULL),
(131, 66, 61, NULL, 'jfsjsfj', NULL, NULL, NULL, NULL),
(132, 66, 61, NULL, 'mgjj', NULL, NULL, NULL, NULL),
(133, 66, 61, NULL, 'ncznzcnn', NULL, NULL, NULL, NULL),
(134, 66, 61, NULL, 'bxbdb', NULL, NULL, NULL, NULL),
(135, 66, 61, NULL, 'nfjfjfj', NULL, NULL, NULL, NULL),
(136, 66, 61, NULL, 'jdgmgxk', NULL, NULL, NULL, NULL),
(137, 66, 61, NULL, 'gggg', NULL, NULL, NULL, NULL),
(138, 66, 61, NULL, 'ngsjsgjdgj', NULL, NULL, NULL, NULL),
(139, 66, 61, NULL, 'mxvnngnmx', NULL, NULL, NULL, NULL),
(140, 66, 61, NULL, 'jggzjjgdk', NULL, NULL, NULL, NULL),
(141, 66, 61, NULL, 'mgdkhkyk', NULL, NULL, NULL, NULL),
(142, 66, 61, NULL, 'gjjjf', NULL, NULL, NULL, NULL),
(143, 66, 61, NULL, 'ncnfjh', NULL, NULL, NULL, NULL),
(144, 66, 61, NULL, 'fjfhfhh', NULL, NULL, NULL, NULL),
(170, 66, NULL, 50, 'hello wow members', NULL, NULL, NULL, NULL),
(186, 51, 58, NULL, 'hdhhd', NULL, NULL, NULL, NULL),
(187, 51, NULL, 52, 'hi', NULL, NULL, NULL, NULL),
(188, 51, NULL, 52, 'hi', NULL, NULL, NULL, NULL),
(194, 66, NULL, 52, 'fault is fault', NULL, NULL, NULL, NULL),
(195, 70, NULL, 55, 'Ladies when are we praying?', NULL, NULL, NULL, NULL),
(196, 72, 58, NULL, 'hello', NULL, NULL, NULL, NULL);

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
(1, 'terms-and-conditions', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available...', NULL, '2021-12-09 10:59:45'),
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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(17, 54, 'Group 1', NULL, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(18, 53, 'Group Two', NULL, '2021-09-23 12:24:58', '2021-10-26 13:01:41'),
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
(40, 51, 'twstttstsgs', NULL, '2021-10-08 10:10:15', '2021-10-08 10:10:15'),
(50, 66, 'wow group', NULL, '2021-10-26 06:21:18', '2021-10-26 06:21:18'),
(52, 51, 'Alex, miller, abc', NULL, '2021-10-27 11:55:53', '2021-10-27 11:55:53'),
(54, 61, 'test@call', NULL, '2021-11-01 13:42:40', '2021-11-01 13:42:40'),
(55, 70, 'Women Ministry', NULL, '2021-11-05 21:34:11', '2021-11-05 21:34:11'),
(56, 69, 'test', NULL, '2021-11-09 19:19:01', '2021-11-09 19:19:01');

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
(7, 3, 58, '2021-09-20 13:08:05', '2021-09-20 13:08:05'),
(8, 2, 58, '2021-09-20 13:19:45', '2021-09-20 13:19:45'),
(10, 1, 53, '2021-09-20 13:26:23', '2021-09-20 13:26:23'),
(12, 4, 53, '2021-09-20 13:41:53', '2021-09-20 13:41:53'),
(13, 4, 58, '2021-09-20 13:41:53', '2021-09-20 13:41:53'),
(16, 5, 53, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(17, 5, 58, '2021-09-20 13:42:53', '2021-09-20 13:42:53'),
(19, 6, 51, '2021-09-21 08:13:35', '2021-09-21 08:13:35'),
(20, 7, 51, '2021-09-21 09:32:03', '2021-09-21 09:32:03'),
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
(33, 13, 51, '2021-09-22 11:15:50', '2021-09-22 11:15:50'),
(36, 14, 58, '2021-09-22 11:35:42', '2021-09-22 11:35:42'),
(40, 16, 58, '2021-09-22 11:45:12', '2021-09-22 11:45:12'),
(41, 17, 54, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(43, 17, 51, '2021-09-23 10:42:56', '2021-09-23 10:42:56'),
(44, 18, 53, '2021-09-23 12:24:58', '2021-09-23 12:24:58'),
(51, 20, 53, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(52, 20, 58, '2021-09-27 07:05:45', '2021-09-27 07:05:45'),
(54, 21, 54, '2021-09-27 10:10:07', '2021-09-27 10:10:07'),
(58, 23, 53, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(59, 23, 58, '2021-09-27 10:14:01', '2021-09-27 10:14:01'),
(62, 24, 58, '2021-09-27 10:17:09', '2021-09-27 10:17:09'),
(64, 1, 62, '2021-09-20 13:07:04', '2021-09-20 13:07:04'),
(66, 25, 62, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(67, 25, 53, '2021-09-29 13:59:54', '2021-09-29 13:59:54'),
(69, 26, 62, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(70, 26, 53, '2021-09-29 14:09:14', '2021-09-29 14:09:14'),
(71, 28, 52, '2021-10-05 11:06:47', '2021-10-05 11:06:47'),
(72, 29, 52, '2021-10-05 11:08:32', '2021-10-05 11:08:32'),
(75, 30, 52, '2021-10-05 11:11:51', '2021-10-05 11:11:51'),
(77, 31, 52, '2021-10-05 11:12:30', '2021-10-05 11:12:30'),
(79, 32, 52, '2021-10-05 11:12:52', '2021-10-05 11:12:52'),
(82, 33, 52, '2021-10-05 11:13:47', '2021-10-05 11:13:47'),
(84, 34, 52, '2021-10-05 11:15:08', '2021-10-05 11:15:08'),
(86, 35, 52, '2021-10-05 11:15:41', '2021-10-05 11:15:41'),
(88, 36, 52, '2021-10-05 11:19:06', '2021-10-05 11:19:06'),
(90, 37, 52, '2021-10-05 11:19:56', '2021-10-05 11:19:56'),
(92, 38, 52, '2021-10-05 11:20:56', '2021-10-05 11:20:56'),
(96, 40, 51, '2021-10-08 10:10:15', '2021-10-08 10:10:15'),
(98, 23, 51, '2021-10-08 10:12:14', '2021-10-08 10:12:14'),
(101, 41, 51, '2021-10-11 12:00:10', '2021-10-11 12:00:10'),
(103, 42, 51, '2021-10-11 12:07:43', '2021-10-11 12:07:43'),
(105, 43, 51, '2021-10-11 12:10:55', '2021-10-11 12:10:55'),
(107, 44, 51, '2021-10-11 12:12:24', '2021-10-11 12:12:24'),
(109, 45, 51, '2021-10-11 12:13:31', '2021-10-11 12:13:31'),
(111, 46, 51, '2021-10-11 12:14:38', '2021-10-11 12:14:38'),
(113, 47, 51, '2021-10-11 12:15:58', '2021-10-11 12:15:58'),
(115, 48, 51, '2021-10-11 12:17:11', '2021-10-11 12:17:11'),
(116, 48, 64, '2021-10-11 12:20:09', '2021-10-11 12:20:09'),
(118, 49, 51, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(119, 49, 64, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(120, 49, 65, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(121, 50, 66, '2021-10-26 06:21:18', '2021-10-26 06:21:18'),
(124, 51, 66, '2021-10-26 09:04:55', '2021-10-26 09:04:55'),
(125, 52, 51, '2021-10-27 11:55:53', '2021-10-27 11:55:53'),
(127, 52, 64, '2021-10-27 11:58:33', '2021-10-27 11:58:33'),
(128, 52, 58, '2021-10-27 11:58:33', '2021-10-27 11:58:33'),
(130, 52, 66, '2021-10-28 12:03:13', '2021-10-28 12:03:13'),
(132, 53, 61, '2021-11-01 11:03:45', '2021-11-01 11:03:45'),
(133, 54, 61, '2021-11-01 13:42:40', '2021-11-01 13:42:40'),
(135, 55, 70, '2021-11-05 21:34:11', '2021-11-05 21:34:11'),
(136, 56, 69, '2021-11-09 19:19:01', '2021-11-09 19:19:01');

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
(24, '2021_10_06_152433_create_call_users_table', 5),
(25, '2021_12_20_113527_create_subsriber_table', 6);

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
(58, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:04:01\"}', '34', '2021-10-08 19:04:02', '2021-10-08 19:04:02'),
(59, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:06:33\"}', '35', '2021-10-08 19:05:03', '2021-10-08 19:05:03'),
(60, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-08 19:06:02', '2021-10-08 19:06:02'),
(67, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-09 01:00:02', '2021-10-09 01:00:02'),
(72, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-10 01:00:02', '2021-10-10 01:00:02'),
(77, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-11 01:00:02', '2021-10-11 01:00:02'),
(79, 51, 56, 41, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in help Group By  Aijaz\"}', NULL, '2021-10-11 12:00:10', '2021-10-11 12:00:10'),
(80, 51, 56, 42, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in group x Group By  Aijaz\"}', NULL, '2021-10-11 12:07:43', '2021-10-11 12:07:43'),
(81, 51, 56, 43, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in happy Group By  Aijaz\"}', NULL, '2021-10-11 12:10:55', '2021-10-11 12:10:55'),
(82, 51, 56, 44, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in abcd Group By  Aijaz\"}', NULL, '2021-10-11 12:12:24', '2021-10-11 12:12:24'),
(83, 51, 56, 45, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in happy Group By  Aijaz\"}', NULL, '2021-10-11 12:13:31', '2021-10-11 12:13:31'),
(84, 51, 56, 46, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in abcdefg Group By  Aijaz\"}', NULL, '2021-10-11 12:14:38', '2021-10-11 12:14:38'),
(85, 51, 56, 47, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"Your Are Added in anclrr Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:15:58', '2021-10-11 12:15:58'),
(86, 51, 56, 48, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in hhahgha Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:17:11', '2021-10-11 12:17:11'),
(87, 64, 56, 48, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in hhahgha Group By Ammar Aijaz\"}', NULL, '2021-10-11 12:20:09', '2021-10-11 12:20:09'),
(92, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-12 01:00:03', '2021-10-12 01:00:03'),
(98, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-13 01:00:03', '2021-10-13 01:00:03'),
(99, 51, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(100, 64, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(101, 65, 56, 49, 'group', '{\"name\":\"Ammar Aijaz\",\"image\":\"https:\\/\\/platform-lookaside.fbsbx.com\\/platform\\/profilepic\\/?asid=2898844243700202&height=800&width=800&ext=1634300819&hash=AeTEKAEasxiX0WrITuw\",\"message\":\"You Are Added in haal Group By Ammar Aijaz\"}', NULL, '2021-10-13 11:26:22', '2021-10-13 11:26:22'),
(106, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-14 01:00:03', '2021-10-14 01:00:03'),
(111, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-15 01:00:03', '2021-10-15 01:00:03'),
(116, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-16 01:00:02', '2021-10-16 01:00:02'),
(121, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-17 01:00:03', '2021-10-17 01:00:03'),
(126, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-18 01:00:03', '2021-10-18 01:00:03'),
(131, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-19 01:00:02', '2021-10-19 01:00:02'),
(136, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-20 01:00:03', '2021-10-20 01:00:03'),
(141, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-21 01:00:03', '2021-10-21 01:00:03'),
(146, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-22 01:00:04', '2021-10-22 01:00:04'),
(151, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-23 01:00:03', '2021-10-23 01:00:03'),
(156, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-24 01:00:02', '2021-10-24 01:00:02'),
(161, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-25 01:00:02', '2021-10-25 01:00:02'),
(162, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-25 16:20:02', '2021-10-25 16:20:02'),
(167, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-26 01:00:03', '2021-10-26 01:00:03'),
(168, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-26 01:00:03', '2021-10-26 01:00:03'),
(170, 66, 48, 51, 'group', '{\"name\":\"Mark Miller\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1631785881.jpg\",\"message\":\"You Are Added in jahah Group By Mark Miller\"}', NULL, '2021-10-26 09:04:55', '2021-10-26 09:04:55'),
(171, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-26 14:07:02', '2021-10-26 14:07:02'),
(176, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-27 01:00:03', '2021-10-27 01:00:03'),
(177, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-27 01:00:03', '2021-10-27 01:00:03'),
(178, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-27 01:00:03', '2021-10-27 01:00:03'),
(180, 64, 51, 52, 'group', '{\"name\":\"abc xyz\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1631710008.jpg\",\"message\":\"You Are Added in Alex, miller, abc Group By abc xyz\"}', NULL, '2021-10-27 11:58:33', '2021-10-27 11:58:33'),
(181, 58, 51, 52, 'group', '{\"name\":\"abc xyz\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1631710008.jpg\",\"message\":\"You Are Added in Alex, miller, abc Group By abc xyz\"}', NULL, '2021-10-27 11:58:33', '2021-10-27 11:58:33'),
(186, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-28 01:00:03', '2021-10-28 01:00:03'),
(187, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-28 01:00:03', '2021-10-28 01:00:03'),
(188, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-28 01:00:03', '2021-10-28 01:00:03'),
(190, 66, 51, 52, 'group', '{\"name\":\"abc xyz\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1631710008.jpg\",\"message\":\"You Are Added in Alex, miller, abc Group By abc xyz\"}', NULL, '2021-10-28 12:03:13', '2021-10-28 12:03:13'),
(195, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-29 01:00:03', '2021-10-29 01:00:03'),
(196, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-29 01:00:03', '2021-10-29 01:00:03'),
(197, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-29 01:00:03', '2021-10-29 01:00:03'),
(202, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-30 01:00:03', '2021-10-30 01:00:03'),
(203, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-30 01:00:03', '2021-10-30 01:00:03'),
(204, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-30 01:00:03', '2021-10-30 01:00:03'),
(209, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-10-31 01:00:02', '2021-10-31 01:00:02'),
(210, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-10-31 01:00:03', '2021-10-31 01:00:03'),
(211, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-10-31 01:00:03', '2021-10-31 01:00:03'),
(216, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-01 01:00:03', '2021-11-01 01:00:03'),
(217, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-01 01:00:04', '2021-11-01 01:00:04'),
(218, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-01 01:00:04', '2021-11-01 01:00:04'),
(219, 61, 67, 53, 'group', '{\"name\":\"IOS device\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1635161973.jpg\",\"message\":\"You Are Added in call@test Group By IOS device\"}', NULL, '2021-11-01 11:03:45', '2021-11-01 11:03:45'),
(225, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-02 01:00:03', '2021-11-02 01:00:03'),
(226, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-02 01:00:03', '2021-11-02 01:00:03'),
(227, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-02 01:00:04', '2021-11-02 01:00:04'),
(232, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-03 01:00:03', '2021-11-03 01:00:03'),
(233, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-03 01:00:03', '2021-11-03 01:00:03'),
(234, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-03 01:00:03', '2021-11-03 01:00:03'),
(239, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-04 01:00:03', '2021-11-04 01:00:03'),
(240, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-04 01:00:03', '2021-11-04 01:00:03'),
(241, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-04 01:00:03', '2021-11-04 01:00:03'),
(246, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-05 01:00:03', '2021-11-05 01:00:03'),
(247, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-05 01:00:03', '2021-11-05 01:00:03'),
(248, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-05 01:00:04', '2021-11-05 01:00:04'),
(253, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-06 01:00:03', '2021-11-06 01:00:03'),
(254, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-06 01:00:03', '2021-11-06 01:00:03'),
(255, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-06 01:00:03', '2021-11-06 01:00:03'),
(260, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-07 01:00:03', '2021-11-07 01:00:03'),
(261, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-07 01:00:10', '2021-11-07 01:00:10'),
(262, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-07 01:00:11', '2021-11-07 01:00:11'),
(267, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-08 01:00:03', '2021-11-08 01:00:03'),
(268, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-08 01:00:03', '2021-11-08 01:00:03'),
(269, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-08 01:00:03', '2021-11-08 01:00:03'),
(274, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-09 01:00:03', '2021-11-09 01:00:03'),
(275, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-09 01:00:03', '2021-11-09 01:00:03'),
(276, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-09 01:00:03', '2021-11-09 01:00:03'),
(281, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-10 01:00:02', '2021-11-10 01:00:02'),
(282, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-10 01:00:03', '2021-11-10 01:00:03'),
(283, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-10 01:00:03', '2021-11-10 01:00:03'),
(288, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-11 01:00:03', '2021-11-11 01:00:03'),
(289, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-11 01:00:03', '2021-11-11 01:00:03'),
(290, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-11 01:00:03', '2021-11-11 01:00:03'),
(295, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-12 01:00:03', '2021-11-12 01:00:03'),
(296, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-12 01:00:03', '2021-11-12 01:00:03'),
(297, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-12 01:00:03', '2021-11-12 01:00:03'),
(302, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-13 01:00:03', '2021-11-13 01:00:03'),
(303, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-13 01:00:03', '2021-11-13 01:00:03'),
(304, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-13 01:00:03', '2021-11-13 01:00:03'),
(309, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-14 01:00:02', '2021-11-14 01:00:02'),
(310, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-14 01:00:02', '2021-11-14 01:00:02'),
(311, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-14 01:00:03', '2021-11-14 01:00:03'),
(316, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-15 01:00:02', '2021-11-15 01:00:02'),
(317, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-15 01:00:03', '2021-11-15 01:00:03'),
(318, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-15 01:00:03', '2021-11-15 01:00:03'),
(323, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-16 01:00:03', '2021-11-16 01:00:03'),
(324, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-16 01:00:03', '2021-11-16 01:00:03'),
(325, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-16 01:00:03', '2021-11-16 01:00:03'),
(330, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-17 01:00:02', '2021-11-17 01:00:02'),
(331, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-17 01:00:02', '2021-11-17 01:00:02'),
(332, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-17 01:00:02', '2021-11-17 01:00:02'),
(337, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-18 01:00:02', '2021-11-18 01:00:02'),
(338, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-18 01:00:02', '2021-11-18 01:00:02'),
(339, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-18 01:00:02', '2021-11-18 01:00:02'),
(344, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-19 01:00:03', '2021-11-19 01:00:03'),
(345, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-19 01:00:03', '2021-11-19 01:00:03'),
(346, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-19 01:00:03', '2021-11-19 01:00:03'),
(351, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-20 01:00:02', '2021-11-20 01:00:02'),
(352, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-20 01:00:02', '2021-11-20 01:00:02'),
(353, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-20 01:00:03', '2021-11-20 01:00:03'),
(358, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-21 01:00:02', '2021-11-21 01:00:02'),
(359, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-21 01:00:03', '2021-11-21 01:00:03'),
(360, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-21 01:00:03', '2021-11-21 01:00:03'),
(365, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-22 01:00:04', '2021-11-22 01:00:04'),
(366, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-22 01:00:04', '2021-11-22 01:00:04'),
(367, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-22 01:00:04', '2021-11-22 01:00:04'),
(372, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-23 01:00:03', '2021-11-23 01:00:03'),
(373, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-23 01:00:03', '2021-11-23 01:00:03'),
(374, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-23 01:00:03', '2021-11-23 01:00:03'),
(379, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-24 01:00:03', '2021-11-24 01:00:03'),
(380, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-24 01:00:03', '2021-11-24 01:00:03'),
(381, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-24 01:00:03', '2021-11-24 01:00:03'),
(386, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-25 01:00:03', '2021-11-25 01:00:03'),
(387, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-25 01:00:03', '2021-11-25 01:00:03'),
(388, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-25 01:00:03', '2021-11-25 01:00:03'),
(393, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-26 01:00:03', '2021-11-26 01:00:03'),
(394, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-26 01:00:03', '2021-11-26 01:00:03'),
(395, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-26 01:00:03', '2021-11-26 01:00:03'),
(400, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-27 01:00:04', '2021-11-27 01:00:04'),
(401, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-27 01:00:04', '2021-11-27 01:00:04'),
(402, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-27 01:00:04', '2021-11-27 01:00:04'),
(407, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-28 01:00:02', '2021-11-28 01:00:02'),
(408, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-28 01:00:03', '2021-11-28 01:00:03'),
(409, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-28 01:00:03', '2021-11-28 01:00:03'),
(414, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-29 01:00:03', '2021-11-29 01:00:03'),
(415, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-29 01:00:03', '2021-11-29 01:00:03'),
(416, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-29 01:00:03', '2021-11-29 01:00:03'),
(421, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-11-30 01:00:04', '2021-11-30 01:00:04'),
(422, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-11-30 01:00:04', '2021-11-30 01:00:04'),
(423, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-11-30 01:00:04', '2021-11-30 01:00:04'),
(428, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-01 01:00:03', '2021-12-01 01:00:03'),
(429, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-01 01:00:03', '2021-12-01 01:00:03'),
(430, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-01 01:00:03', '2021-12-01 01:00:03'),
(435, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-02 01:00:03', '2021-12-02 01:00:03'),
(436, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-02 01:00:03', '2021-12-02 01:00:03'),
(437, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-02 01:00:03', '2021-12-02 01:00:03'),
(442, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-03 01:00:02', '2021-12-03 01:00:02'),
(443, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-03 01:00:03', '2021-12-03 01:00:03'),
(444, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-03 01:00:03', '2021-12-03 01:00:03'),
(449, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-04 01:00:03', '2021-12-04 01:00:03'),
(450, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-04 01:00:03', '2021-12-04 01:00:03'),
(451, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-04 01:00:03', '2021-12-04 01:00:03'),
(456, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-05 01:00:03', '2021-12-05 01:00:03'),
(457, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-05 01:00:03', '2021-12-05 01:00:03'),
(458, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-05 01:00:03', '2021-12-05 01:00:03'),
(463, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-06 01:00:03', '2021-12-06 01:00:03'),
(464, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-06 01:00:03', '2021-12-06 01:00:03'),
(465, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-06 01:00:03', '2021-12-06 01:00:03'),
(470, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-07 01:00:03', '2021-12-07 01:00:03'),
(471, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-07 01:00:03', '2021-12-07 01:00:03'),
(472, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-07 01:00:03', '2021-12-07 01:00:03'),
(477, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-08 01:00:03', '2021-12-08 01:00:03'),
(478, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-08 01:00:04', '2021-12-08 01:00:04'),
(479, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-08 01:00:04', '2021-12-08 01:00:04'),
(484, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-09 01:00:03', '2021-12-09 01:00:03'),
(485, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-09 01:00:03', '2021-12-09 01:00:03'),
(486, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-09 01:00:03', '2021-12-09 01:00:03'),
(514, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-10 01:00:02', '2021-12-10 01:00:02'),
(515, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-10 01:00:02', '2021-12-10 01:00:02'),
(516, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-10 01:00:03', '2021-12-10 01:00:03'),
(517, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-11 01:00:02', '2021-12-11 01:00:02'),
(518, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-11 01:00:02', '2021-12-11 01:00:02'),
(519, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-11 01:00:02', '2021-12-11 01:00:02'),
(520, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-12 01:00:02', '2021-12-12 01:00:02'),
(521, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-12 01:00:03', '2021-12-12 01:00:03'),
(522, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-12 01:00:03', '2021-12-12 01:00:03'),
(523, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-13 01:00:02', '2021-12-13 01:00:02'),
(524, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-13 01:00:03', '2021-12-13 01:00:03'),
(525, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-13 01:00:03', '2021-12-13 01:00:03'),
(526, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-14 01:00:02', '2021-12-14 01:00:02'),
(527, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-14 01:00:02', '2021-12-14 01:00:02'),
(528, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-14 01:00:02', '2021-12-14 01:00:02'),
(529, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-15 01:00:02', '2021-12-15 01:00:02'),
(530, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-15 01:00:02', '2021-12-15 01:00:02'),
(531, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-15 01:00:02', '2021-12-15 01:00:02'),
(532, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-16 01:00:03', '2021-12-16 01:00:03'),
(533, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-16 01:00:03', '2021-12-16 01:00:03'),
(534, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-16 01:00:03', '2021-12-16 01:00:03'),
(535, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-17 01:00:02', '2021-12-17 01:00:02'),
(536, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-17 01:00:02', '2021-12-17 01:00:02'),
(537, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-17 01:00:02', '2021-12-17 01:00:02'),
(538, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-18 01:00:03', '2021-12-18 01:00:03'),
(539, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-18 01:00:03', '2021-12-18 01:00:03'),
(540, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-18 01:00:03', '2021-12-18 01:00:03'),
(541, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-19 01:00:03', '2021-12-19 01:00:03'),
(542, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-19 01:00:03', '2021-12-19 01:00:03'),
(543, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-19 01:00:03', '2021-12-19 01:00:03'),
(544, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-20 01:00:02', '2021-12-20 01:00:02'),
(545, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-20 01:00:02', '2021-12-20 01:00:02'),
(546, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-20 01:00:02', '2021-12-20 01:00:02'),
(547, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-21 01:00:02', '2021-12-21 01:00:02'),
(548, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-21 01:00:02', '2021-12-21 01:00:02'),
(549, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-21 01:00:02', '2021-12-21 01:00:02'),
(550, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-22 01:00:02', '2021-12-22 01:00:02'),
(551, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-22 01:00:03', '2021-12-22 01:00:03'),
(552, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-22 01:00:03', '2021-12-22 01:00:03'),
(553, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-23 01:00:02', '2021-12-23 01:00:02'),
(554, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-23 01:00:03', '2021-12-23 01:00:03'),
(555, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-23 01:00:03', '2021-12-23 01:00:03'),
(556, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-24 01:00:02', '2021-12-24 01:00:02'),
(557, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-24 01:00:02', '2021-12-24 01:00:02'),
(558, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-24 01:00:03', '2021-12-24 01:00:03'),
(559, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-25 01:00:03', '2021-12-25 01:00:03'),
(560, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-25 01:00:03', '2021-12-25 01:00:03'),
(561, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-25 01:00:03', '2021-12-25 01:00:03'),
(562, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-26 01:00:02', '2021-12-26 01:00:02'),
(563, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-26 01:00:02', '2021-12-26 01:00:02'),
(564, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-26 01:00:03', '2021-12-26 01:00:03'),
(565, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-27 01:00:02', '2021-12-27 01:00:02'),
(566, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-27 01:00:02', '2021-12-27 01:00:02'),
(567, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-27 01:00:02', '2021-12-27 01:00:02'),
(568, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-28 01:00:02', '2021-12-28 01:00:02'),
(569, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-28 01:00:02', '2021-12-28 01:00:02'),
(570, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-28 01:00:02', '2021-12-28 01:00:02'),
(571, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-29 01:00:03', '2021-12-29 01:00:03'),
(572, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-29 01:00:03', '2021-12-29 01:00:03'),
(573, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-29 01:00:03', '2021-12-29 01:00:03'),
(574, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-30 01:00:03', '2021-12-30 01:00:03'),
(575, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-30 01:00:03', '2021-12-30 01:00:03'),
(576, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-30 01:00:03', '2021-12-30 01:00:03'),
(577, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2021-12-31 01:00:02', '2021-12-31 01:00:02'),
(578, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2021-12-31 01:00:02', '2021-12-31 01:00:02'),
(579, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2021-12-31 01:00:03', '2021-12-31 01:00:03'),
(580, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-01 01:00:03', '2022-01-01 01:00:03'),
(581, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-01 01:00:03', '2022-01-01 01:00:03'),
(582, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-01 01:00:03', '2022-01-01 01:00:03'),
(583, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-02 01:00:02', '2022-01-02 01:00:02'),
(584, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-02 01:00:03', '2022-01-02 01:00:03'),
(585, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-02 01:00:03', '2022-01-02 01:00:03'),
(586, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-03 01:00:02', '2022-01-03 01:00:02'),
(587, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-03 01:00:02', '2022-01-03 01:00:02'),
(588, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-03 01:00:02', '2022-01-03 01:00:02'),
(589, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-04 01:00:02', '2022-01-04 01:00:02'),
(590, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-04 01:00:02', '2022-01-04 01:00:02'),
(591, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-04 01:00:02', '2022-01-04 01:00:02'),
(592, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-05 01:00:03', '2022-01-05 01:00:03'),
(593, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-05 01:00:03', '2022-01-05 01:00:03'),
(594, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-05 01:00:03', '2022-01-05 01:00:03'),
(595, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-06 01:00:02', '2022-01-06 01:00:02'),
(596, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-06 01:00:02', '2022-01-06 01:00:02'),
(597, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-06 01:00:02', '2022-01-06 01:00:02'),
(598, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-07 01:00:02', '2022-01-07 01:00:02'),
(599, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-07 01:00:02', '2022-01-07 01:00:02'),
(600, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-07 01:00:02', '2022-01-07 01:00:02'),
(601, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-08 01:00:02', '2022-01-08 01:00:02'),
(602, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-08 01:00:02', '2022-01-08 01:00:02'),
(603, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-08 01:00:03', '2022-01-08 01:00:03'),
(604, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-09 01:00:02', '2022-01-09 01:00:02'),
(605, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-09 01:00:03', '2022-01-09 01:00:03'),
(606, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-09 01:00:03', '2022-01-09 01:00:03'),
(607, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-10 01:00:03', '2022-01-10 01:00:03'),
(608, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-10 01:00:03', '2022-01-10 01:00:03'),
(609, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-10 01:00:03', '2022-01-10 01:00:03'),
(610, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-11 01:00:02', '2022-01-11 01:00:02'),
(611, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-11 01:00:02', '2022-01-11 01:00:02'),
(612, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-11 01:00:02', '2022-01-11 01:00:02'),
(613, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-12 01:00:03', '2022-01-12 01:00:03'),
(614, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-12 01:00:03', '2022-01-12 01:00:03'),
(615, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-12 01:00:03', '2022-01-12 01:00:03'),
(616, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-13 01:00:02', '2022-01-13 01:00:02'),
(617, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-13 01:00:02', '2022-01-13 01:00:02'),
(618, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-13 01:00:02', '2022-01-13 01:00:02'),
(619, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-14 01:00:03', '2022-01-14 01:00:03'),
(620, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-14 01:00:03', '2022-01-14 01:00:03'),
(621, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-14 01:00:03', '2022-01-14 01:00:03'),
(622, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-15 01:00:03', '2022-01-15 01:00:03'),
(623, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-15 01:00:03', '2022-01-15 01:00:03'),
(624, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-15 01:00:03', '2022-01-15 01:00:03'),
(625, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-16 01:00:02', '2022-01-16 01:00:02'),
(626, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-16 01:00:02', '2022-01-16 01:00:02'),
(627, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-16 01:00:02', '2022-01-16 01:00:02'),
(628, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-17 01:00:02', '2022-01-17 01:00:02'),
(629, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-17 01:00:02', '2022-01-17 01:00:02'),
(630, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-17 01:00:03', '2022-01-17 01:00:03'),
(631, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-18 01:00:02', '2022-01-18 01:00:02'),
(632, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-18 01:00:02', '2022-01-18 01:00:02'),
(633, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-18 01:00:02', '2022-01-18 01:00:02'),
(634, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-19 01:00:02', '2022-01-19 01:00:02'),
(635, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-19 01:00:02', '2022-01-19 01:00:02'),
(636, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-19 01:00:02', '2022-01-19 01:00:02'),
(637, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-20 01:00:03', '2022-01-20 01:00:03'),
(638, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-20 01:00:03', '2022-01-20 01:00:03'),
(639, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-20 01:00:03', '2022-01-20 01:00:03'),
(640, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-21 01:00:02', '2022-01-21 01:00:02'),
(641, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-21 01:00:02', '2022-01-21 01:00:02'),
(642, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-21 01:00:02', '2022-01-21 01:00:02'),
(643, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-22 01:00:02', '2022-01-22 01:00:02'),
(644, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-22 01:00:02', '2022-01-22 01:00:02'),
(645, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-22 01:00:02', '2022-01-22 01:00:02'),
(646, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-23 01:00:02', '2022-01-23 01:00:02'),
(647, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-23 01:00:02', '2022-01-23 01:00:02'),
(648, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-23 01:00:02', '2022-01-23 01:00:02'),
(649, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-24 01:00:02', '2022-01-24 01:00:02'),
(650, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-24 01:00:02', '2022-01-24 01:00:02'),
(651, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-24 01:00:02', '2022-01-24 01:00:02'),
(652, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-25 01:00:02', '2022-01-25 01:00:02'),
(653, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-25 01:00:02', '2022-01-25 01:00:02'),
(654, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-25 01:00:02', '2022-01-25 01:00:02'),
(655, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-26 01:00:02', '2022-01-26 01:00:02'),
(656, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-26 01:00:02', '2022-01-26 01:00:02'),
(657, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-26 01:00:02', '2022-01-26 01:00:02');
INSERT INTO `notifications` (`id`, `reciever_id`, `sender_id`, `group_id`, `type`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
(658, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-27 01:00:02', '2022-01-27 01:00:02'),
(659, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-27 01:00:02', '2022-01-27 01:00:02'),
(660, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-27 01:00:03', '2022-01-27 01:00:03'),
(661, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-28 01:00:02', '2022-01-28 01:00:02'),
(662, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-28 01:00:02', '2022-01-28 01:00:02'),
(663, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-28 01:00:02', '2022-01-28 01:00:02'),
(664, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-29 01:00:02', '2022-01-29 01:00:02'),
(665, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-29 01:00:03', '2022-01-29 01:00:03'),
(666, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-29 01:00:03', '2022-01-29 01:00:03'),
(667, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-30 01:00:02', '2022-01-30 01:00:02'),
(668, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-30 01:00:02', '2022-01-30 01:00:02'),
(669, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-30 01:00:03', '2022-01-30 01:00:03'),
(670, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-01-31 01:00:03', '2022-01-31 01:00:03'),
(671, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-01-31 01:00:03', '2022-01-31 01:00:03'),
(672, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-01-31 01:00:03', '2022-01-31 01:00:03'),
(673, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-01 01:00:03', '2022-02-01 01:00:03'),
(674, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-01 01:00:03', '2022-02-01 01:00:03'),
(675, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-01 01:00:03', '2022-02-01 01:00:03'),
(676, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-02 01:00:02', '2022-02-02 01:00:02'),
(677, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-02 01:00:02', '2022-02-02 01:00:02'),
(678, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-02 01:00:02', '2022-02-02 01:00:02'),
(679, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-03 01:00:03', '2022-02-03 01:00:03'),
(680, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-03 01:00:03', '2022-02-03 01:00:03'),
(681, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-03 01:00:03', '2022-02-03 01:00:03'),
(682, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-04 01:00:02', '2022-02-04 01:00:02'),
(683, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-04 01:00:02', '2022-02-04 01:00:02'),
(684, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-04 01:00:02', '2022-02-04 01:00:02'),
(685, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-05 01:00:03', '2022-02-05 01:00:03'),
(686, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-05 01:00:03', '2022-02-05 01:00:03'),
(687, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-05 01:00:03', '2022-02-05 01:00:03'),
(688, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-06 01:00:02', '2022-02-06 01:00:02'),
(689, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-06 01:00:02', '2022-02-06 01:00:02'),
(690, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-06 01:00:02', '2022-02-06 01:00:02'),
(691, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-07 01:00:02', '2022-02-07 01:00:02'),
(692, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-07 01:00:02', '2022-02-07 01:00:02'),
(693, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-07 01:00:02', '2022-02-07 01:00:02'),
(694, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-08 01:00:02', '2022-02-08 01:00:02'),
(695, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-08 01:00:02', '2022-02-08 01:00:02'),
(696, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-08 01:00:02', '2022-02-08 01:00:02'),
(697, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-09 01:00:02', '2022-02-09 01:00:02'),
(698, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-09 01:00:02', '2022-02-09 01:00:02'),
(699, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-09 01:00:02', '2022-02-09 01:00:02'),
(700, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-10 01:00:02', '2022-02-10 01:00:02'),
(701, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-10 01:00:02', '2022-02-10 01:00:02'),
(702, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-10 01:00:02', '2022-02-10 01:00:02'),
(703, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-11 01:00:02', '2022-02-11 01:00:02'),
(704, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-11 01:00:02', '2022-02-11 01:00:02'),
(705, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-11 01:00:02', '2022-02-11 01:00:02'),
(706, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-12 01:00:02', '2022-02-12 01:00:02'),
(707, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-12 01:00:03', '2022-02-12 01:00:03'),
(708, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-12 01:00:03', '2022-02-12 01:00:03'),
(709, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-13 01:00:03', '2022-02-13 01:00:03'),
(710, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-13 01:00:03', '2022-02-13 01:00:03'),
(711, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-13 01:00:03', '2022-02-13 01:00:03'),
(712, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-14 01:00:02', '2022-02-14 01:00:02'),
(713, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-14 01:00:02', '2022-02-14 01:00:02'),
(714, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-14 01:00:02', '2022-02-14 01:00:02'),
(715, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-15 01:00:02', '2022-02-15 01:00:02'),
(716, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-15 01:00:02', '2022-02-15 01:00:02'),
(717, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-15 01:00:02', '2022-02-15 01:00:02'),
(718, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-16 01:00:03', '2022-02-16 01:00:03'),
(719, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-16 01:00:03', '2022-02-16 01:00:03'),
(720, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-16 01:00:03', '2022-02-16 01:00:03'),
(721, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-17 01:00:02', '2022-02-17 01:00:02'),
(722, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-17 01:00:02', '2022-02-17 01:00:02'),
(723, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-17 01:00:03', '2022-02-17 01:00:03'),
(724, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-18 01:00:03', '2022-02-18 01:00:03'),
(725, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-18 01:00:03', '2022-02-18 01:00:03'),
(726, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-18 01:00:03', '2022-02-18 01:00:03'),
(727, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-19 01:00:03', '2022-02-19 01:00:03'),
(728, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-19 01:00:03', '2022-02-19 01:00:03'),
(729, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-19 01:00:03', '2022-02-19 01:00:03'),
(730, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-20 01:00:03', '2022-02-20 01:00:03'),
(731, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-20 01:00:03', '2022-02-20 01:00:03'),
(732, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-20 01:00:03', '2022-02-20 01:00:03'),
(733, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-21 01:00:02', '2022-02-21 01:00:02'),
(734, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-21 01:00:02', '2022-02-21 01:00:02'),
(735, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-21 01:00:02', '2022-02-21 01:00:02'),
(736, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-22 01:00:03', '2022-02-22 01:00:03'),
(737, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-22 01:00:03', '2022-02-22 01:00:03'),
(738, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-22 01:00:03', '2022-02-22 01:00:03'),
(739, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-23 01:00:02', '2022-02-23 01:00:02'),
(740, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-23 01:00:02', '2022-02-23 01:00:02'),
(741, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-23 01:00:02', '2022-02-23 01:00:02'),
(742, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-24 01:00:02', '2022-02-24 01:00:02'),
(743, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-24 01:00:02', '2022-02-24 01:00:02'),
(744, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-24 01:00:02', '2022-02-24 01:00:02'),
(745, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-25 01:00:02', '2022-02-25 01:00:02'),
(746, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-25 01:00:02', '2022-02-25 01:00:02'),
(747, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-25 01:00:02', '2022-02-25 01:00:02'),
(748, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-26 01:00:02', '2022-02-26 01:00:02'),
(749, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-26 01:00:02', '2022-02-26 01:00:02'),
(750, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-26 01:00:02', '2022-02-26 01:00:02'),
(751, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-27 01:00:02', '2022-02-27 01:00:02'),
(752, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-27 01:00:02', '2022-02-27 01:00:02'),
(753, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-27 01:00:02', '2022-02-27 01:00:02'),
(754, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-02-28 01:00:03', '2022-02-28 01:00:03'),
(755, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-02-28 01:00:03', '2022-02-28 01:00:03'),
(756, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-02-28 01:00:03', '2022-02-28 01:00:03'),
(757, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-01 01:00:02', '2022-03-01 01:00:02'),
(758, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-01 01:00:03', '2022-03-01 01:00:03'),
(759, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-01 01:00:03', '2022-03-01 01:00:03'),
(760, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-02 01:00:02', '2022-03-02 01:00:02'),
(761, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-02 01:00:03', '2022-03-02 01:00:03'),
(762, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-02 01:00:03', '2022-03-02 01:00:03'),
(763, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-03 01:00:02', '2022-03-03 01:00:02'),
(764, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-03 01:00:02', '2022-03-03 01:00:02'),
(765, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-03 01:00:03', '2022-03-03 01:00:03'),
(766, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-04 01:00:02', '2022-03-04 01:00:02'),
(767, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-04 01:00:02', '2022-03-04 01:00:02'),
(768, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-04 01:00:02', '2022-03-04 01:00:02'),
(769, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-05 01:00:02', '2022-03-05 01:00:02'),
(770, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-05 01:00:02', '2022-03-05 01:00:02'),
(771, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-05 01:00:02', '2022-03-05 01:00:02'),
(772, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-06 01:00:03', '2022-03-06 01:00:03'),
(773, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-06 01:00:03', '2022-03-06 01:00:03'),
(774, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-06 01:00:03', '2022-03-06 01:00:03'),
(775, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-07 01:00:03', '2022-03-07 01:00:03'),
(776, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-07 01:00:03', '2022-03-07 01:00:03'),
(777, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-07 01:00:03', '2022-03-07 01:00:03'),
(778, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-08 01:00:03', '2022-03-08 01:00:03'),
(779, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-08 01:00:03', '2022-03-08 01:00:03'),
(780, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-08 01:00:03', '2022-03-08 01:00:03'),
(781, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-09 01:00:02', '2022-03-09 01:00:02'),
(782, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-09 01:00:03', '2022-03-09 01:00:03'),
(783, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-09 01:00:03', '2022-03-09 01:00:03'),
(784, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-10 01:00:02', '2022-03-10 01:00:02'),
(785, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-10 01:00:02', '2022-03-10 01:00:02'),
(786, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-10 01:00:03', '2022-03-10 01:00:03'),
(787, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-11 01:00:03', '2022-03-11 01:00:03'),
(788, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-11 01:00:03', '2022-03-11 01:00:03'),
(789, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-11 01:00:03', '2022-03-11 01:00:03'),
(790, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-12 01:00:03', '2022-03-12 01:00:03'),
(791, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-12 01:00:03', '2022-03-12 01:00:03'),
(792, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-12 01:00:03', '2022-03-12 01:00:03'),
(793, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-13 01:00:03', '2022-03-13 01:00:03'),
(794, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-13 01:00:03', '2022-03-13 01:00:03'),
(795, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-13 01:00:03', '2022-03-13 01:00:03'),
(796, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-14 01:00:03', '2022-03-14 01:00:03'),
(797, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-14 01:00:03', '2022-03-14 01:00:03'),
(798, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-14 01:00:03', '2022-03-14 01:00:03'),
(799, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-15 01:00:03', '2022-03-15 01:00:03'),
(800, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-15 01:00:03', '2022-03-15 01:00:03'),
(801, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-15 01:00:03', '2022-03-15 01:00:03'),
(802, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-16 01:00:02', '2022-03-16 01:00:02'),
(803, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-16 01:00:02', '2022-03-16 01:00:02'),
(804, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-16 01:00:03', '2022-03-16 01:00:03'),
(805, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-17 01:00:02', '2022-03-17 01:00:02'),
(806, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-17 01:00:02', '2022-03-17 01:00:02'),
(807, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-17 01:00:02', '2022-03-17 01:00:02'),
(808, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-18 01:00:02', '2022-03-18 01:00:02'),
(809, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-18 01:00:02', '2022-03-18 01:00:02'),
(810, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-18 01:00:02', '2022-03-18 01:00:02'),
(811, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-19 01:00:03', '2022-03-19 01:00:03'),
(812, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-19 01:00:03', '2022-03-19 01:00:03'),
(813, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-19 01:00:03', '2022-03-19 01:00:03'),
(814, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-20 01:00:02', '2022-03-20 01:00:02'),
(815, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-20 01:00:02', '2022-03-20 01:00:02'),
(816, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-20 01:00:03', '2022-03-20 01:00:03'),
(817, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-21 01:00:02', '2022-03-21 01:00:02'),
(818, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-21 01:00:03', '2022-03-21 01:00:03'),
(819, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-21 01:00:03', '2022-03-21 01:00:03'),
(820, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-22 01:00:03', '2022-03-22 01:00:03'),
(821, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-22 01:00:03', '2022-03-22 01:00:03'),
(822, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-22 01:00:03', '2022-03-22 01:00:03'),
(823, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-23 01:00:02', '2022-03-23 01:00:02'),
(824, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-23 01:00:02', '2022-03-23 01:00:02'),
(825, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-23 01:00:02', '2022-03-23 01:00:02'),
(826, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-24 01:00:03', '2022-03-24 01:00:03'),
(827, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-24 01:00:03', '2022-03-24 01:00:03'),
(828, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-24 01:00:03', '2022-03-24 01:00:03'),
(829, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-25 01:00:02', '2022-03-25 01:00:02'),
(830, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-25 01:00:02', '2022-03-25 01:00:02'),
(831, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-25 01:00:02', '2022-03-25 01:00:02'),
(832, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-26 01:00:02', '2022-03-26 01:00:02'),
(833, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-26 01:00:02', '2022-03-26 01:00:02'),
(834, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-26 01:00:02', '2022-03-26 01:00:02'),
(835, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-27 01:00:03', '2022-03-27 01:00:03'),
(836, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-27 01:00:03', '2022-03-27 01:00:03'),
(837, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-27 01:00:03', '2022-03-27 01:00:03'),
(838, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-28 01:00:02', '2022-03-28 01:00:02'),
(839, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-28 01:00:03', '2022-03-28 01:00:03'),
(840, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-28 01:00:03', '2022-03-28 01:00:03'),
(841, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-29 01:00:02', '2022-03-29 01:00:02'),
(842, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-29 01:00:02', '2022-03-29 01:00:02'),
(843, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-29 01:00:03', '2022-03-29 01:00:03'),
(844, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-30 01:00:02', '2022-03-30 01:00:02'),
(845, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-30 01:00:03', '2022-03-30 01:00:03'),
(846, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-30 01:00:03', '2022-03-30 01:00:03'),
(847, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-03-31 01:00:04', '2022-03-31 01:00:04'),
(848, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-03-31 01:00:04', '2022-03-31 01:00:04'),
(849, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-03-31 01:00:04', '2022-03-31 01:00:04'),
(850, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-01 01:00:04', '2022-04-01 01:00:04'),
(851, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-01 01:00:04', '2022-04-01 01:00:04'),
(852, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-01 01:00:04', '2022-04-01 01:00:04'),
(853, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-02 01:00:04', '2022-04-02 01:00:04'),
(854, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-02 01:00:04', '2022-04-02 01:00:04'),
(855, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-02 01:00:04', '2022-04-02 01:00:04'),
(856, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-03 01:00:05', '2022-04-03 01:00:05'),
(857, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-03 01:00:05', '2022-04-03 01:00:05'),
(858, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-03 01:00:05', '2022-04-03 01:00:05'),
(859, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-04 01:00:04', '2022-04-04 01:00:04'),
(860, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-04 01:00:04', '2022-04-04 01:00:04'),
(861, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-04 01:00:05', '2022-04-04 01:00:05'),
(862, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-05 01:00:05', '2022-04-05 01:00:05'),
(863, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-05 01:00:05', '2022-04-05 01:00:05'),
(864, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-05 01:00:05', '2022-04-05 01:00:05'),
(865, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-06 01:00:04', '2022-04-06 01:00:04'),
(866, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-06 01:00:05', '2022-04-06 01:00:05'),
(867, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-06 01:00:05', '2022-04-06 01:00:05'),
(868, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-07 01:00:04', '2022-04-07 01:00:04'),
(869, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-07 01:00:04', '2022-04-07 01:00:04'),
(870, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-07 01:00:05', '2022-04-07 01:00:05'),
(871, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-08 01:00:04', '2022-04-08 01:00:04'),
(872, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-08 01:00:04', '2022-04-08 01:00:04'),
(873, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-08 01:00:04', '2022-04-08 01:00:04'),
(874, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-09 01:00:04', '2022-04-09 01:00:04'),
(875, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-09 01:00:05', '2022-04-09 01:00:05'),
(876, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-09 01:00:05', '2022-04-09 01:00:05'),
(877, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-10 01:00:04', '2022-04-10 01:00:04'),
(878, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-10 01:00:04', '2022-04-10 01:00:04'),
(879, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-10 01:00:04', '2022-04-10 01:00:04'),
(880, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-11 01:00:04', '2022-04-11 01:00:04'),
(881, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-11 01:00:04', '2022-04-11 01:00:04'),
(882, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-11 01:00:04', '2022-04-11 01:00:04'),
(883, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-12 01:00:04', '2022-04-12 01:00:04'),
(884, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-12 01:00:04', '2022-04-12 01:00:04'),
(885, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-12 01:00:04', '2022-04-12 01:00:04'),
(886, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-13 01:00:04', '2022-04-13 01:00:04'),
(887, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-13 01:00:04', '2022-04-13 01:00:04'),
(888, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-13 01:00:04', '2022-04-13 01:00:04'),
(889, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-14 01:00:03', '2022-04-14 01:00:03'),
(890, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-14 01:00:03', '2022-04-14 01:00:03'),
(891, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-14 01:00:03', '2022-04-14 01:00:03'),
(892, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-15 01:00:02', '2022-04-15 01:00:02'),
(893, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-15 01:00:02', '2022-04-15 01:00:02'),
(894, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-15 01:00:02', '2022-04-15 01:00:02'),
(895, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-16 01:00:03', '2022-04-16 01:00:03'),
(896, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-16 01:00:03', '2022-04-16 01:00:03'),
(897, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-16 01:00:03', '2022-04-16 01:00:03'),
(898, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-17 01:00:02', '2022-04-17 01:00:02'),
(899, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-17 01:00:02', '2022-04-17 01:00:02'),
(900, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-17 01:00:03', '2022-04-17 01:00:03'),
(901, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-18 01:00:03', '2022-04-18 01:00:03'),
(902, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-18 01:00:03', '2022-04-18 01:00:03'),
(903, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-18 01:00:03', '2022-04-18 01:00:03'),
(904, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-19 01:00:02', '2022-04-19 01:00:02'),
(905, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-19 01:00:02', '2022-04-19 01:00:02'),
(906, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-19 01:00:02', '2022-04-19 01:00:02'),
(907, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-20 01:00:02', '2022-04-20 01:00:02'),
(908, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-20 01:00:02', '2022-04-20 01:00:02'),
(909, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-20 01:00:02', '2022-04-20 01:00:02'),
(910, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-21 01:00:03', '2022-04-21 01:00:03'),
(911, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-21 01:00:03', '2022-04-21 01:00:03'),
(912, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-21 01:00:03', '2022-04-21 01:00:03'),
(913, 63, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:05:37\"}', '36', '2022-04-22 01:00:02', '2022-04-22 01:00:02'),
(914, 61, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"07:22:06\"}', '37', '2022-04-22 01:00:02', '2022-04-22 01:00:02'),
(915, 66, 0, NULL, 'reminder', '{\"message\":\"Time Reminder\",\"reminder_time\":\"02:07:50\"}', '38', '2022-04-22 01:00:02', '2022-04-22 01:00:02'),
(916, 51, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:47', '2022-05-24 16:24:47'),
(917, 52, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:47', '2022-05-24 16:24:47'),
(918, 53, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(919, 54, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(920, 55, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(921, 58, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(922, 59, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(923, 60, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(924, 61, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(925, 62, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(926, 63, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(927, 64, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(928, 65, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(929, 66, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(930, 68, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(931, 69, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(932, 70, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:48', '2022-05-24 16:24:48'),
(933, 71, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:49', '2022-05-24 16:24:49'),
(934, 72, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:49', '2022-05-24 16:24:49'),
(935, 73, 1653409487, NULL, 'notification', '{\"message\":\"test\",\"title\":\"test\",\"first_name\":\"John\",\"last_name\":\"Smith\",\"image\":\"https:\\/\\/server.appsstaging.com\\/3048\\/prayer\\/public\\/uploadedimages\\/1639045723.jpg\"}', NULL, '2022-05-24 16:24:49', '2022-05-24 16:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('0d275aff6f220f08beaf508998127745906be54743459941e189b9e70b9bc85a631a68f023f5700b', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:28', '2021-09-03 13:03:28', '2022-09-03 13:03:28'),
('1051a90d8effe90fefcbbdecb0e07b52fdf4491fd3f4cda5d6f03a6ea2b0a275fec088868dde510f', 70, 3, 'authToken', '[]', 0, '2021-11-05 21:09:03', '2021-11-05 21:09:03', '2022-11-05 21:09:03'),
('11aa4b2b47e030d7203cd2a10e5752eade83c7bd8363b99caaefbf8a0de6bd7afdd91c1b5a226acf', 21, 3, 'authToken', '[]', 0, '2021-09-08 07:51:18', '2021-09-08 07:51:18', '2022-09-08 07:51:18'),
('12e32adca3047543861d4cba126b04367bb4c1f8a108ba3fadb1d660613cdf8d7cc90d4c3e388468', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:54:31', '2021-09-09 06:54:31', '2022-09-09 06:54:31'),
('1698aaf73314c8bd8c02f35dac34f70e86b5d34f1d580a4f6e9149251e1111b13859aeeebeeb275b', 7, 3, 'authToken', '[]', 0, '2021-09-03 08:04:21', '2021-09-03 08:04:21', '2022-09-03 08:04:21'),
('181f7a653e4818788733704cfe7fb02521357b7cb382bf97d0f68c15c9238ad72991baa2fa5b7218', 44, 3, 'authToken', '[]', 0, '2021-09-10 07:01:18', '2021-09-10 07:01:18', '2022-09-10 07:01:18'),
('1a29296961d168c4f4e549c3c7237b8630cb279856e92c4d2df8f87a5c0fe62db87d595c03eaa958', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:57:40', '2021-09-03 12:57:40', '2022-09-03 12:57:40'),
('1b6bcc5d7f8968de7ef5840de7be009568b80161ec0c60ee762be16265cbe157baa0f200108e8176', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:50:26', '2021-09-10 06:50:26', '2022-09-10 06:50:26'),
('1becf88730365fa61f64824878bfbfa06375ca827209aeea8dbee612831e618cda154cc533fc47c4', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:14', '2021-09-03 13:12:14', '2022-09-03 13:12:14'),
('227de05ad52fa4654f1d739f2875beb018d2437d74f2c801e2a93ae9d5220b9e9f0e60443ccd257a', 64, 3, 'authToken', '[]', 0, '2022-01-27 07:40:07', '2022-01-27 07:40:07', '2023-01-27 07:40:07'),
('241c66165f4141a2388598ff7e0952642ab3bb74824ab8c8daeb04562904007b01a93562e9c5632a', NULL, 3, 'authToken', '[]', 0, '2021-09-09 10:21:39', '2021-09-09 10:21:39', '2022-09-09 10:21:39'),
('25026c1b090722016f77dadf282081a1624459329a46637b3ab6b43622d7e710f8da919c5650c7a6', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:49:10', '2021-09-08 07:49:10', '2022-09-08 07:49:10'),
('265a0afca55b02e44bdc3575c4f457e299d801f7ffc7fa66eb924b133d6049c72c28fe9377bf62c6', 7, 3, 'authToken', '[]', 0, '2021-09-07 06:00:20', '2021-09-07 06:00:20', '2022-09-07 06:00:20'),
('273496801fed8afa027e9844e9ff5f362d436aafc6cf4ff6bdac7e4918043f4b24706dbbe5a1a1b7', 67, 3, 'authToken', '[]', 0, '2021-11-02 08:02:31', '2021-11-02 08:02:31', '2022-11-02 08:02:31'),
('2a360457f8150bfaa3680b1110e7f5a9fbf185436c41c35c2523f445135322a8783b120f2d9e12f2', 18, 3, 'authToken', '[]', 0, '2021-09-08 06:50:47', '2021-09-08 06:50:47', '2022-09-08 06:50:47'),
('2bdb967425f9da8f6c40a15ea7efa21760a57ad087c1e526f6cc138455324f6ea69f07d34ead734d', 22, 3, 'authToken', '[]', 0, '2021-09-09 07:17:05', '2021-09-09 07:17:05', '2022-09-09 07:17:05'),
('2e65fef6e7cbf647bf72a155508c3a25ccdde47f966e9835e419fe0e916ad6100dd2ca5b20e0eb29', 48, 3, 'authToken', '[]', 0, '2021-11-02 08:03:38', '2021-11-02 08:03:38', '2022-11-02 08:03:38'),
('3260fcb1899f5103ee5d05e62eeecb9f66bc1e71013c1d10e6ae0ab794b8cddd65c5c74397451bda', 12, 3, 'authToken', '[]', 0, '2021-09-07 10:16:35', '2021-09-07 10:16:35', '2022-09-07 10:16:35'),
('336e58b75e98f495bb166e7436a4077bab98f88b998f40c213804d62789e6cb6bed0af4ce99521f6', 6, 3, 'authToken', '[]', 0, '2021-09-09 12:39:52', '2021-09-09 12:39:52', '2022-09-09 12:39:52'),
('34f1e0bc7b5691c6854cf1fdc1cf8a9a5564981791030a8ce4dc0f94ea5b073be4051471305a7dd9', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:23:15', '2021-09-09 07:23:15', '2022-09-09 07:23:15'),
('3c9c75d7eed458cb200064e9a24e252837a7ba408c43cda4c77e903eeb179e7a02c8cbfe89c9492e', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:59', '2021-09-03 13:11:59', '2022-09-03 13:11:59'),
('3cea450133fd4a1259e2d120f4c13a2ed577582cdd74aa9111972bb8f368eb8e1ba1814bd7e6facc', 68, 3, 'authToken', '[]', 0, '2021-11-03 07:49:48', '2021-11-03 07:49:48', '2022-11-03 07:49:48'),
('43e562d23bf46c7ca894b66cfe599db86e3aa8ccaf64b431d848f9bf483a5c14c5f5c2380a916145', NULL, 3, 'authToken', '[]', 0, '2021-09-08 07:47:29', '2021-09-08 07:47:29', '2022-09-08 07:47:29'),
('44e6f6ed475156f800de925a4d5fe2b3ca864a4bc12d8d269f02fe694c3893b7dec348bab2ba4d67', 15, 3, 'authToken', '[]', 0, '2021-09-07 11:54:19', '2021-09-07 11:54:19', '2022-09-07 11:54:19'),
('45c90dae959632a7632229fbb69aeb9d2987302a8db49df0554af820b99e730818a7ae2f44ef4047', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:54', '2021-09-03 13:03:54', '2022-09-03 13:03:54'),
('4710e0a669dd977637f788bc3d15f267c3695ba65bcafeec30ebcf61385001dcac4280d82603a59d', 61, 3, 'authToken', '[]', 0, '2021-11-01 10:02:47', '2021-11-01 10:02:47', '2022-11-01 10:02:47'),
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
('7f8aebf923a62fc98eb8478a788987954579a5bcbcb9dbc65cba226031a679df86d0d8e31b128b5f', 73, 3, 'authToken', '[]', 0, '2021-12-21 09:19:48', '2021-12-21 09:19:48', '2022-12-21 09:19:48'),
('84d916ae051ca3e65c91477b75e53099ef10cb5d774e389ae372bfd9fe6acc64dfec135b656ce5dd', 58, 3, 'authToken', '[]', 0, '2021-11-08 16:08:53', '2021-11-08 16:08:53', '2022-11-08 16:08:53'),
('84e90d6d4e90019a3bc4430e1162d621c5b59730277dd4e1ee0f400e3f2213000e2c3961e65b596b', 65, 3, 'authToken', '[]', 0, '2021-10-13 11:12:39', '2021-10-13 11:12:39', '2022-10-13 11:12:39'),
('8718034b757f1e6a53f86a65bddf4c9c1ad8679304313054e46db365407d44986184569856f98bce', 51, 3, 'authToken', '[]', 0, '2022-01-27 07:39:43', '2022-01-27 07:39:43', '2023-01-27 07:39:43'),
('8b69f8675ad3f0610f64fabc608a390606e05dd60845fd65a8a4ef6039e219e270b12ddb0a197f93', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:56:14', '2021-09-09 07:56:14', '2022-09-09 07:56:14'),
('8c8e89d0d1b7aca79c06e0e0f4d2d047ffa8ac2f8d4eb63eb3ef1bf53aa1ecfa1ac7acdac2856db3', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:03:20', '2021-09-03 13:03:20', '2022-09-03 13:03:20'),
('90e932d2d25f662f755171a1af3647c7afc9d27789dabfa901275e6ce51f5f0e498b2dbc6a28cfa6', 17, 3, 'authToken', '[]', 0, '2021-09-08 06:46:46', '2021-09-08 06:46:46', '2022-09-08 06:46:46'),
('939efaddb858cffe2f7f0cbb0541539c535670900cb06fa9e46a80f4257c53935e4b19c310cb3d32', 46, 3, 'authToken', '[]', 0, '2021-09-10 12:29:46', '2021-09-10 12:29:46', '2022-09-10 12:29:46'),
('968463a4a817cf363f66665af9c1998bfc4c24a395195bc890e7982f2031669a24aa0459b03bc74d', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:12:22', '2021-09-03 13:12:22', '2022-09-03 13:12:22'),
('99531b25734a92de0949d707942824e9119a4dbcfad18247e370ef0273fb7ff4a440dd9f64a7d168', 18, 3, 'authToken', '[]', 0, '2021-09-08 06:51:02', '2021-09-08 06:51:02', '2022-09-08 06:51:02'),
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
('b4e949b4cf0ebefd68577bb3062e5f912d42bfa43bf08c195980b8f80176e7dd79e7e597baf97db9', 72, 3, 'authToken', '[]', 0, '2021-11-10 14:52:16', '2021-11-10 14:52:16', '2022-11-10 14:52:16'),
('b5d70ee41c4c7bb44a8d4db61c75d16f57ab0b543e58228eea3057bde1655f414f928ac6be425939', NULL, 3, 'authToken', '[]', 0, '2021-09-09 07:01:58', '2021-09-09 07:01:58', '2022-09-09 07:01:58'),
('b7f59e0150b08d4eeeae2e164ace1facb39176de58f98377691c23d58c7c6699487ee595c6edd719', 8, 3, 'authToken', '[]', 0, '2021-09-03 13:11:50', '2021-09-03 13:11:50', '2022-09-03 13:11:50'),
('bc5db0a329a0cd354bad8729c40946a36718055ac511713e0412f4f7406ad6c45d0fd91ec215f322', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:15:48', '2021-09-03 12:15:48', '2022-09-03 12:15:48'),
('befff541c2dc4cd7fa36c2edefa8e7c728308d8904da109f8b42c9ea0d976026cd595568807d95fe', 42, 3, 'authToken', '[]', 0, '2021-09-10 06:50:11', '2021-09-10 06:50:11', '2022-09-10 06:50:11'),
('bff6a5b3cf114b4d7a6af5b8bbfc7dbbea3ea2ad39bd601219ac737524f5959d5c444fdd18d5f4b4', 44, 3, 'authToken', '[]', 0, '2021-09-10 06:55:03', '2021-09-10 06:55:03', '2022-09-10 06:55:03'),
('c06517bffffa950a13b564048fed4ecdc757d4085f87995a5c545306b674685d4cd26f71860a1d4d', 14, 3, 'authToken', '[]', 0, '2021-09-08 11:37:24', '2021-09-08 11:37:24', '2022-09-08 11:37:24'),
('c1f919284f10900bef23ba44eb20f78750da3b105e94e315cd812b6f7ad1d1d31aaccaead0d4293c', 72, 3, 'authToken', '[]', 0, '2021-11-10 14:51:52', '2021-11-10 14:51:52', '2022-11-10 14:51:52'),
('c7bb836ef4cddb9a7a9504a9ccb8602962f6569e083dd6ba494e64b68d101f3be48fd4f25d91175b', 47, 3, 'authToken', '[]', 0, '2021-10-08 07:26:47', '2021-10-08 07:26:47', '2022-10-08 07:26:47'),
('c992e90c7b14b0dbc6f793517033512af1ab2365ac355326505ce1ca29b31baf9a431f57a2c857cb', 14, 3, 'authToken', '[]', 0, '2021-09-09 09:39:18', '2021-09-09 09:39:18', '2022-09-09 09:39:18'),
('cae642e68cef1943ac999c0478f52537dcff9b67f8572243e99197661d9f85773ec9c86ad40f67db', 8, 3, 'authToken', '[]', 0, '2021-09-03 12:14:45', '2021-09-03 12:14:45', '2022-09-03 12:14:45'),
('ce16fc77ecf3290beda36d27b3bc1da48444c8058e1ff58cb30cc99d67122400c4328387679914b7', NULL, 3, 'authToken', '[]', 0, '2021-09-09 06:50:29', '2021-09-09 06:50:29', '2022-09-09 06:50:29'),
('ceca013d08e443156cbe06491519c8a33db1cce3a98803c87ad80c6dce004b5af6d215416290fd22', 54, 3, 'authToken', '[]', 0, '2021-11-08 11:36:44', '2021-11-08 11:36:44', '2022-11-08 11:36:44'),
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
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(8, 51, 54, '0', '2021-09-21 09:33:13', '2021-09-21 09:33:13'),
(25, 54, 65, '0', '2021-10-13 11:35:07', '2021-10-13 11:35:07'),
(26, 51, 65, '0', '2021-10-13 12:01:05', '2021-10-13 12:01:05'),
(27, 51, 58, '0', '2021-10-13 12:16:40', '2021-10-13 12:16:40'),
(28, 66, 58, '0', '2021-10-25 07:39:40', '2021-10-25 07:39:40'),
(29, 66, 61, '0', '2021-10-25 07:40:34', '2021-10-25 07:40:34'),
(33, 53, 66, '0', '2021-10-26 12:55:02', '2021-10-26 12:55:02'),
(34, 53, 61, '0', '2021-10-26 12:55:14', '2021-10-26 12:55:14'),
(36, 51, 64, '0', '2021-10-27 11:55:15', '2021-10-27 11:55:15'),
(37, 66, 51, '0', '2021-10-27 14:17:41', '2021-10-27 14:17:41'),
(40, 72, 58, '0', '2021-11-10 14:54:14', '2021-11-10 14:54:14');

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(69, 1, 54, 'AA', 'AAA', 'praise', '00:23:07', 'asdasd', '2021-09-14 12:50:21', '2021-09-22 09:30:04'),
(70, 1, 53, 'A', 'AAA', 'praise', '00:00:00', 'sasd', '2021-09-14 13:09:16', '2021-09-14 13:09:19'),
(71, 1, 54, 'cccc', 'ccccc', 'prayer', '00:00:00', 'asdasdas', '2021-09-14 13:09:45', '2021-09-21 09:50:54'),
(73, 1, 54, 'AAA', 'AAA', 'prayer', '00:00:00', 'asdasd', '2021-09-14 13:16:42', '2021-09-21 09:51:13'),
(74, 1, 54, 'asdasd', 'dasdas', 'praise', '00:00:05', 'dasdasd', '2021-09-14 13:17:05', '2021-09-14 13:17:17'),
(92, 2, 51, 'happy', 'marriage', 'praise', '00:00:25', 'have to attend today', '2021-10-08 09:59:26', '2021-10-08 10:03:46'),
(93, 1, 53, 'Night Prayer', 'Night', 'prayer', '00:00:02', 'Test', '2021-10-26 13:50:14', '2021-10-26 13:50:44'),
(94, 1, 51, 'discuss', 'Prayer', 'prayer', NULL, 'hello this is a pray', '2021-11-04 11:57:28', '2021-11-04 11:57:28'),
(95, 1, 70, 'For healing', 'Lowanna', 'prayer', NULL, 'pray for LoLo Anniversary Reminder: Based on the date the prayers are answered, a pop up reminder can come up with a verse to say thank you. \n\nSpeak the description when adding your new prayer. \n\nAdd promises category', '2021-11-05 21:10:12', '2021-11-05 21:18:54'),
(96, 2, 70, 'For guidance', 'Marie', 'praise', '00:00:00', 'Pray for wisdom', '2021-11-05 21:11:52', '2021-11-05 21:16:32'),
(97, 1, 70, 'For good health', 'Grandma', 'prayer', NULL, 'Good health Anniversary Reminder: Based on the date the prayers are answered, a pop up reminder can come up with a verse to say thank you. \n\nSpeak the description when adding your new prayer. \n\nAdd promises category', '2021-11-05 21:13:06', '2021-11-05 21:18:05'),
(98, 1, 70, 'For project', 'Vickie', 'praise', NULL, 'Help with project', '2021-11-05 21:14:23', '2021-11-05 21:14:23'),
(99, 1, 58, 'xyz 1', 'abcd', 'praise', '00:00:09', 'snehrhe eueueueeu ueueeuey', '2021-11-08 16:09:52', '2021-11-08 16:16:37'),
(100, 1, 69, 'test1', 'John', 'praise', '00:00:00', 'sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue', '2021-11-09 18:30:50', '2021-11-09 18:45:24'),
(101, 2, 69, 'Peter', 'John 1', 'prayer', NULL, 'sjesjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue sjrjrjr eureue', '2021-11-09 18:32:00', '2021-11-09 18:32:00'),
(102, 1, 69, 'testing', 'Mark', 'prayer', NULL, 'shejehesjrjrjr eureue sjrjrjr eureue sjrjrjr eureue', '2021-11-09 18:33:20', '2021-11-09 18:33:20');

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
(36, 63, '2021-10-08', 'testing again', 'daily', '07:05:37', '2021-10-08 14:05:40', '2021-10-08 14:05:40'),
(37, 61, '2021-10-25', 'testing', 'daily', '07:22:06', '2021-10-25 11:19:55', '2021-10-25 11:19:55'),
(38, 66, '2021-10-26', 'hello', 'once', '02:07:50', '2021-10-26 09:06:59', '2021-10-26 09:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `subsriber`
--

CREATE TABLE `subsriber` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subsriber`
--

INSERT INTO `subsriber` (`id`, `user_id`, `name`, `type`, `status`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 73, '', 'monthly', 'active', '0', '1642755970', '2021-12-21 09:06:10', '2021-12-21 09:06:10'),
(2, 73, '', 'monthly', 'active', '1640077641', '1642756041', '2021-12-21 09:07:21', '2021-12-21 09:07:21'),
(3, 73, '', 'monthly', 'active', '1640078442', '1642756842', '2021-12-21 09:20:42', '2021-12-21 09:20:42');

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
  `complete_profile` tinyint(4) NOT NULL DEFAULT 0,
  `account_verified` tinyint(4) NOT NULL DEFAULT 0,
  `is_social` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_social_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_social_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_device_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `contact_no`, `email`, `email_verified_at`, `password`, `otp`, `profile_image`, `complete_profile`, `account_verified`, `is_social`, `user_social_token`, `user_social_type`, `user_device_type`, `user_device_token`, `time_zone`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(51, 'abc', 'xyz', '031234567894', 'abc@getnada.com', '2021-09-13 05:59:17', '$2y$10$qtZcvtwQRROOFb8D3NT7ke7Ctjsn0YahbSxVBpH9ZQTKJzlMJPL82', '497111', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631710008.jpg', 1, 1, NULL, NULL, NULL, 'android', 'eM4190Y9TpOgiLVn0T1uRA:APA91bHPXKK0p23zyIyHHyFSXVgmDCvcv2sgy8LuDxaYOhhlz-BWVjdNRmK2qQpd2GnqFHEjl5L94v8Fbjuyb4tP3nc0WMESqexz0TIDzYFGJtrBg8x1wauS4Q6KQaEBiAzErKKblE2E', 'Asia/Karachi', 0, 'NIQljIwZXK', '2021-09-13 05:58:14', '2022-01-27 07:39:43'),
(52, NULL, NULL, NULL, 'userbhai2@getnada.com', '2021-09-13 06:56:52', NULL, NULL, NULL, 0, 1, 'yes', 'dsfsdfs6565hgfgfdg5', 'apple', 'ios', '45564454', NULL, 1, NULL, '2021-09-13 06:56:52', '2021-09-13 06:56:52'),
(53, 'APPS', 'HERO', '03312478785', 'testing03.appsnado@gmail.com', '2021-09-14 12:32:15', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1633079396.jpg', 1, 1, 'yes', '113584058949264360136', 'google', 'ios', 'e20AJFWHekvjngABEbJmka:APA91bFEjRY9Rx0a1Lq2JeNzWqTr9jBxj49EUJZxeaSrNBGPqkihBVZeY0dhvGycX2yiRn434L0_mVx8AQXHmBuj6X1_2fFw9EWbDlU7yrgBtULKy0XiiUWucDx7Irzq_6YG7OA8Xw4t', 'Asia/Karachi', 1, 'AXVg6Gc0DYqgFoRyUPH2hDZKYCa5TQXTpAutI73TN1RmQERByuXWcNTjuQEZ', '2021-09-14 12:32:15', '2021-10-26 13:04:31'),
(54, 'Henry', 'Miers', '0331247859', 'testing03.appsnado@gmail.com', '2021-09-14 12:46:50', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1635509109.jpg', 1, 1, 'yes', '1020374712114745', 'facebook', 'ios', 'testing', 'Asia/Karachi', 1, 'TfCTHjxQ9xDzjvQbkUwXAHEAh4EwtK4SbE4yyOWnCzjA7J9TGRGWpDQtc2Nj', '2021-09-14 12:46:50', '2021-11-08 11:16:02'),
(55, 'User One', 'One', '03312457898', 'user1@getnada.com', '2021-09-14 13:08:21', '$2y$10$ESQIQGBKV46mEgJj8vhdueLFcxLzAtbCi/eCgha/5kTQ7QM6.H3y.', '744822', NULL, 0, 1, NULL, NULL, NULL, 'ios', 'testing', NULL, 1, 'FONqBFDgrB', '2021-09-14 13:08:03', '2021-09-14 13:08:21'),
(58, 'alex', 'kyle', '2812470213', 'abcd@getnada.com', '2021-09-15 12:42:36', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '995644', NULL, 1, 1, NULL, NULL, NULL, 'android', 'd7L5J3qLSpiVLryGubo9-o:APA91bGpIcQKULkJ5d5UoB_PA19J4J7V5UGG_zyrnBSm6Ib5vpUB0EI6r0K0xfobWfPnbFyuZmjclJ-AqbO_C-snr2Qz_hQ70maLFw-Zbv0X4PcGDlvdS75EWAuRQQ5GTtjpbHLBoRkX', 'Asia/Karachi', 1, '3faGNaCWOJ', '2021-09-15 12:41:04', '2021-11-08 16:27:31'),
(59, 'Lois', 'Walters', NULL, 'loiswalters.51750@gmail.com', '2021-09-15 15:08:49', NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJyreaQnp-i9UOwkeeN4kghLufMknm570hm-TFmD=s96-c', 0, 1, 'yes', '116236071211851184020', 'google', 'android', 'testing', NULL, 1, NULL, '2021-09-15 15:08:49', '2021-09-15 15:08:49'),
(60, 'alex', 'kyle', '03000000000', 'abcd@getnada1.com', '2021-09-15 12:42:36', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '995644', NULL, 0, 1, NULL, NULL, NULL, 'android', 'testing', NULL, 1, '3faGNaCWOJ', '2021-09-15 12:41:04', '2021-09-15 12:42:36'),
(61, 'Steve', 'Robertson', '03444444444', 'testing02.appsnado@gmail.com', '2021-09-24 06:57:12', NULL, NULL, 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1635161339.jpg', 1, 1, 'yes', '1009106673244553', 'facebook', 'ios', 'e8DvaeRGM09XkA4XZkD2sT:APA91bGvgAqxjHwE5pSEnCvZKqke3WTXekeZdbru3jsU96cLXoxc2P0eAGvq9OqQelcdwe5mU_LFtiLHl9vUWwhCLDFqMy5lzt0875Ru3Db4cCsaF5xDhxWr3U16lTs3tzM-HWdQUmav', 'Asia/Karachi', 1, 'Dc4zJDpzdH3tjRWigTxBBjRKF3ykAYoxtG8IcHskDOONnKVvaCHyRxK5cLqe', '2021-09-24 06:57:12', '2021-11-01 10:02:47'),
(62, 'James', 'Martin', '03312564322', 'userbhai1@getnada.com', '2021-09-10 07:13:32', '$2y$10$CtqCxj3pAYDBIRcN3PIUB.CbNi.R5bPNSf589EpZ/dJL3yT2Jj1Vy', '852012', 'https://server.appsstaging.com/3048/prayer/public/uploadedimages/1631276649.jpg', 1, 1, NULL, NULL, NULL, 'ios', 'fZsga6jIFUo6rStDfL1RyC:APA91bG9w2aH-5wV0_Cg8x42-dL7a_ejNCHGK1YBNPPXiAWxDKUOy4NCQgWSpaC7MZO-1tCP1rk21dmgABWAC3hlLnmYBSRuiluEhqKfVoUSoDUzQ41NlYlyRt_P7i8DUzp4LkOE757a', NULL, 1, 'lFi0B5eC7c', '2021-09-10 07:03:07', '2021-09-29 10:55:07'),
(63, 'Ammar', 'Khan', NULL, 'ammaraijaz29@gmail.com', '2021-10-08 14:02:03', NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJxNf3b_GQ5Eme65dsHEsVj6NsqgaavdX4Evl740=s96-c', 0, 1, 'yes', '111186295989095319099', 'google', 'android', 'eS4ZX_-DQ6KWwRNVKUUGZ8:APA91bFdr3rmo4v-4q2Jg4DZNNfI7vghhmljIznilR_IS7juOdv0ELgx1HGyu5vijE2zxw17ECtDZTCTbhk-td0eTKjesE5re61kobQJFzGRnuNeEYMlfRz84vypXofNVrQk5UhOuXa6', 'Asia/Karachi', 1, NULL, '2021-10-08 14:02:03', '2021-10-08 14:02:03'),
(64, 'alex', 'abc', '33161221544', 'alex@getnada.com', '2021-10-11 12:11:46', '$2y$10$WK52UZThN1WQBmdOg8.STe55QXO9xtojITVWAj7NnP8Hr.KAsakUG', '492235', NULL, 1, 1, NULL, NULL, NULL, 'android', 'dSzBguKaS-qqLZcSbeLQOj:APA91bGt8orzzPmEzBk24ot7XAWLAfYSIly2ohCEgm--IRTSS6r-jiBWhFhJkyGiILf5mru3Bgjoce_1-zKzisA3JI-oxTgjEE5g6m2vIgQgKenImI90D85MccR0SZ_YDN8_tbsrs4qK', 'Asia/Karachi', 1, 'qXfVf4M2gq', '2021-10-11 12:11:01', '2022-01-27 07:40:07'),
(65, 'alexa', 'alex', '03333333333', 'alexa@getnada.com', '2021-10-13 11:13:43', '$2y$10$Cos0MCIi.naXUGfRKot0y.EhwK/zBgd3hIvj/gsye5LVRZwGWJf0q', '741722', NULL, 0, 1, NULL, NULL, NULL, 'android', 'cTHSZ_3XT4O8qTFZzkrrst:APA91bHxnZ5CpQbkZXFUoqtXpi-Zi-g6ce32--jXsViSFjyig_MfGGwGUiX31-IdB9z1z7XEGus_NfR-HQ2eVyFbDgAH4StHZkXwV--NX33ThuzroyptvoNIYwCMwNqdWSZ7Dlk1qtKH', NULL, 1, 'OBdm8vSy6p', '2021-10-13 11:12:39', '2021-10-13 11:13:43'),
(66, 'Testing', 'Device Note 10', '03888888888', 'generictestingdevice@gmail.com', '2021-10-25 07:38:28', NULL, NULL, 'https://lh3.googleusercontent.com/a/AATXAJwXzXJJkSnQ4XDrWdQLWMxTa6eMpQcxdClMnxvJ=s96-c', 1, 1, 'yes', '105872336137561112226', 'google', 'android', 'eM4190Y9TpOgiLVn0T1uRA:APA91bHPXKK0p23zyIyHHyFSXVgmDCvcv2sgy8LuDxaYOhhlz-BWVjdNRmK2qQpd2GnqFHEjl5L94v8Fbjuyb4tP3nc0WMESqexz0TIDzYFGJtrBg8x1wauS4Q6KQaEBiAzErKKblE2E', 'Asia/Karachi', 1, '1YJFpEynlFXC7eBFKPcmd7pz7GIEUcHNfMRqEZYn73JeCx64AbdvtmpxtJI2', '2021-10-25 07:38:28', '2022-01-27 06:16:23'),
(68, 'user', 'test', '03312878722', 'user12@getnada.com', NULL, '$2y$10$TvU8Vu49R./k/f0uQCv.COfxg1Tn30fp1ZA3Ta/gzFxLFyWT/LxIC', '511114', NULL, 0, 0, NULL, NULL, NULL, 'ios', 'abcdefg', NULL, 1, 'HDs7mZ0r7Y', '2021-11-03 07:49:48', '2021-11-03 07:49:48'),
(69, 'Austin', 'Baker', NULL, 'austin@fictivestudios.com', '2021-11-05 19:47:10', '$2y$10$n.A04X8NxbF44SX9A6pOVup3lsoh0QIaksg7./7mPtPFUeiEn5c/y', NULL, 'https://lh3.googleusercontent.com/a/AATXAJwXzbjliYeZssBQwCOJx_GmNrdQ9D4FHyBN8wKw=s96-c', 0, 1, 'yes', '102738025410706574531', 'google', 'android', 'cdcmEVTcRNW9BHxyUKPjhE:APA91bG3HQ9k4BleiX6OnaIowvzqP0w9YinQlwj4KlnDRUCujekxpCSwUctZuxYtBBxPXEb450R1BCKonFW8CctynY9S5TwJmLJriQt6xoFwfMid-jdFMYvNJHqH3P4V7dLEUxQkl6Fi', 'Asia/Karachi', 1, NULL, '2021-11-05 19:47:10', '2021-11-09 18:27:24'),
(70, 'Peaches', 'Vee', NULL, 'imeh79@gmail.com', '2021-11-05 21:09:03', NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14GiHgYWTeYFDIcCeVtgWwlSwI01GWuZyhI0PwiUVyQ=s1337', 0, 1, 'yes', '113292221102909153154', 'google', 'ios', 'dpKOeQHbLUCTogboeg_1Ib:APA91bGjVqGPIJsHWFcYIP1QPSb69M5TIWl10w9P0UlEy_dA0VfI0pZOU9wT92Xz-qIy-IlVgQhZFThe_uezXjyqXjW8FBzUwj1aZ43K9BQr_EubLjT1srHzcvfC1jm4249isK5JQr5Y', 'America/Chicago', 1, NULL, '2021-11-05 21:09:03', '2021-11-05 21:09:03'),
(71, 'Hamd', 'Rashid', NULL, 'hamdrashid@gmail.com', '2021-11-05 22:47:14', NULL, NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=5076535195709468&height=800&width=800&ext=1638744432&hash=AeRsK1GCrHF78O1-G-E', 0, 1, 'yes', '5076535195709468', 'facebook', 'ios', 'emzWAE5f_k_ipBqoMNYTs5:APA91bEayuU3mVAahInLOKnKDcFdty-CPZM5LPZuLD821hSVm7o5c_sFT2EoWk_cBLifkhfwZXsDlrU3XuXn7T-0SH1FzSJWX-H5TTcVZRClvDP0BDq791W3cpXLvGikyVafyCKd9JeP', 'Asia/Karachi', 1, NULL, '2021-11-05 22:47:14', '2021-11-05 22:47:14'),
(72, 'Alex', 'Baker', '6453215466', 'alexa9@getnada.com', '2021-11-10 14:52:16', '$2y$10$9pMNuahSV7ViqKgTn9bHrOCSORCXZBqoA7X0J5.qMAKZsG/bcRW8e', '482079', NULL, 0, 1, NULL, NULL, NULL, 'android', 'cdcmEVTcRNW9BHxyUKPjhE:APA91bG3HQ9k4BleiX6OnaIowvzqP0w9YinQlwj4KlnDRUCujekxpCSwUctZuxYtBBxPXEb450R1BCKonFW8CctynY9S5TwJmLJriQt6xoFwfMid-jdFMYvNJHqH3P4V7dLEUxQkl6Fi', NULL, 1, 'JlE0Vbfv8k', '2021-11-10 14:51:52', '2021-11-10 14:52:16'),
(73, 'xyz', 'xyz1', '123456789', 'xyz@mailinator.com', '2021-12-14 07:00:40', '$2y$10$nh6UE5ENCnKRcIdADvKxz.wXcZyfP18yaVY05acQL0p.hw.lQwaQW', '245359', NULL, 0, 1, NULL, NULL, NULL, 'ios', 'testing', 'Asia/Karachi', 1, 'wJ7W2fhNjw', '2021-12-14 06:57:35', '2021-12-21 08:44:07');

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
-- Indexes for table `subsriber`
--
ALTER TABLE `subsriber`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `call_users`
--
ALTER TABLE `call_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prayers`
--
ALTER TABLE `prayers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `subsriber`
--
ALTER TABLE `subsriber`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
