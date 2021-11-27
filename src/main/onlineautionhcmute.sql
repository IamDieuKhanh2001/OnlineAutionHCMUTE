-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2021 lúc 04:12 AM
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
    (1, 1, 3, 10000000, '2021-11-27 02:31:19', '2021-11-27 02:31:19');

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
    (1, 'Skin LOL', '2021-11-27 02:27:47', '2021-11-27 02:27:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) NOT NULL,
                            `picture_main` text NOT NULL,
                            `picture_side` text NOT NULL,
                            `description` text NOT NULL,
                            `category_id` int(11) NOT NULL,
                            `user_id` int(11) NOT NULL,
                            `price_start` double NOT NULL,
                            `price_buy_now` double NOT NULL,
                            `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
                            `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `picture_main`, `picture_side`, `description`, `category_id`, `user_id`, `price_start`, `price_buy_now`, `create_time`, `modified_time`) VALUES
    (1, 'Yasuo siêu phẩm', 'main.jpg', '{\"1.png\", \"2.png\"}', 'Yasuo siêu phẩm buff dame', 1, 1, 500000, 24000000, '2021-11-27 02:28:59', '2021-11-27 02:28:59');

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
                         `address` varchar(255) NOT NULL,
                         `email` varchar(255) NOT NULL,
                         `phone` varchar(12) NOT NULL,
                         `user_type_id` int(11) NOT NULL,
                         `avatar` text NOT NULL,
                         `point_evaluation` text NOT NULL,
                         `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
                         `modified_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `address`, `email`, `phone`, `user_type_id`, `avatar`, `point_evaluation`, `create_time`, `modified_time`) VALUES
                                                                                                                                                                                           (1, 'thanhtrung', 'thanhtrung', 'Nguyen', 'Thanh Trung', 'Ho Chi Minh', 'trungnt2411@gmail.com', '0334674390', 1, 'abc.png', '100%', '2021-11-27 02:26:03', '2021-11-27 02:26:03'),
                                                                                                                                                                                           (3, 'xuanvinh', 'xuanvinh', 'Phạm', 'Xuân Vinh', 'Hồ Chí Minh', 'xuanvinh@gmail.com', '0909825219', 3, 'vinh.png', '20%', '2021-11-27 02:30:49', '2021-11-27 02:30:49');

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

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auction_history`
--
ALTER TABLE `auction_history`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auction_history`
--
ALTER TABLE `auction_history`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_type`
--
ALTER TABLE `user_type`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
