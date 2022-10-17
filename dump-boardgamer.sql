-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: boardgamer
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Экономика','Зарабатываем деньги, развиваем экономику'),(2,'Научная фантастика','Атмосфера научной фантастики'),(3,'Строительство','Строим'),(4,'Миниатюры','Игры с миньками'),(5,'Кооператив','Игры с кооперативным режимом'),(6,'Кубики','Игры с большим количеством рандома'),(7,'Логистика','Перевозки, перемещение'),(8,'Наследие','Результат партии влияет на все последующие игры'),(9,'Фэнтези','Гномы, эльфы и прочая нечесть'),(10,'Переговоры','Игры обязательными элементами союзов и предательств'),(11,'Контроль территории','Игры на контроль территории'),(12,'Карточная','Карты - основной или даже единственный элемент'),(13,'Тайлы','Игры с выкладыванием тайлов');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_games`
--

DROP TABLE IF EXISTS `categories_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_games` (
  `game_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`game_id`,`category_id`),
  KEY `fk_categories_games_game_idx` (`game_id`),
  KEY `fk_categories_games_category_idx` (`category_id`),
  CONSTRAINT `fk_categories_games_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_categories_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_games`
--

LOCK TABLES `categories_games` WRITE;
/*!40000 ALTER TABLE `categories_games` DISABLE KEYS */;
INSERT INTO `categories_games` VALUES (1,1),(1,2),(1,3),(2,2),(2,4),(2,5),(2,6),(3,1),(3,2),(3,3),(4,1),(4,3),(4,7),(5,5),(5,7),(5,8),(6,1),(6,2),(6,6),(7,9),(7,10),(7,11),(8,1),(8,3),(8,12),(9,1),(9,3),(9,10),(10,2),(10,6),(11,1),(11,12),(12,3),(12,11),(12,13);
/*!40000 ALTER TABLE `categories_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `user_id` bigint unsigned NOT NULL,
  `game_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`game_id`),
  KEY `fk_collections_user_idx` (`user_id`),
  KEY `fk_collections_game_idx` (`game_id`),
  CONSTRAINT `fk_collections_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_collections_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (2,1),(2,5),(2,8),(2,9),(2,11),(3,2),(3,6),(3,7),(3,9),(3,12),(4,1),(4,3),(4,4),(4,5),(4,12),(5,2),(5,3),(5,5),(5,8),(5,10),(5,12),(6,5),(6,7),(6,8),(6,9),(6,10),(6,11),(7,1),(7,2),(7,5),(7,7),(7,8),(7,9),(7,10),(7,12);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `name_sub` varchar(255) DEFAULT NULL,
  `name_original` varchar(127) DEFAULT NULL,
  `playing_time_from` smallint NOT NULL,
  `playing_time_to` smallint DEFAULT NULL,
  `age` tinyint DEFAULT '0',
  `players_from` tinyint DEFAULT '1',
  `players_to` tinyint DEFAULT NULL,
  `description` text,
  `rating` tinyint unsigned DEFAULT NULL,
  `logo` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Серп',NULL,'Scythe',90,115,14,1,5,'Первое, чем удивит и порадует игроков настольная игра \"Серп\", – обилие миниатюр, фишек и карточек...',NULL,NULL),(2,'Немезида',NULL,'Nemesis',90,180,12,1,5,'Что может пойти не так на высокотехнологичном космическом корабле под управлением искусственного интеллекта?...',NULL,NULL),(3,'Покорение Марса',NULL,'Terraforming Mars',120,NULL,12,1,5,'Глобальная игра про освоение красной планеты, в которой игроки с помощью строительства \"проектов...',NULL,NULL),(4,'Брасс. Бирмингем',NULL,'Brass: Birmingham',120,180,14,2,4,'Самая известная стратегия Мартина Уолласа о создании и развитии собственной промышленной империи...',NULL,NULL),(5,'Пандемия. Наследие — Первый сезон',NULL,'Pandemic Legacy: Season 1',60,NULL,13,2,4,'Одну из болезней лечить тяжелее остальных, но к этому вы уже привыкли, вы справитесь, однако скоро наступит февраль, и вот тогда…',NULL,NULL),(6,'Кубарем по галактике',NULL,'Roll for the Galaxy',45,NULL,13,2,5,'«Кубарем по Галактике» — игра о становлении космических империй для 2—5 игрокови...',NULL,NULL),(7,'Игра Престолов (Второе издание)',NULL,'A Game of Thrones: The Board Game (Second Edition)',120,240,14,3,6,'\"Игра престолов\" – это атмосферная, оригинальная и продуманная настольная стратегия по мотивам популярного цикла романов Джорджа Мартина...',NULL,NULL),(8,'Брюгге',NULL,'Bruges',60,NULL,10,2,4,'«Кубарем по Галактике» — игра о становлении космических империй для 2—5 игрокови...',NULL,NULL),(9,'Цивилизация Сида Мейера',NULL,'Sid Meier\'s Civilization: The Board Game',120,240,13,2,4,'В настольной игре \"Цивилизация Сида Мейера\" от 2 до 4 игроков берут на себя роли великих лидеров...',NULL,NULL),(10,'Повелитель Токио',NULL,'King of Tokyo',30,NULL,8,2,6,'Многострадальный город Токио вновь подвергся нападению гигантских монстров!',NULL,NULL),(11,'7 чудес',NULL,'7 Wonders',30,NULL,10,2,7,'Эта яркая стратегическая настольная игра, необычайно динамичная для игр её класса, уже завоевала популярность во всём мире. Но мне не нравится!',NULL,NULL),(12,'Каркассон',NULL,'Carcassonne',30,45,7,2,5,'Настоящий шедевр в мире настольных игр, уже многие годы объединяющий за столами людей всех возрастов по всему миру.',NULL,NULL);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `games_table`
--

DROP TABLE IF EXISTS `games_table`;
/*!50001 DROP VIEW IF EXISTS `games_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `games_table` AS SELECT 
 1 AS `name`,
 1 AS `name_original`,
 1 AS `publisher`,
 1 AS `published_at`,
 1 AS `playing_time`,
 1 AS `age`,
 1 AS `players`,
 1 AS `description`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medias` (
  `game_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(127) NOT NULL,
  `media_type` enum('img','pdf','file') NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `fk_images_games_game_idx` (`game_id`),
  CONSTRAINT `fk_images_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` VALUES (1,'https://stonemaiergames.com/wp-content/uploads/2018/12/3d-scythe-768x767.png','img'),(2,'https://awakenrealms.com/wp-content/uploads/2019/10/NEMESIS_RULEBOOK_280x280mm_ENG.pdf','pdf'),(3,'https://www.fryxgames.se/wp-content/uploads/2014/11/TMbox.jpg','img'),(4,'https://phalanxgames.co.uk/pics/games//259-l.jpg','img'),(5,'https://images.zmangames.com/filer_public/19/65/19657c0c-5e78-4f7e-8985-49124948cad9/zm7170_combined_front_left_520px.png','img');
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Stonemaier Games','SM'),(2,'Awaken Realms',NULL),(3,'Fryxgames',NULL),(4,'Phalanx Games',NULL),(5,'Z-Man games','At Z-Man Games, we create innovative games that become modern essentials.'),(6,'RIO Grande Games',NULL),(7,'Fantasy Flight',NULL),(8,'IELLO','Франция'),(9,'GAGA games','Спб'),(10,'Hobby games','Мой выбор'),(11,'Repos Production',NULL);
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers_games`
--

DROP TABLE IF EXISTS `publishers_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers_games` (
  `game_id` bigint unsigned NOT NULL,
  `publisher_id` bigint unsigned NOT NULL,
  `published_at` year DEFAULT NULL,
  PRIMARY KEY (`game_id`,`publisher_id`),
  KEY `fk_publishers_games_game_idx` (`game_id`),
  KEY `fk_publishers_games_category_idx` (`publisher_id`),
  CONSTRAINT `fk_publishers_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_publishers_games_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers_games`
--

LOCK TABLES `publishers_games` WRITE;
/*!40000 ALTER TABLE `publishers_games` DISABLE KEYS */;
INSERT INTO `publishers_games` VALUES (1,1,2016),(2,2,2018),(2,10,2018),(3,3,2016),(4,4,2018),(5,5,2015),(6,6,2014),(7,7,2011),(8,5,2013),(9,7,2010),(10,8,2011),(11,11,2010),(12,5,2000);
/*!40000 ALTER TABLE `publishers_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_votes`
--

DROP TABLE IF EXISTS `rating_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_votes` (
  `user_id` bigint unsigned NOT NULL,
  `game_id` bigint unsigned NOT NULL,
  `vote` tinyint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`game_id`),
  KEY `fk_votes_author_idx` (`user_id`),
  KEY `fk_votes_game_idx` (`game_id`),
  CONSTRAINT `fk_votes_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_votes_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_votes`
--

LOCK TABLES `rating_votes` WRITE;
/*!40000 ALTER TABLE `rating_votes` DISABLE KEYS */;
INSERT INTO `rating_votes` VALUES (2,1,7,'2022-10-18 00:08:05'),(2,2,6,'2022-10-18 00:08:05'),(2,5,8,'2022-10-18 00:08:05'),(2,7,8,'2022-10-18 00:08:05'),(2,10,3,'2022-10-18 00:08:05'),(3,2,8,'2022-10-18 00:08:05'),(3,4,6,'2022-10-18 00:08:05'),(3,7,10,'2022-10-18 00:08:05'),(3,9,6,'2022-10-18 00:08:05'),(3,11,3,'2022-10-18 00:08:05'),(4,1,8,'2022-10-18 00:08:05'),(4,3,6,'2022-10-18 00:08:05'),(4,4,8,'2022-10-18 00:08:05'),(4,5,9,'2022-10-18 00:08:05'),(4,12,7,'2022-10-18 00:08:05'),(5,2,6,'2022-10-18 00:08:05'),(5,3,9,'2022-10-18 00:08:05'),(5,5,4,'2022-10-18 00:08:05'),(5,8,7,'2022-10-18 00:08:05'),(5,10,7,'2022-10-18 00:08:05'),(6,5,8,'2022-10-18 00:08:05'),(6,8,6,'2022-10-18 00:08:05'),(6,9,7,'2022-10-18 00:08:05'),(6,10,8,'2022-10-18 00:08:05'),(6,11,4,'2022-10-18 00:08:05'),(7,1,8,'2022-10-18 00:08:05'),(7,2,8,'2022-10-18 00:08:05'),(7,3,6,'2022-10-18 00:08:05'),(7,4,7,'2022-10-18 00:08:05'),(7,5,10,'2022-10-18 00:08:05'),(7,6,8,'2022-10-18 00:08:05'),(7,7,8,'2022-10-18 00:08:05'),(7,8,7,'2022-10-18 00:08:05'),(7,9,6,'2022-10-18 00:08:05'),(7,10,7,'2022-10-18 00:08:05'),(7,11,4,'2022-10-18 00:08:05'),(7,12,8,'2022-10-18 00:08:05');
/*!40000 ALTER TABLE `rating_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_likes`
--

DROP TABLE IF EXISTS `review_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_likes` (
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `like_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `fk_likes_users_idx` (`user_id`),
  KEY `fk_likes_reviews_idx` (`review_id`),
  CONSTRAINT `fk_likes_reviews_review` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `fk_likes_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_likes`
--

LOCK TABLES `review_likes` WRITE;
/*!40000 ALTER TABLE `review_likes` DISABLE KEYS */;
INSERT INTO `review_likes` VALUES (2,1,1),(2,3,1),(2,10,1),(3,3,1),(3,5,1),(4,2,0),(4,8,1),(5,2,0),(5,7,1),(5,9,0),(5,11,1),(6,11,1),(7,6,1),(7,9,1);
/*!40000 ALTER TABLE `review_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `game_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_user_idx` (`user_id`),
  KEY `fk_reviews_game_idx` (`game_id`),
  CONSTRAINT `fk_reviews_games_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `fk_reviews_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,5,'У меня ряд игр их, весьма играемые','2022-10-18 00:08:31','2022-10-18 00:08:31'),(2,2,8,'Все правильно сыграли','2022-10-18 00:08:31','2022-10-18 00:08:31'),(3,3,5,'Реиграбельность на уровне','2022-10-18 00:08:31','2022-10-18 00:08:31'),(4,3,11,'Играю с допом.','2022-10-18 00:08:31','2022-10-18 00:08:31'),(5,4,2,'Подскажите, где можно скачать планшет медика для печати?','2022-10-18 00:08:31','2022-10-18 00:08:31'),(6,4,4,'Хорошая игра с приятным оформлением.','2022-10-18 00:08:31','2022-10-18 00:08:31'),(7,5,1,'Взаимодействия в игре гораздо больше, чем может показаться на первый взгляд.','2022-10-18 00:08:31','2022-10-18 00:08:31'),(8,5,2,'Час назад приобрел. Оформление конечно великолепное!','2022-10-18 00:08:31','2022-10-18 00:08:31'),(9,6,7,'Я вот сравниваю к примеру с такой евро как \"Чужие рубежи\" - небо и земля игры.','2022-10-18 00:08:31','2022-10-18 00:08:31'),(10,7,2,'Жаль не с кем сыграть!','2022-10-18 00:08:31','2022-10-18 00:08:31'),(11,7,5,'Пока - мой топ 1','2022-10-18 00:08:31','2022-10-18 00:08:31'),(12,7,7,'Тоже компанию сложно собрать (','2022-10-18 00:08:31','2022-10-18 00:08:31');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(145) NOT NULL,
  `first_name` varchar(145) DEFAULT NULL,
  `last_name` varchar(145) DEFAULT NULL,
  `email` varchar(145) NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `birthday` date NOT NULL,
  `user_status` varchar(31) DEFAULT NULL,
  `city` varchar(127) DEFAULT NULL,
  `country` varchar(127) DEFAULT NULL,
  `gender` enum('w','m','x') DEFAULT 'x',
  `logo` varchar(31) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  UNIQUE KEY `phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','Admin',NULL,'admin@yandex.ru',NULL,NULL,'1984-08-16',NULL,NULL,NULL,'m',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(2,'kate','Катя',NULL,'bot_2@yandex.ru',NULL,NULL,'2000-01-02',NULL,'NY',NULL,'w',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(3,'dim4ik','Димон',NULL,'bot_3@yandex.ru',NULL,NULL,'1984-04-26',NULL,'Екатеринбург',NULL,'m',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(4,'malishka','Дарья',NULL,'bot_4@yandex.ru',NULL,NULL,'1999-07-15',NULL,'Тула',NULL,'w',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(5,'user','Пользователь',NULL,'bot_5@yandex.ru',NULL,NULL,'1990-03-08',NULL,'NY',NULL,'x',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(6,'player','Игрок',NULL,'bot_6@yandex.ru',NULL,NULL,'1987-07-19',NULL,'NY',NULL,'x',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55'),(7,'visor','Артем',NULL,'visor517@yandex.ru',NULL,NULL,'1984-08-16',NULL,'Москва',NULL,'m',NULL,'2022-10-18 00:07:55','2022-10-18 00:07:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'boardgamer'
--

--
-- Final view structure for view `games_table`
--

/*!50001 DROP VIEW IF EXISTS `games_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `games_table` AS select `games`.`name` AS `name`,`games`.`name_original` AS `name_original`,(select `publishers`.`name` from `publishers` where (`publishers`.`id` = `pg`.`publisher_id`)) AS `publisher`,`pg`.`published_at` AS `published_at`,if((`games`.`playing_time_to` is null),concat('~',`games`.`playing_time_from`,' минут'),concat(`games`.`playing_time_from`,' - ',`games`.`playing_time_to`,' минут')) AS `playing_time`,concat(`games`.`age`,'+') AS `age`,concat(`games`.`players_from`,'-',`games`.`players_to`) AS `players`,`games`.`description` AS `description`,(`games`.`rating` / 10) AS `rating` from (`games` join `publishers_games` `pg` on((`games`.`id` = `pg`.`game_id`))) */;
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

-- Dump completed on 2022-10-18  0:35:01
