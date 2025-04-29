-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 02:52 PM
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
  `Ipa` text DEFAULT NULL,
  `Dea` text DEFAULT NULL,
  `Osa` text DEFAULT NULL,
  `Dma` text DEFAULT NULL,
  `Csa` text DEFAULT NULL,
  `Oops` text DEFAULT NULL,
  `Maa` text DEFAULT NULL,
  `Wpa` text DEFAULT NULL,
  `NSma` text DEFAULT NULL,
  `Gca` text DEFAULT NULL,
  `Ppa` text DEFAULT NULL,
  `Dsa` text DEFAULT NULL,
  `Cna` text DEFAULT NULL,
  `Dbmsa` text DEFAULT NULL,
  `Ama` text DEFAULT NULL,
  `Cja` text DEFAULT NULL,
  `Esa` text DEFAULT NULL,
  `Costa` text DEFAULT NULL,
  `Sea` text DEFAULT NULL,
  `Cgaa` text DEFAULT NULL,
  `Ita` text DEFAULT NULL,
  `Awpa` text DEFAULT NULL,
  `Spma` text DEFAULT NULL,
  `Aia` text DEFAULT NULL,
  `Eja` text DEFAULT NULL,
  `Bia` text DEFAULT NULL,
  `ITSma` text DEFAULT NULL,
  `Sca` text DEFAULT NULL,
  `Pgia` text DEFAULT NULL,
  `Sqaa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bscit`
--

INSERT INTO `bscit` (`srno`, `StudentId`, `Ipa`, `Dea`, `Osa`, `Dma`, `Csa`, `Oops`, `Maa`, `Wpa`, `NSma`, `Gca`, `Ppa`, `Dsa`, `Cna`, `Dbmsa`, `Ama`, `Cja`, `Esa`, `Costa`, `Sea`, `Cgaa`, `Ita`, `Awpa`, `Spma`, `Aia`, `Eja`, `Bia`, `ITSma`, `Sca`, `Pgia`, `Sqaa`) VALUES
(1, 7457723, 'C:\\Assingment-project\\bscitupload\\7457723_6.3-T.Y.B.Sc.-Data- (1).pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 6576221, 'C:\\Assingment-project\\bscitupload\\6576221_Resume_28.pdf', 'C:\\Assingment-project\\bscitupload\\6576221_mayurkadamACC.pdf', 'C:\\Assingment-project\\bscitupload\\6576221_mk4444.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8888712, 'C:\\Assingment-project\\bscitupload\\8888712_MAYUR DHANANJAY KADAM.pdf', 'C:\\Assingment-project\\bscitupload\\8888712_4444.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `Faculty` varchar(140) NOT NULL,
  `TeachingYear` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- AUTO_INCREMENT for table `teacherregistration`
--
ALTER TABLE `teacherregistration`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;