-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 06 fév. 2023 à 05:08
-- Version du serveur : 8.0.31
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forfaits`
--

-- --------------------------------------------------------

--
-- Structure de la table `forfaits`
--

CREATE TABLE `forfaits` (
  `id` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_etablissement` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `courriel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `site_web` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description_etablissement` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `nouveau_prix` decimal(10,2) DEFAULT NULL,
  `premium` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `forfaits`
--

INSERT INTO `forfaits` (`id`, `nom`, `description`, `code`, `nom_etablissement`, `adresse`, `ville`, `telephone`, `courriel`, `site_web`, `description_etablissement`, `date_debut`, `date_fin`, `prix`, `nouveau_prix`, `premium`) VALUES
(1, 'Forfait numéro 1', 'Lorem ipsum…', 'ABC001', 'Hotel Pur', '395 rue de la Couronne.', 'Québec, QC.', ' (418) 647-2611', 'info@hotelpur.qc.ca', 'https://www.marriott.com', 'Lorem ipsum…', '2022-11-09', '2022-11-15', '1999.99', '999.99', 1),
(2, 'Forfait numéro 2', 'Lorem ipsum…', 'ABC002', 'Hotel Le Voyageur', '2250 Bd Sainte-Anne.', 'Québec, QC.', '(418) 661-7701', 'info@hotelvoyageurquebec.com', 'https://www.hotelvoyageurquebec.com', 'Lorem ipsum…', '2022-11-09', '2022-11-15', '2999.99', '1999.99', 0),
(3, 'Forfait numéro 3', 'Lorem ipsum…', 'ABC003', 'Hotel Universel', ' 2300 Ch Ste-Foy.', 'Québec, QC.', '(418) 653-5250', 'info@hoteluniversel.qc.ca', 'https://hoteluniversel.qc.ca/', 'Lorem ipsum…', '2022-11-09', '2022-11-15', '3999.99', '2999.99', 1),
(4, 'Forfait numéro 4', 'Lorem ipsum…', 'ABC004', 'Auberge Saint-Antoine', '8 Rue Saint-Antoine.', 'Québec, QC.', '(418) 692-2211', ' info@saint-antoine.com', 'https://www.saint-antoine.com', 'Lorem ipsum…', '2022-11-09', '2022-11-15', '4999.99', NULL, 0),
(5, 'Forfait numéro 5', 'Lorem ipsum…', 'ABC005', 'Fairmont Le Château Frontenac', '1 Rue des Carrières.', 'Québec, QC.', '(418) 692-3861', 'chateaufrontenac@fairmont.com', 'https://www.fairmont.com/', 'Lorem ipsum…', '2022-11-09', '2022-11-15', '5999.00', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

CREATE TABLE `vols` (
  `id` int NOT NULL,
  `compagnie_aerienne` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `site_web` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_de_vol` int NOT NULL,
  `valises_permises` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vols`
--

INSERT INTO `vols` (`id`, `compagnie_aerienne`, `site_web`, `numero_de_vol`, `valises_permises`) VALUES
(1, 'Air Canada', 'https://www.aircanada.com', 5, 2),
(2, 'Air Transat', 'https://www.airtransat.com/', 10, 1),
(3, 'Copa Airlines', 'https://www.copaair.com', 15, 2),
(4, 'United Airlines', 'https://www.united.com', 20, 1),
(5, 'Aeromexico', 'https://aeromexico.com/', 25, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `forfaits`
--
ALTER TABLE `forfaits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vols`
--
ALTER TABLE `vols`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `forfaits`
--
ALTER TABLE `forfaits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `vols`
--
ALTER TABLE `vols`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
