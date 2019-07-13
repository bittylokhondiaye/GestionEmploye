-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 13, 2019 at 07:03 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.2.20-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GestionEmploye`
--

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `matricule` int(11) NOT NULL,
  `nom_complet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` datetime NOT NULL,
  `salaire` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `matricule`, `nom_complet`, `date_naissance`, `salaire`, `service_id`) VALUES
(5, 1597, 'Bitty Ndiaye', '1997-10-30 00:00:00', 1000000, 1),
(6, 4267, 'fatou kandji', '1998-01-15 00:00:00', 700000, 3),
(7, 7618, 'fatou DIouf', '1994-04-06 00:00:00', 6000000, 1),
(8, 8314, 'Mayram kane', '1996-10-11 00:00:00', 1500000, 3),
(12, 4216, 'niatame Diop', '1998-06-12 00:00:00', 1200000, 2),
(13, 1345, 'ousseynou faye', '1995-07-17 00:00:00', 650000, 4),
(14, 7561, 'coach cire', '1990-10-06 00:00:00', 800000, 2),
(15, 4584, 'yaya ly', '1993-05-07 00:00:00', 750000, 3),
(16, 1576, 'Ngagne fall mannequin', '1995-07-16 00:00:00', 900000, 2),
(17, 7413, 'astou ngom', '1996-05-02 00:00:00', 500000, 4),
(18, 4761, 'rokhaya tine', '1994-07-16 00:00:00', 500000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190711153123', '2019-07-11 15:34:37'),
('20190712152544', '2019-07-12 15:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
(1, 'informatique'),
(2, 'marketing'),
(3, 'communication'),
(4, 'securité');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F804D3B9ED5CA9E6` (`service_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `FK_F804D3B9ED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
