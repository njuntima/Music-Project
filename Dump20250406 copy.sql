-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
-- Host: 127.0.0.1    Database: CS4604_Crappy_Spotify_Clone
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1
USE CS4604_Crappy_Spotify_Clone;
UNLOCK TABLES;

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

-- ------------------------------------------------------
-- Table structure for table `ALBUM`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `ALBUM`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALBUM` (
    `al_id` INT NOT NULL AUTO_INCREMENT,
    `al_title` VARCHAR(45) DEFAULT NULL,
    `year` YEAR DEFAULT NULL,
    `artist` VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (`al_id`),
    KEY `fk_ALBUM_1_idx` (`artist`),
    CONSTRAINT `fk_ALBUM_1` FOREIGN KEY (`artist`)
        REFERENCES `ARTIST` (`a_name`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `ALBUM`
LOCK TABLES `ALBUM` WRITE;
/*!40000 ALTER TABLE `ALBUM` DISABLE KEYS */;
INSERT INTO `ALBUM` VALUES
  (1,'1989',2014,'Taylor Swift'),
  (2,'After Hours',2020,'The Weeknd'),
  (3,'DAMN.',2017,'Kendrick Lamar'),
  (4,'When We All Fall Asleep, Where Do We Go?',2019,'Billie Eilish'),
  (5,'÷ (Divide)',2017,'Ed Sheeran'),
  (6,'Sweetener',2018,'Ariana Grande'),
  (7,'Views',2016,'Drake'),
  (8,'Beerbongs & Bentleys',2018,'Post Malone'),
  (9,'Mylo Xyloto',2011,'Coldplay'),
  (10,'Future Nostalgia',2020,'Dua Lipa'),
  (11,'24K Magic',2016,'Bruno Mars'),
  (12,'Joanne',2016,'Lady Gaga'),
  (13,'OK Computer',1997,'Radiohead'),
  (14,'AM',2013,'Arctic Monkeys'),
  (15,'Night Visions',2012,'Imagine Dragons'),
  (16,'21',2011,'Adele'),
  (17,'Purpose',2015,'Justin Bieber'),
  (18,'Planet Her',2021,'Doja Cat'),
  (19,'Maroon 5',2012,'Maroon 5'),
  (20,'Too Weird to Live, Too Rare to Die!',2013,'Panic! At The Disco'),
  (21,'Red',2012,'Taylor Swift');
/*!40000 ALTER TABLE `ALBUM` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `AL_GENRE`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `AL_GENRE`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AL_GENRE` (
    `al_id` INT NOT NULL,
    `genre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`al_id` , `genre`),
    CONSTRAINT `fk_AL_GENRE_1` FOREIGN KEY (`al_id`)
        REFERENCES `ALBUM` (`al_id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `AL_GENRE` WRITE;
/*!40000 ALTER TABLE `AL_GENRE` DISABLE KEYS */;
INSERT INTO `AL_GENRE` VALUES
  (1,'pop'),(2,'r&b'),(3,'hip-hop'),(4,'electropop'),(5,'pop');
/*!40000 ALTER TABLE `AL_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `ARTIST`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `ARTIST`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARTIST` (
    `a_name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`a_name`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ARTIST` WRITE;
/*!40000 ALTER TABLE `ARTIST` DISABLE KEYS */;
INSERT INTO `ARTIST` VALUES
  ('Adele'),('Arctic Monkeys'),('Ariana Grande'),('Billie Eilish'),
  ('Bruno Mars'),('Coldplay'),('Doja Cat'),('Drake'),
  ('Dua Lipa'),('Ed Sheeran'),('Imagine Dragons'),('Justin Bieber'),
  ('Kendrick Lamar'),('Lady Gaga'),('Maroon 5'),
  ('Panic! At The Disco'),('Post Malone'),('Radiohead'),
  ('Taylor Swift'),('The Weeknd');
/*!40000 ALTER TABLE `ARTIST` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `A_GENRE`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `A_GENRE`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `A_GENRE` (
    `a_name` VARCHAR(45) NOT NULL,
    `genre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`a_name` , `genre`),
    CONSTRAINT `fk_A_GENRE_1` FOREIGN KEY (`a_name`)
        REFERENCES `ARTIST` (`a_name`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `A_GENRE` WRITE;
/*!40000 ALTER TABLE `A_GENRE` DISABLE KEYS */;
INSERT INTO `A_GENRE` VALUES
  ('Taylor Swift','pop'),('The Weeknd','r&b'),('Kendrick Lamar','hip-hop'),('Billie Eilish','electropop'),('Ed Sheeran','pop');
/*!40000 ALTER TABLE `A_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `COMPOSED_OF`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `COMPOSED_OF`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSED_OF` (
    `song_id` INT NOT NULL,
    `p_id` INT NOT NULL,
    PRIMARY KEY (`song_id` , `p_id`),
    KEY `fk_COMPOSED_OF_1_idx` (`p_id`),
    CONSTRAINT `fk_COMPOSED_OF_1` FOREIGN KEY (`p_id`)
        REFERENCES `PLAYLIST` (`p_id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_COMPOSED_OF_2` FOREIGN KEY (`song_id`)
        REFERENCES `SONG` (`song_id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `COMPOSED_OF` WRITE;
/*!40000 ALTER TABLE `COMPOSED_OF` DISABLE KEYS */;
INSERT INTO `COMPOSED_OF` VALUES
  (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,6);
/*!40000 ALTER TABLE `COMPOSED_OF` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `MAKES`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `MAKES`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAKES` (
    `song_id` INT NOT NULL,
    `a_name` VARCHAR(45) NOT NULL,
    `al_id` INT DEFAULT NULL,
    PRIMARY KEY (`song_id` , `a_name`),
    KEY `fk_MAKES_2_idx` (`al_id`),
    CONSTRAINT `fk_MAKES_1` FOREIGN KEY (`song_id`)
        REFERENCES `SONG` (`song_id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_MAKES_2` FOREIGN KEY (`al_id`)
        REFERENCES `ALBUM` (`al_id`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `MAKES` WRITE;
/*!40000 ALTER TABLE `MAKES` DISABLE KEYS */;
INSERT INTO `MAKES` (`song_id`,`a_name`,`al_id`) VALUES
  (1,'The Weeknd',2),
  (2,'Ed Sheeran',5),
  (3,'Taylor Swift',1),
  (4,'Billie Eilish',4),
  (5,'Imagine Dragons',15),
  (21,'Taylor Swift',21);
/*!40000 ALTER TABLE `MAKES` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `PLAYLIST`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `PLAYLIST`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYLIST` (
    `p_id` INT NOT NULL AUTO_INCREMENT,
    `p_name` VARCHAR(45) DEFAULT NULL,
    `creator` VARCHAR(45) DEFAULT NULL,
    `is_public` ENUM('public', 'private') NOT NULL DEFAULT 'private',
    PRIMARY KEY (`p_id`),
    KEY `fk_PLAYLIST_1_idx` (`creator`),
    CONSTRAINT `fk_PLAYLIST_1` FOREIGN KEY (`creator`)
        REFERENCES `USER` (`user_name`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `PLAYLIST` WRITE;
/*!40000 ALTER TABLE `PLAYLIST` DISABLE KEYS */;
INSERT INTO `PLAYLIST` (`p_id`,`p_name`,`creator`,`is_public`) VALUES
  (1,'Road Trip','alexjohnson','public'),
  (2,'Study Session','amandagreen','private'),
  (3,'Top Hits','johndoe123','public'),
  (4,'Relaxing Piano','lisawong','public'),
  (5,'Workout Mix','andrewjones','private'),
  (6,'Indie Favs','emmastone','public');
/*!40000 ALTER TABLE `PLAYLIST` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `SONG`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `SONG`;
CREATE TABLE `SONG` (
    `song_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) DEFAULT NULL,
    `duration_sec` INT NOT NULL DEFAULT 0 COMMENT 'Song duration in seconds',
    `year` YEAR DEFAULT NULL,
    PRIMARY KEY (`song_id`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SONG` WRITE;
/*!40000 ALTER TABLE `SONG` DISABLE KEYS */;
INSERT INTO `SONG` VALUES
 (1,'Blinding Lights',200,2020),
 (2,'Shape of You',233,2017),
 (3,'Shake It Off',219,2014),
 (4,'Bad Guy',194,2019),
 (5,'Believer',204,2017),
 (6,'Old Town Road',157,2019),
 (7,'Someone You Loved',182,2018),
 (8,'Dance Monkey',209,2019),
 (9,'Watermelon Sugar',174,2020),
 (10,'Havana',217,2017),
 (11,'Perfect',263,2017),
 (12,'Shallow',215,2018),
 (13,'Hello',295,2015),
 (14,'Cant Stop the Feeling',217,2016),
 (15,'Stay With Me',172,2014),
 (16,'Royals',223,2013),
 (17,'Uptown Funk',269,2014),
 (18,'Cheap Thrills',196,2016),
 (19,'Sugar',235,2015),
 (20,'Rolling in the Deep',228,2011),
 (21,'We Are Never Ever Getting Back Together',192,2012);
/*!40000 ALTER TABLE `SONG` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `S_GENRE`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `S_GENRE`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `S_GENRE` (
    `song_id` INT NOT NULL,
    `genre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`song_id` , `genre`),
    CONSTRAINT `fk_S_GENRE_1` FOREIGN KEY (`song_id`)
        REFERENCES `SONG` (`song_id`)
        ON DELETE CASCADE ON UPDATE CASCADE
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `S_GENRE` WRITE;
/*!40000 ALTER TABLE `S_GENRE` DISABLE KEYS */;
INSERT INTO `S_GENRE` VALUES
  (1,'synth-pop'),(2,'pop'),(3,'pop'),(4,'electropop'),(5,'rock');
/*!40000 ALTER TABLE `S_GENRE` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `STREAM_LOG`
-- ------------------------------------------------------
DROP TABLE IF EXISTS `STREAM_LOG`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `STREAM_LOG` (
    `log_id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `user_name` VARCHAR(45) NOT NULL,
    `song_id` INT NOT NULL,
    `p_id` INT NULL,
    `streamed_at` DATETIME NOT NULL,
    `stream_duration` INT NOT NULL DEFAULT 0,
    `skipped` ENUM('yes', 'no') NOT NULL DEFAULT 'no',
    INDEX `idx_user_time` (`user_name` , `streamed_at`),
    INDEX `idx_song_time` (`song_id` , `streamed_at`),
    FOREIGN KEY (`user_name`)
        REFERENCES `USER` (`user_name`),
    FOREIGN KEY (`song_id`)
        REFERENCES `SONG` (`song_id`),
    FOREIGN KEY (`p_id`)
        REFERENCES `PLAYLIST` (`p_id`)
)  ENGINE=INNODB;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `STREAM_LOG` WRITE;
/*!40000 ALTER TABLE `STREAM_LOG` DISABLE KEYS */;
INSERT INTO `STREAM_LOG` (`user_name`,`song_id`,`p_id`,`streamed_at`,`stream_duration`,`skipped`) VALUES
  ('alexjohnson',1,1,'2025-04-20 10:15:00',200,'no'),
  ('alexjohnson',2,1,'2025-04-20 10:18:00',230,'no'),
  ('amandagreen',3,2,'2025-04-21 14:00:00',0,'yes'),
  ('andrewjones',4,2,'2025-04-22 09:30:00',194,'no'),
  ('johndoe123',5,3,'2025-04-23 18:45:00',204,'no'),
  ('lisawong',6,3,'2025-04-24 12:00:00',150,'yes'),
  ('emmastone',7,4,'2025-04-24 20:20:00',182,'no'),
  ('alexjohnson',8,4,'2025-04-25 08:00:00',209,'no'),
  ('amandagreen',9,5,'2025-04-25 09:10:00',174,'no'),
  ('andrewjones',10,5,'2025-04-25 11:25:00',200,'yes'),
  ('jessicapark', 3, 2, '2025-04-26 13:05:00', 219, 'no'),
  ('jessicapark', 3, 2, '2025-04-28 13:05:00', 219, 'no'),
  ('jessicapark', 3, 2, '2025-04-28 13:10:00', 219, 'no'),
  ('jessicapark', 7, 4, '2025-04-26 13:09:00',  50, 'yes'),
  ('chrisevans',   4, 2, '2025-04-26 14:22:00', 194, 'no'),
  ('chrisevans',   1, 1, '2025-04-26 15:00:00', 100, 'yes'),
  ('davidlee2000', 5, 3, '2025-04-26 16:45:00',   0, 'yes'),
  ('davidlee2000', 2, 1, '2025-04-27 09:15:00', 233, 'no'),
  ('sarahsmith',   8, 4, '2025-04-27 10:30:00', 209, 'no'),
  ('sarahsmith',   9, 5, '2025-04-27 10:34:30', 174, 'no'),
  ('mikebrown85', 10, 5, '2025-04-27 11:10:00', 200, 'yes'),
  ('mikebrown85', 11, 6, '2025-04-27 11:15:00', 263, 'no'),
  ('oliviawilson',12, 6, '2025-04-27 12:00:00', 215, 'no'),
  ('oliviawilson',13, 6, '2025-04-27 12:10:00', 295, 'no'),
  ('ryanreynolds',14, 1, '2025-04-27 12:30:00', 217, 'no'),
  ('ryanreynolds',15, 2, '2025-04-27 12:35:00', 172, 'no'),
  ('robertpark',  16, 3, '2025-04-27 13:00:00', 223, 'no'),
  ('robertpark',  17, 3, '2025-04-27 13:05:00', 100, 'yes'),
  ('rachelgreen', 18, NULL, '2025-04-27 14:11:00', 196, 'no'),
  ('rachelgreen', 19, NULL, '2025-04-27 14:15:00', 235, 'no'),
  ('ryanreynolds',20, NULL, '2025-04-27 15:00:00', 228, 'no'),
  ('sophialee',   1, NULL, '2025-04-27 15:05:00',  50, 'yes'),
  ('sophialee',   21, NULL, '2025-04-27 15:10:00',  192, 'no');
/*!40000 ALTER TABLE `STREAM_LOG` ENABLE KEYS */;
UNLOCK TABLES;

-- ------------------------------------------------------
-- Table structure for table `USER`
-- ------------------------------------------------------
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

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES
('alexjohnson','9881757f9f006aa219628d38800e53bd3e98752e1263fae786b7b1d46d6e9ce7',NULL ,NULL),
('amandagreen','a6656bef55a5d326cd840ba8ecaddc59163e8f8b46db547faecea2814a2f4333',NULL ,NULL),
('andrewjones','cd38c46a5dee24f66f34b866e518d0be7471301d89e57d5b8778ddb837cea8fd',NULL ,NULL),
('chrisevans','a8558bd953326f96e022a080f319587f70a9bd4c28b778afeaad142a94607c82',NULL ,NULL),
('davidlee2000','6e659deaa85842cdabb5c6305fcc40033ba43772ec00d45c2a3c921741a5e377',NULL ,NULL),
('emilywang','cb5053319dbf12aba973adcba9dfc61bfc22718eea4bad6e06e9bd278c40053c',NULL ,NULL),
('emmastone','1db39f0c5888ecceeadae9b94eb36227473256e71b27296760e369466effab2e',NULL ,NULL),
('jennychen','12dd86c71dfcaf6459c31e7be0be0033f031cc595320dcafea39f9bfc7598a17',NULL ,NULL),
('jessicapark','9fe3ffa1a06c1aeaaba1fea0c8c80a0e3462207cffb62c63e51bc223405a47c4',NULL ,NULL),
('johndoe123','5e13e6a64ccb18aabb63024c4467d3be043ab9d7bc8d3fc11cbc81cb2f2682ec',NULL ,NULL),
('lisawong','6cbc3871e4bfdace28d2e364836a2b77376e5f06fef3eff8c86c0358d57dfe62',NULL ,NULL),
('michaelscott','e16ab186aa3a0f4f9cd1b39226a6b6c33ca89a366d895bb3e089310f9fb98ad1',NULL ,NULL),
('mikebrown85','cdb7e829c35faf4ae68f03c4cfc051ef963718aa2ea61f782fbba5efbecd675e',NULL ,NULL),  
('oliviawilson','6beef9fbbc343acf8d0a236551289d8f945d3061fda834e6b9cf63593f862d29',NULL ,NULL),
('rachelgreen','d8ceffaba3d0df342ef7ae9c902ca64c4e3b3c92a7f25fa08e4599e1bf3bbd41',NULL ,NULL),
('robertpark','a5745fd105bdc84104ac2faa54b93f3736e88e1ff27c06501438377ad5a638f5',NULL ,NULL),
('ryanreynolds','2f833dcc0294603549cd17f8d09674e208d294c2a039ba2459006441736ac1f0',NULL ,NULL),
('sarahsmith','f852b96c50b7f06cbe92bc9100aabc72b33dac76d1fe0872faea0856c485e69d',NULL ,NULL),
('sophialee','3e7667f5840aa2e9e888ced67915c7550b0552697d48106cdac44fc0d0b447e5',NULL ,NULL),
('tomhardy','12dcfe87482b2a329e357f09c3bd0a68e000cf8337e6fb8d1de7913334c95918',NULL ,NULL),
('Adele', '714a6363158c9ff2e9e429a5e21ff94a0c1e7f6a44770aa9dbfd84f5a9767af9','Adele', NULL),
('Arctic Monkeys', 'c12283a7b86089b4eac735d4a5519cbcd1e4704c028349ed4c84d00449fb2aee','Arctic Monkeys', NULL),
('Ariana Grande', '77fc678b730e6ba92b68583a8583753354f25b1c0f6a94de0e00b08eae08c940','Ariana Grande', NULL),
('Billie Eilish', 'dab0c8064511d5b8de86a09daa1bc0ca23d33f4a3f654fed7716a10596a0c180','Billie Eilish', NULL),
('Bruno Mars', '3118143fe6552de4d88032913cf1e10c2a3392d68f866380ef4bfd9d77c7ddec','Bruno Mars', NULL),
('Coldplay', '373f69aaf47bbca158e8db69b21f0f77e9b38122e86f0ece746acaba326dd389','Coldplay', NULL),
('Doja Cat', 'de73537177f534cecfeab2f3413299c4fe3bc115cc875bd67a6a269741e0d7af','Doja Cat', NULL),
('Drake', '7cc078f7d75d9eedcf5d12ac4944010dd16d437a491cbd7e3064ba081c1ffe50','Drake', NULL),
('Dua Lipa', '3d9a0a8e56130be76896f6aa0b579e139f813857e2c2915d37e88154055d708e','Dua Lipa', NULL),
('Ed Sheeran', '73427dc4cfc8526aee6744e2cc9e51c9436457076f70151b906cc850dbd658c4','Ed Sheeran', NULL),
('Imagine Dragons', 'ad6f22469349044a2edf620e1d7e4d4b4fdd1158a330ee827ea87e90e6f4d54e','Imagine Dragons', NULL),
('Justin Bieber', '1fb67dbcb2d1e07aaa0ba9988059dc662cdffe190fa9f4fc4636fe9af847a5fe','Justin Bieber', NULL),
('Kendrick Lamar', '213ff78d7cf835f9e51883981e435715d1ad1292fdc06beb63260b548fce881d','Kendrick Lamar', NULL),
('Lady Gaga', '142708941609843c070a64bc282122a7095037b063a85bd11cb0c2c5c9dbcb38','Lady Gaga', NULL),
('Maroon 5', '20a0c99df804111db78ac038fab14d83e7816107c76fa4ba288b873beaa62419','Maroon 5', NULL),
('Panic! At The Disco','360ab0a81d9550b26ce7066e33d6edbcd4171ec38ed1703ca7cfc368959502ef','Panic! At The Disco', NULL),
('Post Malone', '6077a49475b62ade0da7b8055baf3c80b67c621acf4d7230a6be3c7a739015cd','Post Malone', NULL),
('Radiohead', 'b4eba6a912d0e126156e29b42f4885b889f26330b474a3551224fe09cf5e5a13','Radiohead', NULL),
('The Weeknd', '0b06790c09614118dc46e635d7adf0888cbe5bc1d2affa9265d11d2eeca222a3','The Weeknd', NULL),
('Taylor Swift', 'scrypt:32768:8:1$aHbN9odVlaU52Ylk$8ae5e825165de035f77a8d438a1fc5194f97ac5b038d5a2b9065994bbdfff2386f103c722e78ac372478ac2627962ceb53116e5ff6041192248b79192f5b71f0','Taylor Swift', NULL),
('admin', 'scrypt:32768:8:1$k1iuFf5pNVVOU6fW$4acf59786aaa89f3da0f2ab5fb95e022376c1ac8abc76e004e35754fa07fe7e4e2efbaf5a4cea49cbb708895e820a7e88e8b097ee10cc49b79e88b7a17f66b32',NULL, 'admin'),
('user', 'scrypt:32768:8:1$EGUg0WCTR1JuzRZR$884943890b4819b5122a3b8dafbe951d3cc8a1db84309e0b9f523538e6f234c7deb42c28e8a406c0ad8453130fd2c3dfec737f7d7154564be07c79f8b290755b', NULL, NULL);

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;



-- =======================================================
-- 1. Admin Metrics
-- =======================================================

-- SystemCounts: total users, artists, songs, playlists, num stream events, hours streamed
DROP VIEW IF EXISTS SystemCounts;
CREATE VIEW SystemCounts AS
    SELECT 
        (SELECT 
                COUNT(*)
            FROM
                `USER`) AS total_users,
        (SELECT 
                COUNT(*)
            FROM
                ARTIST) AS total_artists,
        (SELECT 
                COUNT(*)
            FROM
                SONG) AS total_songs,
        (SELECT 
                COUNT(*)
            FROM
                PLAYLIST) AS total_playlists,
        (SELECT 
                COUNT(*)
            FROM
                STREAM_LOG) AS num_stream_events,
        ROUND((SELECT 
                        SUM(stream_duration)
                    FROM
                        STREAM_LOG) / 3600,
                2) AS hours_streamed;

-- PlaylistPerformance: performance by playlist type
DROP VIEW IF EXISTS PlaylistPerformance;
CREATE VIEW PlaylistPerformance AS
    SELECT 
        CASE
            WHEN sl.p_id IS NULL THEN 'No Playlist'
            WHEN pl.is_public = 'public' THEN 'Public Playlist'
            ELSE 'Private Playlist'
        END AS playlist_type,
        COUNT(*) AS total_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        STREAM_LOG sl
            LEFT JOIN
        PLAYLIST pl ON sl.p_id = pl.p_id
    GROUP BY playlist_type;

-- HourlyStreamCount: number of streams by date and hour
DROP VIEW IF EXISTS HourlyStreamCount;
CREATE VIEW HourlyStreamCount AS
    SELECT 
        DATE(streamed_at) AS stream_date,
        HOUR(streamed_at) AS stream_hour,
        COUNT(*) AS stream_count
    FROM
        STREAM_LOG
    GROUP BY stream_date , stream_hour;

-- =======================================================
-- 2. Artist Metrics
-- =======================================================

-- ArtistSongStats: all songs per artist with key metrics
DROP VIEW IF EXISTS ArtistSongStats;
CREATE VIEW ArtistSongStats AS
    SELECT 
        m.a_name AS artist_name,
        s.song_id,
        s.name AS song_name,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed,
        ROUND(AVG(sl.stream_duration / s.duration_sec) * 100,
                2) AS avg_pct_listened
    FROM
        STREAM_LOG sl
            JOIN
        SONG s ON sl.song_id = s.song_id
            JOIN
        MAKES m ON s.song_id = m.song_id
    GROUP BY m.a_name , s.song_id , s.name;

-- ArtistAlbumStats: album count, num streams, hours streamed per artist
DROP VIEW IF EXISTS ArtistAlbumStats;
CREATE VIEW ArtistAlbumStats AS
    SELECT 
        al.artist AS artist_name,
        COUNT(DISTINCT al.al_id) AS album_count,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        ALBUM al
            JOIN
        MAKES m ON al.al_id = m.al_id
            JOIN
        SONG s ON m.song_id = s.song_id
            LEFT JOIN
        STREAM_LOG sl ON s.song_id = sl.song_id
    GROUP BY al.artist;

-- =======================================================
-- 3. User Metrics
-- =======================================================

-- FavoritePlaylists: top 5 playlists by hours streamed
DROP VIEW IF EXISTS FavoritePlaylists;
CREATE VIEW FavoritePlaylists AS
    SELECT 
        p.p_id,
        p.p_name,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed,
        ROUND(SUM(CASE
                    WHEN sl.skipped = 'yes' THEN 1
                    ELSE 0
                END) / (SUM(sl.stream_duration) / 3600),
                2) AS avg_skips_per_hour
    FROM
        PLAYLIST p
            JOIN
        STREAM_LOG sl ON p.p_id = sl.p_id
    GROUP BY p.p_id , p.p_name
    ORDER BY hours_streamed DESC
    LIMIT 5;

-- FavoriteSongs: top 15 songs by hours streamed with genre
DROP VIEW IF EXISTS FavoriteSongs;
CREATE VIEW FavoriteSongs AS
    SELECT 
        s.song_id,
        s.name AS song_name,
        sg.genre AS genre,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        SONG s
            JOIN
        S_GENRE sg ON s.song_id = sg.song_id
            JOIN
        STREAM_LOG sl ON s.song_id = sl.song_id
    GROUP BY s.song_id , sg.genre
    ORDER BY hours_streamed DESC
    LIMIT 15;

-- FavoriteGenres: top 3 genres by hours streamed
DROP VIEW IF EXISTS FavoriteGenres;
CREATE VIEW FavoriteGenres AS
    SELECT 
        sg.genre,
        COUNT(DISTINCT sl.song_id) AS num_songs_streamed,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        S_GENRE sg
            JOIN
        STREAM_LOG sl ON sg.song_id = sl.song_id
    GROUP BY sg.genre
    ORDER BY hours_streamed DESC
    LIMIT 3;


-- =======================================================
-- 4. Global Views
-- =======================================================

DROP VIEW IF EXISTS AllSongsByStreamHours;
CREATE VIEW AllSongsByStreamHours AS
SELECT
  s.song_id,
  s.name             AS song_name,
  m.a_name           AS artist_name,
  al.al_title        AS album_title,
  sg.genre           AS genre,
  ROUND(SUM(sl.stream_duration)/3600,2) AS hours_streamed
FROM SONG s
LEFT JOIN MAKES m ON s.song_id = m.song_id             -- song↔artist, album foreign key :contentReference[oaicite:0]{index=0}&#8203;:contentReference[oaicite:1]{index=1}
LEFT JOIN ALBUM al ON m.al_id = al.al_id                -- optional album link
LEFT JOIN S_GENRE sg ON s.song_id = sg.song_id          -- song↔genre :contentReference[oaicite:2]{index=2}&#8203;:contentReference[oaicite:3]{index=3}
LEFT JOIN STREAM_LOG sl ON s.song_id = sl.song_id       -- accumulate duration
GROUP BY
  s.song_id, s.name, m.a_name, al.al_title, sg.genre
ORDER BY hours_streamed DESC;

-- Top100Songs: global top 100 by streams
DROP VIEW IF EXISTS Top100Songs;
CREATE VIEW Top100Songs AS
    SELECT 
        s.song_id,
        s.name AS song_name,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        SONG s
            LEFT JOIN
        STREAM_LOG sl ON s.song_id = sl.song_id
    GROUP BY s.song_id
    ORDER BY hours_streamed DESC
    LIMIT 100;

-- Top100Artists: global top 100 artists
DROP VIEW IF EXISTS Top100Artists;
CREATE VIEW Top100Artists AS
    SELECT 
        m.a_name AS artist_name,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        MAKES m
            JOIN
        STREAM_LOG sl ON m.song_id = sl.song_id
    GROUP BY m.a_name
    ORDER BY hours_streamed DESC
    LIMIT 100;

-- TopSongsRecent: reuse earlier

-- TopArtistsRecent: top 100 artists in past month
DROP VIEW IF EXISTS TopArtistsRecent;
CREATE VIEW TopArtistsRecent AS
    SELECT 
        m.a_name AS artist_name,
        COUNT(sl.log_id) AS num_streams,
        ROUND(SUM(sl.stream_duration) / 3600, 2) AS hours_streamed
    FROM
        MAKES m
            JOIN
        STREAM_LOG sl ON m.song_id = sl.song_id
    WHERE
        sl.streamed_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    GROUP BY m.a_name
    ORDER BY hours_streamed DESC
    LIMIT 100;


-- =======================================================
-- Helper Views
-- =======================================================

DROP VIEW IF EXISTS WeeklySummary;
CREATE VIEW WeeklySummary AS
    SELECT 
        sl.song_id AS song_id,
        s.name AS song_name,
        m.a_name AS artist_id,
        m.a_name AS artist_name,
        YEARWEEK(sl.streamed_at, 1) AS yearweek,
        COUNT(*) AS stream_count,
        SUM(sl.stream_duration) / 3600 AS stream_duration_hr,
        ROUND(SUM(CASE
                    WHEN sl.skipped = 'yes' THEN 1
                    ELSE 0
                END) / COUNT(*) * 100,
                2) AS avg_pct_skipped
    FROM
        STREAM_LOG sl
            JOIN
        MAKES m ON sl.song_id = m.song_id
            JOIN
        SONG s ON sl.song_id = s.song_id
    GROUP BY sl.song_id , s.name , m.a_name , YEARWEEK(sl.streamed_at, 1);


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;