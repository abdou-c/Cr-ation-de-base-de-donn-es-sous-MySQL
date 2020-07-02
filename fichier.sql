-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: banque_du_peuple
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affecter`
--

DROP TABLE IF EXISTS `affecter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affecter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mat` varchar(11) NOT NULL,
  `numAgence` varchar(11) NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mat` (`mat`),
  KEY `numAgence` (`numAgence`),
  CONSTRAINT `affecter_ibfk_1` FOREIGN KEY (`mat`) REFERENCES `personne` (`matricule`),
  CONSTRAINT `affecter_ibfk_2` FOREIGN KEY (`numAgence`) REFERENCES `agence` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affecter`
--

LOCK TABLES `affecter` WRITE;
/*!40000 ALTER TABLE `affecter` DISABLE KEYS */;
/*!40000 ALTER TABLE `affecter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `numero` varchar(11) NOT NULL,
  `adrAgence` int(11) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `adrAgence` (`adrAgence`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `numero` varchar(11) NOT NULL,
  `mat` varchar(11) DEFAULT NULL,
  `rib` int(3) NOT NULL,
  `solde` double(10,5) NOT NULL,
  `dateOuverture` date NOT NULL,
  `nomEmpl` varchar(50) DEFAULT NULL,
  `telEmpl` varchar(20) DEFAULT NULL,
  `agios` double(10,5) DEFAULT NULL,
  `fraisOuverture` double(10,5) DEFAULT NULL,
  `remuneration` double(10,5) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `typeCompte` int(11) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `numAgence` (`mat`),
  KEY `typeCompte` (`typeCompte`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`mat`) REFERENCES `personne` (`matricule`),
  CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`typeCompte`) REFERENCES `typecompte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entreprise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `adrEntreprise` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adrEntreprise` (`adrEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprise`
--

LOCK TABLES `entreprise` WRITE;
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat`
--

DROP TABLE IF EXISTS `etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat`
--

LOCK TABLES `etat` WRITE;
/*!40000 ALTER TABLE `etat` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etatcompte`
--

DROP TABLE IF EXISTS `etatcompte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etatcompte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numcompte` varchar(11) NOT NULL,
  `etatcompte` int(11) unsigned NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numcompte` (`numcompte`),
  KEY `etatcompte` (`etatcompte`),
  CONSTRAINT `etatcompte_ibfk_1` FOREIGN KEY (`numcompte`) REFERENCES `compte` (`numero`),
  CONSTRAINT `etatcompte_ibfk_2` FOREIGN KEY (`etatcompte`) REFERENCES `etat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etatcompte`
--

LOCK TABLES `etatcompte` WRITE;
/*!40000 ALTER TABLE `etatcompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `etatcompte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `matEmpl` varchar(11) NOT NULL,
  `numcompte` varchar(11) NOT NULL,
  `dateOperation` date NOT NULL,
  `montant` double(10,5) NOT NULL,
  `numcomptevir` varchar(11) DEFAULT NULL,
  `taxe` double(10,5) DEFAULT NULL,
  `taxesms` double(10,5) DEFAULT NULL,
  `dateD` date DEFAULT NULL,
  `dateF` date DEFAULT NULL,
  `typeOperation` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matEmpl` (`matEmpl`),
  KEY `numcompte` (`numcompte`),
  KEY `typeOperation` (`typeOperation`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`matEmpl`) REFERENCES `personne` (`matricule`),
  CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`numcompte`) REFERENCES `compte` (`numero`),
  CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`typeOperation`) REFERENCES `typeoperation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personne` (
  `matricule` varchar(11) NOT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `dateNaiss` date NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adrPersonne` int(11) unsigned NOT NULL,
  `email` varchar(20) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`matricule`),
  KEY `adrPersonne` (`adrPersonne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecompte`
--

DROP TABLE IF EXISTS `typecompte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecompte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecompte`
--

LOCK TABLES `typecompte` WRITE;
/*!40000 ALTER TABLE `typecompte` DISABLE KEYS */;
/*!40000 ALTER TABLE `typecompte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeoperation`
--

DROP TABLE IF EXISTS `typeoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeoperation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeoperation`
--

LOCK TABLES `typeoperation` WRITE;
/*!40000 ALTER TABLE `typeoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mat` varchar(11) NOT NULL,
  `idProfil` int(11) unsigned NOT NULL,
  `dateAffecter` date NOT NULL,
  `matAffecteur` varchar(11) NOT NULL,
  `etat` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mat` (`mat`),
  KEY `idProfil` (`idProfil`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`mat`) REFERENCES `personne` (`matricule`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`idProfil`) REFERENCES `profil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-02 10:42:55
