/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.11-MariaDB : Database - iteh1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`iteh1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `iteh1`;

/*Table structure for table `film` */

DROP TABLE IF EXISTS `film`;

CREATE TABLE `film` (
  `Film_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ime_Filma` varchar(255) NOT NULL,
  `Godina_proizvodnje` int(11) NOT NULL,
  `Trajanje` int(11) NOT NULL,
  `Poster` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL,
  `korisnik_id` int(11) DEFAULT NULL,
  `reziser_id` int(11) DEFAULT NULL,
  `zanr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Film_Id`),
  UNIQUE KEY `IDX_7929947a6efe400818e4a96bbc` (`Ime_Filma`,`Godina_proizvodnje`),
  KEY `FK_ecdfd1bf99e7aaca681a7cb5f52` (`korisnik_id`),
  KEY `FK_83664dec8cfce9181ae897ac9af` (`reziser_id`),
  KEY `FK_b6428d39e45c00693c31caab604` (`zanr_id`),
  CONSTRAINT `FK_83664dec8cfce9181ae897ac9af` FOREIGN KEY (`reziser_id`) REFERENCES `reziser` (`ReziserId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_b6428d39e45c00693c31caab604` FOREIGN KEY (`zanr_id`) REFERENCES `zanr` (`zanrId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ecdfd1bf99e7aaca681a7cb5f52` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`KorisnikId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `film` */

insert  into `film`(`Film_Id`,`Ime_Filma`,`Godina_proizvodnje`,`Trajanje`,`Poster`,`Opis`,`korisnik_id`,`reziser_id`,`zanr_id`) values 
(5,'Interstellar',2014,169,'/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg','The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',1,5,2),
(6,'Gladiator',2000,155,'/ehGpN04mLJIrSnxcZBMvHeG0eDc.jpg','In the year 180, the death of emperor Marcus Aurelius throws the Roman Empire into chaos.  Maximus is one of the Roman army\'s most capable and trusted generals and a key advisor to the emperor.  As Marcus\' devious son Commodus ascends to the throne, Maxim',1,3,2),
(7,'Terminator: Dark Fate',2019,128,'/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg','Decades after Sarah Connor prevented Judgment Day, a lethal new Terminator is sent to eliminate the future leader of the resistance. In a fight to save mankind, battle-hardened Sarah Connor teams up with an unexpected ally and an enhanced super soldier to',1,4,2),
(8,'Titanic',1997,194,'/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg','101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later. A young Rose boards the ship with her mother and fiancé. Meanwhile, Jack Dawson and Fabrizio De Rossi win third-class tickets aboard the ship. Rose tells the ',1,6,1),
(9,'300',2006,117,'/lGv19gokQvgC7jgjWqapIachnxU.jpg','Based on Frank Miller\'s graphic novel, \"300\" is very loosely based the 480 B.C. Battle of Thermopylae, where the King of Sparta led his army against the advancing Persians; the battle is said to have inspired all of Greece to band together against the Per',1,7,2),
(10,'Troy',2004,163,'/zda0VWRKHnUSX7B7NOPqVUlu9zK.jpg','In year 1250 B.C. during the late Bronze age, two emerging nations begin to clash. Paris, the Trojan prince, convinces Helen, Queen of Sparta, to leave her husband Menelaus, and sail with him back to Troy. After Menelaus finds out that his wife was taken ',1,8,2);

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `KorisnikId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Uloga` varchar(255) NOT NULL,
  PRIMARY KEY (`KorisnikId`),
  UNIQUE KEY `IDX_918eb3ae8326d664a54e0db1fa` (`Email`),
  UNIQUE KEY `IDX_772c5a96b75a97de8618b64177` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `korisnik` */

insert  into `korisnik`(`KorisnikId`,`Username`,`Password`,`Email`,`Uloga`) values 
(1,'Vladimir','Baba1203.','vladimir12934@gmail.com','Admin'),
(2,'Korisnik1','Baba1203.','korisnik1@gmail.com','Korisnik');

/*Table structure for table `ocena` */

DROP TABLE IF EXISTS `ocena`;

CREATE TABLE `ocena` (
  `ocenaId` int(11) NOT NULL AUTO_INCREMENT,
  `brojcana_ocena` int(11) NOT NULL,
  `komentar` text NOT NULL,
  `korisnikId` int(11) DEFAULT NULL,
  `filmId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ocenaId`),
  UNIQUE KEY `IDX_5fc67d79af986b07996ad17daa` (`korisnikId`,`filmId`),
  KEY `FK_186173129957640d30c8c3da6c3` (`filmId`),
  CONSTRAINT `FK_186173129957640d30c8c3da6c3` FOREIGN KEY (`filmId`) REFERENCES `film` (`Film_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_dc97201ef228a3f5ed1f1cb98a9` FOREIGN KEY (`korisnikId`) REFERENCES `korisnik` (`KorisnikId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ocena` */

insert  into `ocena`(`ocenaId`,`brojcana_ocena`,`komentar`,`korisnikId`,`filmId`) values 
(1,3,'Veoma zabavan i uzbudljiv film!',2,6),
(2,5,'',2,10),
(3,5,'Akcioni film koji osvaja u jednom gledanju!',2,9),
(4,5,'',2,7);

/*Table structure for table `reziser` */

DROP TABLE IF EXISTS `reziser`;

CREATE TABLE `reziser` (
  `ReziserId` int(11) NOT NULL AUTO_INCREMENT,
  `imeRezisera` varchar(255) NOT NULL,
  `prezimeRezisera` varchar(255) NOT NULL,
  PRIMARY KEY (`ReziserId`),
  UNIQUE KEY `IDX_44348dbe6c92d91d0fb0426075` (`imeRezisera`,`prezimeRezisera`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `reziser` */

insert  into `reziser`(`ReziserId`,`imeRezisera`,`prezimeRezisera`) values 
(5,'Christopher',' Nolan '),
(6,'James',' Cameron '),
(3,'Ridley',' Scott '),
(4,'Tim',' Miller '),
(8,'Wolfgang',' Petersen '),
(7,'Zack',' Snyder ');

/*Table structure for table `zanr` */

DROP TABLE IF EXISTS `zanr`;

CREATE TABLE `zanr` (
  `zanrId` int(11) NOT NULL AUTO_INCREMENT,
  `imeZanra` varchar(255) NOT NULL,
  PRIMARY KEY (`zanrId`),
  UNIQUE KEY `IDX_a971ae78d7e7cdbe00f2a65463` (`imeZanra`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `zanr` */

insert  into `zanr`(`zanrId`,`imeZanra`) values 
(2,'Action'),
(3,'Comedy'),
(1,'Drama'),
(4,'Romance'),
(5,'Science Fiction');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
