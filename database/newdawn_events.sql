-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2022 at 09:08 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newdawn_events`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customerName` varchar(254) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customerName`, `phoneNumber`, `created_at`, `updated_at`) VALUES
(14, 'Isaac', '0723453675', '2022-08-24 00:22:40', '2022-08-24 00:22:40'),
(15, 'John', '0723453675', '2022-08-24 00:23:31', '2022-08-24 00:23:31'),
(16, 'Leah', '0787654321', '2022-08-24 00:23:31', '2022-08-24 00:23:31'),
(17, 'Mwalyo', '0787654321', '2022-08-24 00:44:14', '2022-08-24 00:44:14'),
(18, 'Kitu', '0787654321', '2022-08-24 01:42:46', '2022-08-24 01:42:46'),
(19, 'Maima', '0187654321', '2022-08-24 01:42:46', '2022-08-24 01:42:46'),
(20, 'Kasee', '0987890000', '2022-08-26 20:18:34', '2022-08-26 20:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `eventName` varchar(254) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event_items`
--

CREATE TABLE `event_items` (
  `id` int(11) NOT NULL,
  `request_id` varchar(100) NOT NULL,
  `itemID` varchar(40) NOT NULL,
  `number_collected` varchar(40) NOT NULL,
  `amount` varchar(254) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_items`
--

INSERT INTO `event_items` (`id`, `request_id`, `itemID`, `number_collected`, `amount`, `created_at`, `updated_at`) VALUES
(1, '1', '7', '45', '5600', '2022-09-07 06:30:25', '2022-09-07 06:30:25'),
(2, '1', '5', '50', '3400', '2022-09-07 06:30:25', '2022-09-07 06:30:25'),
(3, '1', '3', '34', '4480', '2022-09-07 06:30:25', '2022-09-07 06:30:25'),
(4, '2', '6', '45', '4480', '2022-09-07 06:31:50', '2022-09-07 06:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `event_items_returned`
--

CREATE TABLE `event_items_returned` (
  `id` int(11) NOT NULL,
  `request_id` varchar(50) NOT NULL,
  `returned_on` varchar(50) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `items_collected` varchar(100) NOT NULL,
  `items_returned` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `comments` text DEFAULT NULL,
  `return_value` varchar(10) NOT NULL DEFAULT '0',
  `user_id` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_items_returned`
--

INSERT INTO `event_items_returned` (`id`, `request_id`, `returned_on`, `item_id`, `items_collected`, `items_returned`, `status`, `comments`, `return_value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1', '2022-09-23', '7', '45', '40', 'good', 'Broken Screens', '3', '1', '2022-09-07 06:33:13', '2022-09-07 06:33:13'),
(2, '1', '2022-09-23', '5', '50', '50', 'good', 'Broken Screens', '3', '1', '2022-09-07 06:33:13', '2022-09-07 06:33:13'),
(3, '1', '2022-09-23', '3', '34', '34', 'good', 'Broken Screens', '3', '1', '2022-09-07 06:33:13', '2022-09-07 06:33:13'),
(4, '2', '2022-09-12', '6', '45', '45', 'good', '', '1', '1', '2022-09-07 06:55:22', '2022-09-07 06:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `event_requests`
--

CREATE TABLE `event_requests` (
  `id` int(11) NOT NULL,
  `customerID` int(20) DEFAULT NULL,
  `eventDate` varchar(254) NOT NULL,
  `location` varchar(254) DEFAULT NULL,
  `total_billed` varchar(200) NOT NULL DEFAULT '0',
  `date_of_return` varchar(200) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_requests`
--

INSERT INTO `event_requests` (`id`, `customerID`, `eventDate`, `location`, `total_billed`, `date_of_return`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 20, '2022-09-17', 'Kitundu', '13480', '2022-09-21', '1', '2022-09-07 06:30:24', '2022-09-07 06:30:24'),
(2, 16, '2022-09-10', 'TRM', '4480', '2022-09-13', '1', '2022-09-07 06:31:49', '2022-09-07 06:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(11) NOT NULL,
  `itemName` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `itemName`, `created_at`, `updated_at`) VALUES
(1, 'Chairs', '2021-04-27 09:46:35', '2021-04-27 09:46:35'),
(2, 'Tents', '2022-08-19 06:36:07', '2022-08-19 06:36:07'),
(3, 'Speakers', '2022-08-19 06:36:07', '2022-08-19 06:36:07'),
(4, 'Test', '2022-08-19 06:36:08', '2022-08-19 06:36:08'),
(5, 'Seats', '2022-08-23 08:48:09', '2022-08-23 08:48:09'),
(6, 'Boards', '2022-08-23 08:48:09', '2022-08-23 08:48:09'),
(7, 'Screens', '2022-08-23 08:48:09', '2022-08-23 08:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `request_id` varchar(20) NOT NULL,
  `pmnt_mode` varchar(20) NOT NULL,
  `amount_paid` varchar(30) NOT NULL DEFAULT '0',
  `transaction_no` varchar(254) DEFAULT NULL,
  `received_by` varchar(254) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `request_id`, `pmnt_mode`, `amount_paid`, `transaction_no`, `received_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'mpesa', '4480', NULL, '1', '2022-09-07 06:30:25', '2022-09-07 06:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `sms_recipients`
--

CREATE TABLE `sms_recipients` (
  `id` int(11) NOT NULL,
  `api_key` varchar(254) NOT NULL,
  `password` varchar(200) NOT NULL,
  `recipients` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_recipients`
--

INSERT INTO `sms_recipients` (`id`, `api_key`, `password`, `recipients`, `created_at`, `updated_at`) VALUES
(1, '9ljtrQxsT4oWqG0i3hAOgE7KpzbH8Y', 'Newdawn', '0795974284', '2021-05-05 06:23:27', '2021-05-05 06:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', 'admin@gmail.com', '9e061dc6c341bfb89f01f5bcd11dc99f', 'admin', '2021-02-15 12:52:50', '2021-02-15 12:52:50'),
(2, 'Fort', 'Sort', 'salesperson@gmail.com', '9e061dc6c341bfb89f01f5bcd11dc99f', 'salesperson', '2021-02-16 03:25:21', '2021-02-16 03:25:21'),
(3, 'Ancent', 'NGO', 'ancent@gmail.com', '9e061dc6c341bfb89f01f5bcd11dc99f', 'admin', '2022-07-16 14:04:00', '2022-07-16 14:04:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productName` (`eventName`);

--
-- Indexes for table `event_items`
--
ALTER TABLE `event_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_items_returned`
--
ALTER TABLE `event_items_returned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_requests`
--
ALTER TABLE `event_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_recipients`
--
ALTER TABLE `sms_recipients`
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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_items`
--
ALTER TABLE `event_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event_items_returned`
--
ALTER TABLE `event_items_returned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event_requests`
--
ALTER TABLE `event_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_recipients`
--
ALTER TABLE `sms_recipients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
