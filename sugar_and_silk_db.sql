-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 12:23 PM
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
-- Database: `sugar_and_silk_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Cart_status` varchar(20) DEFAULT NULL,
  `Cart_creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `User_ID`, `Cart_status`, `Cart_creation_date`) VALUES
(1, 11, 'active', '2026-05-20 06:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Cart_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_id` int(11) NOT NULL,
  `Category_name` varchar(100) NOT NULL,
  `Category_description` text DEFAULT NULL,
  `Category_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_id`, `Category_name`, `Category_description`, `Category_type`) VALUES
(1, 'Artisan Cakes', 'Hand-crafted bakery cakes', 'Product'),
(2, 'Daily Bread', 'Freshly baked sourdough and baguettes', 'Product'),
(3, 'Bakery Events', 'Workshops and tasting sessions', 'News'),
(4, 'Flash Sales', 'Limited time discounts', 'News'),
(5, 'News', 'Latest updates and announcements from the bakery', 'News');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `Enquiry_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Message` text NOT NULL,
  `Submitted_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`Enquiry_ID`, `User_ID`, `First_Name`, `Last_Name`, `Email`, `Phone`, `Subject`, `Message`, `Submitted_At`) VALUES
(1, NULL, 'Suvham', 'Shakya', 'fasdfnmdfm@mfgmi.com', '1234567890', 'Very good', 'I am something to ask.', '2026-05-19 16:36:28'),
(2, NULL, 'Suvham', 'Shakya', 'somise2930@fengnu.com', '1234567890', 'Very good', 'Nice very nice, very good food.', '2026-05-21 07:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `News_id` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Image_Path` varchar(255) DEFAULT NULL,
  `Publish_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`News_id`, `User_ID`, `Category_id`, `Title`, `Content`, `Image_Path`, `Publish_Date`) VALUES
(2, 11, 5, 'Grand Reopening', 'Join us this Saturday as we unveil our newly renovated bakery space with free samples for everyone!', 'grand_reopening_1779123556048.jpg', '2026-05-18 16:59:16'),
(3, 11, 5, 'Summer Baking Workshop', 'Registration is now open for our weekend pastry masterclass. Learn the secrets to the perfect croissant.', 'summer_baking_workshop_1779123582573.jpg', '2026-05-18 16:59:42'),
(4, 11, 5, 'Holiday Hours Announcement', 'Please note that our storefront will be closing early at 2:00 PM this upcoming Monday for the holiday.', 'holiday_hours_announcement_1779123604486.jpg', '2026-05-18 17:00:04'),
(5, 11, 5, 'New Loyalty Rewards', 'Earn points with every purchase! Download our new mobile app today and get a free muffin on your next visit.', 'new_loyalty_rewards_1779123635169.jpg', '2026-05-18 17:00:35'),
(6, 11, 5, 'Sugar & Silk Unveils New Signature Strawberry Velvet Collection', 'Sugar & Silk is delighted to introduce its newest seasonal creation — the Strawberry Velvet Collection. Featuring handcrafted cakes, fresh cream pastries, and berry-infused desserts made with premium ingredients, the collection blends elegant flavor with artisan baking. Customers can now enjoy limited-edition treats both in-store and through online orders while supplies last.', 'sugar_&_silk_unveils_new_signature_strawberry_velvet_collection_1779274762470.jpg', '2026-05-19 19:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL,
  `Payment_ID` int(11) DEFAULT NULL,
  `Order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Order_status` varchar(20) DEFAULT NULL,
  `Total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_ID`, `Payment_ID`, `Order_date`, `Order_status`, `Total_amount`) VALUES
(1, 1, '2026-05-19 18:15:00', 'Processing', 275.00),
(2, 2, '2026-05-19 18:15:00', 'Processing', 440.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Order_quantity` int(11) NOT NULL,
  `Order_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_user`
--

CREATE TABLE `order_user` (
  `Order_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_amount` decimal(10,2) NOT NULL,
  `Payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Payment_method` varchar(50) DEFAULT NULL,
  `Payment_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Payment_amount`, `Payment_date`, `Payment_method`, `Payment_status`) VALUES
(1, 275.00, '2026-05-19 18:15:00', 'COD', 'Pending'),
(2, 440.00, '2026-05-19 18:15:00', 'COD', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Product_description` text DEFAULT NULL,
  `Product_price` decimal(10,2) NOT NULL,
  `Stock_quantity` int(11) DEFAULT 0,
  `Product_creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Product_Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Category_id`, `Product_Name`, `Product_description`, `Product_price`, `Stock_quantity`, `Product_creation_date`, `Product_Image`) VALUES
(2, 4, 'Crossiant', 'Flaky, buttery golden-brown croissants.', 250.00, 32, '2026-05-02 18:41:59', 'croissants.jpg'),
(3, 1, 'Two layer Vanilla cake', 'Elegant double-layer vanilla cake with floral frosting.', 3000.00, 5, '2026-05-02 18:41:59', 'vanilla_cake.jpg'),
(4, 2, 'Baguette', 'Traditional crusty French bread with a soft interior.', 450.00, 20, '2026-05-02 18:41:59', 'baguette.jpg'),
(5, 2, 'Swiss rolls', 'Light sponge cake rolled with fresh whipped cream.', 1000.00, 15, '2026-05-02 18:41:59', 'swiss_rolls.jpg'),
(6, 2, 'Sourdough Bread', 'Artisan bread with a tangy flavor and chewy crust.', 450.00, 12, '2026-05-02 18:41:59', 'sourdough.jpg'),
(7, 4, 'Donuts', 'Hand-dipped chocolate and glazed gourmet donuts.', 200.00, 40, '2026-05-02 18:41:59', 'donuts.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL CHECK (`Rating` >= 1 and `Rating` <= 5),
  `Comment` text DEFAULT NULL,
  `Review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_ID`, `User_ID`, `Product_ID`, `Rating`, `Comment`, `Review_date`) VALUES
(1, 11, 7, 3, 'Good donut.', '2026-05-19 10:45:09'),
(2, 11, 5, 4, 'Swiss rolls are good', '2026-05-19 10:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `User_creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `User_Role` varchar(20) NOT NULL DEFAULT 'customer',
  `Profile_Image` varchar(255) DEFAULT 'profile_placeholder.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Username`, `Firstname`, `Lastname`, `Email`, `Password`, `Gender`, `Address`, `User_creation_date`, `is_active`, `User_Role`, `Profile_Image`) VALUES
(11, 'Complex123', 'Suvham123', 'Shakya', 'qwertyuiop@gmail.com', '$2a$10$sHZQEKBZDicvJKsLjg1npuCAM.4NCjK2U/7uqDCRIs2NzLnlw.VDK', 'male', 'Kumaripati', '2026-05-03 21:30:28', 1, 'admin', 'Complex123_1779261933926.png'),
(12, 'Complex12345', 'June', 'Doe', 'fasdfnmdfm@mfgmi.com', '$2a$10$FyM3KOMg4Yr8G.7oqOsh4efYOn4cCk5kCm8jeEEuRtWVtT2IsN.fq', 'male', 'Kumaripati', '2026-05-20 05:33:02', 1, 'customer', 'profile_placeholder.png'),
(13, 'Simple123', 'Suvham', 'Shakya', 'asdfghjkl@gmail.com', '$2a$10$l/76DcWyZmgHaompZNOwuesxkN1Ko5L93uJfIE7KZuIuv3gXlxApG', 'male', 'Kumaripati', '2026-05-21 08:26:05', 1, 'customer', 'profile_placeholder.png'),
(14, 'Simple12345', 'June', 'Doe', 'zxcvbnm@gmail.com', '$2a$10$ppwJkfE5mtivZeLpdODmv.Agk9yoImU5eQfAtmP2TyFbpCXQ1fEW2', 'female', 'Kumaripati', '2026-05-21 08:51:50', 1, 'customer', 'profile_placeholder.png'),
(15, 'Tammana', 'Tammana', 'Aryal', 'tammana@123gmail.com', '$2a$10$Pw2sg13Mu9Kztvp8rapyjuly.ZeHwOQSJExZN2SrG8kGM6oXFZqcq', 'female', 'Balkhu', '2026-05-21 08:52:31', 0, 'customer', 'profile_placeholder.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Cart_ID`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`Enquiry_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`News_id`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Payment_ID` (`Payment_ID`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`Order_ID`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`Order_ID`,`User_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `Enquiry_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `News_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Payment_ID`) REFERENCES `payment` (`Payment_ID`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `order_user`
--
ALTER TABLE `order_user`
  ADD CONSTRAINT `order_user_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`),
  ADD CONSTRAINT `order_user_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
