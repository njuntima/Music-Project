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
-- Table structure for table `ADMIN_EVENTS`
--

DROP TABLE IF EXISTS `ADMIN_EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENTS` (
  `admin_id` varchar(45) NOT NULL,
  `event_date` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`,`event_date`),
  CONSTRAINT `ADMIN_EVENTS_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `ADMIN_STATISTICS` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENTS`
--

LOCK TABLES `ADMIN_EVENTS` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN_STATISTICS`
--

DROP TABLE IF EXISTS `ADMIN_STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_STATISTICS` (
  `admin_id` varchar(45) NOT NULL,
  `admin_username` varchar(45) NOT NULL,
  `total_actions` int NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_STATISTICS`
--

LOCK TABLES `ADMIN_STATISTICS` WRITE;
/*!40000 ALTER TABLE `ADMIN_STATISTICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `AL_GENRE` VALUES (1,'pop'),(2,'r&b'),(3,'hip-hop'),(4,'electropop'),(5,'pop');
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
INSERT INTO `A_GENRE` VALUES ('Billie Eilish','electropop'),('Ed Sheeran','pop'),('Kendrick Lamar','hip-hop'),('Taylor Swift','pop'),('The Weeknd','r&b');
/*!40000 ALTER TABLE `A_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ArtistAlbumStats`
--

DROP TABLE IF EXISTS `ArtistAlbumStats`;
/*!50001 DROP VIEW IF EXISTS `ArtistAlbumStats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ArtistAlbumStats` AS SELECT 
 1 AS `artist_name`,
 1 AS `album_count`,
 1 AS `num_streams`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `ArtistSongStats`
--

DROP TABLE IF EXISTS `ArtistSongStats`;
/*!50001 DROP VIEW IF EXISTS `ArtistSongStats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ArtistSongStats` AS SELECT 
 1 AS `artist_name`,
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `num_streams`,
 1 AS `hours_streamed`,
 1 AS `avg_pct_listened`*/;
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
INSERT INTO `COMPOSED_OF` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,6);
/*!40000 ALTER TABLE `COMPOSED_OF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `FastestGrowingSong`
--

DROP TABLE IF EXISTS `FastestGrowingSong`;
/*!50001 DROP VIEW IF EXISTS `FastestGrowingSong`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `FastestGrowingSong` AS SELECT 
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `hours_this_week`,
 1 AS `hours_last_week`,
 1 AS `growth_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `FavoriteGenres`
--

DROP TABLE IF EXISTS `FavoriteGenres`;
/*!50001 DROP VIEW IF EXISTS `FavoriteGenres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `FavoriteGenres` AS SELECT 
 1 AS `genre`,
 1 AS `num_songs_streamed`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `FavoritePlaylists`
--

DROP TABLE IF EXISTS `FavoritePlaylists`;
/*!50001 DROP VIEW IF EXISTS `FavoritePlaylists`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `FavoritePlaylists` AS SELECT 
 1 AS `p_id`,
 1 AS `p_name`,
 1 AS `num_streams`,
 1 AS `hours_streamed`,
 1 AS `avg_skips_per_hour`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `FavoriteSongs`
--

DROP TABLE IF EXISTS `FavoriteSongs`;
/*!50001 DROP VIEW IF EXISTS `FavoriteSongs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `FavoriteSongs` AS SELECT 
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `genre`,
 1 AS `num_streams`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `HourlyStreamCount`
--

DROP TABLE IF EXISTS `HourlyStreamCount`;
/*!50001 DROP VIEW IF EXISTS `HourlyStreamCount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `HourlyStreamCount` AS SELECT 
 1 AS `stream_date`,
 1 AS `stream_hour`,
 1 AS `stream_count`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `MAKES` VALUES (3,'Taylor Swift',1),(1,'The Weeknd',2),(4,'Billie Eilish',4),(2,'Ed Sheeran',5),(5,'Imagine Dragons',15);
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
  `is_public` enum('public','private') NOT NULL DEFAULT 'private',
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
INSERT INTO `PLAYLIST` VALUES (1,'Road Trip','alexjohnson','public'),(2,'Study Session','amandagreen','private'),(3,'Top Hits','johndoe123','public'),(4,'Relaxing Piano','lisawong','public'),(5,'Workout Mix','andrewjones','private'),(6,'Indie Favs','emmastone','public');
/*!40000 ALTER TABLE `PLAYLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `PlaylistPerformance`
--

DROP TABLE IF EXISTS `PlaylistPerformance`;
/*!50001 DROP VIEW IF EXISTS `PlaylistPerformance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `PlaylistPerformance` AS SELECT 
 1 AS `playlist_type`,
 1 AS `total_streams`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

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
  `duration_sec` int NOT NULL DEFAULT '0' COMMENT 'Song duration in seconds',
  `year` year DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SONG`
--

LOCK TABLES `SONG` WRITE;
/*!40000 ALTER TABLE `SONG` DISABLE KEYS */;
INSERT INTO `SONG` VALUES (1,'Blinding Lights',320000,200,2020),(2,'Shape of You',350000,233,2017),(3,'Shake It Off',120000,219,2014),(4,'Bad Guy',100000,194,2019),(5,'Believer',250000,204,2017),(6,'Old Town Road',180000,157,2019),(7,'Someone You Loved',220000,182,2018),(8,'Dance Monkey',270000,209,2019),(9,'Watermelon Sugar',150000,174,2020),(10,'Havana',130000,217,2017),(11,'Perfect',160000,263,2017),(12,'Shallow',140000,215,2018),(13,'Hello',110000,295,2015),(14,'Cant Stop the Feeling',100000,217,2016),(15,'Stay With Me',90000,172,2014),(16,'Royals',80000,223,2013),(17,'Uptown Funk',100000,269,2014),(18,'Cheap Thrills',70000,196,2016),(19,'Sugar',120000,235,2015),(20,'Rolling in the Deep',100000,228,2011);
/*!40000 ALTER TABLE `SONG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STREAM_LOG`
--

DROP TABLE IF EXISTS `STREAM_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STREAM_LOG` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `song_id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `streamed_at` datetime NOT NULL,
  `stream_duration` int NOT NULL DEFAULT '0',
  `skipped` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`log_id`),
  KEY `idx_user_time` (`user_name`,`streamed_at`),
  KEY `idx_song_time` (`song_id`,`streamed_at`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `STREAM_LOG_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `USER` (`user_name`),
  CONSTRAINT `STREAM_LOG_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `SONG` (`song_id`),
  CONSTRAINT `STREAM_LOG_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `PLAYLIST` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STREAM_LOG`
--

LOCK TABLES `STREAM_LOG` WRITE;
/*!40000 ALTER TABLE `STREAM_LOG` DISABLE KEYS */;
INSERT INTO `STREAM_LOG` VALUES (1,'alexjohnson',1,1,'2025-04-20 10:15:00',200,'no'),(2,'alexjohnson',2,1,'2025-04-20 10:18:00',230,'no'),(3,'amandagreen',3,2,'2025-04-21 14:00:00',0,'yes'),(4,'andrewjones',4,2,'2025-04-22 09:30:00',194,'no'),(5,'johndoe123',5,3,'2025-04-23 18:45:00',204,'no'),(6,'lisawong',6,3,'2025-04-24 12:00:00',150,'yes'),(7,'emmastone',7,4,'2025-04-24 20:20:00',182,'no'),(8,'alexjohnson',8,4,'2025-04-25 08:00:00',209,'no'),(9,'amandagreen',9,5,'2025-04-25 09:10:00',174,'no'),(10,'andrewjones',10,5,'2025-04-25 11:25:00',200,'yes');
/*!40000 ALTER TABLE `STREAM_LOG` ENABLE KEYS */;
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
INSERT INTO `S_GENRE` VALUES (1,'synth-pop'),(2,'pop'),(3,'pop'),(4,'electropop'),(5,'rock');
/*!40000 ALTER TABLE `S_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `SystemCounts`
--

DROP TABLE IF EXISTS `SystemCounts`;
/*!50001 DROP VIEW IF EXISTS `SystemCounts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SystemCounts` AS SELECT 
 1 AS `total_users`,
 1 AS `total_artists`,
 1 AS `total_songs`,
 1 AS `total_playlists`,
 1 AS `num_stream_events`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Top100Artists`
--

DROP TABLE IF EXISTS `Top100Artists`;
/*!50001 DROP VIEW IF EXISTS `Top100Artists`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Top100Artists` AS SELECT 
 1 AS `artist_name`,
 1 AS `num_streams`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Top100Songs`
--

DROP TABLE IF EXISTS `Top100Songs`;
/*!50001 DROP VIEW IF EXISTS `Top100Songs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Top100Songs` AS SELECT 
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `num_streams`,
 1 AS `hours_streamed`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `TopArtistsRecent`
--

DROP TABLE IF EXISTS `TopArtistsRecent`;
/*!50001 DROP VIEW IF EXISTS `TopArtistsRecent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `TopArtistsRecent` AS SELECT 
 1 AS `artist_name`,
 1 AS `num_streams`,
 1 AS `hours_streamed`*/;
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
  `admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  KEY `fk_USER_1_idx` (`artist`),
  CONSTRAINT `fk_USER_1` FOREIGN KEY (`artist`) REFERENCES `ARTIST` (`a_name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `is_admin` FOREIGN KEY (`admin`) REFERENCES `ADMIN_STATISTICS` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('alexjohnson','9881757f9f006aa219628d38800e53bd3e98752e1263fae786b7b1d46d6e9ce7',NULL,NULL),('amandagreen','a6656bef55a5d326cd840ba8ecaddc59163e8f8b46db547faecea2814a2f4333',NULL,NULL),('andrewjones','cd38c46a5dee24f66f34b866e518d0be7471301d89e57d5b8778ddb837cea8fd',NULL,NULL),('chrisevans','a8558bd953326f96e022a080f319587f70a9bd4c28b778afeaad142a94607c82',NULL,NULL),('davidlee2000','6e659deaa85842cdabb5c6305fcc40033ba43772ec00d45c2a3c921741a5e377',NULL,NULL),('emilywang','cb5053319dbf12aba973adcba9dfc61bfc22718eea4bad6e06e9bd278c40053c',NULL,NULL),('emmastone','1db39f0c5888ecceeadae9b94eb36227473256e71b27296760e369466effab2e',NULL,NULL),('jasper2','scrypt:32768:8:1$YGLq2aQnEw7QN9fu$a411191ec6cbe8e824bfb666f9decf27b507a25bc88994845b08fce0dc4c12c79ccf5e5ac014e4167f2bf944c8c16ed5222b84646ea377ff98f36bdb70770e85',NULL,NULL),('jasperhopkins','scrypt:32768:8:1$Q7rT4DwfNirfj9Ow$ee8580de9b9ab351759feeeaece080add4688c869268e572cad30316a57459b7a24c0f6edea70747937097cf085bdf86a115a4a9fce81d04c11ddf3e6aae5e90',NULL,NULL),('jennychen','12dd86c71dfcaf6459c31e7be0be0033f031cc595320dcafea39f9bfc7598a17',NULL,NULL),('jessicapark','9fe3ffa1a06c1aeaaba1fea0c8c80a0e3462207cffb62c63e51bc223405a47c4',NULL,NULL),('johndoe123','5e13e6a64ccb18aabb63024c4467d3be043ab9d7bc8d3fc11cbc81cb2f2682ec',NULL,NULL),('lisawong','6cbc3871e4bfdace28d2e364836a2b77376e5f06fef3eff8c86c0358d57dfe62',NULL,NULL),('michaelscott','e16ab186aa3a0f4f9cd1b39226a6b6c33ca89a366d895bb3e089310f9fb98ad1',NULL,NULL),('mikebrown85','cdb7e829c35faf4ae68f03c4cfc051ef963718aa2ea61f782fbba5efbecd675e',NULL,NULL),('oliviawilson','6beef9fbbc343acf8d0a236551289d8f945d3061fda834e6b9cf63593f862d29',NULL,NULL),('rachelgreen','d8ceffaba3d0df342ef7ae9c902ca64c4e3b3c92a7f25fa08e4599e1bf3bbd41',NULL,NULL),('robertpark','a5745fd105bdc84104ac2faa54b93f3736e88e1ff27c06501438377ad5a638f5',NULL,NULL),('ryanreynolds','2f833dcc0294603549cd17f8d09674e208d294c2a039ba2459006441736ac1f0',NULL,NULL),('sarahsmith','f852b96c50b7f06cbe92bc9100aabc72b33dac76d1fe0872faea0856c485e69d',NULL,NULL),('sophialee','3e7667f5840aa2e9e888ced67915c7550b0552697d48106cdac44fc0d0b447e5',NULL,NULL),('tomhardy','12dcfe87482b2a329e357f09c3bd0a68e000cf8337e6fb8d1de7913334c95918',NULL,NULL);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PROFILE`
--

DROP TABLE IF EXISTS `USER_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_PROFILE` (
  `user_name` varchar(45) NOT NULL,
  `age_group` enum('18-24','25-34','35-44','45+') DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `subscription` enum('free','premium','family') DEFAULT 'free',
  `joined_date` date NOT NULL,
  PRIMARY KEY (`user_name`),
  CONSTRAINT `USER_PROFILE_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `USER` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PROFILE`
--

LOCK TABLES `USER_PROFILE` WRITE;
/*!40000 ALTER TABLE `USER_PROFILE` DISABLE KEYS */;
INSERT INTO `USER_PROFILE` VALUES ('alexjohnson','25-34','USA','premium','2020-01-15'),('amandagreen','18-24','Canada','free','2021-05-20'),('andrewjones','35-44','UK','family','2019-11-02'),('emmastone','25-34','USA','free','2023-02-14'),('johndoe123','18-24','USA','free','2022-08-10'),('lisawong','25-34','China','premium','2018-03-27');
/*!40000 ALTER TABLE `USER_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ArtistAlbumStats`
--

/*!50001 DROP VIEW IF EXISTS `ArtistAlbumStats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ArtistAlbumStats` AS select `al`.`artist` AS `artist_name`,count(distinct `al`.`al_id`) AS `album_count`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (((`ALBUM` `al` join `MAKES` `m` on((`al`.`al_id` = `m`.`al_id`))) join `SONG` `s` on((`m`.`song_id` = `s`.`song_id`))) left join `STREAM_LOG` `sl` on((`s`.`song_id` = `sl`.`song_id`))) group by `al`.`artist` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
-- Final view structure for view `ArtistSongStats`
--

/*!50001 DROP VIEW IF EXISTS `ArtistSongStats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ArtistSongStats` AS select `m`.`a_name` AS `artist_name`,`s`.`song_id` AS `song_id`,`s`.`name` AS `song_name`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed`,round((avg((`sl`.`stream_duration` / `s`.`duration_sec`)) * 100),2) AS `avg_pct_listened` from ((`STREAM_LOG` `sl` join `SONG` `s` on((`sl`.`song_id` = `s`.`song_id`))) join `MAKES` `m` on((`s`.`song_id` = `m`.`song_id`))) group by `m`.`a_name`,`s`.`song_id`,`s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FastestGrowingSong`
--

/*!50001 DROP VIEW IF EXISTS `FastestGrowingSong`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FastestGrowingSong` AS select `s`.`song_id` AS `song_id`,`s`.`name` AS `song_name`,round(sum(if((week(`sl`.`streamed_at`,1) = week(curdate(),1)),(`sl`.`stream_duration` / 3600),0)),2) AS `hours_this_week`,round(sum(if((week(`sl`.`streamed_at`,1) = (week(curdate(),1) - 1)),(`sl`.`stream_duration` / 3600),0)),2) AS `hours_last_week`,round((round(sum(if((week(`sl`.`streamed_at`,1) = week(curdate(),1)),(`sl`.`stream_duration` / 3600),0)),2) - round(sum(if((week(`sl`.`streamed_at`,1) = (week(curdate(),1) - 1)),(`sl`.`stream_duration` / 3600),0)),2)),2) AS `growth_hours` from (`STREAM_LOG` `sl` join `SONG` `s` on((`sl`.`song_id` = `s`.`song_id`))) group by `s`.`song_id` order by `growth_hours` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FavoriteGenres`
--

/*!50001 DROP VIEW IF EXISTS `FavoriteGenres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FavoriteGenres` AS select `sg`.`genre` AS `genre`,count(distinct `sl`.`song_id`) AS `num_songs_streamed`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (`S_GENRE` `sg` join `STREAM_LOG` `sl` on((`sg`.`song_id` = `sl`.`song_id`))) group by `sg`.`genre` order by `hours_streamed` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FavoritePlaylists`
--

/*!50001 DROP VIEW IF EXISTS `FavoritePlaylists`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FavoritePlaylists` AS select `p`.`p_id` AS `p_id`,`p`.`p_name` AS `p_name`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed`,round((sum((case when (`sl`.`skipped` = 'yes') then 1 else 0 end)) / (sum(`sl`.`stream_duration`) / 3600)),2) AS `avg_skips_per_hour` from (`PLAYLIST` `p` join `STREAM_LOG` `sl` on((`p`.`p_id` = `sl`.`p_id`))) group by `p`.`p_id`,`p`.`p_name` order by `hours_streamed` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FavoriteSongs`
--

/*!50001 DROP VIEW IF EXISTS `FavoriteSongs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FavoriteSongs` AS select `s`.`song_id` AS `song_id`,`s`.`name` AS `song_name`,`sg`.`genre` AS `genre`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from ((`SONG` `s` join `S_GENRE` `sg` on((`s`.`song_id` = `sg`.`song_id`))) join `STREAM_LOG` `sl` on((`s`.`song_id` = `sl`.`song_id`))) group by `s`.`song_id`,`sg`.`genre` order by `hours_streamed` desc limit 15 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HourlyStreamCount`
--

/*!50001 DROP VIEW IF EXISTS `HourlyStreamCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HourlyStreamCount` AS select cast(`STREAM_LOG`.`streamed_at` as date) AS `stream_date`,hour(`STREAM_LOG`.`streamed_at`) AS `stream_hour`,count(0) AS `stream_count` from `STREAM_LOG` group by `stream_date`,`stream_hour` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PlaylistPerformance`
--

/*!50001 DROP VIEW IF EXISTS `PlaylistPerformance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PlaylistPerformance` AS select (case when (`sl`.`p_id` is null) then 'No Playlist' when (`pl`.`is_public` = 'public') then 'Public Playlist' else 'Private Playlist' end) AS `playlist_type`,count(0) AS `total_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (`STREAM_LOG` `sl` left join `PLAYLIST` `pl` on((`sl`.`p_id` = `pl`.`p_id`))) group by `playlist_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SystemCounts`
--

/*!50001 DROP VIEW IF EXISTS `SystemCounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SystemCounts` AS select (select count(0) from `USER`) AS `total_users`,(select count(0) from `ARTIST`) AS `total_artists`,(select count(0) from `SONG`) AS `total_songs`,(select count(0) from `PLAYLIST`) AS `total_playlists`,(select count(0) from `STREAM_LOG`) AS `num_stream_events`,round(((select sum(`STREAM_LOG`.`stream_duration`) from `STREAM_LOG`) / 3600),2) AS `hours_streamed` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Top100Artists`
--

/*!50001 DROP VIEW IF EXISTS `Top100Artists`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Top100Artists` AS select `m`.`a_name` AS `artist_name`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (`MAKES` `m` join `STREAM_LOG` `sl` on((`m`.`song_id` = `sl`.`song_id`))) group by `m`.`a_name` order by `num_streams` desc limit 100 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Top100Songs`
--

/*!50001 DROP VIEW IF EXISTS `Top100Songs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Top100Songs` AS select `s`.`song_id` AS `song_id`,`s`.`name` AS `song_name`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (`SONG` `s` left join `STREAM_LOG` `sl` on((`s`.`song_id` = `sl`.`song_id`))) group by `s`.`song_id` order by `num_streams` desc limit 100 */;
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
-- Final view structure for view `TopArtistsRecent`
--

/*!50001 DROP VIEW IF EXISTS `TopArtistsRecent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TopArtistsRecent` AS select `m`.`a_name` AS `artist_name`,count(`sl`.`log_id`) AS `num_streams`,round((sum(`sl`.`stream_duration`) / 3600),2) AS `hours_streamed` from (`MAKES` `m` join `STREAM_LOG` `sl` on((`m`.`song_id` = `sl`.`song_id`))) where (`sl`.`streamed_at` >= (curdate() - interval 30 day)) group by `m`.`a_name` order by `num_streams` desc limit 100 */;
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

-- Dump completed on 2025-04-27 20:53:11
