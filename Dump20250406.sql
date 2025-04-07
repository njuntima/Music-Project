-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: CS4604_Crappy_Spotify_Clone
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ALBUM`
--

DROP TABLE IF EXISTS `ALBUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALBUM` (
  `al_id` int NOT NULL,
  `al_title` varchar(45) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `artist` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`al_id`),
  KEY `fk_ALBUM_1_idx` (`artist`),
  CONSTRAINT `fk_ALBUM_1` FOREIGN KEY (`artist`) REFERENCES `ARTIST` (`a_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALBUM`
--

LOCK TABLES `ALBUM` WRITE;
/*!40000 ALTER TABLE `ALBUM` DISABLE KEYS */;
INSERT INTO `ALBUM` VALUES (1,'1989',2014,'Taylor Swift'),(2,'After Hours',2020,'The Weeknd'),(3,'DAMN.',2017,'Kendrick Lamar'),(4,'When We All Fall Asleep, Where Do We Go?',2019,'Billie Eilish'),(5,'÷ (Divide)',2017,'Ed Sheeran'),(6,'Sweetener',2018,'Ariana Grande'),(7,'Views',2016,'Drake'),(8,'Beerbongs & Bentleys',2018,'Post Malone'),(9,'Mylo Xyloto',2011,'Coldplay'),(10,'Future Nostalgia',2020,'Dua Lipa'),(11,'24K Magic',2016,'Bruno Mars'),(12,'Joanne',2016,'Lady Gaga'),(13,'OK Computer',1997,'Radiohead'),(14,'AM',2013,'Arctic Monkeys'),(15,'Night Visions',2012,'Imagine Dragons'),(16,'21',2011,'Adele'),(17,'Purpose',2015,'Justin Bieber'),(18,'Planet Her',2021,'Doja Cat'),(19,'Maroon 5',2012,'Maroon 5'),(20,'Too Weird to Live, Too Rare to Die!',2013,'Panic! At The Disco');
/*!40000 ALTER TABLE `ALBUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AL_GENRE`
--

DROP TABLE IF EXISTS `AL_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AL_GENRE` (
  `al_id` int NOT NULL,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`al_id`,`genre`),
  CONSTRAINT `fk_AL_GENRE_1` FOREIGN KEY (`al_id`) REFERENCES `ALBUM` (`al_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AL_GENRE`
--

LOCK TABLES `AL_GENRE` WRITE;
/*!40000 ALTER TABLE `AL_GENRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AL_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTIST`
--

DROP TABLE IF EXISTS `ARTIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARTIST` (
  `a_name` varchar(45) NOT NULL,
  PRIMARY KEY (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTIST`
--

LOCK TABLES `ARTIST` WRITE;
/*!40000 ALTER TABLE `ARTIST` DISABLE KEYS */;
INSERT INTO `ARTIST` VALUES ('Adele'),('Arctic Monkeys'),('Ariana Grande'),('Billie Eilish'),('Bruno Mars'),('Coldplay'),('Doja Cat'),('Drake'),('Dua Lipa'),('Ed Sheeran'),('Imagine Dragons'),('Justin Bieber'),('Kendrick Lamar'),('Lady Gaga'),('Maroon 5'),('Panic! At The Disco'),('Post Malone'),('Radiohead'),('Taylor Swift'),('The Weeknd');
/*!40000 ALTER TABLE `ARTIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `A_GENRE`
--

DROP TABLE IF EXISTS `A_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `A_GENRE` (
  `a_name` varchar(45) NOT NULL,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`a_name`,`genre`),
  CONSTRAINT `fk_A_GENRE_1` FOREIGN KEY (`a_name`) REFERENCES `ARTIST` (`a_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A_GENRE`
--

LOCK TABLES `A_GENRE` WRITE;
/*!40000 ALTER TABLE `A_GENRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `A_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSED_OF`
--

DROP TABLE IF EXISTS `COMPOSED_OF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSED_OF` (
  `song_id` int NOT NULL,
  `p_id` int NOT NULL,
  PRIMARY KEY (`song_id`,`p_id`),
  KEY `fk_COMPOSED_OF_1_idx` (`p_id`),
  CONSTRAINT `fk_COMPOSED_OF_1` FOREIGN KEY (`p_id`) REFERENCES `PLAYLIST` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_COMPOSED_OF_2` FOREIGN KEY (`song_id`) REFERENCES `SONG` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSED_OF`
--

LOCK TABLES `COMPOSED_OF` WRITE;
/*!40000 ALTER TABLE `COMPOSED_OF` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPOSED_OF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAKES`
--

DROP TABLE IF EXISTS `MAKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAKES` (
  `song_id` int NOT NULL,
  `a_name` varchar(45) NOT NULL,
  `al_id` int DEFAULT NULL,
  PRIMARY KEY (`song_id`,`a_name`),
  KEY `fk_MAKES_2_idx` (`al_id`),
  CONSTRAINT `fk_MAKES_1` FOREIGN KEY (`song_id`) REFERENCES `SONG` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_MAKES_2` FOREIGN KEY (`al_id`) REFERENCES `ALBUM` (`al_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAKES`
--

LOCK TABLES `MAKES` WRITE;
/*!40000 ALTER TABLE `MAKES` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYLIST`
--

DROP TABLE IF EXISTS `PLAYLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYLIST` (
  `p_id` int NOT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `creator` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_PLAYLIST_1_idx` (`creator`),
  CONSTRAINT `fk_PLAYLIST_1` FOREIGN KEY (`creator`) REFERENCES `USER` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYLIST`
--

LOCK TABLES `PLAYLIST` WRITE;
/*!40000 ALTER TABLE `PLAYLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SONG`
--

DROP TABLE IF EXISTS `SONG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SONG` (
  `song_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `num_streams` int DEFAULT NULL,
  `year` year DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SONG`
--

LOCK TABLES `SONG` WRITE;
/*!40000 ALTER TABLE `SONG` DISABLE KEYS */;
INSERT INTO `SONG` VALUES (1,'Blinding Lights',320000,2020),(2,'Shape of You',350000,2017),(3,'Shake It Off',120000,2014),(4,'Bad Guy',100000,2019),(5,'Believer',250000,2017),(6,'Old Town Road',180000,2019),(7,'Someone You Loved',220000,2018),(8,'Dance Monkey',270000,2019),(9,'Watermelon Sugar',150000,2020),(10,'Havana',130000,2017),(11,'Perfect',160000,2017),(12,'Shallow',140000,2018),(13,'Hello',110000,2015),(14,'Cant Stop the Feeling',100000,2016),(15,'Stay With Me',90000,2014),(16,'Royals',80000,2013),(17,'Uptown Funk',100000,2014),(18,'Cheap Thrills',70000,2016),(19,'Sugar',120000,2015),(20,'Rolling in the Deep',100000,2011);
/*!40000 ALTER TABLE `SONG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `S_GENRE`
--

DROP TABLE IF EXISTS `S_GENRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `S_GENRE` (
  `song_id` int NOT NULL,
  `genre` varchar(45) NOT NULL,
  PRIMARY KEY (`song_id`,`genre`),
  CONSTRAINT `fk_S_GENRE_1` FOREIGN KEY (`song_id`) REFERENCES `SONG` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `S_GENRE`
--

LOCK TABLES `S_GENRE` WRITE;
/*!40000 ALTER TABLE `S_GENRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `S_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `user_name` varchar(45) NOT NULL,
  `password_hash` varchar(64) DEFAULT NULL,
  `artist` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `fk_USER_1_idx` (`artist`),
  CONSTRAINT `fk_USER_1` FOREIGN KEY (`artist`) REFERENCES `ARTIST` (`a_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('alexjohnson','9881757f9f006aa219628d38800e53bd3e98752e1263fae786b7b1d46d6e9ce7',NULL),('amandagreen','a6656bef55a5d326cd840ba8ecaddc59163e8f8b46db547faecea2814a2f4333',NULL),('andrewjones','cd38c46a5dee24f66f34b866e518d0be7471301d89e57d5b8778ddb837cea8fd',NULL),('chrisevans','a8558bd953326f96e022a080f319587f70a9bd4c28b778afeaad142a94607c82',NULL),('davidlee2000','6e659deaa85842cdabb5c6305fcc40033ba43772ec00d45c2a3c921741a5e377',NULL),('emilywang','cb5053319dbf12aba973adcba9dfc61bfc22718eea4bad6e06e9bd278c40053c',NULL),('emmastone','1db39f0c5888ecceeadae9b94eb36227473256e71b27296760e369466effab2e',NULL),('jennychen','12dd86c71dfcaf6459c31e7be0be0033f031cc595320dcafea39f9bfc7598a17',NULL),('jessicapark','9fe3ffa1a06c1aeaaba1fea0c8c80a0e3462207cffb62c63e51bc223405a47c4',NULL),('johndoe123','5e13e6a64ccb18aabb63024c4467d3be043ab9d7bc8d3fc11cbc81cb2f2682ec',NULL),('lisawong','6cbc3871e4bfdace28d2e364836a2b77376e5f06fef3eff8c86c0358d57dfe62',NULL),('michaelscott','e16ab186aa3a0f4f9cd1b39226a6b6c33ca89a366d895bb3e089310f9fb98ad1',NULL),('mikebrown85','cdb7e829c35faf4ae68f03c4cfc051ef963718aa2ea61f782fbba5efbecd675e',NULL),('oliviawilson','6beef9fbbc343acf8d0a236551289d8f945d3061fda834e6b9cf63593f862d29',NULL),('rachelgreen','d8ceffaba3d0df342ef7ae9c902ca64c4e3b3c92a7f25fa08e4599e1bf3bbd41',NULL),('robertpark','a5745fd105bdc84104ac2faa54b93f3736e88e1ff27c06501438377ad5a638f5',NULL),('ryanreynolds','2f833dcc0294603549cd17f8d09674e208d294c2a039ba2459006441736ac1f0',NULL),('sarahsmith','f852b96c50b7f06cbe92bc9100aabc72b33dac76d1fe0872faea0856c485e69d',NULL),('sophialee','3e7667f5840aa2e9e888ced67915c7550b0552697d48106cdac44fc0d0b447e5',NULL),('tomhardy','12dcfe87482b2a329e357f09c3bd0a68e000cf8337e6fb8d1de7913334c95918',NULL);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06 21:01:08
