-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: CS4604_Crappy_Spotify_Clone
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
-- Temporary view structure for view `ArtistProfile`
--

DROP TABLE IF EXISTS `ArtistProfile`;
/*!50001 DROP VIEW IF EXISTS `ArtistProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ArtistProfile` AS SELECT 
 1 AS `a_name`,
 1 AS `album_title`,
 1 AS `song_name`,
 1 AS `num_streams`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `TopArtists`
--

DROP TABLE IF EXISTS `TopArtists`;
/*!50001 DROP VIEW IF EXISTS `TopArtists`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `TopArtists` AS SELECT 
 1 AS `a_name`,
 1 AS `total_streams`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `TopSongs`
--

DROP TABLE IF EXISTS `TopSongs`;
/*!50001 DROP VIEW IF EXISTS `TopSongs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `TopSongs` AS SELECT 
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `num_streams`,
 1 AS `year`,
 1 AS `artist_name`,
 1 AS `album_title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `user_name` varchar(45) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
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
INSERT INTO `USER` VALUES ('alexjohnson',NULL,NULL),('amandagreen',NULL,NULL),('andrewjones',NULL,NULL),('chrisevans',NULL,NULL),('davidlee2000',NULL,NULL),('emilywang',NULL,NULL),('emmastone',NULL,NULL),('jasperhopkins','scrypt:32768:8:1$csBbbRtH6eJOOuCR$9d665f29bf97919ae53a9ce13b67da37812e1a64db4b3d6354879a4977d89ae5081f06810bcdcf189f93a47affd692ff104feab57a5170f429da1abaea451370',NULL),('jennychen',NULL,NULL),('jessicapark',NULL,NULL),('johndoe123',NULL,NULL),('lisawong',NULL,NULL),('michaelscott',NULL,NULL),('mikebrown85',NULL,NULL),('oliviawilson',NULL,NULL),('rachelgreen',NULL,NULL),('robertpark',NULL,NULL),('ryanreynolds',NULL,NULL),('sarahsmith',NULL,NULL),('sophialee',NULL,NULL),('tomhardy',NULL,NULL);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ArtistProfile`
--

/*!50001 DROP VIEW IF EXISTS `ArtistProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ArtistProfile` AS select `a`.`a_name` AS `a_name`,`al`.`al_title` AS `album_title`,`s`.`name` AS `song_name`,`s`.`num_streams` AS `num_streams` from (((`ARTIST` `a` left join `ALBUM` `al` on((`a`.`a_name` = `al`.`artist`))) left join `MAKES` `m` on((`al`.`al_id` = `m`.`al_id`))) left join `SONG` `s` on((`m`.`song_id` = `s`.`song_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TopArtists`
--

/*!50001 DROP VIEW IF EXISTS `TopArtists`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TopArtists` AS select `m`.`a_name` AS `a_name`,sum(`s`.`num_streams`) AS `total_streams` from (`MAKES` `m` join `SONG` `s` on((`m`.`song_id` = `s`.`song_id`))) group by `m`.`a_name` order by `total_streams` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TopSongs`
--

/*!50001 DROP VIEW IF EXISTS `TopSongs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TopSongs` AS select `s`.`song_id` AS `song_id`,`s`.`name` AS `song_name`,`s`.`num_streams` AS `num_streams`,`s`.`year` AS `year`,`m`.`a_name` AS `artist_name`,`al`.`al_title` AS `album_title` from ((`SONG` `s` join `MAKES` `m` on((`s`.`song_id` = `m`.`song_id`))) left join `ALBUM` `al` on((`m`.`al_id` = `al`.`al_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-27 15:05:36
