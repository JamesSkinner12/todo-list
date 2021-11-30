-- MySQL dump 10.13  Distrib 8.0.26, for macos11.4 (arm64)
--
-- Host: localhost    Database: facs_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2021_11_30_201317_create_tasks_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Task 534oi2034','I must be building out the controllers',1,NULL,'2021-12-13 16:00:00','2021-12-01 02:30:28','2021-12-01 04:09:14',NULL),(2,'Task 534oi2034','I must be building out the controllers',3,'2021-12-05 16:00:00','2021-12-03 16:00:00','2021-12-01 02:30:32','2021-12-01 04:08:37',NULL),(3,'Task 3','I must be building out the controllers',5,NULL,'2021-12-03 16:00:00','2021-12-01 02:30:37','2021-12-01 03:15:55',NULL),(4,'Task 4','I must be building out the controllers',4,NULL,'2021-12-03 16:00:00','2021-12-01 02:30:39','2021-12-01 02:36:33',NULL),(5,'Task 5','I must be building out the controllers',2,NULL,'2021-12-03 16:00:00','2021-12-01 02:30:41','2021-12-01 03:26:23',NULL),(6,'Task 5','I must be building out the controllers',6,NULL,'2021-12-03 16:00:00','2021-12-01 03:14:11','2021-12-01 03:15:55',NULL),(7,'Task 5','I must be building out the controllers',8,NULL,'2021-12-03 16:00:00','2021-12-01 03:14:26','2021-12-01 03:16:19',NULL),(8,'Task 5','I must be building out the controllers',8,NULL,'2021-12-03 16:00:00','2021-12-01 03:15:08','2021-12-01 04:09:54',NULL),(9,'asdofij','asodfj',9,NULL,'2021-12-04 02:57:00','2021-12-01 03:56:19','2021-12-01 04:09:26','2021-12-01 04:09:26'),(10,'My New Task','asdfoijasdfo',9,NULL,'2021-12-05 02:57:00','2021-12-01 04:09:48','2021-12-01 04:10:24',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 18:24:54
