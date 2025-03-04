-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2025 at 08:41 AM
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
-- Database: `edialysis`
--

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `alarm_enabled` tinyint(1) DEFAULT NULL,
  `days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`days`)),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`id`, `name`, `dosage`, `color`, `notes`, `alarm_enabled`, `days`, `user_id`) VALUES
(1, 'L1', '100', '#0000FF', 'Prueba 1', 1, '[\"Monday\",\"Thursday\"]', 0),
(2, 'L2', '100', '#00FF00', 'Prueba2', 1, '[\"Monday\",\"Thursday\",\"Sunday\"]', 0),
(3, 'L5', '100', '#FFA500', 'Prueba 5', 1, '[\"Monday\",\"Saturday\"]', 0),
(4, '20', '12', '#0000FF', '20', 0, '[\"Thursday\"]', 4),
(6, 'L0203', '100', '#0000FF', 'Prueba', 0, '[]', 4),
(7, 'L21', '100', '#0000FF', 'L21', 0, '[\"Thursday\",\"Saturday\",\"Sunday\"]', 4),
(8, 'L21', '200', '#FF0000', 'Tomar pastilla completa ', 0, '[\"Monday\"]', 4),
(9, 'L30', '1000', '#FFFF00', 'Tomar completa ', 0, '[\"Monday\"]', 4),
(10, 'Paracetamol ', '100g', '#FF0000', 'Tomar media pastilla ', 1, '[]', 4),
(11, 'Paracetamol ', '100g', '#800080', 'Tomar media pastilla ', 1, '[\"Tuesday\"]', 4),
(12, 'Suerin', '1000G', '#FFA500', 'Tomar pastilla completa ', 0, '[\"Tuesday\",\"Wednesday\"]', 4);

-- --------------------------------------------------------

--
-- Table structure for table `medication_times`
--

CREATE TABLE `medication_times` (
  `id` int(11) NOT NULL,
  `medication_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `taken` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_times`
--

INSERT INTO `medication_times` (`id`, `medication_id`, `time`, `taken`) VALUES
(1, 1, '10:17:00', 0),
(2, 1, '13:17:00', 0),
(3, 2, '10:29:00', 0),
(4, 2, '17:29:00', 0),
(5, 3, '10:45:00', 0),
(6, 3, '06:45:00', 0),
(7, 4, '08:33:00', 0),
(8, 6, '08:49:00', 0),
(9, 7, '08:50:00', 0),
(10, 8, '21:08:00', 0),
(11, 9, '17:22:00', 0),
(12, 10, '03:13:00', 0),
(13, 10, '13:00:00', 0),
(14, 11, '21:00:00', 1),
(15, 11, '02:00:00', 0),
(16, 12, '19:00:00', 0),
(17, 12, '23:30:00', 0),
(18, 12, '03:59:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`) VALUES
(1, 'Juan Pérez', '', 'juan@example.com', '$2b$08$YKqRVRhH.u5n9SR3PbPnnuqKFD7eD2hyHJzulJO4UjBc4j7ffVSNe'),
(3, 'Juan', '', 'juan1@example.com', '$2b$08$VOuvvtskinyNagLpSqD5w.wMz.MATw9Lk3uBYsU7xaDxl/RoHItae'),
(4, 'lady', 'prue2', 'lady@hotmail.com', '$2b$08$3DaaGSN5vHGYeNzAp/QLE.BvgN6K/5N5HWhdsvWjR9mdSybpuig1q'),
(6, 'lady1', 'prue2', 'lady1@hotmail.com', '$2b$08$.L99vM3FGqdlcyqh6Px7c.S6WRfWcY1Sg9fykEy9/cKMpI9mcMFEu'),
(7, 'lady3', 'prue2', 'lady3@hotmail.com', '$2b$08$7M.BwZFQ/iERnjsmd5QUse/JFCFA.VSsNzG.n98h8YJb7xBooWnce'),
(8, 'lady4', 'prue2', 'lady4@hotmail.com', '$2b$08$/d6FWLqAb8R6FBP8DHoDhuNRl7e2gDo4oSDMOBkBFwtsVAhlZGrvu'),
(9, 'lady5', 'T', 'lady5@hotmail.com', '$2b$08$OQUebdpVZEgFDF6gt/uvceRafdmjUHsm4/h8DdBEy3k4rPLrA9sMm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medication_times`
--
ALTER TABLE `medication_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medication_id` (`medication_id`);

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
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `medication_times`
--
ALTER TABLE `medication_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medication_times`
--
ALTER TABLE `medication_times`
  ADD CONSTRAINT `medication_times_ibfk_1` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
