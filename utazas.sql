SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `utazas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `utazas`;

CREATE TABLE IF NOT EXISTS `felhasznalok` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `csaladi_nev` varchar(45) NOT NULL DEFAULT '',
  `utonev` varchar(45) NOT NULL DEFAULT '',
  `bejelentkezes` varchar(12) NOT NULL DEFAULT '',
  `jelszo` varchar(40) NOT NULL DEFAULT '',
  `jogosultsag` varchar(3) NOT NULL DEFAULT '_1_',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `felhasznalok` (`id`, `csaladi_nev`, `utonev`, `bejelentkezes`, `jelszo`, `jogosultsag`) VALUES
(1, 'Rendszer', 'Admin', 'Admin', sha1('admin'), '__1'),
(2, 'Családi_2', 'Utónév_2', 'Login2', sha1('login2'), '_1_');

CREATE TABLE IF NOT EXISTS `menu` (
  `url` varchar(30) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `szulo` varchar(30) NOT NULL,
  `jogosultsag` varchar(3) NOT NULL,
  `sorrend` tinyint(4) NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `menu` (`url`, `nev`, `szulo`, `jogosultsag`, `sorrend`) VALUES
('admin', 'Admin', '', '001', 80),
('alapinfok', 'Alapinfók', 'elerhetoseg', '111', 40),
('belepes', 'Belépés', '', '100', 60),
('elerhetoseg', 'Elérhetőség', '', '111', 20),
('kiegeszitesek', 'Kiegészítések', 'elerhetoseg', '011', 50),
('kilepes', 'Kilépés', '', '011', 70),
('linkek', 'Linkek', '', '100', 30),
('nyitolap', 'Nyitólap', '', '111', 10);

CREATE TABLE helyseg (
    `az` INT NOT NULL ,
    `nev` VARCHAR(255) NOT NULL,
    `orszag` VARCHAR(100) NOT NULL,
     PRIMARY KEY (`az`)
);

CREATE TABLE szalloda (
    `az` VARCHAR(50) PRIMARY KEY NOT NULL,
    `nev` VARCHAR(255) NOT NULL,
    `besorolas` INT CHECK (`besorolas` BETWEEN 1 AND 5),
    `helyseg_az` INT NOT NULL,
    `tengerpart_tav` INT NOT NULL, 
    `repter_tav` INT NOT NULL,
    `felpanzio` BOOLEAN NOT NULL,
    PRIMARY KEY (`az`) FOREIGN KEY (`helyseg_az`) REFERENCES `helyseg` (`az`)
);

CREATE TABLE IF NOT EXISTS tavasz (
    `sorszam` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,          
    `szalloda_az` VARCHAR(50) NOT NULL,          
    `indulas` DATE NOT NULL,                     
    `idotartam` INT NOT NULL,                    
    `ar` INT NOT NULL,
    PRIMARY KEY (`sorszam`),
     FOREIGN KEY (`szalloda_az`) REFERENCES szalloda(`az`)           
);


INSERT INTO helyseg (az, nev, orszag)
VALUES
(1, 'Sousse', 'Tunézia'),
(2, 'Djerba', 'Tunézia'),
(3, 'Sharm El Sheikh', 'Egyiptom'),
(4, 'Hurghada', 'Egyiptom');

INSERT INTO szalloda (az, nev, besorolas, helyseg_az, tengerpart_tav, repter_tav, felpanzio)
VALUES
('BS', 'Baron Resort', 5, 3, 0, 15, 1),
('CL', 'Charm Life', 3, 4, 0, 33, 0),
('CP', 'Cesar Palace', 5, 2, 250, 27, 1),
('CW', 'Caribbean World Soma Bay', 5, 4, 0, 55, 0),
('CZ', 'Crowne Plaza', 4, 3, 400, 9, 1),
('FJ', 'Festival Le Jardin Resort', 4, 4, 0, 17, 0),
('HB', 'Lti Holiday Beach Resort', 4, 2, 100, 20, 1),
('JR', 'Jinene Resort', 4, 1, 50, 25, 1),
('MB', 'Marhaba', 3, 1, 0, 25, 1),
('MD', 'Miramar Djerba', 3, 2, 300, 22, 1),
('MP', 'El Mouradi Palace', 5, 1, 0, 35, 1),
('TA', 'Tropicana Azur', 4, 3, 400, 9, 0);

INSERT INTO tavasz (szalloda_az, indulas, idotartam, ar)
VALUES
('BS', '2011-01-05', 8, 244900),
('BS', '2011-01-05', 15, 358900),
('BS', '2011-01-12', 8, 157900),
('BS', '2011-01-12', 15, 265900),
('BS', '2011-01-19', 8, 157900),
('BS', '2011-01-19', 15, 265900),
('BS', '2011-01-26', 8, 157900),
('BS', '2011-01-26', 15, 265900),
('BS', '2011-02-02', 8, 157900),
('BS', '2011-02-02', 15, 265900),
('BS', '2011-02-09', 8, 157900),
('BS', '2011-02-09', 15, 289900),
('BS', '2011-02-16', 8, 176900),
('BS', '2011-02-16', 15, 303900),
('BS', '2011-02-23', 8, 176900),
('BS', '2011-02-23', 15, 303900),
('BS', '2011-03-02', 8, 176900),
('BS', '2011-03-02', 15, 303900),
('BS', '2011-03-09', 8, 188900),
('BS', '2011-03-09', 15, 322900),
('BS', '2011-03-16', 8, 188900),
('BS', '2011-03-16', 15, 322900),
('BS', '2011-03-23', 8, 188900),
('BS', '2011-03-23', 15, 358900),
('BS', '2011-03-30', 8, 230900),
('BS', '2011-03-30', 15, 394900),
('BS', '2011-04-06', 8, 230900),
('BS', '2011-04-06', 15, 394900),
('BS', '2011-04-13', 8, 230900),
('BS', '2011-04-13', 15, 406900),
('BS', '2011-04-20', 8, 230900),
('BS', '2011-04-20', 15, 445900),
('BS', '2011-04-27', 8, 268900),
('CL', '2011-01-02', 8, 59900),
('CL', '2011-01-02', 15, 99900),
('CL', '2011-01-09', 8, 83900),
('CL', '2011-01-09', 15, 124900),
('CL', '2011-01-16', 8, 91900),
('CL', '2011-01-16', 15, 144900),
('CL', '2011-01-23', 8, 91900),
('CL', '2011-01-23', 15, 144900),
('CL', '2011-01-30', 8, 91900),
('CL', '2011-01-30', 15, 144900),
('CL', '2011-02-06', 8, 98900),
('CL', '2011-02-06', 15, 144900),
('CL', '2011-02-13', 8, 98900),
('CL', '2011-02-13', 15, 144900),
('CL', '2011-02-20', 8, 98900),
('CL', '2011-02-20', 15, 147900),
('CL', '2011-02-27', 8, 98900),
('CL', '2011-02-27', 15, 147900),
('CL', '2011-03-06', 8, 106900),
('CL', '2011-03-06', 15, 157900),
('CL', '2011-03-10', 11, 128900),
('CL', '2011-03-13', 8, 106900),
('CL', '2011-03-13', 12, 135900),
('CL', '2011-03-13', 15, 157900),
('CL', '2011-03-17', 8, 105900),
('CL', '2011-03-17', 11, 128900),
('CL', '2011-03-17', 15, 157900),
('CL', '2011-03-20', 8, 106900),
('CL', '2011-03-20', 12, 135900),
('CL', '2011-03-20', 15, 157900),
('CL', '2011-03-24', 8, 105900),
('CL', '2011-03-24', 11, 128900),
('CL', '2011-03-24', 15, 157900),
('CL', '2011-03-27', 8, 106900),
('CL', '2011-03-27', 12, 135900),
('CL', '2011-03-27', 15, 157900),
('CL', '2011-03-31', 8, 105900),
('CL', '2011-03-31', 11, 128900),
('CL', '2011-03-31', 15, 157900),
('CL', '2011-04-03', 8, 106900),
('CL', '2011-04-03', 12, 135900),
('CL', '2011-04-03', 15, 166900),
('CL', '2011-04-07', 8, 105900),
('CL', '2011-04-07', 11, 136900),
('CL', '2011-04-07', 15, 180900),
('CL', '2011-04-10', 8, 114900),
('CL', '2011-04-10', 12, 155900),
('CL', '2011-04-10', 15, 181900),
('CL', '2011-04-14', 8, 125900),
('CL', '2011-04-14', 11, 150900),
('CL', '2011-04-14', 15, 180900),
('CL', '2011-04-17', 8, 122900),
('CL', '2011-04-17', 12, 149900),
('CL', '2011-04-17', 15, 172900),
('CL', '2011-04-21', 8, 108900),
('CL', '2011-04-21', 11, 130900),
('CL', '2011-04-21', 15, 160900),
('CL', '2011-04-24', 8, 106900),
('CL', '2011-04-28', 8, 105900),
('CP', '2011-01-23', 8, 97900),
('CP', '2011-01-23', 15, 143900),
('CP', '2011-01-30', 8, 97900),
('CP', '2011-01-30', 15, 143900),
('CP', '2011-02-06', 8, 97900),
('CP', '2011-02-06', 15, 143900),
('CP', '2011-02-13', 8, 97900),
('CP', '2011-02-13', 15, 143900),
('CP', '2011-02-20', 15, 143900),
('CP', '2011-02-27', 8, 97900),
('CP', '2011-02-27', 15, 143900),
('CP', '2011-03-06', 8, 97900),
('CP', '2011-03-06', 15, 143900),
('CP', '2011-03-13', 8, 97900),
('CP', '2011-03-13', 15, 143900),
('CP', '2011-03-20', 8, 97900),
('CP', '2011-03-20', 15, 143900),
('CP', '2011-03-27', 8, 97900),
('CP', '2011-03-27', 15, 143900),
('CP', '2011-04-03', 8, 97900),
('CP', '2011-04-03', 15, 154900),
('CP', '2011-04-10', 8, 104900),
('CP', '2011-04-10', 15, 154900),
('CP', '2011-04-17', 8, 97900),
('CP', '2011-04-17', 15, 143900),
('CP', '2011-04-24', 8, 97900),
('CW', '2011-01-02', 8, 79900),
('CW', '2011-01-02', 15, 119900),
('CW', '2011-01-09', 8, 93900),
('CW', '2011-01-09', 15, 142900),
('CW', '2011-01-16', 8, 112900),
('CW', '2011-01-16', 15, 178900),
('CW', '2011-01-23', 8, 112900),
('CW', '2011-01-23', 15, 178900),
('CW', '2011-01-30', 8, 112900),
('CW', '2011-01-30', 15, 178900),
('CW', '2011-02-06', 8, 119900),
('CW', '2011-02-06', 15, 188900),
('CW', '2011-02-13', 8, 119900),
('CW', '2011-02-13', 15, 188900),
('CW', '2011-02-20', 8, 119900),
('CW', '2011-02-20', 15, 188900),
('CW', '2011-02-27', 8, 119900),
('CW', '2011-02-27', 15, 188900),
('CW', '2011-03-06', 8, 128900),
('CW', '2011-03-06', 15, 200900),
('CW', '2011-03-10', 11, 158900),
('CW', '2011-03-13', 8, 128900),
('CW', '2011-03-13', 12, 169900),
('CW', '2011-03-13', 15, 200900),
('CW', '2011-03-17', 8, 127900),
('CW', '2011-03-17', 11, 158900),
('CW', '2011-03-17', 15, 200900),
('CW', '2011-03-20', 8, 128900),
('CW', '2011-03-20', 12, 169900),
('CW', '2011-03-20', 15, 200900),
('CW', '2011-03-24', 8, 127900),
('CW', '2011-03-24', 11, 158900),
('CW', '2011-03-24', 15, 200900),
('CW', '2011-03-27', 8, 128900),
('CW', '2011-03-27', 12, 169900),
('CW', '2011-03-27', 15, 205900),
('CW', '2011-03-31', 8, 127900),
('CW', '2011-03-31', 11, 163900),
('CW', '2011-03-31', 15, 226900),
('CW', '2011-04-03', 8, 132900),
('CW', '2011-04-03', 12, 194900),
('CW', '2011-04-03', 15, 241900),
('CW', '2011-04-07', 8, 152900),
('CW', '2011-04-07', 11, 199900),
('CW', '2011-04-07', 15, 241900),
('CW', '2011-04-10', 8, 163900),
('CW', '2011-04-10', 12, 205900),
('CW', '2011-04-10', 15, 236900),
('CW', '2011-04-14', 8, 142900),
('CW', '2011-04-14', 11, 174900),
('CW', '2011-04-14', 15, 216900),
('CW', '2011-04-17', 8, 128900),
('CW', '2011-04-17', 12, 169900),
('CW', '2011-04-17', 15, 200900),
('CW', '2011-04-21', 8, 127900),
('CW', '2011-04-21', 11, 158900),
('CW', '2011-04-21', 15, 200900),
('CW', '2011-04-24', 8, 128900),
('CW', '2011-04-28', 8, 127900),
('CZ', '2011-01-05', 8, 59900),
('CZ', '2011-01-05', 15, 99900),
('CZ', '2011-01-12', 8, 86900),
('CZ', '2011-01-12', 15, 130900),
('CZ', '2011-01-19', 8, 94900),
('CZ', '2011-01-19', 15, 142900),
('CZ', '2011-01-26', 8, 94900),
('CZ', '2011-01-26', 15, 142900),
('CZ', '2011-02-02', 8, 102900),
('CZ', '2011-02-02', 15, 151900),
('CZ', '2011-02-09', 8, 102900),
('CZ', '2011-02-09', 15, 151900),
('CZ', '2011-02-16', 8, 102900),
('CZ', '2011-02-16', 15, 151900),
('CZ', '2011-02-23', 8, 102900),
('CZ', '2011-02-23', 15, 157900),
('CZ', '2011-03-02', 8, 102900),
('CZ', '2011-03-02', 15, 157900),
('CZ', '2011-03-09', 8, 109900),
('CZ', '2011-03-09', 15, 164900),
('CZ', '2011-03-16', 8, 109900),
('CZ', '2011-03-16', 15, 164900),
('CZ', '2011-03-23', 8, 109900),
('CZ', '2011-03-30', 8, 109900),
('CZ', '2011-03-30', 15, 189900),
('CZ', '2011-04-06', 8, 133900),
('CZ', '2011-04-06', 15, 207900),
('CZ', '2011-04-13', 8, 127900),
('CZ', '2011-04-13', 15, 183900),
('CZ', '2011-04-20', 8, 109900),
('CZ', '2011-04-20', 15, 164900),
('CZ', '2011-04-27', 8, 109900),
('FJ', '2011-01-02', 8, 69900),
('FJ', '2011-01-02', 15, 89900),
('FJ', '2011-01-09', 8, 88900),
('FJ', '2011-01-09', 15, 122900),
('FJ', '2011-01-16', 8, 96900),
('FJ', '2011-01-16', 15, 133900),
('FJ', '2011-01-23', 8, 96900),
('FJ', '2011-01-23', 15, 133900),
('FJ', '2011-01-30', 8, 96900),
('FJ', '2011-01-30', 15, 133900),
('FJ', '2011-02-06', 8, 100900),
('FJ', '2011-02-06', 15, 150900),
('FJ', '2011-02-13', 8, 100900),
('FJ', '2011-02-13', 15, 150900),
('FJ', '2011-02-20', 8, 100900),
('FJ', '2011-02-20', 15, 154900),
('FJ', '2011-02-27', 8, 102900),
('FJ', '2011-02-27', 15, 154900),
('FJ', '2011-03-06', 8, 109900),
('FJ', '2011-03-06', 15, 165900),
('FJ', '2011-03-10', 11, 133900),
('FJ', '2011-03-13', 8, 109900),
('FJ', '2011-03-13', 12, 143900),
('FJ', '2011-03-13', 15, 165900),
('FJ', '2011-03-17', 8, 109900),
('FJ', '2011-03-17', 11, 133900),
('FJ', '2011-03-17', 15, 165900),
('FJ', '2011-03-20', 8, 109900),
('FJ', '2011-03-20', 12, 143900),
('FJ', '2011-03-20', 15, 165900),
('FJ', '2011-03-24', 8, 109900),
('FJ', '2011-03-24', 11, 133900),
('FJ', '2011-03-24', 15, 165900),
('FJ', '2011-03-27', 8, 109900),
('FJ', '2011-03-27', 12, 143900),
('FJ', '2011-03-27', 15, 165900),
('FJ', '2011-03-31', 8, 109900),
('FJ', '2011-03-31', 11, 133900),
('FJ', '2011-03-31', 15, 167900),
('FJ', '2011-04-03', 8, 109900),
('FJ', '2011-04-03', 12, 143900),
('FJ', '2011-04-03', 15, 172900),
('FJ', '2011-04-07', 8, 111900),
('FJ', '2011-04-07', 11, 140900),
('FJ', '2011-04-07', 15, 178900),
('FJ', '2011-04-10', 8, 119900),
('FJ', '2011-04-10', 12, 154900),
('FJ', '2011-04-10', 15, 178900),
('FJ', '2011-04-14', 8, 121900),
('FJ', '2011-04-14', 11, 145900),
('FJ', '2011-04-14', 15, 178900),
('FJ', '2011-04-17', 8, 119900),
('FJ', '2011-04-17', 12, 148900),
('FJ', '2011-04-17', 15, 172900),
('FJ', '2011-04-21', 8, 109900),
('FJ', '2011-04-21', 11, 133900),
('FJ', '2011-04-21', 15, 165900),
('FJ', '2011-04-24', 8, 109900),
('FJ', '2011-04-28', 8, 109900),
('HB', '2011-01-23', 8, 84900),
('HB', '2011-01-23', 15, 116900),
('HB', '2011-01-30', 8, 84900),
('HB', '2011-01-30', 15, 116900),
('HB', '2011-02-06', 8, 84900),
('HB', '2011-02-06', 15, 116900),
('HB', '2011-02-13', 8, 84900),
('HB', '2011-02-13', 15, 116900),
('HB', '2011-02-20', 8, 84900),
('HB', '2011-02-20', 15, 116900),
('HB', '2011-02-27', 8, 84900),
('HB', '2011-02-27', 15, 116900),
('HB', '2011-03-06', 8, 84900),
('HB', '2011-03-06', 15, 116900),
('HB', '2011-03-13', 8, 84900),
('HB', '2011-03-13', 15, 116900),
('HB', '2011-03-20', 8, 84900),
('HB', '2011-03-20', 15, 116900),
('HB', '2011-03-27', 8, 84900),
('HB', '2011-03-27', 15, 116900),
('HB', '2011-04-03', 8, 84900),
('HB', '2011-04-03', 15, 126900),
('HB', '2011-04-10', 8, 90900),
('HB', '2011-04-10', 15, 126900),
('HB', '2011-04-17', 8, 84900),
('HB', '2011-04-17', 15, 116900),
('HB', '2011-04-24', 8, 84900),
('JR', '2011-01-02', 8, 38900),
('JR', '2011-01-02', 15, 53900),
('JR', '2011-01-09', 8, 37900),
('JR', '2011-01-09', 15, 53900),
('JR', '2011-01-16', 8, 37900),
('JR', '2011-01-16', 15, 53900),
('JR', '2011-01-23', 8, 37900),
('JR', '2011-01-23', 15, 53900),
('JR', '2011-01-30', 8, 37900),
('JR', '2011-01-30', 15, 53900),
('JR', '2011-02-06', 8, 37900),
('JR', '2011-02-06', 15, 53900),
('JR', '2011-02-13', 8, 37900),
('JR', '2011-02-13', 15, 53900),
('JR', '2011-02-20', 8, 37900),
('JR', '2011-02-20', 15, 53900),
('JR', '2011-02-27', 8, 37900),
('JR', '2011-02-27', 15, 53900),
('JR', '2011-03-06', 8, 70900),
('JR', '2011-03-06', 15, 90900),
('JR', '2011-03-13', 8, 70900),
('JR', '2011-03-13', 15, 90900),
('JR', '2011-03-20', 8, 70900),
('JR', '2011-03-20', 15, 90900),
('JR', '2011-03-27', 8, 70900),
('JR', '2011-03-27', 15, 90900),
('JR', '2011-04-03', 8, 70900),
('JR', '2011-04-03', 15, 97900),
('JR', '2011-04-10', 8, 76900),
('JR', '2011-04-10', 15, 97900),
('JR', '2011-04-17', 8, 70900),
('JR', '2011-04-17', 15, 90900),
('JR', '2011-04-24', 8, 70900),
('MB', '2011-01-02', 8, 70900),
('MB', '2011-01-02', 15, 89900),
('MB', '2011-01-09', 8, 37900),
('MB', '2011-01-09', 15, 53900),
('MB', '2011-01-16', 8, 37900),
('MB', '2011-01-16', 15, 53900),
('MB', '2011-01-23', 8, 37900),
('MB', '2011-01-23', 15, 53900),
('MB', '2011-01-30', 8, 37900),
('MB', '2011-01-30', 15, 53900),
('MB', '2011-02-06', 8, 37900),
('MB', '2011-02-06', 15, 53900),
('MB', '2011-02-13', 8, 37900),
('MB', '2011-02-13', 15, 53900),
('MB', '2011-02-20', 8, 37900),
('MB', '2011-02-20', 15, 53900),
('MB', '2011-02-27', 8, 37900),
('MB', '2011-02-27', 15, 53900),
('MB', '2011-03-06', 8, 69900),
('MB', '2011-03-06', 15, 88900),
('MB', '2011-03-13', 8, 69900),
('MB', '2011-03-13', 15, 88900),
('MB', '2011-03-20', 8, 69900),
('MB', '2011-03-20', 15, 88900),
('MB', '2011-03-27', 8, 69900),
('MB', '2011-03-27', 15, 88900),
('MB', '2011-04-03', 8, 69900),
('MB', '2011-04-03', 15, 95900),
('MB', '2011-04-10', 8, 75900),
('MB', '2011-04-10', 15, 95900),
('MB', '2011-04-17', 8, 69900),
('MB', '2011-04-17', 15, 88900),
('MB', '2011-04-24', 8, 69900),
('MD', '2011-01-23', 8, 70900),
('MD', '2011-01-23', 15, 90900),
('MD', '2011-01-30', 8, 70900),
('MD', '2011-01-30', 15, 90900),
('MD', '2011-02-06', 8, 70900),
('MD', '2011-02-06', 15, 90900),
('MD', '2011-02-13', 8, 70900),
('MD', '2011-02-13', 15, 90900),
('MD', '2011-02-20', 8, 70900),
('MD', '2011-02-20', 15, 90900),
('MD', '2011-02-27', 8, 70900),
('MD', '2011-02-27', 15, 90900),
('MD', '2011-03-06', 8, 70900),
('MD', '2011-03-06', 15, 90900),
('MD', '2011-03-13', 8, 70900),
('MD', '2011-03-13', 15, 90900),
('MD', '2011-03-20', 8, 70900),
('MD', '2011-03-20', 15, 90900),
('MD', '2011-03-27', 8, 70900),
('MD', '2011-03-27', 15, 90900),
('MD', '2011-04-03', 8, 70900),
('MD', '2011-04-03', 15, 97900),
('MD', '2011-04-10', 8, 76900),
('MD', '2011-04-10', 15, 97900),
('MD', '2011-04-17', 8, 70900),
('MD', '2011-04-17', 15, 90900),
('MD', '2011-04-24', 8, 70900),
('MP', '2011-01-02', 8, 83900),
('MP', '2011-01-02', 15, 115900),
('MP', '2011-01-09', 8, 83900),
('MP', '2011-01-09', 15, 115900),
('MP', '2011-01-16', 8, 83900),
('MP', '2011-01-16', 15, 115900),
('MP', '2011-01-23', 8, 83900),
('MP', '2011-01-23', 15, 115900),
('MP', '2011-01-30', 8, 83900),
('MP', '2011-01-30', 15, 115900),
('MP', '2011-02-06', 8, 83900),
('MP', '2011-02-06', 15, 115900),
('MP', '2011-02-13', 8, 83900),
('MP', '2011-02-13', 15, 115900),
('MP', '2011-02-20', 8, 83900),
('MP', '2011-02-20', 15, 122900),
('MP', '2011-02-27', 8, 90900),
('MP', '2011-02-27', 15, 139900),
('MP', '2011-03-06', 8, 99900),
('MP', '2011-03-06', 15, 148900),
('MP', '2011-03-13', 8, 99900),
('MP', '2011-03-13', 15, 148900),
('MP',	'2011.03.20',	8,	99900),
('MP',	'2011.03.20',	15,	148900),
('MP',	'2011.03.27',	8,	99900),
('MP',	'2011.03.27',	15,	157900),
('MP',	'2011.04.03',	8,	109900),
('MP',	'2011.04.03',	15,	184900),
('MP',	'2011.04.10',	8,	121900),
('MP',	'2011.04.10',	15,	188900),
('MP',	'2011.04.17',	8,	112900),
('MP',	'2011.04.17',	15,	174900),
('MP',	'2011.04.24',	8,	112900),
('TA',	'2011.01.05',	8,	69900),
('TA',	'2011.01.05',	15,	119900),
('TA',	'2011.01.12',	8,	97900),
('TA',	'2011.01.12',	15,	147900),
('TA',	'2011.01.19',	8,	100900),
('TA',	'2011.01.19',	15,	155900),
('TA',	'2011.01.26',	8,	100900),
('TA',	'2011.01.26',	15,	155900),
('TA',	'2011.02.02',	8,	107900),
('TA',	'2011.02.02',	15,	164900),
('TA',	'2011.02.09',	8,	107900),
('TA',	'2011.02.09',	15,	164900),
('TA',	'2011.02.16',	8,	107900),
('TA',	'2011.02.16',	15,	164900),
('TA',	'2011.02.23',	8,	107900),
('TA',	'2011.02.23',	15,	164900),
('TA',	'2011.03.02',	8,	107900),
('TA',	'2011.03.02',	15,	171900),
('TA',	'2011.03.09',	8,	125900),
('TA',	'2011.03.09',	15,	194900),
('TA',	'2011.03.16',	8,	125900),
('TA',	'2011.03.16',	15,	200900),
('TA',	'2011.03.23',	8,	129900),
('TA',	'2011.03.23',	15,	209900),
('TA',	'2011.03.30',	8,	134900),
('TA',	'2011.03.30',	15,	230900),
('TA',	'2011.04.06',	8,	149900),
('TA',	'2011.04.06',	15,	253900),
('TA',	'2011.04.13',	8,	157900),
('TA',	'2011.04.13',	15,	230900),
('TA',	'2011.04.20',	8,	125900),
('TA',	'2011.04.20',	15,	200900),
('TA',	'2011.04.27',	8,	125900);