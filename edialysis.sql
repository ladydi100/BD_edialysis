-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 06:38 AM
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
-- Table structure for table `blood_pressure`
--

CREATE TABLE `blood_pressure` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_pressure`
--

INSERT INTO `blood_pressure` (`id`, `user_id`, `systolic`, `diastolic`, `created_at`) VALUES
(9, 4, 120, 82, '2025-03-09 07:30:19'),
(10, 4, 125, 82, '2025-04-02 17:45:27'),
(15, 11, 120, 80, '2025-05-08 04:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `dialysis_treatments`
--

CREATE TABLE `dialysis_treatments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `treatment_type` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `dry_weight` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dialysis_treatments`
--

INSERT INTO `dialysis_treatments` (`id`, `user_id`, `treatment_type`, `start_date`, `dry_weight`, `created_at`) VALUES
(19, 4, 'Diálisis peritoneal en casa', '2025-04-23', 65.05, '2025-04-03 21:58:13'),
(20, 4, 'Hemodiálisis en el centro de diálisis', '2025-04-07', 63.30, '2025-04-06 20:16:02'),
(25, 11, 'Hemodiálisis en casa', '2025-05-08', 63.00, '2025-05-08 04:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `dialysis_treatment_days`
--

CREATE TABLE `dialysis_treatment_days` (
  `id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `reminder_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dialysis_treatment_days`
--

INSERT INTO `dialysis_treatment_days` (`id`, `treatment_id`, `day_of_week`, `reminder_time`) VALUES
(660, 25, 'Lunes', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `heart_rate`
--

CREATE TABLE `heart_rate` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `heart_rate` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `heart_rate`
--

INSERT INTO `heart_rate` (`id`, `user_id`, `heart_rate`, `created_at`) VALUES
(13, 11, 70, '2025-05-08 04:16:26'),
(14, 11, 75, '2025-05-08 04:16:42'),
(15, 11, 78, '2025-05-08 04:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `medical_appointments`
--

CREATE TABLE `medical_appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_appointments`
--

INSERT INTO `medical_appointments` (`id`, `user_id`, `specialty`, `appointment_date`, `appointment_time`, `created_at`) VALUES
(16, 11, 'Nutrición Clínica', '2025-05-09', '16:30:00', '2025-05-08 04:19:25');

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
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`id`, `name`, `dosage`, `color`, `notes`, `alarm_enabled`, `days`, `user_id`, `created_at`) VALUES
(40, 'Metformina ', '100', '#00FF00', 'Después del desayuno ', 0, '[\"Wednesday\"]', 11, '2025-05-08 04:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `medication_intakes`
--

CREATE TABLE `medication_intakes` (
  `id` int(11) NOT NULL,
  `time_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_intakes`
--

INSERT INTO `medication_intakes` (`id`, `time_id`, `date`, `taken`, `created_at`, `updated_at`) VALUES
(441, 53, '2025-05-07', 1, '2025-05-08 04:16:02', '2025-05-08 04:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `medication_times`
--

CREATE TABLE `medication_times` (
  `id` int(11) NOT NULL,
  `medication_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `taken` tinyint(1) DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Control de medicamentos activos: 1=activo (visible), 0=inactivo (oculto en futuras fechas)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_times`
--

INSERT INTO `medication_times` (`id`, `medication_id`, `time`, `taken`, `active`) VALUES
(53, 40, '12:29:00', 0, 1);

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
(4, 'lady', 'prue2', 'lady@hotmail.com', '$2b$08$3DaaGSN5vHGYeNzAp/QLE.BvgN6K/5N5HWhdsvWjR9mdSybpuig1q'),
(11, 'Juan', 'Prueba', 'juan@hotmail.com', '$2b$08$gAT4ywsOV4ofbf8yKqJWE.T7cbUr/K6NxULNWZ2ZXO35eqVK.6Kda');

-- --------------------------------------------------------

--
-- Table structure for table `weight`
--

CREATE TABLE `weight` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weight`
--

INSERT INTO `weight` (`id`, `user_id`, `weight`, `created_at`) VALUES
(3, 4, 64.00, '2025-04-01 09:29:01'),
(4, 4, 70.00, '2025-04-02 17:44:41'),
(5, 4, 70.00, '2025-04-12 03:22:34'),
(6, 4, 63.00, '2025-04-30 04:59:00'),
(8, 11, 60.00, '2025-05-08 04:16:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_pressure`
--
ALTER TABLE `blood_pressure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dialysis_treatments`
--
ALTER TABLE `dialysis_treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dialysis_treatment_days`
--
ALTER TABLE `dialysis_treatment_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `treatment_id` (`treatment_id`);

--
-- Indexes for table `heart_rate`
--
ALTER TABLE `heart_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `medical_appointments`
--
ALTER TABLE `medical_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `medication_intakes`
--
ALTER TABLE `medication_intakes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_id` (`time_id`,`date`);

--
-- Indexes for table `medication_times`
--
ALTER TABLE `medication_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medication_id` (`medication_id`),
  ADD KEY `idx_medication` (`medication_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `weight`
--
ALTER TABLE `weight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_pressure`
--
ALTER TABLE `blood_pressure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dialysis_treatments`
--
ALTER TABLE `dialysis_treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dialysis_treatment_days`
--
ALTER TABLE `dialysis_treatment_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT for table `heart_rate`
--
ALTER TABLE `heart_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `medical_appointments`
--
ALTER TABLE `medical_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `medication_intakes`
--
ALTER TABLE `medication_intakes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `medication_times`
--
ALTER TABLE `medication_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `weight`
--
ALTER TABLE `weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_pressure`
--
ALTER TABLE `blood_pressure`
  ADD CONSTRAINT `blood_pressure_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dialysis_treatments`
--
ALTER TABLE `dialysis_treatments`
  ADD CONSTRAINT `dialysis_treatments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dialysis_treatment_days`
--
ALTER TABLE `dialysis_treatment_days`
  ADD CONSTRAINT `dialysis_treatment_days_ibfk_1` FOREIGN KEY (`treatment_id`) REFERENCES `dialysis_treatments` (`id`);

--
-- Constraints for table `heart_rate`
--
ALTER TABLE `heart_rate`
  ADD CONSTRAINT `heart_rate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `medical_appointments`
--
ALTER TABLE `medical_appointments`
  ADD CONSTRAINT `medical_appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medication_intakes`
--
ALTER TABLE `medication_intakes`
  ADD CONSTRAINT `medication_intakes_ibfk_1` FOREIGN KEY (`time_id`) REFERENCES `medication_times` (`id`);

--
-- Constraints for table `medication_times`
--
ALTER TABLE `medication_times`
  ADD CONSTRAINT `fk_medication` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medication_times_ibfk_1` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`id`);

--
-- Constraints for table `weight`
--
ALTER TABLE `weight`
  ADD CONSTRAINT `weight_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
