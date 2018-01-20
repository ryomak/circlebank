# ************************************************************
# Sequel Pro SQL dump
# バージョン 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ホスト: 127.0.0.1 (MySQL 5.7.19)
# データベース: circle_bank
# 作成時刻: 2018-01-20 08:05:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ circles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `circles`;

CREATE TABLE `circles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `univ_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(11) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT 'img/circles/default.png',
  `number` int(11) NOT NULL,
  `gender_ratio` varchar(30) DEFAULT NULL,
  `introduction` text NOT NULL,
  `excite` int(11) NOT NULL,
  `fee` int(11) unsigned NOT NULL DEFAULT '0',
  `campus` varchar(255) DEFAULT NULL,
  `message_for_fresh` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `circles` WRITE;
/*!40000 ALTER TABLE `circles` DISABLE KEYS */;

INSERT INTO `circles` (`id`, `univ_id`, `name`, `url_name`, `image`, `number`, `gender_ratio`, `introduction`, `excite`, `fee`, `campus`, `message_for_fresh`)
VALUES
	(1,1,'hands up','handsup','img/circles/1.png',30,'1:1','アットホームなバスケットボールサークルです',3,5000,'京田辺','いつでもきてね'),
	(2,1,'fly speck','flyspeck','1',100,'1:1','テニス',9,3000,'京田辺/今出川','いつでもきてねえええ');

/*!40000 ALTER TABLE `circles` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ circles_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `circles_tags`;

CREATE TABLE `circles_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `circle_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `circles_tags` WRITE;
/*!40000 ALTER TABLE `circles_tags` DISABLE KEYS */;

INSERT INTO `circles_tags` (`id`, `circle_id`, `tag_id`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,2,3),
	(4,1,3),
	(5,2,4);

/*!40000 ALTER TABLE `circles_tags` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `circle_id` int(11) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `user_id`, `circle_id`, `point`, `text`)
VALUES
	(1,1,2,4,'良い'),
	(2,2,2,10,'本当良い');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ delegetes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delegetes`;

CREATE TABLE `delegetes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `circle_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `delegetes` WRITE;
/*!40000 ALTER TABLE `delegetes` DISABLE KEYS */;

INSERT INTO `delegetes` (`id`, `circle_id`, `name`, `contact`)
VALUES
	(1,1,'田中','tanaka@mail.com'),
	(2,2,'大野','arashi@mail.com');

/*!40000 ALTER TABLE `delegetes` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `circle_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'img/users/default.png',
  `agenda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `place` varchar(255) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `capacity` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`id`, `circle_id`, `name`, `image`, `agenda`, `place`, `detail`, `capacity`, `fee`)
VALUES
	(1,2,'ほわ音でー','img/users/default.png','2017-02-14 15:41:30','a','f',10,10),
	(2,1,'ホワイトデー','img/users/default.png','2017-02-15 00:00:00','fsad','fds',0,0),
	(3,2,'fsa','img/users/default.png','2017-02-14 00:00:00','fsa','fdsa',1,1);

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ events_schedules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events_schedules`;

CREATE TABLE `events_schedules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `events_schedules` WRITE;
/*!40000 ALTER TABLE `events_schedules` DISABLE KEYS */;

INSERT INTO `events_schedules` (`id`, `user_id`, `event_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,1,3),
	(4,3,2),
	(6,2,3);

/*!40000 ALTER TABLE `events_schedules` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;

INSERT INTO `likes` (`id`, `user_id`, `circle_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,1,2),
	(4,1,3),
	(5,4,1);

/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`)
VALUES
	(1,'バスケットボール'),
	(2,'アットホーム'),
	(3,'京田辺'),
	(4,'今出川'),
	(5,'飲みサークル');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ universities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `universities`;

CREATE TABLE `universities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;

INSERT INTO `universities` (`id`, `url_name`, `name`)
VALUES
	(1,'doshisha','同志社大学'),
	(2,'kanseigakuin','関西学院大学'),
	(3,'doshisha','同志社女子大学');

/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `univ_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `gender` char(2) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'img/users/default.png',
  `year` int(11) NOT NULL,
  `department` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `univ_id`, `name`, `gender`, `mail`, `password`, `image`, `year`, `department`, `subject`)
VALUES
	(1,1,'栗栖','男','ryooomaaa0413@gmail.com','$2a$10$3rCT9hO/RZu1Qxd.lhJA7.6EDUZ5SPTVcVlu4KKQZNPYin.rKNJ0S','img/users/1.png',2015,'理工学部','情報システムデザイン学科'),
	(2,1,'津國健太','男','tsukuni@gmail.com','$2a$10$g0Xsy1kZ3eoAOxNRdXe.xOTHpw1SKMtRlOSsMgamhWqA6DYPevu3a','img/users/2.png',2015,'理工学部','機械システム学科'),
	(3,1,'櫻井','男','sakurai@gmail.com','$2a$10$Stqc3LpJYS7.yzvF3mFIku6ZO/9Apr7KN8BvtSOLqgI6sTfxdD4UC','img/users/default.png',2015,'理工学部','情報システムデザイン学科'),
	(4,1,'相田','男','aida@gmail.com','$2a$10$XMGMyBAaoRYHWdrzY7HfKu3Wcla6S9w3BThdYKd8NehrgYnU81aRO','img/users/default.png',2015,'理工学部','情報システムデザイン学科'),
	(5,1,'admin','男','admin@user1234','$2a$10$Rj43eRZVwv4ISdNxCuIi0O3PC3NBNnaUNzXAk1UHnDJ5fgImoUdWO','img/users/default.png',2015,'理工学部','情報システムデザイン学科');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
