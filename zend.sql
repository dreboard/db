-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2017 at 05:16 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zend`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAlbums` ()  BEGIN
SELECT * FROM album;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_rateChapter12` (IN `numRating_Chapter` INT(11) UNSIGNED, IN `txtRating_Chapter` VARCHAR(250), IN `chapterName` VARCHAR(250), IN `addedBy` VARCHAR(250))  BEGIN
DECLARE numRating_Chapter INT;

DECLARE txtRating_Chapter VARCHAR(250);

DECLARE chapterName1 VARCHAR(250);

DECLARE addedBy1 VARCHAR(250);

DECLARE chapterId INT;

DECLARE studentId INT;

SET chapterName1 = chapterName;
SET addedBy1 = addedBy;

SET chapterId = (SELECT chapterId 
                   FROM chapters 
                   WHERE chaptername = chapterName1);

SET studentId = (SELECT Id 
                   FROM students 
                   WHERE email = addedBy1);

SELECT chapterId;
SELECT studentId;

INSERT INTO ratechapter (rateBy, rateText, rateLevel, chapterRated)
VALUES (studentId, txtRating_Chapter, numRating_Chapter,chapterId);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `artist`, `title`) VALUES
(1, 'The Military Wives', 'In My Dreams'),
(2, 'Adele', '21'),
(3, 'Bruce Springsteen', 'Wrecking Ball (Deluxe)'),
(4, 'Lana Del Rey', 'Born To Die'),
(5, 'Gotye', 'Making Mirrors');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
