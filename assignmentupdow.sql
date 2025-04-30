-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2025 at 12:36 PM
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
-- Database: `assignmentupdow`
--

-- --------------------------------------------------------

--
-- Table structure for table `bscit`
--

CREATE TABLE `bscit` (
  `srno` int(44) NOT NULL,
  `StudentId` int(7) DEFAULT NULL,
  `dmdw` text DEFAULT NULL,
  `knowledge` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bscit`
--

INSERT INTO `bscit` (`srno`, `StudentId`, `dmdw`, `knowledge`) VALUES
(1, 7457723, NULL, NULL),
(2, 6576221, NULL, NULL),
(3, 8888712, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `srno` int(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `middleName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `studentId` bigint(7) NOT NULL,
  `password` varchar(40) NOT NULL,
  `Course_list` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`srno`, `firstName`, `middleName`, `lastName`, `gender`, `email`, `contact`, `studentId`, `password`, `Course_list`) VALUES
(1, 'Sachi', 'Dhananjay', 'kadam', 'female', 'kadammayur2005@gmail.com', '9598455612', 6576221, 'mk444444', 'BscIT'),
(2, 'mayur', 'Dhananjay', 'kadam', 'male', 'kadammayur2005@gmail.com', '1236547789', 8888712, 'mk6985223', 'BscIT');

-- --------------------------------------------------------

--
-- Table structure for table `subjectdatabase`
--

CREATE TABLE `subjectdatabase` (
  `srno` int(11) NOT NULL,
  `Subject` varchar(144) NOT NULL,
  `filename` varchar(144) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjectdatabase`
--

INSERT INTO `subjectdatabase` (`srno`, `Subject`, `filename`) VALUES
(9, 'knowledge', 'C:\\Assingment-project\\BsitSuject\\Knowledge and Reasoning.pdf'),
(11, 'BigData', 'C:\\Assingment-project\\BsitSuject\\BIg data.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `teacherregistration`
--

CREATE TABLE `teacherregistration` (
  `srno` int(11) NOT NULL,
  `FirstName` varchar(140) NOT NULL,
  `MiddleName` varchar(140) NOT NULL,
  `LastName` varchar(140) NOT NULL,
  `Gender` varchar(140) NOT NULL,
  `Email` varchar(140) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `TeacherId` text NOT NULL,
  `Password` text NOT NULL,
  `Faculty` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacherregistration`
--

INSERT INTO `teacherregistration` (`srno`, `FirstName`, `MiddleName`, `LastName`, `Gender`, `Email`, `Contact`, `TeacherId`, `Password`, `Faculty`) VALUES
(1, 'mayur', 'Dhananjay', 'kadam', 'male', 'kadammayur2005@gmail.com', '1236547789', 'TR28308', 'mkhj5239874', 'BscIT'),
(2, 'mayur', 'Dhananjay', 'kadam', 'male', 'kadammayur2005@gmail.com', '1236547789', 'TR28308', 'mkhj5239874', 'BscIT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bscit`
--
ALTER TABLE `bscit`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `subjectdatabase`
--
ALTER TABLE `subjectdatabase`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `teacherregistration`
--
ALTER TABLE `teacherregistration`
  ADD PRIMARY KEY (`srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bscit`
--
ALTER TABLE `bscit`
  MODIFY `srno` int(44) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `srno` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjectdatabase`
--
ALTER TABLE `subjectdatabase`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `teacherregistration`
--
ALTER TABLE `teacherregistration`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
