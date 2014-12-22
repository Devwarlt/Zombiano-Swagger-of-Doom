-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 10. Nov 2014 um 18:33
-- Server Version: 5.5.16
-- PHP-Version: 5.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `soulforge_zombies`
--
CREATE DATABASE IF NOT EXISTS `soulforge_zombies` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `soulforge_zombies`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `premium` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `namechosen` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `guild` int(11) NOT NULL DEFAULT '0',
  `guildRank` int(11) NOT NULL DEFAULT '0',
  `vaultCount` int(11) NOT NULL DEFAULT '1',
  `maxCharSlot` int(11) NOT NULL DEFAULT '1',
  `craftingRecipes` varchar(535) NOT NULL DEFAULT '1',
  `ownedSkins` varchar(535) NOT NULL,
  `regTime` datetime NOT NULL,
  `guest` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accId` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `skinType` int(11) NOT NULL DEFAULT '-1',
  `level` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `fame` int(11) NOT NULL,
  `items` varchar(128) NOT NULL,
  `backpack1` varchar(512) NOT NULL DEFAULT '65535,65535,65535,65535,65535,65535,65535,65535',
  `backpack2` varchar(512) NOT NULL DEFAULT '65535,65535,65535,65535,65535,65535,65535,65535',
  `backpacks` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL,
  `mp` int(11) NOT NULL,
  `stats` varchar(64) NOT NULL,
  `dead` tinyint(1) NOT NULL,
  `tex1` int(11) NOT NULL DEFAULT '0',
  `tex2` int(11) NOT NULL DEFAULT '0',
  `pet` int(11) NOT NULL,
  `fameStats` varchar(128) NOT NULL DEFAULT 'eNoVytkRgCAMRdGH4IIbgmsPdmNVNmZf5n7kzM0kksLjJN2V4b30vcHK1YYam9hCxxqh5zpQI0wwQ4IFMhRYYeNjpw444YIfA3kDIA',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deathTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `totalFame` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `classstats`
--

CREATE TABLE IF NOT EXISTS `classstats` (
  `accId` int(11) NOT NULL,
  `objType` int(11) NOT NULL,
  `bestLv` int(11) NOT NULL,
  `bestFame` int(11) NOT NULL,
  PRIMARY KEY (`accId`,`objType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `death`
--

CREATE TABLE IF NOT EXISTS `death` (
  `accId` int(11) NOT NULL,
  `chrId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `charType` int(11) NOT NULL,
  `tex1` int(11) NOT NULL DEFAULT '0',
  `tex2` int(11) NOT NULL DEFAULT '0',
  `items` varchar(128) NOT NULL,
  `fame` int(11) NOT NULL,
  `fameStats` varchar(128) NOT NULL,
  `totalFame` int(11) NOT NULL,
  `firstBorn` tinyint(1) NOT NULL,
  `killer` varchar(128) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`accId`,`chrId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(16) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` varchar(128) NOT NULL,
  `link` varchar(256) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `accId` int(11) NOT NULL,
  `fame` int(11) NOT NULL,
  `totalFame` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `totalCredits` int(11) NOT NULL,
  PRIMARY KEY (`accId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vaults`
--

CREATE TABLE IF NOT EXISTS `vaults` (
  `accId` int(11) NOT NULL,
  `chestId` int(11) NOT NULL AUTO_INCREMENT,
  `items` varchar(128) NOT NULL,
  PRIMARY KEY (`accId`,`chestId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Tabellenstruktur für Tabelle `craftingrecipes`
--

CREATE TABLE IF NOT EXISTS `craftingrecipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row1` varchar(512) NOT NULL,
  `row2` varchar(512) NOT NULL,
  `row3` varchar(512) NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Tabellenstruktur für Tabelle `sprites`
--

CREATE TABLE IF NOT EXISTS `sprites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(128) NOT NULL,
  `name` varchar(256) NOT NULL,
  `dataType` int(11) NOT NULL,
  `tags` text NOT NULL,
  `data` longblob NOT NULL,
  `fileSize` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tabellenstruktur für Tabelle `fpcpacks`
--

CREATE TABLE IF NOT EXISTS `fpcpacks` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `accId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `contents` text NOT NULL,
  `used` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
