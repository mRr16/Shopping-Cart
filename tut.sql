-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 03:30 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tut`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `p_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `p_name`, `image`, `price`, `quantity`) VALUES
(28, 'Laptop', 'images/5c4bfa113d86bdownload2.jpg', 1000.00, 11),
(29, 'Mobile', 'images/5c4bfc1d32d90download.jpg', 500.00, 38),
(30, 'Watch', 'images/5c4bfc9b650a85c4bf62cc56385ad58c60c1a87a.jpg', 250.00, 8),
(31, 'Tab', 'images/5c4bfcd4c43435.jpg', 300.00, 21),
(33, 'T-Shirt', 'images/5c4bfd4eb99045c4bf82fcaa2ctshirt7.jpg', 25.00, 11),
(34, 'Shirt', 'images/5c4bfd691cfbf5c4bf8933c9b9Mens Navy Check Casula Shirt.jpg', 30.00, 24);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_info`
--

CREATE TABLE `shipping_info` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `total_money` double NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `username`, `total_money`, `payment_status`, `order_time`) VALUES
(25, 'rubel', 1275, 'pending', '2019-01-26 06:47:24'),
(26, 'sohel', 825, 'pending', '2019-01-30 14:25:39'),
(27, 'rakib', 805, 'pending', '2019-01-30 14:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `full_address` varchar(30) NOT NULL,
  `zipcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`username`, `password`, `first_name`, `last_name`, `contact_no`, `full_address`, `zipcode`) VALUES
('rakib', '12345', 'Saruar', 'Rakib', '01289458997', 'SHRH,RU', 2300),
('rubel', '12345', 'Rubel ', 'Rana', '01558925547', 'SHRH,RU', 2200),
('sohel', '12345', 'Sohel', 'Rana', '017764758465', 'Ranisankail,Thakurgaon', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_info`
--

CREATE TABLE `voucher_info` (
  `v_id` int(11) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `ordered_quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher_info`
--

INSERT INTO `voucher_info` (`v_id`, `item_name`, `ordered_quantity`, `unit_price`) VALUES
(1, '15', 1, 33),
(1, '12', 1, 66),
(1, '15', 1, 33),
(1, '12', 1, 66),
(1, '15', 1, 33),
(1, '12', 1, 66),
(2, '0', 1, 33),
(3, '0', 1, 33),
(4, '0', 1, 32),
(5, '0', 2, 42),
(6, '0', 1, 42),
(7, '0', 2, 42),
(8, '0', 2, 42),
(9, '0', 1, 42),
(10, '0', 1, 42),
(11, '0', 1, 42),
(12, '0', 1, 42),
(13, '0', 1, 42),
(14, '0', 1, 42),
(15, '0', 1, 42),
(16, '0', 1, 42),
(17, '0', 1, 32),
(18, '0', 1, 32),
(20, 'w', 1, 32),
(21, 'w', 1, 32),
(22, 'w', 1, 32),
(23, 'poi', 1, 42),
(24, 'ee', 1, 32),
(24, 'poi', 1, 42),
(24, 'w', 1, 32),
(25, 'Laptop', 1, 1000),
(25, 'Watch', 1, 250),
(25, 'T-Shirt', 1, 25),
(26, 'Mobile', 1, 500),
(26, 'T-Shirt', 1, 25),
(26, 'Tab', 1, 300),
(27, 'Mobile', 1, 500),
(27, 'T-Shirt', 1, 25),
(27, 'Shirt', 1, 30),
(27, 'Watch', 1, 250);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
