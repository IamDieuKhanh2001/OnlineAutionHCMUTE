-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 31, 2021 lúc 03:00 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `onlineautionhcmute`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_recovery`
--

CREATE TABLE `account_recovery` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_upgrade`
--

CREATE TABLE `account_upgrade` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account_upgrade`
--

INSERT INTO `account_upgrade` (`id`, `user_id`, `status`, `create_time`) VALUES
(1, 2, 'success', '2021-12-25 04:27:21'),
(2, 5, 'fail', '2021-12-28 14:03:58'),
(3, 10, 'success', '2021-12-31 02:38:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auction_history`
--

CREATE TABLE `auction_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deposit_price` double NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auction_history`
--

INSERT INTO `auction_history` (`id`, `product_id`, `user_id`, `deposit_price`, `create_time`, `modified_time`) VALUES
(1, 3, 2, 6000000, '2021-12-25 09:20:34', '2021-12-25 09:20:34'),
(2, 4, 4, 4000000, '2021-12-25 09:49:29', '2021-12-25 09:49:29'),
(3, 3, 4, 2100000, '2021-12-25 09:56:30', '2021-12-25 09:56:30'),
(4, 3, 4, 2200000, '2021-12-25 09:57:03', '2021-12-25 09:57:03'),
(5, 3, 4, 5000000, '2021-12-25 09:57:24', '2021-12-25 09:57:24'),
(6, 5, 4, 9000000, '2021-12-25 09:58:33', '2021-12-25 09:58:33'),
(7, 5, 2, 12000000, '2021-12-25 10:00:02', '2021-12-25 10:00:02'),
(8, 6, 4, 8000000, '2021-12-25 10:02:52', '2021-12-25 10:02:52'),
(9, 6, 2, 6000000, '2021-12-25 10:03:39', '2021-12-25 10:03:39'),
(10, 21, 4, 20000000, '2021-12-28 09:46:22', '2021-12-28 09:46:22'),
(11, 22, 4, 25000000, '2021-12-28 09:46:57', '2021-12-28 09:46:57'),
(12, 37, 4, 10000000, '2021-12-28 09:47:22', '2021-12-28 09:47:22'),
(13, 38, 4, 8000000, '2021-12-28 09:48:01', '2021-12-28 09:48:01'),
(14, 39, 4, 8000000, '2021-12-28 09:48:14', '2021-12-28 09:48:14'),
(15, 43, 4, 7000000, '2021-12-28 09:48:24', '2021-12-28 09:48:24'),
(16, 44, 4, 9000000, '2021-12-28 09:48:33', '2021-12-28 09:48:33'),
(17, 45, 4, 11000000, '2021-12-28 09:48:45', '2021-12-28 09:48:45'),
(18, 23, 4, 9000000, '2021-12-28 09:49:08', '2021-12-28 09:49:08'),
(19, 24, 4, 2000000, '2021-12-28 09:50:21', '2021-12-28 09:50:21'),
(20, 25, 4, 10000000, '2021-12-28 09:50:42', '2021-12-28 09:50:42'),
(21, 40, 4, 15000000, '2021-12-28 09:50:57', '2021-12-28 09:50:57'),
(22, 41, 4, 8000000, '2021-12-28 09:51:08', '2021-12-28 09:51:08'),
(23, 42, 4, 7000000, '2021-12-28 09:51:30', '2021-12-28 09:51:30'),
(24, 46, 4, 15000000, '2021-12-28 09:51:42', '2021-12-28 09:51:42'),
(25, 47, 4, 14000000, '2021-12-28 09:51:52', '2021-12-28 09:51:52'),
(26, 48, 4, 16000000, '2021-12-28 09:52:02', '2021-12-28 09:52:02'),
(27, 27, 4, 12000000, '2021-12-28 09:53:02', '2021-12-28 09:53:02'),
(28, 29, 4, 75000000, '2021-12-28 09:53:26', '2021-12-28 09:53:26'),
(29, 30, 4, 15000000, '2021-12-28 09:53:45', '2021-12-28 09:53:45'),
(30, 31, 4, 17000000, '2021-12-28 09:53:57', '2021-12-28 09:53:57'),
(31, 32, 4, 21000000, '2021-12-28 09:54:07', '2021-12-28 09:54:07'),
(32, 33, 4, 27000000, '2021-12-28 09:54:18', '2021-12-28 09:54:18'),
(33, 34, 4, 12000000, '2021-12-28 09:54:33', '2021-12-28 09:54:33'),
(34, 35, 4, 11000000, '2021-12-28 09:54:53', '2021-12-28 09:54:53'),
(35, 36, 4, 25000000, '2021-12-28 09:55:05', '2021-12-28 09:55:05'),
(36, 49, 4, 15000000, '2021-12-28 09:55:25', '2021-12-28 09:55:25'),
(37, 17, 4, 8000000, '2021-12-28 09:59:11', '2021-12-28 09:59:11'),
(38, 18, 4, 10000000, '2021-12-28 10:00:02', '2021-12-28 10:00:02'),
(39, 20, 4, 7000000, '2021-12-28 10:00:26', '2021-12-28 10:00:26'),
(40, 11, 4, 15000000, '2021-12-28 10:00:34', '2021-12-28 10:00:34'),
(41, 12, 4, 7000000, '2021-12-28 10:00:44', '2021-12-28 10:00:44'),
(42, 14, 4, 7000000, '2021-12-28 10:00:52', '2021-12-28 10:00:52'),
(43, 15, 4, 7000000, '2021-12-28 10:00:59', '2021-12-28 10:00:59'),
(44, 16, 4, 5000000, '2021-12-28 10:01:10', '2021-12-28 10:01:10'),
(45, 9, 4, 10000000, '2021-12-28 10:01:30', '2021-12-28 10:01:30'),
(46, 10, 4, 15000000, '2021-12-28 10:01:40', '2021-12-28 10:01:40'),
(47, 26, 4, 3500000, '2021-12-28 10:02:05', '2021-12-28 10:02:05'),
(48, 28, 4, 6000000, '2021-12-28 10:02:25', '2021-12-28 10:02:25'),
(49, 7, 4, 20000000, '2021-12-28 10:02:35', '2021-12-28 10:02:35'),
(50, 8, 4, 25000000, '2021-12-28 10:02:45', '2021-12-28 10:02:45'),
(52, 4, 5, 3000000, '2021-12-28 10:09:44', '2021-12-28 10:09:44'),
(53, 4, 5, 4000000, '2021-12-28 10:09:55', '2021-12-28 10:09:55'),
(54, 21, 5, 16000000, '2021-12-28 10:10:58', '2021-12-28 10:10:58'),
(55, 21, 5, 17000000, '2021-12-28 10:11:03', '2021-12-28 10:11:03'),
(56, 22, 5, 21000000, '2021-12-28 10:12:11', '2021-12-28 10:12:11'),
(57, 22, 5, 22000000, '2021-12-28 10:12:19', '2021-12-28 10:12:19'),
(58, 37, 5, 6000000, '2021-12-28 10:12:36', '2021-12-28 10:12:36'),
(59, 37, 5, 7000000, '2021-12-28 10:12:41', '2021-12-28 10:12:41'),
(60, 38, 5, 4000000, '2021-12-28 10:12:54', '2021-12-28 10:12:54'),
(61, 38, 5, 5000000, '2021-12-28 10:13:00', '2021-12-28 10:13:00'),
(62, 39, 5, 4000000, '2021-12-28 10:13:13', '2021-12-28 10:13:13'),
(63, 39, 5, 6000000, '2021-12-28 10:13:21', '2021-12-28 10:13:21'),
(64, 43, 5, 3000000, '2021-12-28 10:13:46', '2021-12-28 10:13:46'),
(65, 43, 5, 4000000, '2021-12-28 10:13:49', '2021-12-28 10:13:49'),
(66, 44, 5, 5000000, '2021-12-28 10:13:58', '2021-12-28 10:13:58'),
(67, 44, 5, 6000000, '2021-12-28 10:14:02', '2021-12-28 10:14:02'),
(68, 45, 5, 7000000, '2021-12-28 10:14:14', '2021-12-28 10:14:14'),
(69, 45, 5, 8000000, '2021-12-28 10:14:18', '2021-12-28 10:14:18'),
(70, 23, 5, 5000000, '2021-12-28 10:14:52', '2021-12-28 10:14:52'),
(71, 23, 5, 6000000, '2021-12-28 10:14:57', '2021-12-28 10:14:57'),
(72, 24, 5, 2000000, '2021-12-28 10:15:12', '2021-12-28 10:15:12'),
(73, 24, 5, 2200000, '2021-12-28 10:15:30', '2021-12-28 10:15:30'),
(74, 25, 5, 5200000, '2021-12-28 10:16:31', '2021-12-28 10:16:31'),
(75, 25, 5, 5400000, '2021-12-28 10:16:38', '2021-12-28 10:16:38'),
(76, 40, 5, 10500000, '2021-12-28 10:16:50', '2021-12-28 10:16:50'),
(77, 40, 5, 11000000, '2021-12-28 10:16:56', '2021-12-28 10:16:56'),
(78, 41, 5, 3500000, '2021-12-28 10:17:10', '2021-12-28 10:17:10'),
(79, 41, 5, 4000000, '2021-12-28 10:17:15', '2021-12-28 10:17:15'),
(80, 42, 5, 2500000, '2021-12-28 10:17:40', '2021-12-28 10:17:40'),
(81, 42, 5, 3000000, '2021-12-28 10:17:45', '2021-12-28 10:17:45'),
(82, 46, 5, 10500000, '2021-12-28 10:18:18', '2021-12-28 10:18:18'),
(83, 46, 5, 11000000, '2021-12-28 10:18:23', '2021-12-28 10:18:23'),
(84, 47, 5, 9500000, '2021-12-28 10:18:40', '2021-12-28 10:18:40'),
(85, 47, 5, 10000000, '2021-12-28 10:18:46', '2021-12-28 10:18:46'),
(86, 48, 5, 11500000, '2021-12-28 10:19:02', '2021-12-28 10:19:02'),
(87, 48, 5, 12000000, '2021-12-28 10:19:07', '2021-12-28 10:19:07'),
(88, 6, 5, 6100000, '2021-12-28 10:19:21', '2021-12-28 10:19:21'),
(89, 6, 5, 6200000, '2021-12-28 10:19:30', '2021-12-28 10:19:30'),
(90, 6, 5, 6300000, '2021-12-28 10:19:41', '2021-12-28 10:19:41'),
(91, 26, 5, 3200000, '2021-12-28 10:19:55', '2021-12-28 10:19:55'),
(92, 26, 5, 3400000, '2021-12-28 10:20:02', '2021-12-28 10:20:02'),
(93, 27, 5, 7200000, '2021-12-28 10:20:13', '2021-12-28 10:20:13'),
(94, 27, 5, 7400000, '2021-12-28 10:20:19', '2021-12-28 10:20:19'),
(95, 28, 5, 5200000, '2021-12-28 10:20:28', '2021-12-28 10:20:28'),
(96, 28, 5, 5400000, '2021-12-28 10:20:33', '2021-12-28 10:20:33'),
(97, 7, 5, 16000000, '2021-12-28 10:20:44', '2021-12-28 10:20:44'),
(98, 7, 5, 17000000, '2021-12-28 10:20:53', '2021-12-28 10:20:53'),
(99, 8, 5, 22000000, '2021-12-28 10:21:13', '2021-12-28 10:21:13'),
(100, 8, 5, 24000000, '2021-12-28 10:21:20', '2021-12-28 10:21:20'),
(101, 29, 5, 72000000, '2021-12-28 10:21:33', '2021-12-28 10:21:33'),
(102, 29, 5, 74000000, '2021-12-28 10:21:39', '2021-12-28 10:21:39'),
(103, 9, 5, 6000000, '2021-12-28 10:21:52', '2021-12-28 10:21:52'),
(104, 9, 5, 7000000, '2021-12-28 10:21:57', '2021-12-28 10:21:57'),
(105, 10, 5, 10200000, '2021-12-28 10:22:17', '2021-12-28 10:22:17'),
(106, 10, 5, 10400000, '2021-12-28 10:22:23', '2021-12-28 10:22:23'),
(107, 11, 5, 11500000, '2021-12-28 10:22:34', '2021-12-28 10:22:34'),
(108, 11, 5, 12000000, '2021-12-28 10:22:38', '2021-12-28 10:22:38'),
(109, 12, 5, 3000000, '2021-12-28 10:22:49', '2021-12-28 10:22:49'),
(110, 12, 5, 4000000, '2021-12-28 10:22:54', '2021-12-28 10:22:54'),
(111, 14, 5, 2050000, '2021-12-28 10:23:17', '2021-12-28 10:23:17'),
(112, 14, 5, 2100000, '2021-12-28 10:23:23', '2021-12-28 10:23:23'),
(113, 15, 5, 2100000, '2021-12-28 10:23:32', '2021-12-28 10:23:32'),
(114, 15, 5, 2200000, '2021-12-28 10:23:36', '2021-12-28 10:23:36'),
(115, 16, 5, 3150000, '2021-12-28 10:23:49', '2021-12-28 10:23:49'),
(116, 16, 5, 3300000, '2021-12-28 10:23:55', '2021-12-28 10:23:55'),
(117, 20, 5, 2150000, '2021-12-28 10:24:23', '2021-12-28 10:24:23'),
(118, 20, 5, 2300000, '2021-12-28 10:24:32', '2021-12-28 10:24:32'),
(121, 17, 5, 3150000, '2021-12-28 10:26:33', '2021-12-28 10:26:33'),
(122, 17, 5, 3300000, '2021-12-28 10:26:37', '2021-12-28 10:26:37'),
(123, 18, 5, 51500000, '2021-12-28 10:26:53', '2021-12-28 10:26:53'),
(124, 30, 5, 11000000, '2021-12-28 10:27:19', '2021-12-28 10:27:19'),
(125, 30, 5, 12000000, '2021-12-28 10:27:27', '2021-12-28 10:27:27'),
(126, 31, 5, 13000000, '2021-12-28 10:27:38', '2021-12-28 10:27:38'),
(127, 31, 5, 14000000, '2021-12-28 10:27:44', '2021-12-28 10:27:44'),
(128, 32, 5, 17000000, '2021-12-28 10:27:53', '2021-12-28 10:27:53'),
(129, 32, 5, 18000000, '2021-12-28 10:27:59', '2021-12-28 10:27:59'),
(130, 33, 5, 23000000, '2021-12-28 10:28:14', '2021-12-28 10:28:14'),
(131, 33, 5, 24000000, '2021-12-28 10:28:20', '2021-12-28 10:28:20'),
(132, 34, 5, 7500000, '2021-12-28 10:28:38', '2021-12-28 10:28:38'),
(133, 34, 5, 8000000, '2021-12-28 10:28:43', '2021-12-28 10:28:43'),
(134, 35, 5, 7000000, '2021-12-28 10:28:54', '2021-12-28 10:28:54'),
(135, 35, 5, 8000000, '2021-12-28 10:29:01', '2021-12-28 10:29:01'),
(136, 36, 5, 21000000, '2021-12-28 10:29:13', '2021-12-28 10:29:13'),
(137, 49, 5, 10500000, '2021-12-28 10:29:33', '2021-12-28 10:29:33'),
(138, 49, 5, 11000000, '2021-12-28 10:29:42', '2021-12-28 10:29:42'),
(139, 5, 4, 9400000, '2021-12-28 10:30:12', '2021-12-28 10:30:12'),
(140, 5, 4, 9600000, '2021-12-28 10:30:25', '2021-12-28 10:30:25'),
(141, 24, 4, 2400000, '2021-12-28 10:30:44', '2021-12-28 10:30:44'),
(142, 18, 4, 10300000, '2021-12-28 10:31:34', '2021-12-28 10:31:34'),
(143, 18, 4, 10450000, '2021-12-28 10:31:41', '2021-12-28 10:31:41'),
(144, 36, 5, 22000000, '2021-12-28 10:33:00', '2021-12-28 10:33:00'),
(145, 22, 8, 35000000, '2021-12-29 06:26:21', '2021-12-29 06:26:21'),
(146, 3, 10, 5100000, '2021-12-31 02:35:26', '2021-12-31 02:35:26'),
(147, 3, 10, 10000000, '2021-12-31 02:35:46', '2021-12-31 02:35:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auction_permission`
--

CREATE TABLE `auction_permission` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auction_permission`
--

INSERT INTO `auction_permission` (`id`, `product_id`, `user_id`, `status`, `create_time`) VALUES
(1, 3, 2, 'accept', '2021-12-25 09:19:48'),
(2, 4, 4, 'accept', '2021-12-25 09:48:50'),
(3, 5, 2, 'accept', '2021-12-25 09:59:46'),
(4, 6, 2, 'accept', '2021-12-25 10:03:26'),
(5, 19, 4, 'block', '2021-12-29 06:20:53'),
(6, 19, 5, 'block', '2021-12-29 06:20:56'),
(7, 22, 8, 'accept', '2021-12-29 06:25:32'),
(8, 3, 10, 'accept', '2021-12-31 02:34:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `create_time`, `modified_time`) VALUES
(1, 'Điện thoại', '2021-12-25 04:18:31', '2021-12-25 04:18:31'),
(2, 'Ô tô ', '2021-12-25 04:19:25', '2021-12-25 04:19:25'),
(3, 'Xe máy', '2021-12-25 04:19:31', '2021-12-25 04:19:31'),
(4, 'Giày dép', '2021-12-25 04:19:48', '2021-12-25 04:19:48'),
(5, 'Máy tính', '2021-12-25 04:19:59', '2021-12-25 04:19:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_confirm`
--

CREATE TABLE `email_confirm` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `json_data` text NOT NULL,
  `hash` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `email_confirm`
--

INSERT INTO `email_confirm` (`id`, `user_id`, `purpose`, `status`, `json_data`, `hash`, `create_time`) VALUES
(1, 1, 'confirm_email', 'success', '{\"email\":\"quachdieukhanh@gmail.com\"}', '9c375cb54252ba1fdba8995b7465f289c42276840ede493b3b269aff86426be2', '2021-12-25 04:16:45'),
(2, 2, 'confirm_email', 'success', '{\"email\":\"19110226@student.hcmute.edu.vn\"}', 'e4f462e7b3cb7aa643b7babc62234fd3d757713e661691d2435d41172368dca2', '2021-12-25 04:25:40'),
(3, 3, 'confirm_email', 'success', '{\"email\":\"2vinhpx2001@gmail.com\"}', 'cdc9589a9c71edd03b555721c77fefaa5b9b8c091e5a13527bab4ea774f0f75a', '2021-12-25 04:28:51'),
(4, 4, 'confirm_email', 'success', '{\"email\":\"quachdieukhanh123@gmail.com\"}', 'd5d8b13de265c33939655d32834c088d624d935b229ec9621da965f503644f76', '2021-12-25 04:32:14'),
(5, 8, 'confirm_email', 'success', '{\"email\":\"19110226@student.hcmute.edu.vn\"}', 'e4f462e7b3cb7aa643b7babc62234fd3d757713e661691d2435d41172368dca2', '2021-12-29 06:22:46'),
(6, 9, 'confirm_email', 'success', '{\"email\":\"19110226@student.hcmute.edu.vn\"}', 'e4f462e7b3cb7aa643b7babc62234fd3d757713e661691d2435d41172368dca2', '2021-12-29 06:28:26'),
(7, 10, 'confirm_email', 'success', '{\"email\":\"clonebytrung@gmail.com\"}', 'e09cd32053f73c164c0f88c7511f2ee37e67a558641f8d54ff5db60918c6b52e', '2021-12-31 02:33:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_notification_seller`
--

CREATE TABLE `email_notification_seller` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `email_notification_seller`
--

INSERT INTO `email_notification_seller` (`id`, `product_id`, `create_time`) VALUES
(48, 21, '2021-12-31 01:54:40'),
(49, 5, '2021-12-31 01:54:40'),
(50, 4, '2021-12-31 01:54:40'),
(51, 3, '2021-12-31 02:44:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `evaluation`
--

CREATE TABLE `evaluation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `assessor` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `comment` text NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `evaluation`
--

INSERT INTO `evaluation` (`id`, `product_id`, `assessor`, `user_id`, `type`, `comment`, `create_time`) VALUES
(1, 4, 4, 2, 'dislike', 'Trễ hẹn', '2021-12-25 09:52:07'),
(2, 4, 2, 4, 'like', 'Go Go Go', '2021-12-25 09:53:06'),
(3, 12, 2, 5, 'like', 'Thank', '2021-12-25 09:53:06'),
(4, 21, 2, 4, 'like', 'Nhận hàng nhanh, đúng hẹn', '2021-12-29 06:11:51'),
(5, 21, 2, 4, 'dislike', 'Trễ 20p', '2021-12-29 06:11:51'),
(6, 21, 2, 4, 'like', 'Nhanh chóng', '2021-12-29 06:11:51'),
(7, 21, 2, 4, 'like', 'Nhanh chóng', '2021-12-29 06:11:51'),
(8, 21, 2, 9, 'dislike', 'Bom hàng', '2021-12-29 06:11:51'),
(9, 21, 2, 9, 'dislike', 'Giao sai ', '2021-12-29 06:11:51'),
(10, 21, 4, 2, 'like', 'Hàng đẹp', '2021-12-31 02:41:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price_start` double NOT NULL,
  `price_step` double NOT NULL,
  `price_current` double NOT NULL,
  `price_buy_now` double NOT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `user_id_holding_price` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `product_type_id`, `user_id`, `price_start`, `price_step`, `price_current`, `price_buy_now`, `end_time`, `user_id_holding_price`, `create_time`, `modified_time`) VALUES
(3, 'Iphone 11', '<p>Quay video 4K, chụp ảnh chân dung tuyệt đẹp và chụp ảnh phong cảnh rộng với hệ thống camera kép hoàn toàn mới. Chụp ảnh tuyệt đẹp trong điều kiện ánh sáng yếu với chế độ Ban Đêm. Xem ảnh, video và chơi game màu sắc chân thực trên màn hình Liquid Retina 6.1 inch (3). Trải nghiệm hiệu năng chưa từng có với chip A13 Bionic cho game, thực tế ảo tăng cường (AR) và chụp ảnh. Làm được nhiều việc hơn và sạc ít hơn với thời lượng pin bền bỉ cả ngày (2). Và bớt phải lo lắng nhờ khả năng chống nước ở độ sâu tối đa 2 mét trong vòng 30 phút (1).</p><br>Bổ sung vào lúc: Sat Dec 25 16:19:36 ICT 2021<br><p>Beautiful Luxury</p>', 1, 2, 2000000, 100000, 6100000, 21000000, '2021-12-31 02:44:00', 10, '2021-12-25 04:49:56', '2021-12-31 02:35:46'),
(4, 'Iphone 4s', '<p><strong><span style=\"color: #e03e2d;\">iPhone </span>4S <em>là</em></strong><em> một điện thoại thông minh với màn hình cảm ứng được <strong>Apple</strong> Inc phát triển, sản xuất và đưa ra thị trường. <strong>Là</strong> thế hệ thứ năm của <strong>iPhone</strong>, <strong>iPhone 4S</strong> giữ <strong>lại</strong> thiết kế bên ngoài của <strong>iPhone 4</strong>, nhưng có nhiều cải tiến về cấu hình và phần mềm.</em></p>', 1, 2, 2000000, 100000, 4000000, 9000000, '2021-12-28 04:54:28', 4, '2021-12-25 04:54:28', '2021-12-28 10:09:55'),
(5, 'Samsung', '<p>Nhờ chế độ gập mở đa góc độ Flex Mode, Galaxy Z Fold3 5G mở ra một thế giới tuyệt vời với khả năng đứng thẳng độc đáo.<sup><a class=\"click_sup\" title=\"Xem chú thích\" href=\"https://www.samsung.com/vn/smartphones/galaxy-z-fold3-5g/?cid=vn_pd_ppc_sem_q2b2_sustain_Sustain-Google-SEM-Q2B2-Warm-Dec-Brand-Model-ZFold3-TextAds_none_none&amp;utm_source=sem&amp;utm_medium=searchl&amp;utm_campaign=sustain-Google-SEM-Q2B2-Warm-Dec-Brand-Model-ZFold3-TextAds&amp;utm_term=h&amp;utm_content=none&amp;gclid=Cj0KCQiA_JWOBhDRARIsANymNOYYx_TjTYCsxEA5f1l3Yr5gHa2R0jmRy_98B2cyHGXCONSqKOrn9MsaAgR6EALw_wcB#disclaimer2\">2</a></sup> Thiết kế cân đối hoàn hảo cho bạn thỏa sức khám phá kỷ nguyên tiếp theo của tương lai điện thoại thông minh.</p>\r\n<p>Chiếc điện thoại Galaxy Fold gọn nhẹ nhất từ trước đến nay, với màn hình lớn từ trong ra ngoài. Khi gập lại, nó là một điện thoại thông minh 6,2 inch cao cấp có thể cầm và thao tác chỉ với một tay.<sup><a class=\"click_sup\" title=\"Xem chú thích\" href=\"https://www.samsung.com/vn/smartphones/galaxy-z-fold3-5g/?cid=vn_pd_ppc_sem_q2b2_sustain_Sustain-Google-SEM-Q2B2-Warm-Dec-Brand-Model-ZFold3-TextAds_none_none&amp;utm_source=sem&amp;utm_medium=searchl&amp;utm_campaign=sustain-Google-SEM-Q2B2-Warm-Dec-Brand-Model-ZFold3-TextAds&amp;utm_term=h&amp;utm_content=none&amp;gclid=Cj0KCQiA_JWOBhDRARIsANymNOYYx_TjTYCsxEA5f1l3Yr5gHa2R0jmRy_98B2cyHGXCONSqKOrn9MsaAgR6EALw_wcB#disclaimer3\">3</a></sup> Khi mở ra, bạn sẽ có một giao diện lớn, mở ra những trải nghiệm đột phá mới.</p>', 2, 2, 1000000, 200000, 9600000, 50000000, '2021-12-27 04:59:19', 2, '2021-12-25 04:59:19', '2021-12-28 10:30:25'),
(6, 'Xiaomi note 10', '<h3><a href=\"https://www.thegioididong.com/dtdd-xiaomi\">Xiaomi</a> đã trình làng chiếc điện thoại mang tên gọi là <a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-note-10\">Xiaomi Redmi Note 10</a> với điểm nhấn chính là cụm 4 camera 48 MP, chip rồng Snapdragon 678 mạnh mẽ cùng nhiều nâng cấp như dung lượng pin 5.000 mAh và hỗ trợ sạc nhanh 33 W tiện lợi.</h3>', 3, 2, 1500000, 100000, 6300000, 10000000, '2021-12-31 05:01:29', 4, '2021-12-25 05:01:29', '2021-12-28 10:19:41'),
(7, 'Vinfast 2021 1A', '<p>Xe VinFast Fadil là một mẫu CUV (Crossover) 5 chỗ thuộc phân khúc A nhỏ gọn với phong cách thiết kế thể hiện sự trẻ trung, hiện đại và năng động. Là mẫu xe phù hợp để di chuyển trong nội đô với thiết kế nhỏ gọn cân đối, khung gầm xe được nâng cao thoải mái di chuyển trên nhiều loại địa hình khác nhau, cho cảm giác lái tuyệt vời.</p><br>Bổ sung vào lúc: Sat Dec 25 12:04:03 ICT 2021<br><p>xe đỏ, 2021</p>', 4, 3, 15000000, 1000000, 17000000, 100000000, '2021-12-31 05:03:26', 4, '2021-12-25 05:03:26', '2021-12-28 10:20:53'),
(8, 'Vinfast lux 2.0', '<p><strong>VinFast Lux A2.0</strong> là chiếc sedan hạng D, nó có kích thước tổng thể là: 4.973 x 1.900 x 1.500mmm. Tất cả có chung chiều dài cơ sở là 2.968mm và khoảng sáng gầm xe tối thiểu 150mm.</p>\r\n<p>Sự khác biệt giữa các biến thể đến từ yếu tố mạ chrome trên thân xe. Chúng chỉ có trên Lux A2.0 Plus và Premium. Thiết kế này không chỉ khiến kiểu dáng xe thêm hiện đại mà còn mang đến sức hút cao cấp. Ngoài ra, các biến thể này cũng có ống xả đôi thay vì đơn như bản Base.</p>', 4, 3, 20000000, 2000000, 24000000, 150000000, '2021-12-31 05:06:13', 4, '2021-12-25 05:06:13', '2021-12-28 10:21:20'),
(9, 'Toyota Raize', '<p><span style=\"color: #000000;\">Xe</span> được trang bị động cơ 1KR-VET 1.0L tăng áp 3 xi lanh tạo ra công suất 98 PS tại vòng tua 6.000 v/p và mô-men xoắn 140 Nm tại vòng tua 2.400 đến 4.000 vòng/phút.</p>\r\n<p>Phiên bản 1.2G sử dụng động cơ WA-VE 1.2L 3 xi lanh hút khí tự nhiên cho công suất 88 PS tại vòng tua 6.000 v/p và mô men xoắn cực đại 113 Nm tại vòng tua 4.500 v/p.</p>', 5, 3, 5000000, 1000000, 7000000, 100000000, '2021-12-31 05:08:29', 4, '2021-12-25 05:08:29', '2021-12-28 10:21:57'),
(10, 'Toyota vios', '<p>Tại Việt Nam, Vios E số tự động được nhiều người ưa chuộng. Với thiết kế trẻ trung, sang trọng, được nâng cấp nhiều tính năng hiện đại mà giá cả hợp lý. Đặc biệt, dòng xe này có động cơ cực kì bền bỉ và tiết kiệm nhiên liệu, thân thiện với môi trường. Với phiên bản Toyota Vios 1.5E CVT 2021 mới này hứa hẹn sẽ đem lại thành công lớn hơn cho hãng xe Nhật tại thị trường Việt Nam cũng như Tây Ninh nói riêng.</p>', 5, 3, 10000000, 200000, 10400000, 50000000, '2021-12-31 05:10:20', 4, '2021-12-25 05:10:20', '2021-12-28 10:22:23'),
(11, 'SH mode 150i', '<p>Thuộc phân khúc xe ga cao cấp và thừa hưởng thiết kế sang trọng nổi tiếng của dòng xe SH, Sh mode luôn được đánh giá cao nhờ kiểu dáng sang trọng, tinh tế tới từng đường nét, động cơ tiên tiến và các tiện nghi cao cấp xứng tầm phong cách sống thời thượng, đẳng cấp.</p>', 6, 3, 10000000, 1500000, 12000000, 90000000, '2021-12-31 05:12:08', 4, '2021-12-25 05:12:08', '2021-12-28 10:22:38'),
(12, 'SH 2021', '<p>Thuộc phân khúc 2021 xe ga cao cấp và thừa hưởng thiết kế sang trọng nổi tiếng của dòng xe SH, Sh mode luôn được đánh giá cao nhờ kiểu dáng sang trọng, tinh tế tới từng đường nét, động cơ tiên tiến và các tiện nghi cao cấp xứng tầm phong cách sống thời thượng, đẳng cấp.</p>', 6, 3, 2000000, 1000000, 4000000, 100000000, '2021-12-31 05:14:50', 4, '2021-12-25 05:14:50', '2021-12-28 10:22:54'),
(13, 'Honda 2021', '<p>Thuộc phân khúc xe ga cao cấp và thừa hưởng thiết kế sang trọng nổi tiếng của dòng xe Honda, Honda luôn được đánh giá cao nhờ kiểu dáng sang trọng, tinh tế tới từng đường nét, động cơ tiên tiến và các tiện nghi cao cấp xứng tầm phong cách sống thời thượng, đẳng cấp.</p>', 7, 3, 20000000, 100000, 20000000, 20000000, '2021-12-31 05:16:20', NULL, '2021-12-25 05:16:20', '2021-12-25 05:16:20'),
(14, 'Nike air max', '<p>We could tell you that our innovative Air system delivers the best sensation you\'ve ever felt. Or say how the honeycombed foam midsole gives you an incredible, super-soft feel. We could tell you a lot of things about these shoes. But what fun is giving away all the surprises? Lace up and ride the next era of Air for yourself.</p>', 8, 3, 2000000, 50000, 2100000, 9000000, '2021-12-31 05:18:45', 4, '2021-12-25 05:18:45', '2021-12-28 10:23:23'),
(15, 'Nike air force 1', '<p><strong>We could tell you that our innovative Air system delivers the best sensation you\'ve ever felt. Or say how the honeycombed foam midsole gives you an incredible, super-soft feel. We could tell you a lot of things about these shoes. But what fun is giving away all the surprises? Lace up and ride the next era of Air for yourself.</strong></p>', 8, 3, 2000000, 100000, 2200000, 9000000, '2021-12-31 05:20:17', 4, '2021-12-25 05:20:17', '2021-12-28 10:23:36'),
(16, 'Adidas superstar', '<p>Xịn đẹp sang trọng</p>', 9, 3, 3000000, 150000, 3300000, 8000000, '2021-12-31 05:22:08', 4, '2021-12-25 05:22:08', '2021-12-28 10:23:55'),
(17, 'Asus vivobook', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\">\r\n<li><span class=\"a-list-item\">ASUS VivoBook R Series 15.6\" FHD NanoEdge Cuaderno con pantalla táctil</span></li>\r\n<li><span class=\"a-list-item\">Intel Core i5-1035G1 1.0GHz con velocidad turbo de hasta 3.6GHz, caché de 6M</span></li>\r\n<li><span class=\"a-list-item\">8GB DDR4 2666MHz So-Dimm - 256GB PCIe SSD</span></li>\r\n<li><span class=\"a-list-item\">Teclado retroiluminado - Lector de huellas dactilares - Pantalla NanoEdge - WiFi + Bluetooth 5.0</span></li>\r\n<li><span class=\"a-list-item\">Windows 10 Home, 2 USB 3.1, 1 USB 3.2, 1 USB tipo C, puerto HDMI, lector de tarjetas micro SD</span></li>\r\n</ul>', 10, 3, 3000000, 150000, 3300000, 15000000, '2021-12-31 05:24:22', 4, '2021-12-25 05:24:22', '2021-12-28 10:26:37'),
(18, 'Asus nitro 5 2021', '<p>Là phiên bản mới nhất được ra mắt vào cuối 2021, mặc dù vẫn tập trung vào hiệu năng nhưng Acer vẫn đưa một chút cải tiến thêm về thiết kế ở phần tản nhiệt sau. Với nhiệt lượng lớn được tỏa ra khi chơi game, đây là cách mà Acer giúp các bạn có được hiệu năng chơi game tốt nhất trên dòng laptop gaming của mình.</p>', 10, 3, 5000000, 150000, 10450000, 200000000, '2021-12-31 05:26:15', 5, '2021-12-25 05:26:15', '2021-12-28 10:31:41'),
(19, 'Lenovo think pad pro', '<p>Là phiên bản mới nhất được ra mắt vào cuối 2021, mặc dù vẫn tập trung vào hiệu năng nhưng Acer vẫn đưa một chút cải tiến thêm về thiết kế ở phần tản nhiệt sau. Với nhiệt lượng lớn được tỏa ra khi chơi game, đây là cách mà Acer giúp các bạn có được hiệu năng chơi game tốt nhất trên dòng laptop gaming của mình.</p>', 11, 3, 2000000, 100000, 2000000, 6000000, '2021-12-31 05:28:12', 0, '2021-12-25 05:28:12', '2021-12-29 06:20:56'),
(20, 'Macbook pro 2021', '<p>Là phiên bản mới nhất được ra mắt vào cuối 2021, mặc dù vẫn tập trung vào hiệu năng nhưng Acer vẫn đưa một chút cải tiến thêm về thiết kế ở phần tản nhiệt sau. Với nhiệt lượng lớn được tỏa ra khi chơi game, đây là cách mà Acer giúp các bạn có được hiệu năng chơi game tốt nhất trên dòng laptop gaming của mình.</p>', 12, 3, 2000000, 150000, 2300000, 9000000, '2021-12-31 05:29:36', 4, '2021-12-25 05:29:36', '2021-12-28 10:24:32'),
(21, 'Apple iPhone 12 64GB', '<p>iPhone 12 đẩy nhanh mọi tác vụ với mạng 5G siêu nhanh(1). A14 Bionic, chip nhanh nhất trên điện thoại thông minh. Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động.</p>', 1, 2, 15000000, 1000000, 17000000, 25000000, '2021-12-26 07:04:52', 4, '2021-12-28 07:04:52', '2021-12-28 10:11:03'),
(22, 'Apple iPhone 13 Pro Max 256GB', '<p>iPhone 13 Pro Max. Một nâng cấp hệ thống camera chuyên nghiệp hoành tráng chưa từng có. Màn hình Super Retina XDR với ProMotion cho cảm giác nhanh nhạy hơn. Chip A15 Bionic thần tốc. Mạng 5G siêu nhanh.1 Thiết kế bền bỉ và thời lượng pin dài nhất từng có trên iPhone (2).</p>', 1, 2, 20000000, 1000000, 26000000, 38000000, '2021-12-31 07:07:58', 8, '2021-12-28 07:07:58', '2021-12-29 06:26:21'),
(23, 'Galaxy Tab A7 Lite', '<p> Thiết kế siêu mỏng nhẹ Galaxy Tab A7 Lite sở hữu kiểu thiết kế đặc trưng của dòng Galaxy Tab A7. Thiết bị sử dụng chất liệu nhôm với thiết kế nguyên khối giúp cho máy trở nên cao cấp hơn dù chỉ thuộc phân khúc tầm trung giá rẻ.</p>', 2, 2, 4000000, 200000, 6000000, 10000000, '2021-12-31 07:13:56', 4, '2021-12-28 07:13:56', '2021-12-28 10:14:57'),
(24, 'Samsung Galaxy A12', '<p>Màn hình Công nghệ màn hình: PLS TFT LCD Độ phân giải: HD+ (720 x 1600 Pixels) Màn hình rộng: 6.5\"</p>\r\n<p>Camera sau Độ phân giải: Chính 48 MP &amp; Phụ 5 MP, 2 MP, 2 MP Quay phim: FullHD 1080p@30fps Đèn Flash: Có Tính năng: Zoom kỹ thuật số Góc rộng (Wide) Chạm lấy nét Góc siêu rộng (Ultrawide) Siêu cận (Macro) Xóa phông Tự động lấy nét (AF) Nhận diện khuôn mặt HDR Làm đẹp</p>', 2, 2, 1000000, 200000, 2400000, 4000000, '2021-12-31 07:16:59', 4, '2021-12-28 07:16:59', '2021-12-28 10:30:44'),
(25, 'Galaxy Tab S7 FE', '<p>Màn hình Công nghệ màn hình: TFT LCD Độ phân giải: 1600 x 2560 Pixels</p>\r\n<p>Màn hình rộng: 12.4\" Hệ điều hành &amp; CPU Hệ điều hành: Android 11 Chip xử lý (CPU): Snapdragon 750G Tốc độ CPU: 2 nhân 2.2 GHz &amp; 6 nhân 1.8 GHz Chip đồ hoạ (GPU): Adreno 619 Bộ nhớ &amp; Lưu trữ RAM: 4 GB Bộ nhớ trong: 64 GB Bộ nhớ còn lại (khả dụng) khoảng: 50 GB Thẻ nhớ ngoài: Micro SD, hỗ trợ tối đa 1 TB</p>', 2, 2, 5000000, 200000, 5400000, 11000000, '2021-12-31 07:21:16', 4, '2021-12-28 07:21:16', '2021-12-28 10:16:38'),
(26, 'Xiaomi POCO X3 PRO', '', 3, 2, 3000000, 200000, 3400000, 5700000, '2021-12-31 07:26:21', 4, '2021-12-28 07:26:21', '2021-12-28 10:20:02'),
(27, 'Xiaomi 11T Pro 12', '<p>Tháng 10 này Xiaomi đã cho ra mắt sản phẩm điện thoại Xiaomi 11T PRO được bán chính thức tại Xiaomi Official Store trên Shopee Mall. Một dòng điện thoại hiện thân cho những giá trị cốt lõi của Xiaomi, điện thoại Xiaomi 11T series sở hữu 1 trong những công nghệ máy ảnh tốt nhất, và 1 trong những màn hình LCD tốt nhất với tần số quét 144Hz. Không những Fans Xiaomi mà cả giới truyền thông đều yêu thích những tính năng đặc biệt này. Tiếp nối thành công của Mi 10T pro. Thước phim ma thuật là cảm giác bạn được hòa mình vào 1 kiệt tác. Đó là cảm xúc chân thật hệt như các nhân vật trong phim. Trước đây việc trải nghiệm hoặc ghi lại những khoảnh khắc như vậy trong cuộc sống của bạn rất khó khăn và tốn kém. Điện thoại Xiaomi 11T và 11 T pro được thiết kế với tư duy Thước Phim Ma Thuật để cho ra những đoạn phim và hình ảnh mang chiều sâu thật nhất với màn hình 120Hz AMOLED, Hỗ trợ Dolby Vision®được bảo vệ bởi Corning Gorilla Glass VictusTM. Xiaomi 11T pro còn mang lại trải nghiệm điện ảnh, âm thanh cực sống động với bộ đôi chuyên dụng của Xiaomi 11T Pro loa phân phối với hỗ trợ SOUND BY Harman Kardon và Dolby Atmos.</p>', 3, 2, 7000000, 200000, 7400000, 15990000, '2021-12-31 07:29:20', 4, '2021-12-28 07:29:20', '2021-12-28 10:20:19'),
(28, 'POCO F3', '<p>Sở hữu sức mạnh “vô đối” đến từ CPU của nhà Qualcomm, Xiaomi POCO F3 mang đến người dùng cơ hội trải nghiệm hiệu năng của flagship hàng đầu trong mức giá tầm trung, một “món hời” mà các tín đồ “hệ gaming” không thể nào bỏ qua.</p>\r\n<p>POCO F3 hiển thị mọi thứ sống động rực rỡ với màn hình AMOLED, vật liệu E4 cao cấp mang đến màu sắc chính xác tuyệt vời, hỗ trợ HDR 10+ giúp tăng chất lượng hiển thị lên cao nhất, cho phép cường độ sáng được đẩy lên tối đa nhưng lại tiết kiệm đến 15% dung lượng pin.</p>', 3, 2, 5000000, 200000, 5400000, 9990000, '2021-12-31 07:34:39', 4, '2021-12-28 07:34:39', '2021-12-28 10:20:33'),
(29, 'VinFast Lux SA2.0', '<p>Dài x Rộng x Cao :<br />4940 x 1960 x 1773 (mm)</p>\r\n<p>Dung tích bình nhiên liệu : 85 (L)</p>\r\n<p>Động cơ : Turbo 2.0L</p>\r\n<p>Công suất tối đa : 228 (Hp)</p>\r\n<p>Momnet xoắn cực đại :<br />350 (Nm)</p>\r\n<p>Hộp số tự động ZF 8 cấp</p>', 4, 2, 70000000, 2000000, 74000000, 899000000, '2021-12-31 07:41:39', 4, '2021-12-28 07:41:39', '2021-12-28 10:21:39'),
(30, 'ASUS VivoBook A515EA', '<p>CPU Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB</p>\r\n<p>RAM 8GB Onboard DDR4 2666MHz (1x SO-DIMM socket, up to 16GB SDRAM)</p>\r\n<p>Ổ cứng 512GB SSD M.2 PCIE G3X4 (Còn trống 1 khe 2.5\" SATA)</p>\r\n<p>Card đồ họa Intel Iris Xe Graphics </p>', 10, 2, 10000000, 1000000, 12000000, 19290000, '2021-12-31 07:55:24', 4, '2021-12-28 07:55:24', '2021-12-28 10:27:27'),
(31, 'ASUS ROG Strix G15', '<p>CPU AMD Ryzen 7 5800H 3.2GHz up to 4.4GHz 16MB</p>\r\n<p>RAM 8GB (8x1) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</p>\r\n<p>Ổ cứng 512GB SSD PCIE G3X4 (Còn trống 2 khe SSD M.2 PCIE)</p>\r\n<p>Card đồ họa NVIDIA GeForce RTX™ 3050 4GB GDDR6 With ROG Boost up to 1840MHz at 80W (95W with Dynamic Boost)</p>', 10, 2, 12000000, 1000000, 14000000, 28790000, '2021-12-31 07:58:47', 4, '2021-12-28 07:58:47', '2021-12-28 10:27:44'),
(32, 'ASUS ROG Zephyrus G14', '<p>CPU AMD Ryzen 9 5900HS 3.0GHz up to 4.6GHz 16MB</p>\r\n<p>RAM 16GB (8GB Onboard + 8GB) DDR4 3200MHz (1x SO-DIMM socket, up to 40GB SDRAM)</p>\r\n<p>Ổ cứng 1TB SSD PCIE G3X4</p>\r\n<p>Card đồ họa NVIDIA GeForce GTX 3050Ti 4GB GDDR6 With ROG Boost up to 1585MHz at 60W (75W with Dynamic Boost)</p>', 10, 3, 16000000, 1000000, 18000000, 40990000, '2021-12-31 08:04:06', 4, '2021-12-28 08:04:06', '2021-12-28 10:27:59'),
(33, 'ASUS TUF Gaming A15', '<p>CPU AMD Ryzen 7 5800H 3.2GHz up to 4.4GHz 16MB</p>\r\n<p>RAM 16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</p>\r\n<p>Ổ cứng 512GB SSD M.2 NVMe PCIe 3.0 (Còn trống 1 khe SSD M.2 PCIE/ SATA3)</p>\r\n<p>Card đồ họa NVIDIA GeForce RTX 3070 8GB GDDR6 Up to 1510MHz at 90W (95W with Dynamic Boost)</p>', 10, 3, 22000000, 1000000, 24000000, 38590000, '2021-12-31 08:08:53', 4, '2021-12-28 08:08:53', '2021-12-28 10:28:20'),
(34, 'Asus Gaming FX505GD', '<ul>\r\n<li>CPU i5 thế hệ mới với 8 luồng và xung cực cao, cho hiệu năng render vượt trội hơn cả i7-7700HQ cũ</li>\r\n<li>Card rời GTX 1050Ti- 4G mạnh mẽ, chơi tốt nhiều game ở thiết lập high, bao gồm PUBG PC vs Apex</li>\r\n<li>Màn hình IPS cho màu sắc trung thực, sắc nét từ mọi góc nhìn. Viền siêu mỏng thời thượng, hợp xu hướng thiết kế hiện đại.</li>\r\n<li>Thiết kế ấn tượng với các góc được vát sắc mạnh mẽ, nam tính cùng tông đen đỏ trẻ trung</li>\r\n<li>Phím LED RGB xuyên chữ , tiện dùng trong đêm</li>\r\n<li>Trọng lượng nhẹ, tiện cho việc di chuyển nhiều</li>\r\n</ul>', 10, 3, 7000000, 500000, 8000000, 16200000, '2021-12-31 08:13:17', 4, '2021-12-28 08:13:17', '2021-12-28 10:28:43'),
(35, 'ASUS S533EA-BN293T', '<p>• CPU Intel Core i5-1135G7 2.4GHz up to 4.2GHz 8MB</p>\r\n<p>• RAM 8GB DDR4 3200MHz</p>\r\n<p>• Ổ cứng 512GB SSD M.2 PCIE G3X2 (Còn trống 1 khe SSD M.2 PCIE/SATA3)</p>\r\n<p>• Card đồ họa Intel Iris Xe Graphics</p>', 10, 3, 6000000, 1000000, 8000000, 19790000, '2021-12-31 08:17:12', 4, '2021-12-28 08:17:12', '2021-12-28 10:29:01'),
(36, 'ASUS ROG Strix G15 G513QR-HQ264T', '<p>CPU AMD Ryzen 9 5900HX 3.3GHz up to 4.6GHz 16MB</p>\r\n<p>RAM 16GB (8x2) DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</p>\r\n<p>Ổ cứng 512GB SSD PCIE G3X4 (Còn trống 1 khe SSD M.2 PCIE)</p>\r\n<p>Card đồ họa NVIDIA GeForce RTX 3070 8GB GDDR6 With ROG Boost up to 1660MHz at 115W (130W with Dynamic Boost)</p>', 10, 3, 20000000, 1000000, 22000000, 46190000, '2021-12-31 08:30:59', 4, '2021-12-28 08:30:59', '2021-12-28 10:33:00'),
(37, 'iPhone 13 mini', '<ul>\r\n<li>Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao</li>\r\n<li>Không gian hiển thị sống động - Màn hình 5.4\" Super Retina XDR độ sáng cao, sắc nét</li>\r\n<li>Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học</li>\r\n<li>Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút</li>\r\n</ul>', 1, 3, 5000000, 500000, 7000000, 18400000, '2021-12-31 08:36:35', 4, '2021-12-28 08:36:35', '2021-12-28 10:12:41'),
(38, 'iPhone 11 Pro 64GB', '<p><strong><a href=\"https://didongmoi.com.vn/iphone-11-pro-cu\">iPhone 11 Pro 64GB cũ</a></strong> là model có kích thước nhỏ nhất của Apple trong năm nay. Được \"ví von\" như phiên bản kế nhiệm của Xs 2018, <a href=\"https://didongmoi.com.vn/dien-thoai-iphone-11-pro\"><strong>iPhone 11 Pro</strong></a> sở hữu rất nhiều điểm tương đồng nhưng vẫn không thiếu những cải tiến hiện đại.</p>\r\n<div>Thiết kế gần như tương đồng, sự khác biệt của \"lớp áo\" chỉ nằm ở cụm camera vuông ở mặt sau và mặt kính lưng nhám. Đặc biệt, cụm camera vuông là một điểm nhấn nổi bật, cả ba ống kính được đặt theo hình tam giác và xếp gọn vào khung vuông kèm đèn LED.</div>\r\n<div> </div>\r\n<div>Chưa hết chu kỳ làm mới, Apple tiếp tục sử dụng màn hình Notch tai thỏ cho những thiết bị năm nay. Bốn góc cạnh của máy được bo tròn một cách tinh tế. Đặc biệt, là phiên bản mới nhất nên <strong>iP 11 Pro 64gb cũ</strong> được hãng nâng cấp dung lượng thỏi pin, thời lượng sử dụng dài hơn. Tuy nhiên, dung lượng RAM vẫn chỉ dừng lại ở mức 4GB.</div>', 1, 3, 3000000, 200000, 5000000, 12990000, '2021-12-31 08:39:32', 4, '2021-12-28 08:39:32', '2021-12-28 10:13:00'),
(39, 'Apple iPhone XS 64GB', '<p>Apple IPhone XS 64GB là sản phẩm sở hữu thiết kế tinh tế với khung viền kim loại cứng cáp nhưng vẫn tạo nên cảm giác sang trọng khi cầm nắm. IPhone XS 64GB cũ sở hữu 3 màu sắc bắt mắt là: Bạc, Gold và Xám</p>', 1, 3, 3000000, 200000, 6000000, 10990000, '2021-12-31 08:45:20', 4, '2021-12-28 08:45:20', '2021-12-28 10:13:21'),
(40, 'Samsung Galaxy S21+', '<p>Khám phá vẻ đẹp chuẩn mực, hoàn toàn khác biệt trên Samsung Galaxy S21 Plus, nơi bạn sẽ được tận hưởng camera chuyên nghiệp nhất từ trước đến nay, bộ vi xử lý mạnh mẽ và hỗ trợ kết nối mạng 5G siêu tốc.</p>', 2, 3, 10000000, 500000, 11000000, 20990000, '2021-12-31 08:53:00', 4, '2021-12-28 08:53:00', '2021-12-28 10:16:56'),
(41, 'Samsung Galaxy S20 FE', '<p><strong>Trải nghiệm những tính năng cao cấp của điện thoại Samsung Galaxy S20 FE 256GB, nơi bạn được tận hưởng niềm vui bất tận với camera xuất sắc, màn hình vô cực 120Hz siêu mượt và cấu hình đủ để sử dụng thoải mái trong nhiều năm nữa.</strong></p>', 2, 3, 3000000, 500000, 4000000, 13490000, '2021-12-31 08:58:51', 4, '2021-12-28 08:58:51', '2021-12-28 10:17:15'),
(42, 'Samsung Galaxy A52s', '<p><strong>Samsung A52s 5G</strong> là phiên bản nâng cấp của Galaxy A52. Máy không chỉ được thừa hưởng thiết kế tinh tế và ấn tượng của phiên bản đi trước mà chúng còn được nâng cấp khá nhiều về trang bị và tính năng. Chắc chắn đây sẽ là chiếc smartphone mang đến cho người dùng những trải nghiệm thú vị khó quên.</p>', 2, 3, 2000000, 500000, 3000000, 9550000, '2021-12-31 09:03:30', 4, '2021-12-28 09:03:30', '2021-12-28 10:17:45'),
(43, 'Iphone X 64GB', '<p>Máy trần không hộp. Cam kết máy nguyên bản chính hãng Apple. Ngoại hình có trầy phẩy nhẹ</p>', 1, 7, 2000000, 200000, 4000000, 7590000, '2021-12-31 09:18:05', 4, '2021-12-28 09:18:05', '2021-12-28 10:13:49'),
(44, 'iPhone 11 Pro 256GB', '<ul>\r\n<li><span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Máy trần không hộp, đã qua sử dụng</span></li>\r\n<li><span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Ngoại hình thẩm mỹ đẹp<br /></span></li>\r\n<li><span data-sheets-value=\"{\" data-sheets-userformat=\"{\">Chưa qua sửa chữa</span></li>\r\n</ul>', 1, 7, 4000000, 500000, 6000000, 14989000, '2021-12-31 09:20:51', 4, '2021-12-28 09:20:51', '2021-12-28 10:14:02'),
(45, 'iPhone 12 mini', '<div class=\"item-warranty-info\">\r\n<p>Máy mới 100% , chính hãng Apple Việt Nam.<br />CellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam</p>\r\n</div>\r\n<div class=\"item-warranty-info\">\r\n<p>Thân máy, cáp USB-C to Lightning, sách HDSD</p>\r\n</div>\r\n<div class=\"item-warranty-info\">\r\n<p>Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple Việt Nam. 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Gia hạn bảo hành thời gian giãn cách</p>\r\n</div>', 1, 7, 6000000, 500000, 8000000, 15500000, '2021-12-31 09:23:56', 4, '2021-12-28 09:23:56', '2021-12-28 10:14:18'),
(46, 'GALAXY Z FLIP3 5G', '<ul>\r\n<li>Hàng Nguyên Seal Full Box</li>\r\n<li>Bảo hành 12 tháng chính hãng Samsung Việt Nam</li>\r\n<li>Hỗ trợ trả góp lãi suất 0%</li>\r\n<li>Giao hàng miễn phí tận nhà</li>\r\n<li>Cam kết chất lượng - Giá Thành Cạnh Tranh</li>\r\n</ul>', 2, 7, 10000000, 500000, 11000000, 18800000, '2021-12-31 09:27:24', 4, '2021-12-28 09:27:24', '2021-12-28 10:18:23'),
(47, 'Samsung Galaxy S21 Plus 5G', '<p>Trong 3 phiên bản thì Samsung Galaxy S21 Plus là một trong những chiếc điện thoại đáng được sở hữu nhất trong phân khúc tầm giá hiện tại. Với sự thay đổi thiết kế đột phá đi đầu trong phong cách thiết kế cùng với cấu hình cực kỳ mạnh mẽ của dòng S Plus của Samsung mang đến cho người dùng.</p>', 2, 7, 9000000, 500000, 10000000, 18799000, '2021-12-31 09:29:56', 4, '2021-12-28 09:29:56', '2021-12-28 10:18:46'),
(48, 'Samsung Galaxy Note 20 Ultra', '<p><strong>Chiếc Galaxy Note màn hình lớn nhất, bút S Pen thông minh nhất và những tính năng mạnh mẽ nhất đã xuất hiện. <a href=\"https://fptshop.com.vn/dien-thoai/samsung-galaxy-note-20-ultra\">Samsung Galaxy Note 20 Ultra</a> sẽ định nghĩa lại <a href=\"https://fptshop.com.vn/dien-thoai\">smartphone</a>, thay đổi những trải nghiệm của bạn theo cách thú vị hơn bao giờ hết.</strong></p>', 2, 7, 11000000, 500000, 12000000, 19990000, '2021-12-31 09:32:57', 4, '2021-12-28 09:32:57', '2021-12-28 10:19:07'),
(49, 'ASUS TUF DashF15 FX516PC-HN011T', '<p>Laptop Asus với cấu hình mạnh không chỉ giúp xử lý công việc nhanh chóng mà còn mang lại khả năng giải trí với những trận đấu game mượt mà. Với<strong> laptop ASUS TUF DashF15 FX516PC-HN011T</strong>, máy không chỉ gọn nhẹ mà còn vô cùng ổn định với chip set thế hệ H.</p>', 10, 7, 10000000, 500000, 11000000, 24690000, '2021-12-31 09:44:29', 4, '2021-12-28 09:44:29', '2021-12-28 10:29:42'),
(50, 'Macbook abc', '<p><strong>Macbook Air 2022</strong></p>\r\n<p> </p>\r\n<p>Rẻ đẹp</p>', 12, 10, 10000000, 200000, 10000000, 20000000, '2022-01-03 02:40:31', NULL, '2021-12-31 02:40:31', '2021-12-31 02:40:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_history`
--

CREATE TABLE `product_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_bidding` double DEFAULT NULL,
  `user_id_holding` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_history`
--

INSERT INTO `product_history` (`id`, `product_id`, `price_bidding`, `user_id_holding`, `create_time`) VALUES
(1, 3, 2000000, 2, '2021-12-25 09:20:34'),
(2, 4, 2000000, 4, '2021-12-25 09:49:29'),
(3, 3, 2100000, 2, '2021-12-25 09:56:30'),
(4, 3, 2100000, 4, '2021-12-25 09:56:30'),
(5, 3, 2200000, 2, '2021-12-25 09:57:03'),
(6, 3, 2200000, 4, '2021-12-25 09:57:03'),
(7, 3, 5000000, 2, '2021-12-25 09:57:24'),
(8, 3, 5000000, 4, '2021-12-25 09:57:24'),
(9, 5, 1000000, 4, '2021-12-25 09:58:33'),
(10, 5, 9200000, 2, '2021-12-25 10:00:02'),
(11, 6, 1500000, 4, '2021-12-25 10:02:52'),
(12, 6, 6000000, 4, '2021-12-25 10:03:39'),
(13, 6, 6000000, 2, '2021-12-25 10:03:39'),
(14, 21, 15000000, 4, '2021-12-28 09:46:22'),
(15, 22, 20000000, 4, '2021-12-28 09:46:57'),
(16, 37, 5000000, 4, '2021-12-28 09:47:22'),
(17, 38, 3000000, 4, '2021-12-28 09:48:01'),
(18, 39, 3000000, 4, '2021-12-28 09:48:14'),
(19, 43, 2000000, 4, '2021-12-28 09:48:24'),
(20, 44, 4000000, 4, '2021-12-28 09:48:33'),
(21, 45, 6000000, 4, '2021-12-28 09:48:45'),
(22, 23, 4000000, 4, '2021-12-28 09:49:08'),
(23, 24, 1000000, 4, '2021-12-28 09:50:21'),
(24, 25, 5000000, 4, '2021-12-28 09:50:42'),
(25, 40, 10000000, 4, '2021-12-28 09:50:57'),
(26, 41, 3000000, 4, '2021-12-28 09:51:08'),
(27, 42, 2000000, 4, '2021-12-28 09:51:30'),
(28, 46, 10000000, 4, '2021-12-28 09:51:42'),
(29, 47, 9000000, 4, '2021-12-28 09:51:52'),
(30, 48, 11000000, 4, '2021-12-28 09:52:02'),
(31, 27, 7000000, 4, '2021-12-28 09:53:02'),
(32, 29, 70000000, 4, '2021-12-28 09:53:26'),
(33, 30, 10000000, 4, '2021-12-28 09:53:45'),
(34, 31, 12000000, 4, '2021-12-28 09:53:57'),
(35, 32, 16000000, 4, '2021-12-28 09:54:07'),
(36, 33, 22000000, 4, '2021-12-28 09:54:18'),
(37, 34, 7000000, 4, '2021-12-28 09:54:33'),
(38, 35, 6000000, 4, '2021-12-28 09:54:53'),
(39, 36, 20000000, 4, '2021-12-28 09:55:05'),
(40, 49, 10000000, 4, '2021-12-28 09:55:26'),
(41, 17, 3000000, 4, '2021-12-28 09:59:11'),
(42, 18, 5000000, 4, '2021-12-28 10:00:02'),
(43, 20, 2000000, 4, '2021-12-28 10:00:26'),
(44, 11, 10000000, 4, '2021-12-28 10:00:34'),
(45, 12, 2000000, 4, '2021-12-28 10:00:44'),
(46, 14, 2000000, 4, '2021-12-28 10:00:52'),
(47, 15, 2000000, 4, '2021-12-28 10:00:59'),
(48, 16, 3000000, 4, '2021-12-28 10:01:10'),
(49, 9, 5000000, 4, '2021-12-28 10:01:30'),
(50, 10, 10000000, 4, '2021-12-28 10:01:40'),
(51, 26, 3000000, 4, '2021-12-28 10:02:05'),
(52, 28, 5000000, 4, '2021-12-28 10:02:25'),
(53, 7, 15000000, 4, '2021-12-28 10:02:35'),
(54, 8, 20000000, 4, '2021-12-28 10:02:45'),
(56, 4, 3000000, 4, '2021-12-28 10:09:44'),
(57, 4, 3000000, 5, '2021-12-28 10:09:44'),
(58, 4, 4000000, 4, '2021-12-28 10:09:55'),
(59, 4, 4000000, 5, '2021-12-28 10:09:55'),
(60, 21, 16000000, 4, '2021-12-28 10:10:58'),
(61, 21, 16000000, 5, '2021-12-28 10:10:58'),
(62, 21, 17000000, 4, '2021-12-28 10:11:03'),
(63, 21, 17000000, 5, '2021-12-28 10:11:03'),
(64, 22, 21000000, 4, '2021-12-28 10:12:11'),
(65, 22, 21000000, 5, '2021-12-28 10:12:11'),
(66, 22, 22000000, 4, '2021-12-28 10:12:19'),
(67, 22, 22000000, 5, '2021-12-28 10:12:19'),
(68, 37, 6000000, 4, '2021-12-28 10:12:36'),
(69, 37, 6000000, 5, '2021-12-28 10:12:36'),
(70, 37, 7000000, 4, '2021-12-28 10:12:41'),
(71, 37, 7000000, 5, '2021-12-28 10:12:41'),
(72, 38, 4000000, 4, '2021-12-28 10:12:54'),
(73, 38, 4000000, 5, '2021-12-28 10:12:54'),
(74, 38, 5000000, 4, '2021-12-28 10:13:00'),
(75, 38, 5000000, 5, '2021-12-28 10:13:00'),
(76, 39, 4000000, 4, '2021-12-28 10:13:13'),
(77, 39, 4000000, 5, '2021-12-28 10:13:13'),
(78, 39, 6000000, 4, '2021-12-28 10:13:21'),
(79, 39, 6000000, 5, '2021-12-28 10:13:21'),
(80, 43, 3000000, 4, '2021-12-28 10:13:46'),
(81, 43, 3000000, 5, '2021-12-28 10:13:46'),
(82, 43, 4000000, 4, '2021-12-28 10:13:49'),
(83, 43, 4000000, 5, '2021-12-28 10:13:49'),
(84, 44, 5000000, 4, '2021-12-28 10:13:58'),
(85, 44, 5000000, 5, '2021-12-28 10:13:58'),
(86, 44, 6000000, 4, '2021-12-28 10:14:02'),
(87, 44, 6000000, 5, '2021-12-28 10:14:02'),
(88, 45, 7000000, 4, '2021-12-28 10:14:14'),
(89, 45, 7000000, 5, '2021-12-28 10:14:14'),
(90, 45, 8000000, 4, '2021-12-28 10:14:18'),
(91, 45, 8000000, 5, '2021-12-28 10:14:18'),
(92, 23, 5000000, 4, '2021-12-28 10:14:52'),
(93, 23, 5000000, 5, '2021-12-28 10:14:52'),
(94, 23, 6000000, 4, '2021-12-28 10:14:57'),
(95, 23, 6000000, 5, '2021-12-28 10:14:57'),
(96, 24, 2000000, 4, '2021-12-28 10:15:12'),
(97, 24, 2000000, 5, '2021-12-28 10:15:12'),
(98, 24, 2200000, 5, '2021-12-28 10:15:30'),
(99, 25, 5200000, 4, '2021-12-28 10:16:31'),
(100, 25, 5200000, 5, '2021-12-28 10:16:31'),
(101, 25, 5400000, 4, '2021-12-28 10:16:38'),
(102, 25, 5400000, 5, '2021-12-28 10:16:38'),
(103, 40, 10500000, 4, '2021-12-28 10:16:50'),
(104, 40, 10500000, 5, '2021-12-28 10:16:50'),
(105, 40, 11000000, 4, '2021-12-28 10:16:56'),
(106, 40, 11000000, 5, '2021-12-28 10:16:56'),
(107, 41, 3500000, 4, '2021-12-28 10:17:10'),
(108, 41, 3500000, 5, '2021-12-28 10:17:10'),
(109, 41, 4000000, 4, '2021-12-28 10:17:15'),
(110, 41, 4000000, 5, '2021-12-28 10:17:15'),
(111, 42, 2500000, 4, '2021-12-28 10:17:40'),
(112, 42, 2500000, 5, '2021-12-28 10:17:40'),
(113, 42, 3000000, 4, '2021-12-28 10:17:45'),
(114, 42, 3000000, 5, '2021-12-28 10:17:45'),
(115, 46, 10500000, 4, '2021-12-28 10:18:18'),
(116, 46, 10500000, 5, '2021-12-28 10:18:18'),
(117, 46, 11000000, 4, '2021-12-28 10:18:23'),
(118, 46, 11000000, 5, '2021-12-28 10:18:23'),
(119, 47, 9500000, 4, '2021-12-28 10:18:40'),
(120, 47, 9500000, 5, '2021-12-28 10:18:40'),
(121, 47, 10000000, 4, '2021-12-28 10:18:46'),
(122, 47, 10000000, 5, '2021-12-28 10:18:46'),
(123, 48, 11500000, 4, '2021-12-28 10:19:02'),
(124, 48, 11500000, 5, '2021-12-28 10:19:02'),
(125, 48, 12000000, 4, '2021-12-28 10:19:07'),
(126, 48, 12000000, 5, '2021-12-28 10:19:07'),
(127, 6, 6100000, 4, '2021-12-28 10:19:21'),
(128, 6, 6100000, 5, '2021-12-28 10:19:21'),
(129, 6, 6200000, 4, '2021-12-28 10:19:30'),
(130, 6, 6200000, 5, '2021-12-28 10:19:30'),
(131, 6, 6300000, 4, '2021-12-28 10:19:41'),
(132, 6, 6300000, 5, '2021-12-28 10:19:41'),
(133, 26, 3200000, 4, '2021-12-28 10:19:55'),
(134, 26, 3200000, 5, '2021-12-28 10:19:55'),
(135, 26, 3400000, 4, '2021-12-28 10:20:02'),
(136, 26, 3400000, 5, '2021-12-28 10:20:02'),
(137, 27, 7200000, 4, '2021-12-28 10:20:13'),
(138, 27, 7200000, 5, '2021-12-28 10:20:13'),
(139, 27, 7400000, 4, '2021-12-28 10:20:19'),
(140, 27, 7400000, 5, '2021-12-28 10:20:19'),
(141, 28, 5200000, 4, '2021-12-28 10:20:28'),
(142, 28, 5200000, 5, '2021-12-28 10:20:28'),
(143, 28, 5400000, 4, '2021-12-28 10:20:33'),
(144, 28, 5400000, 5, '2021-12-28 10:20:33'),
(145, 7, 16000000, 4, '2021-12-28 10:20:44'),
(146, 7, 16000000, 5, '2021-12-28 10:20:44'),
(147, 7, 17000000, 4, '2021-12-28 10:20:53'),
(148, 7, 17000000, 5, '2021-12-28 10:20:53'),
(149, 8, 22000000, 4, '2021-12-28 10:21:13'),
(150, 8, 22000000, 5, '2021-12-28 10:21:13'),
(151, 8, 24000000, 4, '2021-12-28 10:21:20'),
(152, 8, 24000000, 5, '2021-12-28 10:21:20'),
(153, 29, 72000000, 4, '2021-12-28 10:21:33'),
(154, 29, 72000000, 5, '2021-12-28 10:21:33'),
(155, 29, 74000000, 4, '2021-12-28 10:21:39'),
(156, 29, 74000000, 5, '2021-12-28 10:21:39'),
(157, 9, 6000000, 4, '2021-12-28 10:21:52'),
(158, 9, 6000000, 5, '2021-12-28 10:21:52'),
(159, 9, 7000000, 4, '2021-12-28 10:21:57'),
(160, 9, 7000000, 5, '2021-12-28 10:21:57'),
(161, 10, 10200000, 4, '2021-12-28 10:22:17'),
(162, 10, 10200000, 5, '2021-12-28 10:22:17'),
(163, 10, 10400000, 4, '2021-12-28 10:22:23'),
(164, 10, 10400000, 5, '2021-12-28 10:22:23'),
(165, 11, 11500000, 4, '2021-12-28 10:22:34'),
(166, 11, 11500000, 5, '2021-12-28 10:22:34'),
(167, 11, 12000000, 4, '2021-12-28 10:22:38'),
(168, 11, 12000000, 5, '2021-12-28 10:22:38'),
(169, 12, 3000000, 4, '2021-12-28 10:22:49'),
(170, 12, 3000000, 5, '2021-12-28 10:22:49'),
(171, 12, 4000000, 4, '2021-12-28 10:22:54'),
(172, 12, 4000000, 5, '2021-12-28 10:22:54'),
(173, 14, 2050000, 4, '2021-12-28 10:23:17'),
(174, 14, 2050000, 5, '2021-12-28 10:23:17'),
(175, 14, 2100000, 4, '2021-12-28 10:23:23'),
(176, 14, 2100000, 5, '2021-12-28 10:23:23'),
(177, 15, 2100000, 4, '2021-12-28 10:23:32'),
(178, 15, 2100000, 5, '2021-12-28 10:23:32'),
(179, 15, 2200000, 4, '2021-12-28 10:23:36'),
(180, 15, 2200000, 5, '2021-12-28 10:23:36'),
(181, 16, 3150000, 4, '2021-12-28 10:23:49'),
(182, 16, 3150000, 5, '2021-12-28 10:23:49'),
(183, 16, 3300000, 4, '2021-12-28 10:23:55'),
(184, 16, 3300000, 5, '2021-12-28 10:23:55'),
(185, 20, 2150000, 4, '2021-12-28 10:24:23'),
(186, 20, 2150000, 5, '2021-12-28 10:24:23'),
(187, 20, 2300000, 4, '2021-12-28 10:24:32'),
(188, 20, 2300000, 5, '2021-12-28 10:24:32'),
(193, 17, 3150000, 4, '2021-12-28 10:26:33'),
(194, 17, 3150000, 5, '2021-12-28 10:26:33'),
(195, 17, 3300000, 4, '2021-12-28 10:26:37'),
(196, 17, 3300000, 5, '2021-12-28 10:26:37'),
(197, 18, 10150000, 5, '2021-12-28 10:26:53'),
(198, 30, 11000000, 4, '2021-12-28 10:27:19'),
(199, 30, 11000000, 5, '2021-12-28 10:27:19'),
(200, 30, 12000000, 4, '2021-12-28 10:27:27'),
(201, 30, 12000000, 5, '2021-12-28 10:27:27'),
(202, 31, 13000000, 4, '2021-12-28 10:27:38'),
(203, 31, 13000000, 5, '2021-12-28 10:27:38'),
(204, 31, 14000000, 4, '2021-12-28 10:27:44'),
(205, 31, 14000000, 5, '2021-12-28 10:27:44'),
(206, 32, 17000000, 4, '2021-12-28 10:27:53'),
(207, 32, 17000000, 5, '2021-12-28 10:27:53'),
(208, 32, 18000000, 4, '2021-12-28 10:27:59'),
(209, 32, 18000000, 5, '2021-12-28 10:27:59'),
(210, 33, 23000000, 4, '2021-12-28 10:28:14'),
(211, 33, 23000000, 5, '2021-12-28 10:28:14'),
(212, 33, 24000000, 4, '2021-12-28 10:28:20'),
(213, 33, 24000000, 5, '2021-12-28 10:28:20'),
(214, 34, 7500000, 4, '2021-12-28 10:28:38'),
(215, 34, 7500000, 5, '2021-12-28 10:28:38'),
(216, 34, 8000000, 4, '2021-12-28 10:28:43'),
(217, 34, 8000000, 5, '2021-12-28 10:28:43'),
(218, 35, 7000000, 4, '2021-12-28 10:28:54'),
(219, 35, 7000000, 5, '2021-12-28 10:28:54'),
(220, 35, 8000000, 4, '2021-12-28 10:29:01'),
(221, 35, 8000000, 5, '2021-12-28 10:29:01'),
(222, 36, 21000000, 4, '2021-12-28 10:29:13'),
(223, 36, 21000000, 5, '2021-12-28 10:29:13'),
(224, 49, 10500000, 4, '2021-12-28 10:29:33'),
(225, 49, 10500000, 5, '2021-12-28 10:29:33'),
(226, 49, 11000000, 4, '2021-12-28 10:29:42'),
(227, 49, 11000000, 5, '2021-12-28 10:29:42'),
(228, 5, 9400000, 2, '2021-12-28 10:30:12'),
(229, 5, 9400000, 4, '2021-12-28 10:30:12'),
(230, 5, 9600000, 2, '2021-12-28 10:30:25'),
(231, 5, 9600000, 4, '2021-12-28 10:30:25'),
(232, 24, 2400000, 4, '2021-12-28 10:30:44'),
(233, 18, 10300000, 5, '2021-12-28 10:31:34'),
(234, 18, 10300000, 4, '2021-12-28 10:31:34'),
(235, 18, 10450000, 5, '2021-12-28 10:31:41'),
(236, 18, 10450000, 4, '2021-12-28 10:31:41'),
(237, 36, 22000000, 4, '2021-12-28 10:33:00'),
(238, 36, 22000000, 5, '2021-12-28 10:33:00'),
(239, 22, 26000000, 8, '2021-12-29 06:26:21'),
(240, 3, 5100000, 2, '2021-12-31 02:35:26'),
(241, 3, 5100000, 10, '2021-12-31 02:35:26'),
(242, 3, 6100000, 10, '2021-12-31 02:35:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_type`
--

CREATE TABLE `product_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product_type`
--

INSERT INTO `product_type` (`id`, `name`, `category_id`, `create_time`, `modified_time`) VALUES
(1, 'Iphone', 1, '2021-12-25 04:20:14', '2021-12-25 04:20:14'),
(2, 'Samsung', 1, '2021-12-25 04:20:21', '2021-12-25 04:20:21'),
(3, 'Xiaomi', 1, '2021-12-25 04:20:29', '2021-12-25 04:20:29'),
(4, 'Vinfast', 2, '2021-12-25 04:20:45', '2021-12-25 04:20:45'),
(5, 'Toyota', 2, '2021-12-25 04:20:52', '2021-12-25 04:20:52'),
(6, 'SH', 3, '2021-12-25 04:21:08', '2021-12-25 04:21:08'),
(7, 'Honda', 3, '2021-12-25 04:21:39', '2021-12-25 04:21:39'),
(8, 'Nike', 4, '2021-12-25 04:22:15', '2021-12-25 04:22:15'),
(9, 'Adidas', 4, '2021-12-25 04:22:21', '2021-12-25 04:22:21'),
(10, 'Asus', 5, '2021-12-25 04:22:58', '2021-12-25 04:22:58'),
(11, 'Lenovo', 5, '2021-12-25 04:23:05', '2021-12-25 04:23:05'),
(12, 'Macbook', 5, '2021-12-25 04:23:22', '2021-12-25 04:23:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `birthdate`, `address`, `email`, `phone`, `user_type_id`, `status`, `create_time`, `modified_time`) VALUES
(1, 'admin', '$2a$12$QPHztmF1x5hil4jg33H4U.w1v2H/i4x6.deS0dbY/fr4H7jVTghou', 'QuanLi', 'administrator', '2001-11-11', 'aabb', 'quachdieukhanhadmin@gmail.com', '0938427896', 1, 'active', '2021-12-25 04:16:44', '2021-12-30 17:30:55'),
(2, 'seller01', '$2a$12$.j3sycRxfcPlcO4Z2RmdIuovz654zl9RNOu46.9i9NQm0S.eWjJci', 'Khanh', 'seller01', '2021-12-25', 'aaa', '123@student.hcmute.edu.vn', '1111', 2, 'active', '2021-12-25 04:25:40', '2021-12-25 04:25:40'),
(3, 'seller02', '$2a$12$ZW49qo35fvAO8MU.aVa5HOGw/tR.W9v5qfsx1cWhx065BWOop4aki', 'vinh', 'seller02', '2021-12-25', 'aaa', '2vinhpx2001@gmail.com', '1111', 2, 'active', '2021-12-25 04:28:51', '2021-12-25 04:28:51'),
(4, 'bidder01', '$2a$12$/oxDPQPPJT5BvifFr1pVEeYKdSsxFmGCqC4lU6zublNPIkuhq3AyW', 'Khánh', 'bidder01', '2021-12-25', 'aaa', 'quachdieukhanh123@gmail.com', '1111', 3, 'active', '2021-12-25 04:32:14', '2021-12-25 04:32:14'),
(5, 'bidder02', '$2a$12$/oxDPQPPJT5BvifFr1pVEeYKdSsxFmGCqC4lU6zublNPIkuhq3AyW', 'Trung', 'bidder02', '2021-12-25', 'aaa', 'quachdieukhanh567@gmail.com', '1111', 3, 'active', '2021-12-25 04:32:14', '2021-12-25 04:32:14'),
(6, 'bidder03', '$2a$12$/oxDPQPPJT5BvifFr1pVEeYKdSsxFmGCqC4lU6zublNPIkuhq3AyW', 'Vinh', 'bidder03', '2021-12-25', 'aaa', 'quachdieukhanh5678@gmail.com', '1111', 3, 'active', '2021-12-25 04:32:14', '2021-12-25 04:32:14'),
(7, 'seller03', '$2a$12$ZW49qo35fvAO8MU.aVa5HOGw/tR.W9v5qfsx1cWhx065BWOop4aki', 'Trung', 'seller03', '2021-12-25', 'aaa', 'seller03mail.com', '1111', 2, 'active', '2021-12-25 04:28:51', '2021-12-25 04:28:51'),
(8, 'IamDieuKhanh2001', '$2a$12$gD2s3/BezxvcV2IFvRq26uoicQapdnexg6ZhSgp1jadu8NZ1NbJz2', 'Quách Diệu', 'Khánh', '2021-12-29', '12/6/8 Hoàng Hoa Thám p7 Q Bình Thạnh', '456@student.hcmute.edu.vn', '0938427896', 3, 'active', '2021-12-29 06:22:46', '2021-12-29 06:22:46'),
(9, 'DieuKhanh', '$2a$12$jC113ZJ5ojdOILew7Qj/OuW51awNY1Thoo0mKAswDmywA7YPlMfc2', 'Khanh', 'Quach Dieu', '2021-12-29', 'aabb', '19110226@student.hcmute.edu.vn', '0938427896', 3, 'active', '2021-12-29 06:28:26', '2021-12-29 06:28:26'),
(10, 'thanhtrung', '$2a$12$ir3sknIZjy8FgBay/qLE3ukDmM9VG5teMsSFVEpD1z9yyyJ4lK8FK', 'Nguyễn Thành Edit', 'Trung Edit', '2001-10-31', 'HCM edit', 'clonebytrung@gmail.com', '113', 2, 'active', '2021-12-31 02:33:13', '2021-12-31 02:38:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_type`
--

INSERT INTO `user_type` (`id`, `name`, `create_time`, `modified_time`) VALUES
(1, 'admin', '2021-11-27 02:23:39', '2021-11-27 02:23:39'),
(2, 'seller', '2021-11-27 02:24:29', '2021-11-27 02:24:29'),
(3, 'bidder', '2021-11-27 02:24:53', '2021-11-27 02:24:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watch_list`
--

CREATE TABLE `watch_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `watch_list`
--

INSERT INTO `watch_list` (`id`, `user_id`, `product_id`, `create_time`) VALUES
(4, 4, 13, '2021-12-28 10:02:50'),
(6, 8, 22, '2021-12-29 06:25:52'),
(7, 10, 3, '2021-12-31 02:33:45'),
(8, 10, 4, '2021-12-31 02:33:48'),
(9, 10, 5, '2021-12-31 02:33:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `winner`
--

CREATE TABLE `winner` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `winner`
--

INSERT INTO `winner` (`id`, `user_id`, `product_id`, `create_time`) VALUES
(50, 4, 21, '2021-12-31 01:54:40'),
(51, 2, 5, '2021-12-31 01:54:40'),
(52, 4, 4, '2021-12-31 01:54:40'),
(53, 10, 3, '2021-12-31 02:44:02');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account_recovery`
--
ALTER TABLE `account_recovery`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `account_upgrade`
--
ALTER TABLE `account_upgrade`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `auction_history`
--
ALTER TABLE `auction_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `auction_permission`
--
ALTER TABLE `auction_permission`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_confirm`
--
ALTER TABLE `email_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_notification_seller`
--
ALTER TABLE `email_notification_seller`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);

--
-- Chỉ mục cho bảng `product_history`
--
ALTER TABLE `product_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `winner`
--
ALTER TABLE `winner`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account_recovery`
--
ALTER TABLE `account_recovery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `account_upgrade`
--
ALTER TABLE `account_upgrade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `auction_history`
--
ALTER TABLE `auction_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT cho bảng `auction_permission`
--
ALTER TABLE `auction_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `email_confirm`
--
ALTER TABLE `email_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `email_notification_seller`
--
ALTER TABLE `email_notification_seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product_history`
--
ALTER TABLE `product_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT cho bảng `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `watch_list`
--
ALTER TABLE `watch_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `winner`
--
ALTER TABLE `winner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
