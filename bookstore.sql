-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2017 at 06:07 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(2) NOT NULL,
  `ZipCode` int(5) NOT NULL COMMENT 'NNNNN'
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `BookOrders`
--

CREATE TABLE `BookOrders` (
  `TransactionID` int(8) UNSIGNED NOT NULL COMMENT 'NN-NNNNNN',
  `ISBN` varchar(13) NOT NULL COMMENT 'NNN-N-NNNNN-NNN-N',
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `ISBN` varchar(13) NOT NULL COMMENT 'NNN-N-NNNNN-NNN-N',
  `Title` varchar(100) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Genre` varchar(16) DEFAULT NULL,
  `Publisher` varchar(45) NOT NULL,
  `PublishedYear` date NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `MiddleInital` varchar(1) DEFAULT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL COMMENT 'NNN-NNN-NNNN',
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `ISBN` varchar(13) NOT NULL COMMENT 'NNN-N-NNNNN-NNN-N',
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `TransactionID` int(8) UNSIGNED NOT NULL COMMENT 'NN-NNNNNN',
  `Date` datetime NOT NULL,
  `ISBN` varchar(13) NOT NULL COMMENT 'NNN-N-NNNNN-NNN-N',
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `BookOrders`
--
ALTER TABLE `BookOrders`
  ADD KEY `TransactionID` (`TransactionID`,`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `ISBN` (`ISBN`,`CustomerID`),
  ADD KEY `ISBN_2` (`ISBN`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `CustomerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `TransactionID` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'NN-NNNNNN';
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

--
-- Constraints for table `BookOrders`
--
ALTER TABLE `BookOrders`
  ADD CONSTRAINT `BookOrders_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `Orders` (`TransactionID`),
  ADD CONSTRAINT `BookOrders_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
