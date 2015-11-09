-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.13 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for paminili
CREATE DATABASE IF NOT EXISTS `paminili` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `paminili`;


-- Dumping structure for table paminili.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '0',
  `permission_category` int(11) NOT NULL DEFAULT '0',
  `url` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `permission_category` (`permission_category`),
  CONSTRAINT `permission_category` FOREIGN KEY (`permission_category`) REFERENCES `permission_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.permission: ~14 rows (approximately)
DELETE FROM `permission`;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` (`id`, `name`, `permission_category`, `url`) VALUES
	(1, 'home', 1, 'http://localhost/paminili.org/'),
	(2, 'statistics', 2, 'http://localhost/paminili.org/main/statistics'),
	(4, 'home', 1, 'http://localhost/paminili.org/main/home'),
	(5, 'home', 1, 'http://localhost/paminili.org/main/home'),
	(7, 'questions', 3, 'http://localhost/paminili.org/main/questions'),
	(9, 'loadBestRatedPoliceStations', 2, 'http://localhost/paminili.org//main/loadBestRatedPoliceStations'),
	(10, 'loadWorstRatedPoliceStations', 2, 'http://localhost/paminili.org//main/loadWorstRatedPoliceStations'),
	(11, 'loadProblemTypesGraph', 2, 'http://localhost/paminili.org//main/loadProblemTypesGraph'),
	(12, 'loadHighestRapeComplains', 2, 'http://localhost/paminili.org//main/loadHighestRapeComplains'),
	(13, 'loadHighestChildAbuseComplains', 2, 'http://localhost/paminili.org//main/loadHighestChildAbuseComplains'),
	(14, 'loadHighestDomesticViolenceComplains', 2, 'http://localhost/paminili.org//main/loadHighestDomesticViolenceComplains'),
	(15, 'loadHighestTrafficOffenceComplains', 2, 'http://localhost/paminili.org//main/loadHighestTrafficOffenceComplains'),
	(16, 'loadHighestTheftComplains', 2, 'http://localhost/paminili.org//main/loadHighestTheftComplains'),
	(17, 'loadHighestOtherComplains', 2, 'http://localhost/paminili.org//main/loadHighestOtherComplains');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;


-- Dumping structure for table paminili.permission_category
CREATE TABLE IF NOT EXISTS `permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.permission_category: ~3 rows (approximately)
DELETE FROM `permission_category`;
/*!40000 ALTER TABLE `permission_category` DISABLE KEYS */;
INSERT INTO `permission_category` (`id`, `name`) VALUES
	(1, 'home_page'),
	(2, 'statistics'),
	(3, 'questions');
/*!40000 ALTER TABLE `permission_category` ENABLE KEYS */;


-- Dumping structure for table paminili.police_station
CREATE TABLE IF NOT EXISTS `police_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT '0',
  `district` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.police_station: ~24 rows (approximately)
DELETE FROM `police_station`;
/*!40000 ALTER TABLE `police_station` DISABLE KEYS */;
INSERT INTO `police_station` (`id`, `name`, `province`, `district`) VALUES
	(1, 'Embilipitiya', 'Southern', 'Hambantota'),
	(2, 'Tangalle', 'Southern', 'Hambantota'),
	(3, 'Lunugamvehera', 'Southern', 'Hambantota'),
	(4, 'Katuwana', 'Southern', 'Hambantota'),
	(5, 'Kataragama', 'Southern', 'Hambantota'),
	(6, 'Middeniya', 'Southern', 'Hambantota'),
	(7, 'Weeraketiya', 'Southern', 'Hambantota'),
	(8, 'Hakmana', 'Southern', 'Hambantota'),
	(9, 'Hungama', 'Southern', 'Hambantota'),
	(10, 'Mawarala', 'Southern', 'Hambantota'),
	(11, 'Tissamaharama', 'Southern', 'Hambantota'),
	(12, 'Urubokka', 'Southern', 'Hambantota'),
	(13, 'Hambantota', 'Southern', 'Hambantota'),
	(14, 'Angunukolapelessa', 'Southern', 'Hambantota'),
	(15, 'Panamura', 'Southern', 'Hambantota'),
	(16, 'Dickwella', 'Southern', 'Hambantota'),
	(17, 'Gandara', 'Southern', 'Hambantota'),
	(18, 'Thihagoda', 'Southern', 'Hambantota'),
	(19, 'Kamburupitiya', 'Southern', 'Hambantota'),
	(20, 'Deniyaya', 'Southern', 'Hambantota'),
	(21, 'Akuressa', 'Southern', 'Hambantota'),
	(22, 'Udawalawa', 'Southern', 'Hambantota'),
	(23, 'Hambegamuwa', 'Southern', 'Hambantota'),
	(24, NULL, NULL, NULL);
/*!40000 ALTER TABLE `police_station` ENABLE KEYS */;


-- Dumping structure for table paminili.question
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `police_station_id` int(11) NOT NULL,
  `complain_type` varchar(100) DEFAULT NULL,
  `is_complain_written` varchar(100) DEFAULT NULL,
  `complain_record_time` varchar(100) DEFAULT NULL,
  `is_your_language` varchar(100) DEFAULT NULL,
  `provide_female_officer` varchar(100) DEFAULT NULL,
  `time_taken_to_medical_service` varchar(100) DEFAULT NULL,
  `efficient` varchar(100) DEFAULT NULL,
  `friendly` varchar(100) DEFAULT NULL,
  `intimidating` varchar(100) DEFAULT NULL,
  `humiliating` varchar(100) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.question: ~7 rows (approximately)
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `police_station_id`, `complain_type`, `is_complain_written`, `complain_record_time`, `is_your_language`, `provide_female_officer`, `time_taken_to_medical_service`, `efficient`, `friendly`, `intimidating`, `humiliating`, `score`) VALUES
	(1, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(2, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(3, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(4, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(5, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(6, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40),
	(7, 1, 'Rape', 'Yes', 'Within 10 minutes', 'Yes_I read and signed it', 'Not applicable', 'Not applicable', 'Yes', 'Yes', 'Yes', 'Yes', 40);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


-- Dumping structure for table paminili.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `sessionsid` varchar(100) NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL,
  `pg` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `others` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Handle the sessions';

-- Dumping data for table paminili.sessions: ~0 rows (approximately)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- Dumping structure for table paminili.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `user_role` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`user_role`),
  CONSTRAINT `role` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `user_role`, `password`) VALUES
	(2, 'nilupul', 1, '123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table paminili.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.user_role: ~1 rows (approximately)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `name`) VALUES
	(1, 'superadmin');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;


-- Dumping structure for table paminili.user_role_permission_category
CREATE TABLE IF NOT EXISTS `user_role_permission_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` int(11) NOT NULL,
  `permission_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_role_permission_category_user_role` (`user_role`),
  KEY `FK_user_role_permission_category_permission_category` (`permission_category`),
  CONSTRAINT `FK_user_role_permission_category_permission_category` FOREIGN KEY (`permission_category`) REFERENCES `permission_category` (`id`),
  CONSTRAINT `FK_user_role_permission_category_user_role` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table paminili.user_role_permission_category: ~3 rows (approximately)
DELETE FROM `user_role_permission_category`;
/*!40000 ALTER TABLE `user_role_permission_category` DISABLE KEYS */;
INSERT INTO `user_role_permission_category` (`id`, `user_role`, `permission_category`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3);
/*!40000 ALTER TABLE `user_role_permission_category` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

