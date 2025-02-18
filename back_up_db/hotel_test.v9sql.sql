-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 02:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `reservation_id`, `amount`, `payment_date`, `payment_time`) VALUES
(2, 106, 5000, '2024-12-14', '00:00:00'),
(3, 109, 1000, '2024-12-14', '00:00:00'),
(4, 107, 1500, '2024-12-14', '00:00:00'),
(5, 108, 2000, '2024-12-14', '00:00:00'),
(6, 110, 1000, '2024-12-14', '00:00:00'),
(7, 111, 100, '2024-12-18', '00:00:00'),
(8, 111, 100, '2024-12-18', '00:00:00'),
(9, 112, 200, '2024-12-18', '00:00:00'),
(10, 113, 200, '2024-12-18', '00:00:00'),
(11, 113, 200, '2024-12-18', '00:00:00'),
(12, 115, 100, '2024-12-18', '00:00:00'),
(13, 116, 200, '2024-12-18', '16:24:56'),
(14, 117, 100, '2024-12-20', '10:49:41'),
(15, 118, 600, '2024-12-20', '10:50:51'),
(16, 143, 150, '2024-12-20', '12:32:12'),
(17, 144, 150, '2024-12-20', '14:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `total_cost`, `status`) VALUES
(106, 8, 5000, 'Paid'),
(107, 8, 1500, 'Paid'),
(108, 8, 2000, 'Paid'),
(109, 8, 1000, 'Paid'),
(110, 8, 1000, 'Paid'),
(111, 8, 100, 'Paid'),
(112, 8, 200, 'Paid'),
(113, 8, 200, 'Paid'),
(115, 8, 100, 'Paid'),
(116, 8, 200, 'Paid'),
(117, 9, 100, 'Paid'),
(118, 9, 600, 'Paid'),
(121, 9, 100, 'Unpaid'),
(122, 9, 100, 'Unpaid'),
(123, 9, 100, 'Unpaid'),
(124, 9, 100, 'Unpaid'),
(125, 9, 100, 'Unpaid'),
(126, 9, 100, 'Unpaid'),
(127, 9, 100, 'Unpaid'),
(128, 9, 100, 'Unpaid'),
(129, 9, 100, 'Unpaid'),
(130, 9, 100, 'Unpaid'),
(131, 9, 100, 'Unpaid'),
(132, 9, 100, 'Unpaid'),
(133, 9, 100, 'Unpaid'),
(134, 9, 100, 'Unpaid'),
(135, 9, 100, 'Unpaid'),
(136, 9, 100, 'Unpaid'),
(137, 9, 100, 'Unpaid'),
(138, 9, 100, 'Unpaid'),
(139, 9, 100, 'Unpaid'),
(140, 9, 100, 'Unpaid'),
(141, 9, 100, 'Unpaid'),
(142, 9, 100, 'Unpaid'),
(143, 8, 150, 'Paid'),
(144, 8, 150, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_line`
--

CREATE TABLE `reservation_line` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_line`
--

INSERT INTO `reservation_line` (`id`, `room_id`, `reservation_id`, `check_in`, `check_out`, `subtotal`) VALUES
(101, 5, 106, '2024-12-20', '2024-12-30', 5000),
(102, 5, 107, '2024-12-14', '2024-12-17', 1500),
(103, 5, 108, '2024-12-16', '2024-12-20', 2000),
(104, 5, 109, '2024-12-17', '2024-12-19', 1000),
(105, 5, 110, '2024-12-15', '2024-12-17', 1000),
(106, 1, 111, '2024-12-14', '2024-12-15', 100),
(107, 1, 112, '2024-12-18', '2024-12-20', 200),
(108, 1, 113, '2024-12-18', '2024-12-20', 200),
(110, 1, 115, '2024-12-26', '2024-12-27', 100),
(111, 1, 116, '2024-12-18', '2024-12-20', 200),
(112, 1, 117, '2024-12-20', '2024-12-21', 100),
(113, 1, 118, '2024-12-22', '2024-12-28', 600),
(116, 1, 121, '2024-12-20', '2024-12-21', 100),
(117, 1, 122, '2024-12-20', '2024-12-21', 100),
(118, 1, 123, '2024-12-20', '2024-12-21', 100),
(119, 1, 124, '2024-12-20', '2024-12-21', 100),
(120, 1, 125, '2024-12-20', '2024-12-21', 100),
(121, 1, 126, '2024-12-20', '2024-12-21', 100),
(122, 1, 127, '2024-12-20', '2024-12-21', 100),
(123, 1, 128, '2024-12-20', '2024-12-21', 100),
(124, 1, 129, '2024-12-20', '2024-12-21', 100),
(125, 1, 130, '2024-12-20', '2024-12-21', 100),
(126, 1, 131, '2024-12-20', '2024-12-21', 100),
(127, 1, 132, '2024-12-20', '2024-12-21', 100),
(128, 1, 133, '2024-12-20', '2024-12-21', 100),
(129, 1, 134, '2024-12-20', '2024-12-21', 100),
(130, 1, 135, '2024-12-20', '2024-12-21', 100),
(131, 1, 136, '2024-12-20', '2024-12-21', 100),
(132, 1, 137, '2024-12-20', '2024-12-21', 100),
(133, 1, 138, '2024-12-20', '2024-12-21', 100),
(134, 1, 139, '2024-12-20', '2024-12-21', 100),
(135, 1, 140, '2024-12-20', '2024-12-21', 100),
(136, 1, 141, '2024-12-20', '2024-12-21', 100),
(137, 1, 142, '2024-12-20', '2024-12-21', 100),
(138, 3, 143, '2024-12-20', '2024-12-21', 150),
(139, 3, 144, '2024-12-20', '2024-12-21', 150);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_type` varchar(11) NOT NULL,
  `price` int(11) NOT NULL,
  `availability_status` varchar(11) NOT NULL,
  `number_of_rooms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_type`, `price`, `availability_status`, `number_of_rooms`) VALUES
(1, 'Stuites', 100, 'available', 0),
(3, 'Standard', 150, 'available', 997),
(4, 'Famlily', 200, 'available', 999),
(5, 'FamlilyBig', 500, 'available', 999);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `number`, `password`, `user_type`, `created_at`) VALUES
(7, 'admin', 'admin', 'admin@gmail.com', 912902901, '123', 'user', '2024-12-14 13:02:49'),
(8, 'rhod', 'sol', 'sol@gmail.com', 2147483647, '123', 'user', '2024-12-14 13:08:35'),
(9, 'customer', 'number1', 'customer1@gmail.com', 909990, '123', 'user', '2024-12-20 09:45:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `reservation_line`
--
ALTER TABLE `reservation_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id_fk` (`reservation_id`),
  ADD KEY `room_id_fk` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `reservation_line`
--
ALTER TABLE `reservation_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_line`
--
ALTER TABLE `reservation_line`
  ADD CONSTRAINT `reservation_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_id_fk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
