-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 12 jan. 2025 à 22:15
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `luxdatabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `boardingpassdetails`
--

CREATE TABLE `boardingpassdetails` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `luggage` varchar(20) NOT NULL,
  `boardingDate` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `emergency_contact` varchar(255) NOT NULL,
  `num_passengers` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boardingpassdetails`
--

INSERT INTO `boardingpassdetails` (`id`, `country`, `destination`, `luggage`, `boardingDate`, `notes`, `emergency_contact`, `num_passengers`, `user_id`) VALUES
(1, 'England', 'Australia', 'rrrr', '0000-00-00', 'rrrrr', '', 0, NULL),
(2, 'USA', 'Australia', '5', '0000-00-00', 'ggggggggggggggg', '', 0, NULL),
(3, 'Australia', 'Australia', '456', '0000-00-00', 'ccccccccccccccc', '', 0, NULL),
(4, 'Canada', 'England', '456', '0000-00-00', 'test', '', 0, NULL),
(5, 'England', 'England', '5', '0000-00-00', 'jjjj', '454', 44, NULL),
(6, 'Australia', 'Canada', '456', '0000-00-00', 'sdsdsdd', '55555555', 44, NULL),
(7, 'USA', 'England', '48z', '0000-00-00', 'dffdf', '77777777', 44, NULL),
(8, 'Canada', 'USA', '48z', '0000-00-00', 'dffd', '55555555', 44, NULL),
(9, 'England', 'England', '48z', '0000-00-00', 'dfffffff', '454', 44, NULL),
(10, 'England', 'England', '48z', '0000-00-00', 'dfffffff', '454', 44, NULL),
(11, 'Canada', 'Australia', '48z', '0000-00-00', 'dfffffffffffffffffffffff', '77777777', 44, NULL),
(12, 'England', 'Australia', '48z', '0000-00-00', 'efffffffff', '77777777', 44, NULL),
(13, 'USA', 'Australia', '48z', '0000-00-00', '454464hihu', '77777777', 44, NULL),
(14, 'Canada', 'England', '48z', '0000-00-00', 'rgrgrg', '454', 71, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `user_id`) VALUES
(1, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', 'im testing', NULL),
(2, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', 'dfffdddddddd', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `phone`, `subject`, `message`, `submitted_at`, `user_id`) VALUES
(1, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', '0615281985', 'asking ', 'thank you ', '2024-06-08 19:37:10', NULL),
(2, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', '0615281985', 'asking ', 'i have a bad day', '2024-06-08 20:02:34', NULL),
(3, 'superloka', 'ahmadbourass142222@gmail.com', '06154198561', 'asking ', 'just testinnnng', '2024-06-08 20:11:07', NULL),
(4, 'sohaib', 'lekbachsoso@gmail.com', '0615281985', 'old', 'test ', '2024-06-10 09:54:13', NULL),
(5, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', '0615281985', 'asking ', 'tgtht', '2025-01-12 18:48:41', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customerinformation`
--

CREATE TABLE `customerinformation` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipCode` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customerinformation`
--

INSERT INTO `customerinformation` (`id`, `firstName`, `lastName`, `city`, `zipCode`, `email`, `phone`, `user_id`) VALUES
(1, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(2, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(3, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(4, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(5, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(6, 'Ahmed', 'Bourass', 'Fès', '30007', 'ahmadbourass03@gmail.com', '0615281985', NULL),
(8, 'Ahmed', 'Bourass', 'Fès', '30000', 'ahmadbourass03@gmail.com', '0615281985', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `flight_requests`
--

CREATE TABLE `flight_requests` (
  `request_id` int(11) NOT NULL,
  `flyFrom` varchar(255) NOT NULL,
  `flyTo` varchar(255) NOT NULL,
  `selectDate` date NOT NULL,
  `selectTime` time NOT NULL,
  `selectPassenger` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `selectAircraft` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `flight_requests`
--

INSERT INTO `flight_requests` (`request_id`, `flyFrom`, `flyTo`, `selectDate`, `selectTime`, `selectPassenger`, `created_at`, `selectAircraft`, `user_id`) VALUES
(3, 'LAX', 'CDG', '2024-05-29', '17:46:00', '1', '2024-06-08 14:41:55', 'Dassault Falcon 50', NULL),
(4, 'ATL', 'HND', '2024-06-21', '02:10:00', '2', '2024-06-08 20:03:21', 'Embraer Phenom 300', NULL),
(5, 'ATL', 'HND', '2024-06-21', '02:10:00', '2', '2024-06-08 20:04:10', 'Embraer Phenom 300', NULL),
(6, 'LAX', 'HND', '2024-06-21', '06:14:00', '1', '2024-06-08 20:06:34', 'Embraer Phenom 300', NULL),
(7, 'LAX', 'HND', '2024-06-01', '22:13:00', '4', '2024-06-08 20:10:21', 'Dassault Falcon 50', NULL),
(8, 'LAX', 'DXB', '2024-06-22', '01:12:00', '18', '2024-06-08 20:12:13', 'Embraer Phenom 300', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter_subscriptions`
--

CREATE TABLE `newsletter_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `newsletter_subscriptions`
--

INSERT INTO `newsletter_subscriptions` (`subscription_id`, `email`, `subscribed_at`, `user_id`) VALUES
(1, 'ahmadbourass03@gmail.com', '2024-06-08 15:06:51', NULL),
(2, 'ahmadbourass13@gmail.com', '2024-06-08 19:57:28', NULL),
(3, 'ahmadbourass143@gmail.com', '2024-06-08 20:04:21', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verificationToken` varchar(64) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT 0,
  `referrer_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `verificationToken`, `isVerified`, `referrer_user_id`) VALUES
(1, 'Ahmed Bourass', 'ahmadbourass03@gmail.com', '$2b$10$kQu/s87NbtSIJNXv9K2e4.TQu6XCAxOhYK5tpiRhn2uA6VdDwEyzW', NULL, 0, NULL),
(8, 'superl', 'ahmadbourass13@gmail.com', '$2b$10$MgIoyMNc5iy41F.sfDf.bO0WtJt/a.IZk2Nc19doJkOrZ7WXzoHg2', '929a418fe6314408683061e909e5dc8a4bacafb875c61192a346758ae1a8257f', 1, NULL),
(9, 'cfff', 'abadbourass03@gmail.com', '$2b$10$ZRtmm0zL8S2iTAUP6Ugf0ucBEaozPldoENM19SQeNBOf1nPPcpKLm', NULL, 0, NULL),
(10, 'The Black', 'ahmadbourass003@gmail.com', '$2b$10$JMFCQuHy1LFkRdHcr4rI2u6YlURsRoctevKK9ErFV3YUON5VNdooq', NULL, 0, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boardingpassdetails`
--
ALTER TABLE `boardingpassdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_boardingpassdetails` (`user_id`);

--
-- Index pour la table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_contact_messages` (`user_id`);

--
-- Index pour la table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_contact_us` (`user_id`);

--
-- Index pour la table `customerinformation`
--
ALTER TABLE `customerinformation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id_customerinformation` (`user_id`);

--
-- Index pour la table `flight_requests`
--
ALTER TABLE `flight_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_user_id_flight_requests` (`user_id`);

--
-- Index pour la table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `fk_user_id_newsletter_subscriptions` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_referrer_user_id_users` (`referrer_user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boardingpassdetails`
--
ALTER TABLE `boardingpassdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `customerinformation`
--
ALTER TABLE `customerinformation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `flight_requests`
--
ALTER TABLE `flight_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boardingpassdetails`
--
ALTER TABLE `boardingpassdetails`
  ADD CONSTRAINT `fk_user_id_boardingpassdetails` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `fk_user_id_contact_messages` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `fk_user_id_contact_us` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `customerinformation`
--
ALTER TABLE `customerinformation`
  ADD CONSTRAINT `fk_user_id_customerinformation` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `flight_requests`
--
ALTER TABLE `flight_requests`
  ADD CONSTRAINT `fk_user_id_flight_requests` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  ADD CONSTRAINT `fk_user_id_newsletter_subscriptions` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_referrer_user_id_users` FOREIGN KEY (`referrer_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
