-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Out 19, 2016 as 10:41 
-- Versão do Servidor: 5.1.41
-- Versão do PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `baiak`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `page_lastday` int(11) NOT NULL,
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `vip_days` int(11) NOT NULL DEFAULT '0',
  `viptime` int(11) NOT NULL DEFAULT '0',
  `vipdays` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=877076 ;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `vip_time`, `page_lastday`, `email_new`, `email_new_time`, `created`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `vote`, `vip_days`, `viptime`, `vipdays`, `last_post`, `flag`) VALUES
(1, '1', '356a192b7913b04c54574d18c28d46e6395428ab', 65535, 0, '', 'b6589fc6ab0dc82cf120', 0, 0, 1, 0, 1476821638, '', 0, 0, '', '', 2, '0', 0, 0, 0, 0, 0, 0, 0, '');

--
-- Gatilhos `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `account_viplist`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
--

CREATE TABLE IF NOT EXISTS `auction_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `auction_system`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `bans`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `deaths_in_wars`
--

CREATE TABLE IF NOT EXISTS `deaths_in_wars` (
  `guild_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `killer_guild` int(11) NOT NULL,
  `killer` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `result1` int(11) NOT NULL,
  `result2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `deaths_in_wars`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `environment_killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `world_id`, `value`) VALUES
(2147483647, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `invited_to` int(11) NOT NULL,
  `invited_by` int(11) NOT NULL,
  `in_war_with` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `show` smallint(1) NOT NULL,
  `war_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `guilds`
--

INSERT INTO `guilds` (`id`, `world_id`, `name`, `ownerid`, `creationdata`, `checkdata`, `motd`, `balance`, `description`, `logo_gfx_name`, `invited_to`, `invited_by`, `in_war_with`, `kills`, `show`, `war_time`) VALUES
(1, 0, 'Huheuhe', 9, 1474834214, 1476648302, 'Your guild has been successfully created, to view all available commands type: !commands. If you would like to remove this message use !cleanmotd and to set new motd use !setmotd text.', 0, '', '', 0, 0, 0, 0, 0, 0);

--
-- Gatilhos `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
        UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `guild_invites`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE IF NOT EXISTS `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_kills_ibfk_1` (`war_id`),
  KEY `guild_kills_ibfk_2` (`death_id`),
  KEY `guild_kills_ibfk_3` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `guild_kills`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `guild_ranks`
--

INSERT INTO `guild_ranks` (`id`, `guild_id`, `name`, `level`) VALUES
(1, 1, 'Leader', 3),
(2, 1, 'Vice-Leader', 2),
(3, 1, 'Member', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `guild_wars`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Tower 1', 1, 81, 7740000, 0, 0, 4, 86, 0, 0),
(2, 0, 0, 0, 0, 0, '', 0, 56, 5670000, 0, 3, 4, 63, 0, 0),
(3, 0, 0, 0, 0, 0, 'Small Street IV', 1, 19, 2340000, 0, 1, 2, 26, 0, 0),
(4, 0, 0, 0, 0, 0, '', 0, 71, 8460000, 0, 3, 2, 94, 0, 0),
(5, 0, 0, 0, 0, 0, '', 0, 67, 8460000, 0, 3, 4, 94, 0, 0),
(6, 0, 0, 0, 0, 0, '', 0, 57, 6660000, 0, 2, 4, 74, 0, 0),
(7, 0, 0, 0, 0, 0, '', 0, 66, 9090000, 0, 2, 2, 101, 0, 0),
(8, 0, 0, 0, 0, 0, 'Pirate Street', 0, 44, 5490000, 0, 0, 4, 61, 0, 0),
(9, 0, 0, 0, 0, 0, '', 0, 50, 6930000, 0, 0, 2, 77, 0, 0),
(10, 0, 0, 0, 0, 0, '', 0, 19, 1890000, 0, 1, 2, 21, 0, 0),
(11, 0, 0, 0, 0, 0, '', 0, 26, 2610000, 0, 1, 2, 29, 0, 0),
(12, 0, 0, 0, 0, 0, 'Cemetery house 1', 1, 59, 1980000, 1980000, 1, 2, 99, 0, 0),
(13, 0, 0, 0, 0, 0, 'Cemetery house 2', 1, 76, 2620000, 2620000, 2, 2, 131, 0, 0),
(14, 0, 0, 0, 0, 0, '', 0, 119, 11340000, 0, 3, 4, 126, 0, 0),
(15, 0, 0, 0, 0, 0, '', 0, 76, 7290000, 0, 3, 2, 81, 0, 0),
(16, 0, 0, 0, 0, 0, 'Frozen Ville 1', 2, 16, 840000, 840000, 1, 4, 42, 0, 0),
(17, 0, 0, 0, 0, 0, 'Frozen Ville 2', 2, 24, 1120000, 1120000, 1, 2, 56, 0, 0),
(18, 0, 0, 0, 0, 0, 'Frozen Ville 3', 2, 14, 600000, 600000, 1, 2, 30, 0, 0),
(19, 0, 0, 0, 0, 0, 'Frozen Ville 4', 2, 17, 840000, 840000, 1, 4, 42, 0, 0),
(20, 0, 0, 0, 0, 0, 'Frozen Ville 5', 2, 21, 960000, 960000, 1, 2, 48, 0, 0),
(21, 0, 0, 0, 0, 0, 'Frozen Ville 6', 2, 69, 2520000, 2520000, 1, 2, 126, 0, 0),
(22, 0, 0, 0, 0, 0, 'Frozen Ville 7', 2, 68, 2520000, 2520000, 1, 2, 126, 0, 0),
(23, 0, 0, 0, 0, 0, 'Frozen Ville 8', 2, 66, 2520000, 2520000, 1, 2, 126, 0, 0),
(24, 0, 0, 0, 0, 0, 'Frozen Ville 9', 2, 40, 1680000, 1680000, 1, 0, 84, 0, 0),
(25, 0, 0, 0, 0, 0, 'Great Street I', 1, 18, 2250000, 0, 1, 2, 25, 0, 0),
(26, 0, 0, 0, 0, 0, 'Great Street II', 1, 28, 3060000, 0, 1, 2, 34, 0, 0),
(27, 0, 0, 0, 0, 0, 'Frozen Ville 12', 2, 28, 1120000, 1120000, 1, 2, 56, 0, 0),
(28, 0, 0, 0, 0, 0, 'Frozen Frost House', 2, 24, 1080000, 1080000, 1, 4, 54, 0, 0),
(29, 0, 0, 0, 0, 0, 'Frozen First ville', 2, 56, 2280000, 2280000, 1, 2, 114, 0, 0),
(30, 0, 0, 0, 0, 0, 'North Ville 1', 1, 78, 3040000, 3040000, 3, 0, 152, 0, 0),
(31, 0, 0, 0, 0, 0, 'River Street IV', 1, 23, 3420000, 0, 2, 2, 38, 0, 0),
(32, 0, 0, 0, 0, 0, 'River Street V', 1, 18, 2880000, 0, 2, 2, 32, 0, 0),
(33, 0, 0, 0, 0, 0, 'River Street VI', 1, 28, 4140000, 0, 2, 2, 46, 0, 0),
(34, 0, 0, 0, 0, 0, '', 0, 32, 2970000, 0, 1, 0, 33, 0, 0),
(35, 0, 0, 0, 0, 0, 'Principal Street 6', 1, 63, 2220000, 2220000, 1, 0, 111, 0, 0),
(36, 0, 0, 0, 0, 0, 'Principal Street 8', 1, 56, 2380000, 2380000, 1, 8, 119, 0, 0),
(37, 0, 0, 0, 0, 0, 'Demon Street 1', 1, 33, 1260000, 1260000, 1, 2, 63, 0, 0),
(38, 0, 0, 0, 0, 0, 'Upper Street II', 1, 10, 1350000, 0, 2, 2, 15, 0, 0),
(39, 0, 0, 0, 0, 0, 'Upper Street III', 1, 13, 1620000, 0, 1, 2, 18, 0, 0),
(40, 0, 0, 0, 0, 0, 'Upper Street IV', 1, 20, 2520000, 0, 2, 2, 28, 0, 0),
(41, 0, 0, 0, 0, 0, 'Upper Street V', 1, 23, 2520000, 0, 1, 2, 28, 0, 0),
(42, 0, 0, 0, 0, 0, 'Heavy Depot House', 1, 19, 2160000, 0, 1, 2, 24, 0, 0),
(43, 0, 0, 0, 0, 0, 'Heavy Depot House II', 1, 38, 3960000, 0, 1, 2, 44, 0, 0),
(44, 0, 0, 0, 0, 0, 'Small Street V', 1, 26, 2880000, 0, 1, 2, 32, 0, 0),
(45, 0, 0, 0, 0, 0, 'Small Street VI', 1, 10, 1260000, 0, 1, 2, 14, 0, 0),
(46, 0, 0, 0, 0, 0, 'Small Street VII', 1, 14, 1710000, 0, 1, 2, 19, 0, 0),
(47, 0, 0, 0, 0, 0, 'Demon Street 6', 1, 30, 1540000, 1540000, 1, 4, 77, 0, 0),
(48, 0, 0, 0, 0, 0, 'Demon Street 7', 1, 27, 1160000, 1160000, 1, 2, 58, 0, 0),
(49, 0, 0, 0, 0, 0, 'HouseShop 1', 1, 14, 720000, 720000, 1, 2, 36, 0, 0),
(50, 0, 0, 0, 0, 0, 'Cemetery Village #1', 1, 101, 2900000, 2900000, 2, 6, 145, 0, 0),
(51, 0, 0, 0, 0, 0, 'Principal Street 1', 1, 83, 2900000, 2900000, 1, 4, 145, 0, 0),
(52, 0, 0, 0, 0, 0, 'Safe House I', 1, 14, 1800000, 0, 1, 2, 20, 0, 0),
(53, 0, 0, 0, 0, 0, 'Safe House II', 1, 6, 990000, 0, 1, 2, 11, 0, 0),
(54, 0, 0, 0, 0, 0, 'Safe House III', 1, 8, 1170000, 0, 1, 2, 13, 0, 0),
(55, 0, 0, 0, 0, 0, 'Safe House IV', 1, 6, 990000, 0, 1, 2, 11, 0, 0),
(56, 0, 0, 0, 0, 0, 'Port house I', 1, 15, 1710000, 0, 1, 2, 19, 0, 0),
(57, 0, 0, 0, 0, 0, 'Port house II', 1, 13, 1620000, 0, 1, 2, 18, 0, 0),
(58, 0, 0, 0, 0, 0, 'Principal Street 4', 1, 19, 900000, 900000, 1, 2, 45, 0, 0),
(59, 0, 0, 0, 0, 0, 'Hydraland I', 3, 30, 2790000, 0, 0, 0, 31, 0, 0),
(60, 0, 0, 0, 0, 0, 'Hydraland II', 3, 30, 2790000, 0, 0, 0, 31, 0, 0),
(61, 0, 0, 0, 0, 0, 'Hydraland III', 3, 42, 3870000, 0, 0, 0, 43, 0, 0),
(62, 0, 0, 0, 0, 0, 'Hydraland IV', 3, 42, 3870000, 0, 0, 0, 43, 0, 0),
(63, 0, 0, 0, 0, 0, 'Hydraland V', 3, 30, 2790000, 0, 0, 0, 31, 0, 0),
(64, 0, 0, 0, 0, 0, 'Hydraland VI', 3, 15, 1440000, 0, 1, 0, 16, 0, 0),
(65, 0, 0, 0, 0, 0, 'Hydraland VII', 3, 15, 1440000, 0, 1, 0, 16, 0, 0),
(66, 0, 0, 0, 0, 0, 'Hydraland VIII', 3, 27, 2610000, 0, 1, 0, 29, 0, 0),
(67, 0, 0, 0, 0, 0, 'Jungle #3', 3, 38, 1680000, 1680000, 1, 2, 84, 0, 0),
(68, 0, 0, 0, 0, 0, 'Desert Ville #1', 1, 37, 1420000, 1420000, 1, 2, 71, 0, 0),
(69, 0, 0, 0, 0, 0, 'Desert Ville #2', 1, 18, 840000, 840000, 0, 2, 42, 0, 0),
(70, 0, 0, 0, 0, 0, 'Liberty Bay I', 2, 37, 3510000, 0, 0, 0, 39, 0, 0),
(71, 0, 0, 0, 0, 0, 'Liberty Bay II', 2, 37, 3510000, 0, 0, 0, 39, 0, 0),
(72, 0, 0, 0, 0, 0, 'Liberty Bay III', 2, 0, 90000, 0, 0, 0, 1, 0, 0),
(73, 0, 0, 0, 0, 0, 'Liberty Bay IV', 2, 37, 3510000, 0, 0, 0, 39, 0, 0),
(74, 0, 0, 0, 0, 0, 'Liberty Bay V', 2, 0, 180000, 0, 0, 0, 2, 0, 0),
(75, 0, 0, 0, 0, 0, 'Liberty Bay VI', 2, 37, 3690000, 0, 1, 0, 41, 0, 0),
(76, 0, 0, 0, 0, 0, 'Liberty Bay VII', 2, 33, 3150000, 0, 0, 0, 35, 0, 0),
(77, 0, 0, 0, 0, 0, 'Liberty Bay VIII', 2, 26, 2430000, 0, 0, 0, 27, 0, 0),
(78, 0, 0, 0, 0, 0, 'Liberty Bay IX', 2, 33, 3150000, 0, 0, 0, 35, 0, 0),
(79, 0, 0, 0, 0, 0, 'Liberty Bay X', 2, 33, 3150000, 0, 0, 0, 35, 0, 0),
(80, 0, 0, 0, 0, 0, 'Liberty Bay XI', 2, 33, 3150000, 0, 0, 0, 35, 0, 0),
(81, 0, 0, 0, 0, 0, 'Liberty Bay XII', 2, 26, 2430000, 0, 0, 0, 27, 0, 0),
(82, 0, 0, 0, 0, 0, 'Liberty Bay XIII', 2, 33, 3150000, 0, 0, 0, 35, 0, 0),
(83, 0, 0, 0, 0, 0, 'Liberty Bay XIV', 2, 21, 1980000, 0, 0, 0, 22, 0, 0),
(84, 0, 0, 0, 0, 0, 'Liberty Bay XV', 2, 23, 2250000, 0, 0, 0, 25, 0, 0),
(85, 0, 0, 0, 0, 0, 'Liberty Bay XVI', 2, 18, 1710000, 0, 0, 0, 19, 0, 0),
(86, 0, 0, 0, 0, 0, 'Desert Ville #29', 1, 47, 1440000, 1440000, 1, 2, 72, 0, 0),
(87, 0, 0, 0, 0, 0, 'Desert Ville #30', 1, 47, 1440000, 1440000, 1, 2, 72, 0, 0),
(88, 0, 0, 0, 0, 0, 'Desert Ville #31', 1, 47, 1440000, 1440000, 1, 2, 72, 0, 0),
(89, 0, 0, 0, 0, 0, 'Favela House I', 1, 26, 2790000, 0, 1, 2, 31, 0, 0),
(90, 0, 0, 0, 0, 0, 'Favela House II', 1, 26, 2880000, 0, 1, 2, 32, 0, 0),
(91, 0, 0, 0, 0, 0, 'Favela House III', 1, 40, 4050000, 0, 1, 2, 45, 0, 0),
(92, 0, 0, 0, 0, 0, 'Favela House IV', 1, 26, 2790000, 0, 1, 2, 31, 0, 0),
(93, 0, 0, 0, 0, 0, 'Favela House V', 1, 10, 1350000, 0, 1, 2, 15, 0, 0),
(94, 0, 0, 0, 0, 0, 'Desert Ville #37', 1, 10, 560000, 560000, 1, 2, 28, 0, 0),
(95, 0, 0, 0, 0, 0, 'Baiak City 1', 4, 44, 4320000, 0, 1, 0, 48, 0, 0),
(96, 0, 0, 0, 0, 0, 'Baiak City 2', 4, 63, 5940000, 0, 1, 0, 66, 0, 0),
(97, 0, 0, 0, 0, 0, 'Baiak City 3', 4, 63, 5940000, 0, 1, 0, 66, 0, 0),
(98, 0, 0, 0, 0, 0, 'Baiak City 4', 4, 72, 6750000, 0, 1, 0, 75, 0, 0),
(99, 0, 0, 0, 0, 0, 'Baiak City 5', 4, 72, 6840000, 0, 1, 0, 76, 0, 0),
(100, 0, 0, 0, 0, 0, 'Baiak City 6', 4, 60, 5490000, 0, 1, 0, 61, 0, 0),
(101, 0, 0, 0, 0, 0, 'Baiak City 7', 4, 56, 5760000, 0, 1, 0, 64, 0, 0),
(102, 0, 0, 0, 0, 0, 'Baiak City 8', 4, 69, 6570000, 0, 1, 0, 73, 0, 0),
(103, 0, 0, 0, 0, 0, 'Baiak City 9', 4, 128, 13590000, 0, 1, 0, 151, 0, 0),
(104, 0, 0, 0, 0, 0, 'Baiak City 10', 4, 64, 6030000, 0, 1, 0, 67, 0, 0),
(105, 0, 0, 0, 0, 0, 'Baiak City 11', 4, 60, 6030000, 0, 1, 0, 67, 0, 0),
(106, 0, 0, 0, 0, 0, 'Baiak City 12', 4, 64, 6390000, 0, 1, 0, 71, 0, 0),
(107, 0, 0, 0, 0, 0, 'Desert Ville #25', 1, 20, 720000, 720000, 1, 2, 36, 0, 0),
(108, 0, 0, 0, 0, 0, 'GuildHall 1''', 1, 17, 2160000, 0, 2, 2, 24, 0, 0),
(109, 0, 0, 0, 0, 0, 'Baiak Yurots House 3', 1, 38, 4680000, 0, 2, 2, 52, 0, 0),
(110, 0, 0, 0, 0, 0, 'Biggest Guild Hall', 1, 104, 5120000, 5120000, 10, 6, 256, 0, 0),
(111, 0, 0, 0, 0, 0, 'Baiak Yurots House 5', 1, 30, 3150000, 0, 1, 2, 35, 0, 0),
(112, 0, 0, 0, 0, 0, 'Favela House 2', 1, 51, 5040000, 0, 1, 2, 56, 0, 0),
(113, 0, 0, 0, 0, 0, 'BaiakHouse 17', 0, 16, 1980000, 0, 1, 2, 22, 0, 0),
(114, 0, 0, 0, 0, 0, 'BaiakHouse 16', 0, 28, 2880000, 0, 1, 2, 32, 0, 0),
(115, 0, 0, 0, 0, 0, 'BaiakHouse 15', 0, 22, 2340000, 0, 1, 2, 26, 0, 0),
(116, 0, 0, 0, 0, 0, 'BaiakHouse 14', 0, 28, 2970000, 0, 1, 2, 33, 0, 0),
(117, 0, 0, 0, 0, 0, 'Temple Ville #7', 1, 38, 1720000, 1720000, 2, 0, 86, 0, 0),
(118, 0, 0, 0, 0, 0, 'BaiakHouse 13', 0, 82, 9090000, 0, 1, 2, 101, 0, 0),
(119, 0, 0, 0, 0, 0, 'BaiakHouse 12', 0, 62, 6390000, 0, 1, 2, 71, 0, 0),
(120, 0, 0, 0, 0, 0, 'BaiakHouse 11', 0, 62, 6480000, 0, 1, 2, 72, 0, 0),
(121, 0, 0, 0, 0, 0, 'BaiakHouse 8', 0, 68, 6570000, 0, 1, 2, 73, 0, 0),
(122, 0, 0, 0, 0, 0, 'BaiakHouse 7', 0, 70, 6750000, 0, 0, 2, 75, 0, 0),
(123, 0, 0, 0, 0, 0, 'BaiakHouse 6', 0, 54, 5400000, 0, 1, 2, 60, 0, 0),
(124, 0, 0, 0, 0, 0, 'BaiakHouse 5', 0, 54, 5310000, 0, 1, 2, 59, 0, 0),
(126, 0, 0, 0, 0, 0, 'River Street Max', 1, 33, 4770000, 0, 2, 2, 53, 0, 0),
(143, 0, 0, 0, 0, 0, 'AP 1', 1, 47, 4860000, 0, 1, 2, 54, 0, 0),
(144, 0, 0, 0, 0, 0, 'AP 2', 1, 41, 4860000, 0, 1, 8, 54, 0, 0),
(145, 0, 0, 0, 0, 0, 'AP 3', 1, 45, 4860000, 0, 1, 4, 54, 0, 0),
(146, 0, 0, 0, 0, 0, 'AP 4', 1, 45, 4860000, 0, 1, 4, 54, 0, 0),
(148, 0, 0, 0, 0, 0, 'AP 5', 1, 47, 4860000, 0, 1, 2, 54, 0, 0),
(149, 0, 0, 0, 0, 0, 'AP 6', 1, 45, 5490000, 0, 1, 4, 61, 0, 0),
(150, 0, 0, 0, 0, 0, 'AP 7', 1, 45, 4950000, 0, 1, 4, 55, 0, 0),
(151, 0, 0, 0, 0, 0, 'AP 8', 1, 47, 4860000, 0, 1, 2, 54, 0, 0),
(152, 0, 0, 0, 0, 0, 'AP 9', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(153, 0, 0, 0, 0, 0, 'AP 10', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(154, 0, 0, 0, 0, 0, 'AP 11', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(155, 0, 0, 0, 0, 0, 'AP 12', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(156, 0, 0, 0, 0, 0, 'AP 13', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(157, 0, 0, 0, 0, 0, 'AP 14', 1, 7, 1350000, 0, 1, 2, 15, 0, 0),
(158, 0, 0, 0, 0, 0, 'AP 15', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(159, 0, 0, 0, 0, 0, 'AP 16', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(161, 0, 0, 0, 0, 0, 'BaiakHouse 10', 0, 7, 1350000, 0, 1, 2, 15, 0, 0),
(162, 0, 0, 0, 0, 0, 'BaiakHouse 9', 0, 47, 4680000, 0, 1, 2, 52, 0, 0),
(163, 0, 0, 0, 0, 0, 'AP 17', 1, 46, 7200000, 0, 1, 0, 80, 0, 0),
(164, 0, 0, 0, 0, 0, 'AP 18', 1, 86, 10170000, 0, 2, 0, 113, 0, 0),
(165, 0, 0, 0, 0, 0, 'Unnamed House #165', 1, 16, 1440000, 0, 0, 0, 16, 0, 0),
(171, 0, 0, 0, 0, 0, 'VilaHouse 1', 1, 49, 7290000, 0, 8, 0, 81, 0, 0),
(174, 0, 0, 0, 0, 0, 'VilaHouse 2', 1, 49, 7380000, 0, 5, 0, 82, 0, 0),
(175, 0, 0, 0, 0, 0, 'VilaHouse 3', 1, 49, 7290000, 0, 6, 0, 81, 0, 0),
(176, 0, 0, 0, 0, 0, 'VilaHouse 4', 1, 190, 27540000, 0, 15, 4, 306, 0, 0),
(178, 0, 0, 0, 0, 0, 'VilaHouse 5', 1, 94, 12870000, 0, 9, 2, 143, 0, 0),
(179, 0, 0, 0, 0, 0, 'VilaHouse 6', 1, 94, 11700000, 0, 5, 2, 130, 0, 0),
(180, 0, 0, 0, 0, 0, 'VilaHouse 7', 1, 94, 11340000, 0, 6, 2, 126, 0, 0),
(181, 0, 0, 0, 0, 0, 'VilaHouse 8', 1, 94, 13680000, 0, 7, 2, 152, 0, 0),
(182, 0, 0, 0, 0, 0, 'BaiakHouse 18', 1, 45, 5760000, 0, 1, 4, 64, 0, 0),
(183, 0, 0, 0, 0, 0, 'BaiakHouse 19', 1, 47, 6390000, 0, 1, 0, 71, 0, 0),
(184, 0, 0, 0, 0, 0, 'VilaHouse 19', 1, 23, 3060000, 0, 1, 0, 34, 0, 0),
(185, 0, 0, 0, 0, 0, 'VilaHouse 20', 1, 19, 3690000, 0, 1, 0, 41, 0, 0),
(186, 0, 0, 0, 0, 0, 'VilaHouse 21', 1, 26, 5310000, 0, 1, 0, 59, 0, 0),
(187, 0, 0, 0, 0, 0, 'BaiakHouse 20', 1, 18, 2700000, 0, 1, 2, 30, 0, 0),
(188, 0, 0, 0, 0, 0, 'BaiakHouse 21', 1, 18, 2790000, 0, 1, 2, 31, 0, 0),
(191, 0, 0, 0, 0, 0, 'IceHouse 1', 1, 47, 5760000, 0, 1, 2, 64, 0, 0),
(192, 0, 0, 0, 0, 0, 'Unnamed House #192', 4, 47, 5760000, 0, 3, 2, 64, 0, 0),
(193, 0, 0, 0, 0, 0, 'AP 19', 1, 4, 1620000, 0, 1, 2, 18, 0, 0),
(194, 0, 0, 0, 0, 0, 'AP 20', 1, 6, 1620000, 0, 1, 2, 18, 0, 0),
(195, 0, 0, 0, 0, 0, 'BaiakHouse 22', 1, 31, 4410000, 0, 2, 2, 49, 0, 0),
(196, 0, 0, 0, 0, 0, 'BaiakHouse 23', 1, 10, 1800000, 0, 1, 2, 20, 0, 0),
(199, 0, 0, 0, 0, 0, 'Ice House 2', 1, 45, 5760000, 0, 3, 4, 64, 0, 0),
(200, 0, 0, 0, 0, 0, 'Ice House 3', 1, 31, 4320000, 0, 1, 4, 48, 0, 0),
(208, 0, 0, 0, 0, 0, 'AP 21', 1, 10, 1800000, 0, 1, 2, 20, 0, 0),
(209, 0, 0, 0, 0, 0, 'AP 22', 1, 7, 1080000, 0, 1, 2, 12, 0, 0),
(210, 0, 0, 0, 0, 0, 'AP 23', 1, 9, 1890000, 0, 0, 2, 21, 0, 0),
(211, 0, 0, 0, 0, 0, 'BaiakHouse 24', 1, 12, 1440000, 0, 1, 0, 16, 0, 0),
(212, 0, 0, 0, 0, 0, 'BaiakHouse 25', 1, 12, 1440000, 0, 1, 0, 16, 0, 0),
(215, 0, 0, 0, 0, 0, 'BaiakHouse 26', 1, 20, 3240000, 0, 1, 2, 36, 0, 0),
(216, 0, 0, 0, 0, 0, 'BaiakHouse 27', 1, 14, 1800000, 0, 1, 2, 20, 0, 0),
(217, 0, 0, 0, 0, 0, 'BaiakHouse 28', 1, 9, 1080000, 0, 1, 0, 12, 0, 0),
(218, 0, 0, 0, 0, 0, 'BaiakHouse 29', 1, 19, 1980000, 0, 1, 2, 22, 0, 0),
(219, 0, 0, 0, 0, 0, 'BaiakHouse 30', 1, 28, 2790000, 0, 1, 2, 31, 0, 0),
(220, 0, 0, 0, 0, 0, 'BaiakHouse 31', 1, 10, 1530000, 0, 1, 2, 17, 0, 0),
(221, 0, 0, 0, 0, 0, 'BoatHouse 1', 1, 15, 3150000, 0, 1, 0, 35, 0, 0),
(222, 0, 0, 0, 0, 0, 'AP 24', 1, 49, 8640000, 0, 6, 0, 96, 0, 0),
(223, 0, 0, 0, 0, 0, 'VilaHouse 22', 1, 45, 5760000, 0, 1, 4, 64, 0, 0),
(224, 0, 0, 0, 0, 0, 'VilaHouse 23', 1, 47, 5850000, 0, 1, 2, 65, 0, 0),
(225, 0, 0, 0, 0, 0, 'VilaHouse 24', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(226, 0, 0, 0, 0, 0, 'VilaHouse 25', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(227, 0, 0, 0, 0, 0, 'VilaHouse 26', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(228, 0, 0, 0, 0, 0, 'VilaHouse 27', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(229, 0, 0, 0, 0, 0, 'VilaHouse 28', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(230, 0, 0, 0, 0, 0, 'VilaHouse 29', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(231, 0, 0, 0, 0, 0, 'VilaHouse 30', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(232, 0, 0, 0, 0, 0, 'VilaHouse 31', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(233, 0, 0, 0, 0, 0, 'Vila House 32', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(234, 0, 0, 0, 0, 0, 'Vila House 33', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(235, 0, 0, 0, 0, 0, 'VilaHouse 34', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(236, 0, 0, 0, 0, 0, 'VilaHouse 35', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(237, 0, 0, 0, 0, 0, 'VilaHouse 36', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(238, 0, 0, 0, 0, 0, 'VilaHouse 37', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(239, 0, 0, 0, 0, 0, 'VilaHouse 38', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(240, 0, 0, 0, 0, 0, 'VilaHouse 39', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(241, 0, 0, 0, 0, 0, 'VilaHouse 40', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(242, 0, 0, 0, 0, 0, 'VilaHouse 41', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(243, 0, 0, 0, 0, 0, 'VilaHouse 42', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(244, 0, 0, 0, 0, 0, 'VilaHouse 43', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(245, 0, 0, 0, 0, 0, 'VilaHouse 44', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(246, 0, 0, 0, 0, 0, 'VilaHouse 45', 1, 49, 7290000, 0, 7, 0, 81, 0, 0),
(247, 0, 0, 0, 0, 0, 'BaiakHouse 32', 1, 22, 4500000, 0, 1, 0, 50, 0, 0),
(248, 0, 0, 0, 0, 0, 'Temple House II', 1, 16, 3420000, 0, 1, 2, 38, 0, 0),
(249, 0, 0, 0, 0, 0, 'AP 25', 1, 46, 7470000, 0, 7, 0, 83, 0, 0),
(250, 0, 0, 0, 0, 0, 'BaiakHouse1', 1, 28, 3780000, 0, 2, 2, 42, 0, 0),
(251, 0, 0, 0, 0, 0, 'BaiakHouse2', 1, 22, 3150000, 0, 2, 2, 35, 0, 0),
(253, 0, 0, 0, 0, 0, 'BaiakHouse3', 1, 16, 2520000, 0, 1, 2, 28, 0, 0),
(254, 0, 0, 0, 0, 0, 'BaiakHouse4', 1, 16, 2520000, 0, 1, 2, 28, 0, 0),
(255, 0, 0, 0, 0, 0, 'Donate House 1', 6, 37, 5040000, 0, 1, 2, 56, 0, 0),
(256, 0, 0, 0, 0, 0, 'Donate GuildHouse1', 6, 472, 56340000, 0, 6, 20, 626, 0, 0),
(257, 0, 0, 0, 0, 0, 'Donate House 2', 6, 105, 12510000, 0, 2, 2, 139, 0, 0),
(258, 0, 0, 0, 0, 0, 'Donate House 3', 6, 34, 4410000, 0, 1, 2, 49, 0, 0),
(259, 0, 0, 0, 0, 0, 'Donate House 4', 6, 80, 9630000, 0, 1, 4, 107, 0, 0),
(260, 0, 0, 0, 0, 0, 'Donate House 5', 6, 98, 12150000, 0, 1, 2, 135, 0, 0),
(261, 0, 0, 0, 0, 0, 'Donate House 7', 6, 91, 11250000, 0, 2, 4, 125, 0, 0),
(262, 0, 0, 0, 0, 0, 'Donate House 8', 6, 157, 20700000, 0, 3, 8, 230, 0, 0),
(263, 0, 0, 0, 0, 0, 'Donate House 9', 6, 153, 18720000, 0, 2, 4, 208, 0, 0),
(264, 0, 0, 0, 0, 0, 'Donate House 10', 6, 74, 10440000, 0, 2, 4, 116, 0, 0),
(265, 0, 0, 0, 0, 0, 'Donate House 11', 6, 35, 5130000, 0, 2, 4, 57, 0, 0),
(266, 0, 0, 0, 0, 0, 'Donate House 6', 6, 103, 13860000, 0, 2, 4, 154, 0, 0),
(267, 0, 0, 0, 0, 0, 'Mansao Donate 1', 6, 261, 35010000, 0, 3, 4, 389, 0, 0),
(268, 0, 0, 0, 0, 0, 'Donate House 12', 6, 117, 13320000, 0, 1, 2, 148, 0, 0),
(269, 0, 0, 0, 0, 0, 'Donate House 13', 6, 127, 13950000, 0, 1, 2, 155, 0, 0),
(270, 0, 0, 0, 0, 0, 'Donate House 14', 6, 145, 15480000, 0, 1, 2, 172, 0, 0),
(271, 0, 0, 0, 0, 0, 'Donate House 15', 6, 114, 14400000, 0, 2, 4, 160, 0, 0),
(272, 0, 0, 0, 0, 0, 'Donate House 16', 6, 83, 11250000, 0, 3, 4, 125, 0, 0),
(273, 0, 0, 0, 0, 0, 'Donate House 17', 6, 41, 5580000, 0, 1, 4, 62, 0, 0),
(274, 0, 0, 0, 0, 0, 'Donate House 18', 6, 34, 4590000, 0, 1, 2, 51, 0, 0),
(275, 0, 0, 0, 0, 0, 'Donate House 19', 6, 19, 2970000, 0, 1, 2, 33, 0, 0),
(276, 0, 0, 0, 0, 0, 'Donate House 20', 6, 10, 1800000, 0, 1, 2, 20, 0, 0),
(277, 0, 0, 0, 0, 0, 'Donate House 21', 6, 28, 3960000, 0, 1, 2, 44, 0, 0),
(278, 0, 0, 0, 0, 0, 'Donate House 22', 6, 46, 6930000, 0, 2, 4, 77, 0, 0),
(279, 0, 0, 0, 0, 0, 'Donate House 23', 6, 12, 2160000, 0, 1, 2, 24, 0, 0),
(280, 0, 0, 0, 0, 0, 'Donate House 24', 6, 30, 4050000, 0, 1, 2, 45, 0, 0),
(282, 0, 0, 0, 0, 0, 'Donate House 25', 6, 38, 5400000, 0, 1, 4, 60, 0, 0),
(283, 0, 0, 0, 0, 0, 'Donate House 26', 6, 49, 7020000, 0, 2, 4, 78, 0, 0),
(284, 0, 0, 0, 0, 0, 'Donate House 27', 6, 32, 5130000, 0, 2, 4, 57, 0, 0),
(285, 0, 0, 0, 0, 0, 'Donate House 28', 6, 91, 10980000, 0, 2, 4, 122, 0, 0),
(286, 0, 0, 0, 0, 0, 'Donate House 29', 6, 189, 20970000, 0, 3, 6, 233, 0, 0),
(287, 0, 0, 0, 0, 0, 'Donate House 30', 6, 30, 4140000, 0, 1, 2, 46, 0, 0),
(288, 0, 0, 0, 0, 0, 'Donate House 31', 6, 78, 9900000, 0, 1, 8, 110, 0, 0),
(289, 0, 0, 0, 0, 0, 'Donate House 32', 6, 44, 6480000, 0, 2, 4, 72, 0, 0),
(290, 0, 0, 0, 0, 0, 'Donate House 33', 6, 43, 6930000, 0, 1, 2, 77, 0, 0),
(291, 0, 0, 0, 0, 0, 'Donate House 34', 6, 45, 6840000, 0, 1, 2, 76, 0, 0),
(292, 0, 0, 0, 0, 0, 'Donate House 35', 6, 51, 6660000, 0, 1, 4, 74, 0, 0),
(293, 0, 0, 0, 0, 0, 'Donate House 36', 6, 69, 9270000, 0, 2, 6, 103, 0, 0),
(611, 0, 0, 0, 0, 0, '', 0, 37, 15300000, 0, 0, 0, 170, 0, 0),
(1378, 0, 0, 0, 0, 0, '', 0, 18, 1620000, 0, 0, 0, 18, 0, 0),
(1379, 0, 0, 0, 0, 0, '', 0, 16, 1890000, 0, 0, 0, 21, 0, 0),
(1389, 0, 0, 0, 0, 0, '', 0, 53, 6840000, 0, 0, 0, 76, 0, 0),
(1400, 0, 0, 0, 0, 0, '', 0, 0, 720000, 0, 0, 0, 8, 0, 0),
(1745, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 0, 2, 65, 0, 0),
(1746, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 2, 137, 0, 0),
(1747, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 6, 152, 0, 0),
(1748, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 32, 0, 0),
(1749, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 19, 0, 0),
(1750, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 49, 0, 0),
(1751, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 42, 0, 0),
(1752, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 73, 0, 0),
(1753, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 23, 0, 0),
(1754, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 4, 322, 0, 0),
(1755, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 145, 0, 0),
(1756, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 137, 0, 0),
(1757, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 163, 0, 0),
(1758, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 143, 0, 0),
(1759, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 123, 0, 0),
(1760, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 4, 60, 0, 0),
(1761, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 6, 102, 0, 0),
(1762, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 7, 8, 583, 0, 0),
(1763, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 116, 0, 0),
(1764, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 3, 6, 232, 0, 0),
(1765, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 131, 0, 0),
(1766, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 58, 0, 0),
(1767, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 97, 0, 0),
(1768, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 8, 202, 0, 0),
(1769, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 183, 0, 0),
(1770, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 4, 121, 0, 0),
(1771, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 2, 53, 0, 0),
(1772, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 6, 10, 304, 0, 0),
(1776, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 2, 0, 97, 0, 0),
(1777, 0, 0, 0, 0, 0, 'Forgotten headquarter (Flat 1, Area 42)', 0, 0, 0, 0, 1, 0, 69, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_auctions`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_data`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_lists`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `lottery`
--

INSERT INTO `lottery` (`id`, `name`, `item`, `world_id`) VALUES
(1, 'Nobody', 'nothing', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marriage_system`
--

CREATE TABLE IF NOT EXISTS `marriage_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `marriage_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marriage_system`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `marrystatus` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `nick_verify` int(11) NOT NULL DEFAULT '0',
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `worldtransfer` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` tinyint(4) NOT NULL DEFAULT '1',
  `show_eq` tinyint(4) NOT NULL DEFAULT '1',
  `show_bars` tinyint(4) NOT NULL DEFAULT '1',
  `show_skills` tinyint(4) NOT NULL DEFAULT '1',
  `show_quests` tinyint(4) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '0',
  `resets` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `auction_balance` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `marrystatus`, `promotion`, `deleted`, `description`, `created`, `nick_verify`, `old_name`, `hide_char`, `worldtransfer`, `comment`, `show_outfit`, `show_eq`, `show_bars`, `show_skills`, `show_quests`, `rep`, `resets`, `cast`, `castViewers`, `castDescription`, `auction_balance`) VALUES
(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 1, 160, 54, 7, '', 400, 0, 1476902223, 20490432, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0),
(2, 'Rook Sample', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0),
(3, 'Sorcerer Sample', 0, 1, 1, 8, 1, 185, 185, 0, 0, 0, 0, 0, 110, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0),
(4, 'Druid Sample', 0, 1, 1, 8, 2, 185, 185, 0, 0, 0, 0, 0, 110, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0),
(5, 'Paladin Sample', 0, 1, 1, 8, 3, 185, 185, 0, 0, 0, 0, 0, 110, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0),
(6, 'Knight Sample', 0, 1, 1, 8, 4, 185, 185, 0, 0, 0, 0, 0, 110, 0, 0, 35, 35, 0, 0, 1, 160, 54, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 1, '', 0, 0, '', 0, 0, '', 1, 1, 1, 1, 1, 0, 0, 0, 0, '', 0);

--
-- Gatilhos `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `player_deaths`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_depotitems`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_namelocks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_spells`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_viplist`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `poll` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `polls`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_votes`
--

CREATE TABLE IF NOT EXISTS `poll_votes` (
  `poll_id` int(11) NOT NULL,
  `votes` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `poll_votes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '25'),
('encryption', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The Forgotten Server!'),
(2, 0, 'Bem Vindo! Baiak Ice Editado por [ADM] Victor!'),
(3, 0, 'Bem Vindo! Baiak Troia!'),
(4, 0, 'Welcome to Wakeserv! Inovação é o nosso lema.'),
(5, 0, 'Bem Vindo! Baiak Troia!'),
(6, 0, 'Bem Vindo ao Baiakciteron-war!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(0, 0, 0),
(1, 0, 1474141374),
(2, 0, 1474827553),
(3, 0, 1474830762),
(4, 0, 1474833510);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `server_reports`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiles`
--

INSERT INTO `tiles` (`id`, `world_id`, `house_id`, `x`, `y`, `z`) VALUES
(0, 0, 1, 155, 106, 7),
(1, 0, 1, 164, 103, 6),
(2, 0, 1, 162, 105, 5),
(3, 0, 1, 163, 105, 5),
(4, 0, 1, 164, 104, 6),
(5, 0, 3, 136, 26, 7),
(6, 0, 3, 136, 27, 7),
(7, 0, 3, 143, 27, 7),
(8, 0, 8, 174, 56, 6),
(9, 0, 8, 178, 52, 6),
(10, 0, 8, 178, 53, 6),
(11, 0, 8, 178, 52, 7),
(12, 0, 8, 178, 53, 7),
(13, 0, 8, 178, 56, 6),
(14, 0, 8, 176, 56, 7),
(15, 0, 25, 155, 24, 7),
(16, 0, 25, 155, 25, 7),
(17, 0, 25, 157, 28, 7),
(18, 0, 26, 164, 32, 7),
(19, 0, 26, 169, 33, 7),
(20, 0, 26, 169, 34, 7),
(21, 0, 31, 157, 59, 6),
(22, 0, 31, 160, 60, 6),
(23, 0, 31, 160, 61, 6),
(24, 0, 31, 159, 65, 6),
(25, 0, 32, 152, 59, 6),
(26, 0, 32, 154, 60, 6),
(27, 0, 32, 154, 61, 6),
(28, 0, 32, 154, 65, 6),
(29, 0, 33, 146, 59, 6),
(30, 0, 33, 144, 60, 6),
(31, 0, 33, 144, 61, 6),
(32, 0, 33, 148, 65, 6),
(33, 0, 38, 166, 27, 6),
(34, 0, 38, 166, 28, 6),
(35, 0, 38, 169, 29, 6),
(36, 0, 38, 169, 30, 6),
(37, 0, 39, 165, 31, 6),
(38, 0, 39, 169, 33, 6),
(39, 0, 39, 169, 34, 6),
(40, 0, 40, 164, 26, 5),
(41, 0, 40, 165, 27, 5),
(42, 0, 40, 167, 26, 5),
(43, 0, 40, 165, 28, 5),
(44, 0, 41, 168, 29, 5),
(45, 0, 41, 165, 33, 5),
(46, 0, 41, 165, 34, 5),
(47, 0, 42, 129, 62, 7),
(48, 0, 42, 133, 64, 7),
(49, 0, 42, 133, 65, 7),
(50, 0, 43, 128, 63, 6),
(51, 0, 43, 132, 62, 6),
(52, 0, 43, 128, 64, 6),
(53, 0, 44, 136, 31, 7),
(54, 0, 44, 136, 32, 7),
(55, 0, 44, 141, 35, 7),
(56, 0, 45, 151, 26, 7),
(57, 0, 45, 151, 27, 7),
(58, 0, 45, 148, 29, 7),
(59, 0, 46, 148, 32, 7),
(60, 0, 46, 151, 34, 7),
(61, 0, 46, 151, 35, 7),
(62, 0, 52, 78, 23, 7),
(63, 0, 52, 77, 27, 7),
(64, 0, 52, 78, 24, 7),
(65, 0, 53, 84, 23, 7),
(66, 0, 53, 82, 25, 7),
(67, 0, 53, 84, 24, 7),
(68, 0, 54, 87, 24, 7),
(69, 0, 54, 89, 26, 7),
(70, 0, 54, 89, 27, 7),
(71, 0, 55, 87, 31, 7),
(72, 0, 55, 89, 29, 7),
(73, 0, 55, 89, 30, 7),
(74, 0, 56, 118, 66, 7),
(75, 0, 56, 118, 67, 7),
(76, 0, 56, 122, 66, 7),
(77, 0, 57, 119, 70, 7),
(78, 0, 57, 122, 72, 7),
(79, 0, 57, 122, 73, 7),
(80, 0, 59, 114, 179, 7),
(81, 0, 60, 114, 185, 7),
(82, 0, 61, 113, 202, 7),
(83, 0, 62, 121, 202, 7),
(84, 0, 63, 126, 190, 7),
(85, 0, 64, 136, 187, 7),
(86, 0, 65, 141, 187, 7),
(87, 0, 66, 152, 186, 7),
(88, 0, 66, 156, 186, 7),
(89, 0, 70, 228, 84, 7),
(90, 0, 70, 228, 88, 6),
(91, 0, 71, 241, 82, 7),
(92, 0, 71, 241, 86, 6),
(93, 0, 72, 268, 66, 7),
(94, 0, 73, 275, 66, 7),
(95, 0, 73, 277, 70, 6),
(96, 0, 74, 291, 62, 7),
(97, 0, 74, 296, 62, 6),
(98, 0, 75, 309, 66, 7),
(99, 0, 75, 309, 70, 6),
(100, 0, 75, 310, 70, 6),
(101, 0, 76, 325, 77, 6),
(102, 0, 76, 329, 78, 7),
(103, 0, 77, 320, 121, 6),
(104, 0, 78, 309, 114, 6),
(105, 0, 78, 309, 118, 7),
(106, 0, 79, 303, 115, 6),
(107, 0, 79, 302, 119, 7),
(108, 0, 80, 291, 115, 6),
(109, 0, 80, 291, 119, 7),
(110, 0, 81, 243, 119, 6),
(111, 0, 82, 226, 115, 6),
(112, 0, 82, 226, 119, 7),
(113, 0, 83, 296, 103, 5),
(114, 0, 84, 270, 104, 5),
(115, 0, 84, 270, 108, 6),
(116, 0, 85, 244, 109, 5),
(117, 0, 89, 182, 42, 7),
(118, 0, 89, 189, 41, 7),
(119, 0, 89, 189, 42, 7),
(120, 0, 90, 182, 38, 7),
(121, 0, 90, 189, 36, 7),
(122, 0, 90, 189, 37, 7),
(123, 0, 91, 183, 29, 7),
(124, 0, 91, 183, 30, 7),
(125, 0, 91, 182, 32, 7),
(126, 0, 92, 175, 27, 7),
(127, 0, 92, 175, 28, 7),
(128, 0, 92, 180, 31, 7),
(129, 0, 93, 175, 28, 6),
(130, 0, 93, 175, 29, 6),
(131, 0, 93, 176, 32, 6),
(132, 0, 95, 1035, 1049, 7),
(133, 0, 96, 1051, 1049, 7),
(134, 0, 97, 1045, 1038, 7),
(135, 0, 98, 1045, 1026, 7),
(136, 0, 99, 1037, 1017, 7),
(137, 0, 99, 1039, 1017, 7),
(138, 0, 100, 1023, 1017, 7),
(139, 0, 101, 1003, 982, 7),
(140, 0, 101, 1005, 982, 7),
(141, 0, 101, 1007, 982, 7),
(142, 0, 102, 1011, 1015, 7),
(143, 0, 102, 1011, 1017, 7),
(144, 0, 103, 1010, 1029, 7),
(145, 0, 103, 1010, 1031, 7),
(146, 0, 103, 1010, 1033, 7),
(147, 0, 104, 1010, 1043, 7),
(148, 0, 105, 1014, 1053, 7),
(149, 0, 105, 1014, 1055, 7),
(150, 0, 106, 1021, 1049, 7),
(151, 0, 106, 1023, 1049, 7),
(152, 0, 108, 95, 67, 7),
(153, 0, 108, 99, 65, 7),
(154, 0, 108, 98, 68, 7),
(155, 0, 108, 98, 69, 7),
(156, 0, 109, 95, 75, 7),
(157, 0, 109, 95, 76, 7),
(158, 0, 109, 97, 73, 7),
(159, 0, 109, 99, 77, 7),
(160, 0, 111, 106, 66, 7),
(161, 0, 111, 107, 67, 7),
(162, 0, 111, 107, 68, 7),
(163, 0, 112, 191, 44, 7),
(164, 0, 112, 185, 49, 7),
(165, 0, 112, 192, 44, 7),
(166, 0, 113, 179, 27, 6),
(167, 0, 113, 179, 28, 6),
(168, 0, 113, 181, 32, 6),
(169, 0, 114, 184, 29, 6),
(170, 0, 114, 184, 30, 6),
(171, 0, 114, 183, 33, 6),
(172, 0, 115, 183, 36, 6),
(173, 0, 115, 184, 37, 6),
(174, 0, 115, 184, 38, 6),
(175, 0, 116, 183, 42, 6),
(176, 0, 116, 184, 43, 6),
(177, 0, 116, 184, 44, 6),
(178, 0, 118, 199, 43, 7),
(179, 0, 118, 199, 44, 7),
(180, 0, 118, 198, 48, 7),
(181, 0, 118, 198, 49, 7),
(182, 0, 118, 198, 50, 7),
(183, 0, 119, 195, 28, 7),
(184, 0, 119, 195, 29, 7),
(185, 0, 119, 198, 36, 7),
(186, 0, 119, 199, 36, 7),
(187, 0, 119, 200, 36, 7),
(188, 0, 120, 204, 28, 7),
(189, 0, 120, 204, 29, 7),
(190, 0, 120, 207, 36, 7),
(191, 0, 120, 208, 36, 7),
(192, 0, 120, 209, 36, 7),
(193, 0, 121, 213, 28, 7),
(194, 0, 121, 213, 29, 7),
(195, 0, 121, 210, 37, 7),
(196, 0, 121, 210, 38, 7),
(197, 0, 121, 210, 39, 7),
(198, 0, 122, 210, 43, 7),
(199, 0, 122, 211, 40, 7),
(200, 0, 122, 211, 41, 7),
(201, 0, 122, 210, 45, 7),
(202, 0, 123, 211, 50, 7),
(203, 0, 123, 211, 51, 7),
(204, 0, 123, 210, 52, 7),
(205, 0, 123, 210, 53, 7),
(206, 0, 123, 210, 54, 7),
(207, 0, 124, 211, 58, 7),
(208, 0, 124, 211, 59, 7),
(209, 0, 124, 210, 60, 7),
(210, 0, 124, 210, 61, 7),
(211, 0, 124, 210, 62, 7),
(212, 0, 126, 164, 59, 6),
(213, 0, 126, 162, 60, 6),
(214, 0, 126, 162, 61, 6),
(215, 0, 126, 166, 65, 6),
(216, 0, 143, 367, 480, 7),
(217, 0, 143, 367, 481, 7),
(218, 0, 143, 374, 483, 7),
(219, 0, 144, 337, 485, 7),
(220, 0, 144, 337, 486, 7),
(221, 0, 144, 338, 485, 7),
(222, 0, 144, 338, 486, 7),
(223, 0, 144, 342, 485, 7),
(224, 0, 144, 342, 486, 7),
(225, 0, 144, 343, 485, 7),
(226, 0, 144, 343, 486, 7),
(227, 0, 144, 340, 492, 7),
(228, 0, 145, 381, 505, 7),
(229, 0, 145, 381, 506, 7),
(230, 0, 145, 382, 505, 7),
(231, 0, 145, 382, 506, 7),
(232, 0, 145, 388, 503, 7),
(233, 0, 146, 391, 503, 7),
(234, 0, 146, 397, 500, 7),
(235, 0, 146, 397, 501, 7),
(236, 0, 146, 398, 500, 7),
(237, 0, 146, 398, 501, 7),
(238, 0, 148, 413, 477, 7),
(239, 0, 148, 413, 478, 7),
(240, 0, 148, 406, 480, 7),
(241, 0, 149, 419, 486, 7),
(242, 0, 149, 421, 492, 7),
(243, 0, 149, 421, 493, 7),
(244, 0, 149, 422, 492, 7),
(245, 0, 149, 422, 493, 7),
(246, 0, 150, 409, 490, 7),
(247, 0, 150, 409, 491, 7),
(248, 0, 150, 410, 490, 7),
(249, 0, 150, 410, 491, 7),
(250, 0, 150, 403, 493, 7),
(251, 0, 151, 391, 487, 7),
(252, 0, 151, 388, 493, 7),
(253, 0, 151, 388, 494, 7),
(254, 0, 152, 420, 475, 7),
(255, 0, 152, 421, 472, 7),
(256, 0, 152, 421, 473, 7),
(257, 0, 153, 422, 480, 7),
(258, 0, 153, 423, 481, 7),
(259, 0, 153, 424, 481, 7),
(260, 0, 154, 376, 491, 7),
(261, 0, 154, 376, 492, 7),
(262, 0, 154, 379, 492, 7),
(263, 0, 155, 403, 503, 7),
(264, 0, 155, 403, 504, 7),
(265, 0, 155, 406, 504, 7),
(266, 0, 156, 413, 503, 7),
(267, 0, 156, 410, 504, 7),
(268, 0, 156, 413, 504, 7),
(269, 0, 157, 348, 509, 7),
(270, 0, 157, 348, 510, 7),
(271, 0, 157, 351, 509, 7),
(272, 0, 158, 361, 492, 7),
(273, 0, 158, 361, 493, 7),
(274, 0, 158, 364, 493, 7),
(275, 0, 159, 373, 475, 7),
(276, 0, 159, 374, 472, 7),
(277, 0, 159, 374, 473, 7),
(278, 0, 161, 210, 551, 7),
(279, 0, 161, 210, 552, 7),
(280, 0, 161, 212, 554, 7),
(281, 0, 162, 221, 550, 7),
(282, 0, 162, 218, 556, 7),
(283, 0, 162, 218, 557, 7),
(284, 0, 163, 270, 66, 6),
(285, 0, 163, 266, 69, 6),
(286, 0, 163, 268, 71, 6),
(287, 0, 163, 269, 71, 6),
(288, 0, 163, 271, 69, 6),
(289, 0, 163, 271, 69, 7),
(290, 0, 164, 291, 67, 6),
(291, 0, 164, 292, 67, 6),
(292, 0, 164, 293, 65, 6),
(293, 0, 164, 296, 67, 6),
(294, 0, 164, 298, 65, 6),
(295, 0, 164, 298, 65, 7),
(296, 0, 171, 804, 1335, 7),
(297, 0, 171, 808, 1335, 7),
(298, 0, 171, 802, 1338, 7),
(299, 0, 171, 810, 1337, 7),
(300, 0, 171, 810, 1339, 7),
(301, 0, 171, 802, 1341, 7),
(302, 0, 171, 806, 1343, 7),
(303, 0, 171, 810, 1341, 7),
(304, 0, 174, 842, 1342, 7),
(305, 0, 174, 838, 1344, 7),
(306, 0, 174, 838, 1347, 7),
(307, 0, 174, 846, 1344, 7),
(308, 0, 174, 846, 1348, 7),
(309, 0, 175, 838, 1334, 7),
(310, 0, 175, 840, 1332, 7),
(311, 0, 175, 838, 1336, 7),
(312, 0, 175, 838, 1338, 7),
(313, 0, 175, 840, 1340, 7),
(314, 0, 175, 844, 1340, 7),
(315, 0, 176, 814, 1314, 7),
(316, 0, 176, 814, 1317, 7),
(317, 0, 176, 817, 1312, 6),
(318, 0, 176, 816, 1312, 7),
(319, 0, 176, 819, 1312, 7),
(320, 0, 176, 823, 1313, 7),
(321, 0, 176, 823, 1314, 7),
(322, 0, 176, 825, 1312, 7),
(323, 0, 176, 829, 1313, 7),
(324, 0, 176, 829, 1314, 7),
(325, 0, 176, 830, 1315, 7),
(326, 0, 176, 816, 1316, 6),
(327, 0, 176, 818, 1316, 6),
(328, 0, 176, 822, 1317, 7),
(329, 0, 176, 830, 1318, 7),
(330, 0, 176, 816, 1320, 7),
(331, 0, 176, 819, 1320, 7),
(332, 0, 176, 824, 1320, 7),
(333, 0, 176, 826, 1320, 7),
(334, 0, 176, 829, 1320, 7),
(335, 0, 178, 387, 462, 5),
(336, 0, 178, 387, 463, 5),
(337, 0, 178, 390, 462, 5),
(338, 0, 178, 394, 462, 6),
(339, 0, 178, 390, 464, 5),
(340, 0, 178, 390, 466, 5),
(341, 0, 178, 394, 464, 6),
(342, 0, 178, 394, 466, 6),
(343, 0, 178, 388, 468, 5),
(344, 0, 178, 389, 468, 6),
(345, 0, 178, 392, 468, 6),
(346, 0, 179, 407, 462, 5),
(347, 0, 179, 409, 461, 5),
(348, 0, 179, 410, 462, 5),
(349, 0, 179, 410, 463, 5),
(350, 0, 179, 407, 464, 5),
(351, 0, 179, 407, 466, 5),
(352, 0, 179, 409, 468, 5),
(353, 0, 180, 409, 451, 5),
(354, 0, 180, 412, 451, 5),
(355, 0, 180, 409, 453, 5),
(356, 0, 180, 409, 455, 5),
(357, 0, 180, 412, 452, 5),
(358, 0, 180, 406, 457, 6),
(359, 0, 180, 411, 457, 5),
(360, 0, 180, 410, 457, 6),
(361, 0, 181, 387, 451, 5),
(362, 0, 181, 390, 451, 5),
(363, 0, 181, 387, 452, 5),
(364, 0, 181, 390, 453, 5),
(365, 0, 181, 390, 455, 5),
(366, 0, 181, 394, 453, 6),
(367, 0, 181, 388, 457, 5),
(368, 0, 181, 388, 457, 6),
(369, 0, 181, 392, 457, 6),
(370, 0, 182, 193, 18, 7),
(371, 0, 182, 193, 19, 7),
(372, 0, 182, 194, 18, 7),
(373, 0, 182, 194, 19, 7),
(374, 0, 182, 200, 22, 7),
(375, 0, 182, 194, 25, 7),
(376, 0, 183, 121, 128, 7),
(377, 0, 184, 375, 457, 6),
(378, 0, 185, 382, 457, 6),
(379, 0, 186, 376, 462, 6),
(380, 0, 187, 97, 32, 7),
(381, 0, 187, 97, 33, 7),
(382, 0, 187, 101, 35, 7),
(383, 0, 188, 106, 33, 7),
(384, 0, 188, 107, 36, 7),
(385, 0, 188, 108, 36, 7),
(386, 0, 191, 197, 504, 7),
(387, 0, 191, 197, 505, 7),
(388, 0, 191, 201, 511, 7),
(389, 0, 192, 202, 559, 7),
(390, 0, 192, 202, 560, 7),
(391, 0, 192, 204, 566, 7),
(392, 0, 192, 209, 560, 7),
(393, 0, 192, 209, 563, 7),
(394, 0, 193, 202, 564, 5),
(395, 0, 193, 202, 565, 5),
(396, 0, 193, 204, 566, 5),
(397, 0, 194, 202, 559, 5),
(398, 0, 194, 202, 560, 5),
(399, 0, 194, 204, 561, 5),
(400, 0, 195, 104, 70, 7),
(401, 0, 195, 104, 71, 7),
(402, 0, 195, 105, 69, 7),
(403, 0, 195, 115, 71, 7),
(404, 0, 196, 95, 61, 7),
(405, 0, 196, 95, 62, 7),
(406, 0, 196, 98, 61, 7),
(407, 0, 199, 210, 540, 7),
(408, 0, 199, 210, 541, 7),
(409, 0, 199, 216, 540, 7),
(410, 0, 199, 216, 541, 7),
(411, 0, 199, 211, 547, 7),
(412, 0, 199, 215, 547, 7),
(413, 0, 199, 217, 544, 7),
(414, 0, 200, 210, 540, 6),
(415, 0, 200, 211, 540, 6),
(416, 0, 200, 210, 546, 6),
(417, 0, 200, 211, 546, 6),
(418, 0, 200, 215, 544, 6),
(419, 0, 208, 143, 43, 5),
(420, 0, 208, 143, 44, 5),
(421, 0, 208, 145, 46, 5),
(422, 0, 209, 142, 50, 5),
(423, 0, 209, 142, 51, 5),
(424, 0, 209, 145, 51, 5),
(425, 0, 210, 144, 54, 5),
(426, 0, 210, 144, 55, 5),
(427, 0, 211, 151, 54, 6),
(428, 0, 212, 151, 49, 6),
(429, 0, 215, 167, 49, 6),
(430, 0, 215, 167, 50, 6),
(431, 0, 215, 168, 51, 6),
(432, 0, 215, 165, 53, 6),
(433, 0, 216, 157, 45, 6),
(434, 0, 216, 157, 46, 6),
(435, 0, 216, 156, 49, 6),
(436, 0, 217, 151, 45, 6),
(437, 0, 218, 161, 47, 6),
(438, 0, 218, 161, 48, 6),
(439, 0, 218, 160, 53, 6),
(440, 0, 219, 145, 49, 6),
(441, 0, 219, 146, 54, 6),
(442, 0, 219, 146, 55, 6),
(443, 0, 220, 144, 42, 6),
(444, 0, 220, 145, 46, 6),
(445, 0, 220, 146, 44, 6),
(446, 0, 220, 146, 45, 6),
(447, 0, 221, 203, 79, 6),
(448, 0, 222, 414, 182, 6),
(449, 0, 222, 418, 179, 6),
(450, 0, 222, 416, 177, 7),
(451, 0, 222, 419, 182, 6),
(452, 0, 222, 417, 182, 7),
(453, 0, 222, 420, 181, 7),
(454, 0, 223, 390, 507, 7),
(455, 0, 223, 386, 513, 7),
(456, 0, 223, 386, 514, 7),
(457, 0, 223, 387, 513, 7),
(458, 0, 223, 387, 514, 7),
(459, 0, 224, 379, 477, 7),
(460, 0, 224, 379, 478, 7),
(461, 0, 224, 386, 480, 7),
(462, 0, 225, 851, 1303, 7),
(463, 0, 225, 855, 1303, 7),
(464, 0, 225, 849, 1305, 7),
(465, 0, 225, 857, 1305, 7),
(466, 0, 225, 849, 1308, 7),
(467, 0, 225, 853, 1311, 7),
(468, 0, 225, 857, 1309, 7),
(469, 0, 226, 859, 1303, 7),
(470, 0, 226, 861, 1301, 7),
(471, 0, 226, 859, 1306, 7),
(472, 0, 226, 865, 1301, 7),
(473, 0, 226, 867, 1303, 7),
(474, 0, 226, 867, 1305, 7),
(475, 0, 226, 867, 1307, 7),
(476, 0, 227, 859, 1318, 7),
(477, 0, 227, 861, 1316, 7),
(478, 0, 227, 863, 1316, 7),
(479, 0, 227, 859, 1321, 7),
(480, 0, 227, 865, 1316, 7),
(481, 0, 227, 867, 1318, 7),
(482, 0, 227, 867, 1322, 7),
(483, 0, 228, 871, 1314, 7),
(484, 0, 228, 873, 1314, 7),
(485, 0, 228, 875, 1314, 7),
(486, 0, 228, 869, 1316, 7),
(487, 0, 228, 869, 1319, 7),
(488, 0, 228, 877, 1316, 7),
(489, 0, 228, 877, 1320, 7),
(490, 0, 229, 869, 1326, 7),
(491, 0, 229, 871, 1324, 7),
(492, 0, 229, 875, 1324, 7),
(493, 0, 229, 877, 1326, 7),
(494, 0, 229, 877, 1327, 7),
(495, 0, 229, 869, 1329, 7),
(496, 0, 229, 877, 1330, 7),
(497, 0, 230, 874, 1335, 7),
(498, 0, 230, 876, 1335, 7),
(499, 0, 230, 878, 1335, 7),
(500, 0, 230, 872, 1337, 7),
(501, 0, 230, 872, 1340, 7),
(502, 0, 230, 880, 1337, 7),
(503, 0, 230, 880, 1341, 7),
(504, 0, 231, 885, 1334, 7),
(505, 0, 231, 887, 1334, 7),
(506, 0, 231, 889, 1334, 7),
(507, 0, 231, 883, 1336, 7),
(508, 0, 231, 883, 1339, 7),
(509, 0, 231, 891, 1336, 7),
(510, 0, 231, 891, 1340, 7),
(511, 0, 232, 884, 1326, 7),
(512, 0, 232, 884, 1327, 7),
(513, 0, 232, 886, 1324, 7),
(514, 0, 232, 890, 1324, 7),
(515, 0, 232, 892, 1326, 7),
(516, 0, 232, 884, 1329, 7),
(517, 0, 232, 892, 1330, 7),
(518, 0, 233, 886, 1314, 7),
(519, 0, 233, 890, 1314, 7),
(520, 0, 233, 884, 1316, 7),
(521, 0, 233, 884, 1317, 7),
(522, 0, 233, 884, 1319, 7),
(523, 0, 233, 892, 1316, 7),
(524, 0, 233, 892, 1320, 7),
(525, 0, 234, 881, 1306, 7),
(526, 0, 234, 881, 1307, 7),
(527, 0, 234, 883, 1304, 7),
(528, 0, 234, 887, 1304, 7),
(529, 0, 234, 889, 1306, 7),
(530, 0, 234, 881, 1309, 7),
(531, 0, 234, 889, 1310, 7),
(532, 0, 235, 883, 1294, 7),
(533, 0, 235, 887, 1294, 7),
(534, 0, 235, 881, 1296, 7),
(535, 0, 235, 881, 1297, 7),
(536, 0, 235, 881, 1299, 7),
(537, 0, 235, 889, 1296, 7),
(538, 0, 235, 889, 1300, 7),
(539, 0, 236, 863, 1291, 7),
(540, 0, 236, 861, 1293, 7),
(541, 0, 236, 867, 1291, 7),
(542, 0, 236, 869, 1293, 7),
(543, 0, 236, 869, 1295, 7),
(544, 0, 236, 861, 1296, 7),
(545, 0, 236, 869, 1297, 7),
(546, 0, 237, 876, 1286, 7),
(547, 0, 237, 876, 1287, 7),
(548, 0, 237, 878, 1284, 7),
(549, 0, 237, 876, 1289, 7),
(550, 0, 237, 882, 1284, 7),
(551, 0, 237, 884, 1286, 7),
(552, 0, 237, 884, 1290, 7),
(553, 0, 238, 860, 1283, 7),
(554, 0, 238, 862, 1281, 7),
(555, 0, 238, 860, 1286, 7),
(556, 0, 238, 866, 1281, 7),
(557, 0, 238, 868, 1283, 7),
(558, 0, 238, 868, 1285, 7),
(559, 0, 238, 868, 1287, 7),
(560, 0, 239, 856, 1271, 7),
(561, 0, 239, 860, 1271, 7),
(562, 0, 239, 854, 1273, 7),
(563, 0, 239, 862, 1273, 7),
(564, 0, 239, 862, 1275, 7),
(565, 0, 239, 854, 1276, 7),
(566, 0, 239, 862, 1277, 7),
(567, 0, 240, 858, 1263, 7),
(568, 0, 240, 860, 1261, 7),
(569, 0, 240, 864, 1261, 7),
(570, 0, 240, 866, 1263, 7),
(571, 0, 240, 858, 1266, 7),
(572, 0, 240, 866, 1265, 7),
(573, 0, 240, 866, 1267, 7),
(574, 0, 241, 867, 1254, 7),
(575, 0, 241, 869, 1252, 7),
(576, 0, 241, 873, 1252, 7),
(577, 0, 241, 875, 1254, 7),
(578, 0, 241, 867, 1257, 7),
(579, 0, 241, 875, 1258, 7),
(580, 0, 241, 871, 1260, 7),
(581, 0, 242, 877, 1254, 7),
(582, 0, 242, 879, 1252, 7),
(583, 0, 242, 877, 1257, 7),
(584, 0, 242, 883, 1252, 7),
(585, 0, 242, 885, 1254, 7),
(586, 0, 242, 885, 1258, 7),
(587, 0, 242, 881, 1260, 7),
(588, 0, 243, 878, 1266, 7),
(589, 0, 243, 878, 1267, 7),
(590, 0, 243, 878, 1269, 7),
(591, 0, 243, 880, 1264, 7),
(592, 0, 243, 884, 1264, 7),
(593, 0, 243, 886, 1266, 7),
(594, 0, 243, 886, 1270, 7),
(595, 0, 244, 884, 1274, 7),
(596, 0, 244, 888, 1274, 7),
(597, 0, 244, 882, 1276, 7),
(598, 0, 244, 882, 1277, 7),
(599, 0, 244, 882, 1279, 7),
(600, 0, 244, 890, 1276, 7),
(601, 0, 244, 890, 1280, 7),
(602, 0, 245, 816, 1342, 7),
(603, 0, 245, 818, 1342, 7),
(604, 0, 245, 820, 1342, 7),
(605, 0, 245, 814, 1344, 7),
(606, 0, 245, 814, 1347, 7),
(607, 0, 245, 822, 1344, 7),
(608, 0, 245, 822, 1348, 7),
(609, 0, 246, 828, 1342, 7),
(610, 0, 246, 830, 1342, 7),
(611, 0, 246, 832, 1342, 7),
(612, 0, 246, 826, 1345, 7),
(613, 0, 246, 826, 1348, 7),
(614, 0, 246, 834, 1345, 7),
(615, 0, 246, 834, 1348, 7),
(616, 0, 247, 103, 28, 7),
(617, 0, 249, 429, 175, 7),
(618, 0, 249, 424, 178, 6),
(619, 0, 249, 426, 177, 6),
(620, 0, 249, 429, 179, 7),
(621, 0, 249, 426, 180, 6),
(622, 0, 249, 425, 180, 7),
(623, 0, 249, 432, 179, 7),
(624, 0, 250, 156, 60, 7),
(625, 0, 250, 158, 60, 7),
(626, 0, 250, 156, 65, 7),
(627, 0, 250, 156, 66, 7),
(628, 0, 251, 149, 60, 7),
(629, 0, 251, 151, 60, 7),
(630, 0, 251, 152, 65, 7),
(631, 0, 251, 152, 66, 7),
(632, 0, 253, 164, 60, 7),
(633, 0, 253, 164, 65, 7),
(634, 0, 253, 164, 66, 7),
(635, 0, 254, 168, 60, 7),
(636, 0, 254, 168, 65, 7),
(637, 0, 254, 168, 66, 7),
(638, 0, 255, 2437, 489, 7),
(639, 0, 255, 2437, 490, 7),
(640, 0, 255, 2439, 494, 7),
(641, 0, 256, 2413, 494, 6),
(642, 0, 256, 2413, 495, 6),
(643, 0, 256, 2413, 494, 7),
(644, 0, 256, 2413, 495, 7),
(645, 0, 256, 2425, 494, 7),
(646, 0, 256, 2425, 495, 7),
(647, 0, 256, 2430, 494, 6),
(648, 0, 256, 2430, 495, 6),
(649, 0, 256, 2413, 505, 6),
(650, 0, 256, 2413, 506, 6),
(651, 0, 256, 2415, 505, 7),
(652, 0, 256, 2421, 497, 7),
(653, 0, 256, 2427, 497, 7),
(654, 0, 256, 2431, 499, 7),
(655, 0, 256, 2418, 501, 7),
(656, 0, 256, 2418, 502, 7),
(657, 0, 256, 2422, 500, 6),
(658, 0, 256, 2422, 501, 6),
(659, 0, 256, 2423, 500, 7),
(660, 0, 256, 2425, 501, 7),
(661, 0, 256, 2425, 502, 7),
(662, 0, 256, 2427, 500, 7),
(663, 0, 256, 2422, 505, 7),
(664, 0, 256, 2422, 506, 7),
(665, 0, 256, 2430, 505, 6),
(666, 0, 256, 2430, 506, 6),
(667, 0, 257, 2403, 494, 7),
(668, 0, 257, 2403, 495, 7),
(669, 0, 257, 2389, 496, 7),
(670, 0, 257, 2402, 497, 7),
(671, 0, 258, 2390, 503, 7),
(672, 0, 258, 2389, 506, 7),
(673, 0, 258, 2390, 504, 7),
(674, 0, 259, 2397, 503, 7),
(675, 0, 259, 2397, 504, 7),
(676, 0, 259, 2407, 503, 7),
(677, 0, 259, 2407, 504, 7),
(678, 0, 259, 2407, 512, 7),
(679, 0, 260, 2371, 496, 7),
(680, 0, 260, 2371, 497, 7),
(681, 0, 260, 2377, 500, 7),
(682, 0, 261, 2443, 505, 7),
(683, 0, 261, 2444, 509, 7),
(684, 0, 261, 2444, 510, 7),
(685, 0, 261, 2454, 504, 7),
(686, 0, 261, 2454, 505, 7),
(687, 0, 261, 2450, 511, 7),
(688, 0, 262, 2482, 493, 7),
(689, 0, 262, 2482, 494, 7),
(690, 0, 262, 2490, 493, 7),
(691, 0, 262, 2490, 494, 7),
(692, 0, 262, 2482, 497, 7),
(693, 0, 262, 2482, 498, 7),
(694, 0, 262, 2484, 496, 7),
(695, 0, 262, 2492, 496, 7),
(696, 0, 262, 2493, 497, 7),
(697, 0, 262, 2493, 498, 7),
(698, 0, 262, 2487, 500, 7),
(699, 0, 263, 2482, 505, 7),
(700, 0, 263, 2482, 506, 7),
(701, 0, 263, 2484, 511, 7),
(702, 0, 263, 2477, 514, 7),
(703, 0, 263, 2477, 515, 7),
(704, 0, 263, 2480, 513, 7),
(705, 0, 264, 2493, 506, 7),
(706, 0, 264, 2493, 507, 7),
(707, 0, 264, 2490, 511, 7),
(708, 0, 264, 2492, 508, 7),
(709, 0, 264, 2494, 513, 7),
(710, 0, 264, 2494, 514, 7),
(711, 0, 265, 2504, 527, 7),
(712, 0, 265, 2505, 525, 7),
(713, 0, 265, 2505, 526, 7),
(714, 0, 265, 2498, 528, 7),
(715, 0, 265, 2504, 530, 7),
(716, 0, 265, 2504, 531, 7),
(717, 0, 266, 2478, 545, 7),
(718, 0, 266, 2468, 548, 7),
(719, 0, 266, 2468, 549, 7),
(720, 0, 266, 2473, 549, 7),
(721, 0, 266, 2482, 546, 7),
(722, 0, 266, 2482, 547, 7),
(723, 0, 267, 2359, 513, 7),
(724, 0, 267, 2359, 514, 7),
(725, 0, 267, 2367, 516, 7),
(726, 0, 267, 2367, 518, 7),
(727, 0, 267, 2372, 513, 7),
(728, 0, 267, 2372, 514, 7),
(729, 0, 267, 2371, 517, 7),
(730, 0, 268, 2350, 513, 7),
(731, 0, 268, 2350, 514, 7),
(732, 0, 268, 2347, 523, 7),
(733, 0, 269, 2351, 524, 7),
(734, 0, 269, 2351, 525, 7),
(735, 0, 269, 2352, 529, 7),
(736, 0, 270, 2352, 532, 7),
(737, 0, 270, 2354, 533, 7),
(738, 0, 270, 2354, 534, 7),
(739, 0, 271, 2347, 539, 7),
(740, 0, 271, 2350, 540, 7),
(741, 0, 271, 2350, 541, 7),
(742, 0, 271, 2346, 547, 7),
(743, 0, 271, 2348, 546, 7),
(744, 0, 271, 2346, 548, 7),
(745, 0, 272, 2359, 542, 7),
(746, 0, 272, 2359, 543, 7),
(747, 0, 272, 2363, 544, 7),
(748, 0, 272, 2373, 547, 7),
(749, 0, 272, 2375, 546, 7),
(750, 0, 272, 2378, 544, 7),
(751, 0, 272, 2373, 548, 7),
(752, 0, 273, 2375, 534, 7),
(753, 0, 273, 2375, 535, 7),
(754, 0, 273, 2369, 537, 7),
(755, 0, 273, 2369, 538, 7),
(756, 0, 273, 2371, 536, 7),
(757, 0, 274, 2390, 512, 7),
(758, 0, 274, 2390, 513, 7),
(759, 0, 274, 2394, 517, 7),
(760, 0, 275, 2396, 515, 7),
(761, 0, 275, 2400, 512, 7),
(762, 0, 275, 2400, 513, 7),
(763, 0, 276, 2397, 517, 7),
(764, 0, 276, 2401, 516, 7),
(765, 0, 276, 2401, 517, 7),
(766, 0, 277, 2388, 520, 7),
(767, 0, 277, 2388, 521, 7),
(768, 0, 277, 2394, 522, 7),
(769, 0, 278, 2388, 534, 7),
(770, 0, 278, 2388, 535, 7),
(771, 0, 278, 2394, 535, 7),
(772, 0, 278, 2391, 538, 7),
(773, 0, 278, 2391, 541, 7),
(774, 0, 278, 2391, 542, 7),
(775, 0, 279, 2395, 542, 7),
(776, 0, 279, 2396, 540, 7),
(777, 0, 279, 2396, 542, 7),
(778, 0, 280, 2396, 546, 7),
(779, 0, 280, 2396, 547, 7),
(780, 0, 280, 2389, 548, 7),
(781, 0, 282, 2399, 546, 7),
(782, 0, 282, 2399, 547, 7),
(783, 0, 282, 2407, 545, 7),
(784, 0, 282, 2411, 546, 7),
(785, 0, 282, 2411, 547, 7),
(786, 0, 283, 2395, 554, 7),
(787, 0, 283, 2395, 555, 7),
(788, 0, 283, 2400, 552, 7),
(789, 0, 283, 2404, 554, 7),
(790, 0, 283, 2406, 553, 7),
(791, 0, 283, 2406, 554, 7),
(792, 0, 284, 2410, 551, 7),
(793, 0, 284, 2410, 552, 7),
(794, 0, 284, 2413, 552, 7),
(795, 0, 284, 2419, 552, 7),
(796, 0, 284, 2419, 553, 7),
(797, 0, 284, 2421, 552, 7),
(798, 0, 285, 2430, 551, 7),
(799, 0, 285, 2430, 552, 7),
(800, 0, 285, 2435, 549, 7),
(801, 0, 285, 2438, 550, 7),
(802, 0, 285, 2438, 551, 7),
(803, 0, 285, 2437, 552, 7),
(804, 0, 286, 2442, 547, 7),
(805, 0, 286, 2443, 551, 7),
(806, 0, 286, 2444, 548, 7),
(807, 0, 286, 2444, 549, 7),
(808, 0, 286, 2446, 550, 7),
(809, 0, 286, 2443, 552, 7),
(810, 0, 286, 2453, 547, 7),
(811, 0, 286, 2451, 548, 7),
(812, 0, 286, 2453, 548, 7),
(813, 0, 287, 2390, 546, 6),
(814, 0, 287, 2390, 547, 6),
(815, 0, 287, 2398, 548, 6),
(816, 0, 288, 2395, 556, 6),
(817, 0, 288, 2395, 557, 6),
(818, 0, 288, 2396, 556, 6),
(819, 0, 288, 2396, 557, 6),
(820, 0, 288, 2400, 552, 6),
(821, 0, 288, 2405, 556, 6),
(822, 0, 288, 2405, 557, 6),
(823, 0, 288, 2406, 556, 6),
(824, 0, 288, 2406, 557, 6),
(825, 0, 289, 2408, 548, 6),
(826, 0, 289, 2410, 554, 6),
(827, 0, 289, 2410, 555, 6),
(828, 0, 289, 2413, 552, 6),
(829, 0, 289, 2420, 551, 6),
(830, 0, 289, 2420, 552, 6),
(831, 0, 290, 2394, 513, 5),
(832, 0, 290, 2395, 513, 5),
(833, 0, 290, 2396, 513, 5),
(834, 0, 290, 2397, 513, 5),
(835, 0, 290, 2396, 518, 6),
(836, 0, 291, 2394, 537, 5),
(837, 0, 291, 2395, 537, 5),
(838, 0, 291, 2396, 537, 5),
(839, 0, 291, 2397, 537, 5),
(840, 0, 291, 2396, 536, 6),
(841, 0, 292, 2485, 525, 6),
(842, 0, 292, 2485, 526, 6),
(843, 0, 292, 2487, 525, 6),
(844, 0, 292, 2487, 526, 6),
(845, 0, 292, 2484, 534, 6),
(846, 0, 293, 2462, 535, 6),
(847, 0, 293, 2462, 536, 6),
(848, 0, 293, 2464, 533, 6),
(849, 0, 293, 2465, 533, 6),
(850, 0, 293, 2464, 537, 6),
(851, 0, 293, 2472, 539, 6),
(852, 0, 293, 2464, 541, 6),
(853, 0, 293, 2465, 541, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_items`
--

INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(0, 0, 1, 0, 1221, 1, ''),
(1, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(3, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(4, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(5, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(6, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(7, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027536d616c6c20537472656574204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203233343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(8, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202750697261746520537472656574272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(9, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(10, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(11, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(12, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(13, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202750697261746520537472656574272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534393030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(14, 0, 1, 0, 1252, 1, ''),
(15, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(16, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(17, 0, 1, 0, 1636, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274772656174205374726565742049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203232353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(18, 0, 1, 0, 1634, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027477265617420537472656574204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(19, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(20, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(21, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203334323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(22, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(23, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(24, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203334323030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(25, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520275269766572205374726565742056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(26, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(27, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(28, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520275269766572205374726565742056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238383030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(29, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(30, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(31, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(32, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(33, 0, 1, 0, 10267, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027557070657220537472656574204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(34, 0, 1, 0, 1634, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027557070657220537472656574204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(35, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(36, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(37, 0, 1, 0, 1636, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f757365202755707065722053747265657420494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203136323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(38, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(39, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(40, 0, 1, 0, 1634, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027557070657220537472656574204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(41, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(42, 0, 1, 0, 1634, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027557070657220537472656574204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235323030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(43, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(44, 0, 1, 0, 1636, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520275570706572205374726565742056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(45, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(46, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(47, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f75736520274865617679204465706f7420486f757365272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(48, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(49, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(50, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(51, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f75736520274865617679204465706f7420486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203339363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(52, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(53, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(54, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(55, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027536d616c6c205374726565742056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238383030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(56, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(57, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(58, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027536d616c6c20537472656574205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(59, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027536d616c6c2053747265657420564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203137313030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(60, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(61, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(62, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(63, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361666520486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(64, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(65, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(66, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361666520486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(67, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(68, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520275361666520486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(69, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(70, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(71, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361666520486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732039393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(72, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(73, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(74, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(75, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(76, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027506f727420686f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203137313030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(77, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027506f727420686f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203136323030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(78, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(79, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(80, 0, 1, 0, 1219, 1, ''),
(81, 0, 1, 0, 1219, 1, ''),
(82, 0, 1, 0, 1221, 1, ''),
(83, 0, 1, 0, 1221, 1, ''),
(84, 0, 1, 0, 1219, 1, ''),
(85, 0, 1, 0, 1221, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f757365202748796472616c616e64205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(86, 0, 1, 0, 1221, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f757365202748796472616c616e6420564949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(87, 0, 1, 0, 1219, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202748796472616c616e642056494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203236313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(88, 0, 1, 0, 1219, 1, ''),
(89, 0, 1, 0, 1252, 1, ''),
(90, 0, 1, 0, 1252, 1, ''),
(91, 0, 1, 0, 1252, 1, ''),
(92, 0, 1, 0, 1252, 1, ''),
(93, 0, 1, 0, 1252, 1, ''),
(94, 0, 1, 0, 1252, 1, ''),
(95, 0, 1, 0, 1252, 1, ''),
(96, 0, 1, 0, 1225, 1, ''),
(97, 0, 1, 0, 1252, 1, ''),
(98, 0, 1, 0, 1225, 1, ''),
(99, 0, 1, 0, 5303, 1, ''),
(100, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f75736520274c69626572747920426179205649272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(101, 0, 1, 0, 1249, 1, ''),
(102, 0, 1, 0, 1249, 1, ''),
(103, 0, 1, 0, 1252, 1, ''),
(104, 0, 1, 0, 1252, 1, ''),
(105, 0, 1, 0, 1252, 1, ''),
(106, 0, 1, 0, 1252, 1, ''),
(107, 0, 1, 0, 1252, 1, ''),
(108, 0, 1, 0, 1252, 1, ''),
(109, 0, 1, 0, 1252, 1, ''),
(110, 0, 1, 0, 1252, 1, ''),
(111, 0, 1, 0, 1252, 1, ''),
(112, 0, 1, 0, 1252, 1, ''),
(113, 0, 1, 0, 1252, 1, ''),
(114, 0, 1, 0, 1252, 1, ''),
(115, 0, 1, 0, 1252, 1, ''),
(116, 0, 1, 0, 1249, 1, ''),
(117, 0, 1, 0, 1210, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203237393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(118, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(119, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(120, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(121, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(122, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(123, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(124, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(125, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203430353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(126, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(127, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(128, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f757365204956272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203237393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(129, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(130, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(131, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f7573652056272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(132, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(133, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203539343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(134, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203539343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(135, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203637353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(136, 0, 1, 0, 10490, 1, ''),
(137, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203638343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(138, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(139, 0, 1, 0, 10490, 1, ''),
(140, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(141, 0, 1, 0, 10490, 1, ''),
(142, 0, 1, 0, 10491, 1, ''),
(143, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b20436974792038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203635373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(144, 0, 1, 0, 10491, 1, ''),
(145, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b20436974792039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313335393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(146, 0, 1, 0, 10491, 1, ''),
(147, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b2043697479203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203630333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(148, 0, 1, 0, 10491, 1, ''),
(149, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b2043697479203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203630333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(150, 0, 1, 0, 10490, 1, ''),
(151, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b2043697479203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203633393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(152, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274775696c6448616c6c203127272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(153, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274775696c6448616c6c203127272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231363030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(154, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(155, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(156, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(157, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(158, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426169616b205975726f747320486f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436383030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(159, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426169616b205975726f747320486f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(160, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e016000000049742062656c6f6e677320746f20686f7573652027426169616b205975726f747320486f7573652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(161, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(162, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(163, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(164, 0, 1, 0, 1210, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027466176656c6120486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(165, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(166, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(167, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(168, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(169, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(170, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(171, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(172, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203233343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(173, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(174, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(175, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203239373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(176, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(177, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(178, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(179, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(180, 0, 1, 0, 5304, 1, ''),
(181, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(182, 0, 1, 0, 5304, 1, ''),
(183, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(184, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(185, 0, 1, 0, 5303, 1, ''),
(186, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203633393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(187, 0, 1, 0, 5303, 1, ''),
(188, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(189, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(190, 0, 1, 0, 5303, 1, ''),
(191, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027426169616b486f757365203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(192, 0, 1, 0, 5303, 1, ''),
(193, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(194, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(195, 0, 1, 0, 5304, 1, ''),
(196, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b486f7573652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203635373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(197, 0, 1, 0, 5304, 1, ''),
(198, 0, 1, 0, 5304, 1, ''),
(199, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(200, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(201, 0, 1, 0, 5304, 1, ''),
(202, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(203, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(204, 0, 1, 0, 5304, 1, ''),
(205, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b486f7573652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(206, 0, 1, 0, 5304, 1, ''),
(207, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(208, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(209, 0, 1, 0, 5304, 1, ''),
(210, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f7573652027426169616b486f7573652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(211, 0, 1, 0, 5304, 1, ''),
(212, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574204d6178272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(213, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(214, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(215, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027526976657220537472656574204d6178272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203437373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(216, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(217, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(218, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(219, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(220, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(221, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(222, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(223, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(224, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(225, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(226, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(227, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(228, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(229, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(230, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(231, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(232, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(233, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(234, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(235, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(236, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(237, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(238, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(239, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(240, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(241, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(242, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(243, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(244, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(245, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(246, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(247, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(248, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(249, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(250, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203439353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(251, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203438363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(252, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(253, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(254, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(255, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(256, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(257, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(258, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(259, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(260, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(261, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(262, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(263, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(264, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(265, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(266, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(267, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(268, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(269, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(270, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(271, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(272, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(273, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(274, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(275, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(276, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(277, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(278, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(279, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(280, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014c00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(281, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e014c00000049742062656c6f6e677320746f20686f7573652027272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(282, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(283, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(284, 0, 1, 0, 5303, 1, ''),
(285, 0, 1, 0, 5304, 1, ''),
(286, 0, 1, 0, 5303, 1, ''),
(287, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(288, 0, 1, 0, 5304, 1, ''),
(289, 0, 1, 0, 5304, 1, ''),
(290, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313031373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(291, 0, 1, 0, 5303, 1, ''),
(292, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313031373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(293, 0, 1, 0, 5303, 1, ''),
(294, 0, 1, 0, 5304, 1, ''),
(295, 0, 1, 0, 5304, 1, ''),
(296, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(297, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(298, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(299, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(300, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(301, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(302, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(303, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(304, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203733383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(305, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203733383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(306, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203733383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(307, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203733383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(308, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203733383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(309, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(310, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(311, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(312, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(313, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(314, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(315, 0, 1, 0, 6445, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020e000000),
(316, 0, 1, 0, 6445, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020f000000),
(317, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020a000000),
(318, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020b000000),
(319, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020c000000),
(320, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(321, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(322, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f726964020d000000),
(323, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(324, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(325, 0, 1, 0, 6445, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(326, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640208000000),
(327, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640209000000),
(328, 0, 1, 0, 6250, 1, ''),
(329, 0, 1, 0, 6445, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640207000000),
(330, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(331, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(332, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(333, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(334, 0, 1, 0, 6444, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323735343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(335, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(336, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(337, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(338, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(339, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(340, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(341, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(342, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(343, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(344, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(345, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313238373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(346, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313137303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(347, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313137303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(348, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(349, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(350, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313137303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(351, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313137303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(352, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313137303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(353, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(354, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(355, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(356, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(357, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(358, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(359, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(360, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313133343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(361, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(362, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(363, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(364, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(365, 0, 1, 0, 7028, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(366, 0, 1, 0, 6903, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(367, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(368, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(369, 0, 1, 0, 7027, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313336383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(370, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(371, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(372, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(373, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(374, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(375, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(376, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203633393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(377, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(378, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(379, 0, 1, 0, 6898, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(380, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(381, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(382, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203237303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(383, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203237393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(384, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(385, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(386, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(387, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(388, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(389, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(390, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(391, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(392, 0, 1, 0, 7026, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(393, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(394, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(395, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(396, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313933272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203136323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(397, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(398, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(399, 0, 1, 0, 6892, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313934272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203136323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(400, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(401, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(402, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313935272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203434313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(403, 0, 1, 0, 6439, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313935272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203434313030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(404, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(405, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(406, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313936272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(407, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(408, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(409, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(410, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(411, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313939272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(412, 0, 1, 0, 7025, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313939272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(413, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313939272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(414, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(415, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(416, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(417, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(418, 0, 1, 0, 6901, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323030272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203433323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(419, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(420, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(421, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(422, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(423, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(424, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(425, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(426, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(427, 0, 1, 0, 1210, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(428, 0, 1, 0, 1210, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(429, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(430, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(431, 0, 1, 0, 5304, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203332343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(432, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203332343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(433, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(434, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(435, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(436, 0, 1, 0, 1210, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(437, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(438, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(439, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(440, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203237393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(441, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(442, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(443, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(444, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(445, 0, 1, 0, 7811, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(446, 0, 1, 0, 7812, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(447, 0, 1, 0, 4916, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(448, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640207000000),
(449, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640209000000),
(450, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(451, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640208000000),
(452, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(453, 0, 1, 0, 6437, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203836343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(454, 0, 1, 0, 9169, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203537363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(455, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(456, 0, 1, 0, 7817, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(457, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(458, 0, 1, 0, 7818, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(459, 0, 1, 0, 7815, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(460, 0, 1, 0, 7816, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(461, 0, 1, 0, 9166, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203538353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(462, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(463, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(464, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(465, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(466, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(467, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(468, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(469, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(470, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(471, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(472, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(473, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(474, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(475, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(476, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(477, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(478, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(479, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(480, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(481, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(482, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(483, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(484, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(485, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(486, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(487, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(488, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(489, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(490, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(491, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(492, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(493, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(494, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(495, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(496, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(497, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(498, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(499, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(500, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(501, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(502, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(503, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(504, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(505, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(506, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(507, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(508, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(509, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(510, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(511, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(512, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(513, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(514, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(515, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(516, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(517, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(518, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(519, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(520, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(521, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(522, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(523, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(524, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(525, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(526, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(527, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(528, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(529, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(530, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(531, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(532, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(533, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(534, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(535, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(536, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(537, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(538, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(539, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(540, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(541, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(542, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(543, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(544, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(545, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(546, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(547, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(548, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(549, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(550, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(551, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(552, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(553, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(554, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(555, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(556, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(557, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(558, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(559, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(560, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(561, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(562, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(563, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(564, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(565, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(566, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(567, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(568, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(569, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(570, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(571, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(572, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(573, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(574, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(575, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(576, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(577, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(578, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(579, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(580, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(581, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(582, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(583, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(584, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(585, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(586, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(587, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(588, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(589, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(590, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(591, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(592, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(593, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(594, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(595, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(596, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(597, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(598, 0, 1, 0, 6250, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(599, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(600, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(601, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(602, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(603, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(604, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(605, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(606, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(607, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(608, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(609, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(610, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(611, 0, 1, 0, 6446, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(612, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(613, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(614, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(615, 0, 1, 0, 6447, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(616, 0, 1, 0, 6253, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(617, 0, 1, 0, 1213, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(618, 0, 1, 0, 6437, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(619, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640207000000),
(620, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(621, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(622, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(623, 0, 1, 0, 6436, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023323439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203734373030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(624, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203337383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(625, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203337383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(626, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(627, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(628, 0, 1, 0, 5303, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(629, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(630, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(631, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(632, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(633, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(634, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(635, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027426169616b486f75736534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(636, 0, 1, 0, 7819, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(637, 0, 1, 0, 7820, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(638, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(639, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(640, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203530343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(641, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(642, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(643, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(644, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(645, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(646, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(647, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(648, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(649, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(650, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(651, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(652, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(653, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(654, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(655, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(656, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(657, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(658, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(659, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(660, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(661, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(662, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027446f6e617465204775696c64486f75736531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353633343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(663, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(664, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(665, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(666, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(667, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(668, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(669, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313235313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(670, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313235313030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(671, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(672, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203434313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(673, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(674, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(675, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(676, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(677, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(678, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203936333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(679, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(680, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(681, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313231353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(682, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313132353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(683, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(684, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(685, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(686, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(687, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313132353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(688, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(689, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(690, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(691, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(692, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(693, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(694, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323037303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(695, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323037303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(696, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(697, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(698, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323037303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(699, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(700, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(701, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313837323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(702, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(703, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(704, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313837323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(705, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(706, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(707, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313034343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(708, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313034343030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(709, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(710, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(711, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203531333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(712, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(713, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(714, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203531333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(715, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(716, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(717, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313338363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(718, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(719, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(720, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f7573652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313338363030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(721, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(722, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(723, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(724, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(725, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274d616e73616f20446f6e6174652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(726, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274d616e73616f20446f6e6174652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(727, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(728, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(729, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f75736520274d616e73616f20446f6e6174652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530313030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(730, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(731, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(732, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313333323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(733, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(734, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(735, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313339353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(736, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313534383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(737, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(738, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(739, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313434303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(740, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(741, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(742, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(743, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313434303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(744, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(745, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(746, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(747, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313132353030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(748, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(749, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313132353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(750, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313132353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(751, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(752, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(753, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(754, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(755, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(756, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(757, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(758, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(759, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435393030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(760, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203239373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(761, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(762, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(763, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(764, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(765, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(766, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(767, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(768, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203339363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(769, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(770, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(771, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203639333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(772, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203639333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(773, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(774, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(775, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(776, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(777, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(778, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(779, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(780, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203430353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(781, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(782, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(783, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(784, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(785, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(786, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(787, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(788, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203730323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(789, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203730323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(790, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(791, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(792, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(793, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(794, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203531333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(795, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(796, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(797, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203531333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(798, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(799, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(800, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313039383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(801, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(802, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(803, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313039383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(804, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323039373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(805, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(806, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(807, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(808, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323039373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(809, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(810, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(811, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323039373030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(812, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(813, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(814, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(815, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(816, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(817, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(818, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(819, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(820, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203939303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(821, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(822, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(823, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(824, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(825, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634383030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(826, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(827, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(828, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634383030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(829, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(830, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(831, 0, 1, 0, 7821, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(832, 0, 1, 0, 7822, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(833, 0, 1, 0, 1710, 1, ''),
(834, 0, 1, 0, 1711, 1, ''),
(835, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203639333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(836, 0, 1, 0, 7821, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(837, 0, 1, 0, 7822, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(838, 0, 1, 0, 1710, 1, ''),
(839, 0, 1, 0, 1711, 1, ''),
(840, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203638343030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(841, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(842, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(843, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(844, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(845, 0, 1, 0, 5517, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203636363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(846, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(847, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(848, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(849, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(850, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203932373030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(851, 0, 1, 0, 5515, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365203336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203932373030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(852, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(853, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e);

-- --------------------------------------------------------

--
-- Estrutura da tabela `zaypay_payment`
--

CREATE TABLE IF NOT EXISTS `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `zaypay_payment`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_bug_tracker`
--

CREATE TABLE IF NOT EXISTS `z_bug_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_bug_tracker`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelog`
--

CREATE TABLE IF NOT EXISTS `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_changelog`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `icon_id` int(3) NOT NULL DEFAULT '1',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_forum`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_monsters`
--

CREATE TABLE IF NOT EXISTS `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_monsters`
--

INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Draken Spellweaver', 0, 2600, 5000, 10, 0, '', 'fire, invisible', 0, 0, 'blood', 'drakenspellweaver.gif'),
(0, 'Draken Warmaster', 0, 2400, 4150, 1, 0, '', 'fire, invisibility', 0, 0, 'blood', 'drakenwarmaster.gif'),
(0, 'Gnarlhound', 0, 60, 198, 1, 0, '"Gnarlll!", "Grrrrrr!"', '', 127, 0, 'blood', 'gnarlhound.gif'),
(0, 'Insect Swarm', 0, 40, 50, 1, 0, '', 'earth', 0, 127, 'venom', 'insectswarm.gif'),
(0, 'Killer Caiman', 350, 800, 1500, 10, 1, '', 'invisible', 0, 0, 'blood', 'killercaiman.gif'),
(0, 'Lancer Beetle', 0, 250, 400, 1, 0, '"Crump!"', 'earth, invisible, lifedrain, paralyze', 0, 127, 'venom', 'lancerbeetle.gif'),
(0, 'Lizard Chosen', 0, 2200, 3050, 10, 0, '"Grzzzzzzz!"', 'earth, invisible', 0, 0, 'blood', 'lizardchosen.gif'),
(0, 'Lizard Dragon Priest', 0, 1200, 1450, 50, 0, '', 'earth, invisible', 0, 0, 'blood', 'lizarddragonpriest.gif'),
(0, 'Lizard High Guard', 0, 1450, 1800, 60, 0, '"Grzzzzzzz!"', 'earth, invisible', 0, 0, 'blood', 'lizardhighguard.gif'),
(0, 'Lizard Legionnaire', 0, 1100, 1400, 1, 0, '"Tssss!"', 'earth, invisible', 0, 0, 'blood', 'lizardlegionnaire.gif'),
(0, 'Lizard Zaogun', 0, 1700, 2955, 100, 0, '', 'earth, invisible', 0, 0, 'blood', 'lizardzaogun.gif'),
(0, 'Orc Marauder', 0, 220, 235, 85, 1, '"Grrrrrr"', 'invisible', 0, 127, 'blood', 'orcmarauder.gif'),
(0, 'Sandcrawler', 0, 20, 30, 1, 0, '"Chrk chrk!"', '', 1, 0, 'venom', 'sandcrawler.gif'),
(0, 'Terramite', 0, 160, 365, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'terramite.gif'),
(0, 'Ghastly Dragon', 0, 4600, 7800, 95, 0, '"EMBRACE MY GIFTS!", "I WILL FEAST ON YOUR SOUL!"', 'paralyze, invisible, death, earth', 0, 0, 'undead', 'ghastlydragon.gif'),
(0, 'Wailing Widow', 0, 450, 850, 30, 1, '"EMBRACE MY GIFTS!", "I WILL FEAST ON YOUR SOUL!"', 'paralyze, invisible, death, earth', 0, 0, 'venom', 'wailingwidow.gif'),
(0, 'Eternal Guardian', 300, 25, 70, 1, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 1, 1, 'blood', 'eternalguardian.gif'),
(0, 'Battlemaster Zunzu', 0, 2500, 5000, 100, 0, '', 'earth, invisible', 0, 0, 'blood', 'battlemasterzunzu.gif'),
(0, 'Acid Blob', 0, 250, 250, 1, 0, '', 'death, earth', 0, 0, 'venom', 'acidblob.gif'),
(0, 'Crazed Beggar', 300, 35, 100, 1, 0, '"You are one of THEM! Die!", "Wanna buy roses??"', '', 1, 1, 'blood', 'crazedbeggar.gif'),
(0, 'Medusa', 0, 4050, 4500, 10, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusa.gif'),
(0, 'Damaged Worker Golem', 0, 95, 260, 25, 0, '"Klonk klonk klonk", "Failure! Failire!", "Good morning citizen. How may I serve you?", "Target identified: Rat! Termination initiated!"', 'invisible, paralyze', 0, 0, 'undead', 'damagedworkergolem.gif'),
(0, 'Death Blob', 0, 300, 320, 1, 0, '', '', 0, 0, 'undead', 'deathblob.gif'),
(0, 'Gang Member', 420, 70, 295, 1, 0, '"I don''t like the way you look!", "You''re wearing the wrong colours!", "This is our territory!"', '', 1, 1, 'blood', 'gangmember.gif'),
(0, 'Gladiator', 470, 90, 185, 1, 1, '"You are no match for me!", "Feel my prowess", "Fight!"', '', 1, 1, 'blood', 'gladiator.gif'),
(0, 'Gozzler', 800, 180, 240, 1, 1, '"Huhuhuhuuu!", "Let the fun begin!", "Yihahaha!", "I''ll bite you! Nyehehehehe!"', 'invisible', 1, 0, 'blood', 'gozzler.gif'),
(0, 'Hellspawn', 0, 2550, 3500, 70, 0, '"Your fragile bones are like toothpicks to me.", "You little weasel will not live to see another day.", "I''m just a messenger of what''s yet to come."', 'paralyze, invisible', 0, 0, 'blood', 'hellspawn.gif'),
(0, 'Infernalist', 0, 4000, 3650, 20, 0, '"Nothing will remain but your scorched bones!", "Some like it hot!", "Feel the heat of battle!"', 'energy, fire, paralyze, invisible', 0, 0, 'blood', 'infernalist.gif'),
(0, 'Mad Scientist', 0, 205, 325, 1, 0, '"Die in the name of Science!", "I will study your corpse", "You will regret interrupting my studies!", "Let me test this!"', 'drown, invisible', 0, 0, 'blood', 'madscientist.gif'),
(0, 'Mercury Blob', 0, 180, 150, 1, 0, '"Crackle"', 'death', 0, 0, 'undead', 'mercuryblob.gif'),
(0, 'Mutated Rat', 0, 450, 550, 13, 0, '"Grrrrrrrrrrrrrr!", "Fcccccchhhhhh"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedrat.gif'),
(0, 'Mutated Human', 0, 150, 240, 13, 0, '"Take that creature off my back!! I can fell it!", "HEEEEEEEELP!", "You will be the next infected one... GRAAAAAAAAARRR!", "Science... is a curse.", "Run as fast as you can.", "Oh by the gods! What is this... aaaaaargh!"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedhuman.gif'),
(0, 'Mutated Bat', 0, 615, 900, 13, 0, '"Shriiiiek"', 'death, earth, drown, invisible, drunk', 0, 0, 'blood', 'mutatedbat.gif'),
(0, 'Mutated Tiger', 0, 750, 1100, 13, 0, '"GRAAARRRRRR", "CHHHHHHHHHHH"', 'paralyze, drunk, invisible', 0, 0, 'blood', 'mutatedtiger.gif'),
(0, 'The Mutated Pumpkin', 0, 30000, 100000, 1, 0, '"I had the Halloween Hare for breakfast!", "Your soul will be mine...wait, wrong line", "Trick or treat? I saw death!", "No wait! Don''t kill me! It''s me, your friend!", "Bunnies, bah! I''m the real thing!", "Muahahahaha!", "I''ve come to avenge all those mutilated pumpkins!", "Wait until I get you!", "Fear the spirit of Halloween!"', 'invisible', 0, 0, 'fire', 'themutatedpumpkin.gif'),
(0, 'Nightmare Scion', 0, 1350, 1400, 70, 1, '"Weeeheeheee!"', 'earth, death, invisible', 0, 0, 'blood', 'nightmarescion.gif'),
(0, 'Vampire Bride', 0, 1050, 1200, 23, 0, '"Kneel before your Mistress!", "Dead is the new alive.", "Come, let me kiss you, darling. Oh wait, I meant kill.", "Enjoy the pain - I know you love it."', 'death, invisible', 0, 0, 'blood', 'vampirebride.gif'),
(0, 'War Golem', 0, 2550, 4300, 25, 1, '"Azerus barada nikto!", "Klonk klonk klonk", "Engaging Enemy!", "Threat level processed.", "Charging weapon systems!", "Auto repair in progress.", "The battle is joined!", "Termination initialized!", "Rrrtttarrrttarrrtta"', 'invisible, paralyze', 0, 0, 'undead', 'wargolem.gif'),
(0, 'Worker Golem', 0, 1250, 1400, 25, 0, '"INTRUDER ALARM!", "klonk klonk klonk", "Rrrtttarrrttarrrtta", "Awaiting orders.", "Secret objective complete."', 'invisible, paralyze', 0, 0, 'undead', 'workergolem.gif'),
(0, 'Zombie', 0, 280, 500, 1, 0, '"Mst.... klll....", "Whrrrr... ssss.... mmm.... grrrrl", "Dnnnt... cmmm... clsrrr....", "Httt.... hmnnsss..."', 'death, energy, ice, earth, lifedrain, paralyze', 0, 0, 'undead', 'zombie.gif'),
(0, 'Pythius The Rotten', 0, 100, 8350, 40, 0, '"YOU''LL NEVER GET MY TREASURE!"', 'death, earth, fire, drown, lifedrain, paralyze, invisible', 0, 0, 'undead', 'pythiustherotten.gif'),
(0, 'Lavahole', 0, 1200, 9950, 1, 0, '', 'physical, energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'lavahole.gif'),
(0, 'Yalahari', 0, 5, 150, 24, 0, '"Welcome to Yalahar, outsider.", "Our wisdom and knowledge are unequalled in this world.", "One day Yalahar will return to its former glory.", "That knowledge would overburden your fragile mind."', 'paralyze, invisible', 0, 0, 'blood', 'yalahari.gif'),
(0, 'Diseased Dan', 0, 300, 2000, 15, 0, '"Tchhh!", "Slurp!"', 'paralyze, invisible', 0, 0, 'venom', 'diseaseddan.gif'),
(0, 'Bandit', 450, 65, 245, 1, 0, '"Your money or your life!", "Hand me your purse!"', '', 1, 1, 'blood', 'bandit.gif'),
(0, 'Seagull', 250, 0, 25, 1, 0, '', '', 1, 0, 'blood', 'seagull.gif'),
(0, 'Butterfly', 0, 0, 2, 40, 0, '', 'poison, paralyze, drunk', 0, 0, 'venom', 'butterfly.gif'),
(0, 'Undead Gladiator', 0, 800, 1000, 15, 0, '', 'invisible', 0, 0, 'blood', 'undeadgladiator.gif'),
(0, 'The Incendier', 0, 2900, 25600, 40, 0, '', 'paralyze, invisible', 0, 0, 'fire', 'theincendier.gif'),
(0, 'Bones', 0, 3750, 9500, 40, 0, '"Your new name is breakfast.", "Keep that dog away!", "Out Fluffy! Out! Bad dog!"', 'drunk, invisible', 0, 0, 'undead', 'bones.gif'),
(0, 'Fluffy', 0, 3550, 4500, 45, 0, '"Wooof!"', 'drunk, invisible', 0, 0, 'blood', 'fluffy.gif'),
(0, 'Grynch Clan Goblin', 0, 4, 80, 90, 1, '"T''was not me hand in your pocket!", "Look! Cool stuff in house. Let''s get it!", "Uhh! Nobody home!", "Me just borrowed it!", "Me no steal! Me found it!", "Me had it for five minutes. It''s family heirloom now!", "Nice human won''t hurt little, good goblin?", "Gimmegimme!", "Invite me in you lovely house plx!", "Other Goblin stole it!", "All presents mine!", "Me got ugly ones purse", "Free itans plz!", "Not me! Not me!", "Guys, help me here! Guys? Guys???", "That only much dust in me pocket! Honest!", "Can me have your stuff?", "Halp, Big dumb one is after me!", "Uh, So many shiny things!", "Utani hur hur hur!", "Mee? Stealing? Never!!!", "Oh what fun it is to steal a one-horse open sleigh!", "Must have it! Must have it!", "Where me put me lockpick?", "Catch me if you can!"', 'fire, invisible', 0, 0, 'blood', 'grynchclangoblin.gif'),
(0, 'Hacker', 0, 45, 430, 15, 1, '"Feel the wrath of me dos attack!", "You''re next!", "Gimme free gold!", "Me sooo smart!", "Me have a cheating link for you!", "Me is GM!", "Gimme your password!", "Me just need the code!", "Me not stink!", "Me other char is highlevel!"', 'energy, fire, poison, drunk', 0, 1, 'blood', 'hacker.gif'),
(0, 'Minishabaal', 0, 4000, 3500, 240, 1, '"I had Princess Lumelia as breakfast!", "Naaa-Nana-Naaa-Naaa!", "My brother will come and get you for this!", "Get them Fluffy!", "He He He!", "Pftt, Ferumbras such an upstart!", "My dragon is not that old, it''s just second hand!", "My other dragon is a red one!", "When I am big I want to become the ruthless eighth!", "WHERE''S FLUFFY?", "Muahaha!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'minishabaal.gif'),
(0, 'Primitive', 0, 45, 200, 40, 0, '"We don''t need a future!", "I''ll rook you all!", "They thought they''d beaten us!", "You are history!", "There can only be one world!", "Valor who?", "Die noob!", "There are no dragons!", "I''ll quit forever! Again ...", "You all are noobs!", "Beware of the cyclops!", "Just had a disconnect.", "Magic is only good for girls!", "We''ll be back!"', 'energy, fire, drunk, invisible', 0, 0, 'blood', 'primitive.gif'),
(0, 'Tibia Bug', 250, 50, 270, 10, 0, '"My father was a year 2k bug.", "Psst, I''ll make you rich.", "You are bugged ... by me!"', 'energy, fire, drunk', 1, 1, 'venom', 'tibiabug.gif'),
(0, 'Undead Minion', 620, 550, 850, 5, 0, '', 'fire, poison, lifedrain, drunk', 0, 1, 'undead', 'undeadminion.gif'),
(0, 'Amazon', 390, 60, 110, 1, 0, '"Yeeee ha!", "Your head shall be mine!"', '', 1, 1, 'blood', 'amazon.gif'),
(0, 'Valkyrie', 450, 85, 190, 1, 0, '"Another head for me!", "Stand still!", "One more head for me!", "Head off!"', '', 1, 1, 'blood', 'valkyrie.gif'),
(0, 'Xenia', 450, 255, 290, 1, 0, '"Stand still!", "One more head for me!", "Head off!"', '', 0, 1, 'blood', 'xenia.gif'),
(0, 'Carrion Worm', 280, 70, 145, 1, 0, '', '', 0, 1, 'blood', 'carrionworm.gif'),
(0, 'Rotworm', 0, 40, 65, 1, 0, '', '', 0, 1, 'blood', 'rotworm.gif'),
(0, 'Rotworm Queen', 0, 85, 105, 1, 0, '"..."', '', 0, 0, 'blood', 'rotwormqueen.gif'),
(0, 'Kongra', 0, 115, 340, 1, 1, '"Hugah!", "Ungh! Ungh!", "Huaauaauaauaa!"', '', 0, 0, 'blood', 'kongra.gif'),
(0, 'Hairman The Huge', 0, 335, 600, 5, 1, '"Hugah!", "Ungh! Ungh!", "Huaauaauaauaa!"', 'invisible', 0, 0, 'blood', 'hairmanthehuge.gif'),
(0, 'Merlkin', 0, 145, 230, 1, 0, '"Ugh! Ugh! Ugh!", "Holy banana!", "Chakka! Chakka!"', 'invisible', 0, 0, 'blood', 'merlkin.gif'),
(0, 'Sibang', 0, 115, 225, 1, 1, '"Eeeeek! Eeeeek", "Huh! Huh! Huh!", "Ahhuuaaa!"', 'invisible', 0, 0, 'blood', 'sibang.gif'),
(0, 'Crystal Spider', 0, 900, 1250, 35, 1, '"Screeech!"', 'ice, fire, paralyze, drunk, invisible', 0, 0, 'undead', 'crystalspider.gif'),
(0, 'Giant Spider', 0, 900, 1300, 25, 1, '', 'earth, invisible', 0, 0, 'VENOM', 'giantspider.gif'),
(0, 'Poison Spider', 270, 22, 26, 1, 0, '', 'earth', 1, 1, 'VENOM', 'poisonspider.gif'),
(0, 'Scorpion', 310, 45, 45, 1, 0, '', 'earth', 1, 1, 'VENOM', 'scorpion.gif'),
(0, 'Spider', 210, 12, 20, 1, 0, '', '', 1, 1, 'VENOM', 'spider.gif'),
(0, 'Tarantula', 485, 120, 225, 30, 1, '', '', 1, 1, 'VENOM', 'tarantula.gif'),
(0, 'The Old Widow', 0, 2800, 3200, 50, 1, '', 'earth, fire, invisible', 0, 0, 'venom', 'theoldwidow.gif'),
(0, 'Drasilla', 0, 700, 1000, 1, 0, '"FCHHHHHHHH!", "GROOOOAAAAAAAAR!"', 'fire, poison, drunk, invisible', 0, 0, 'blood', 'drasilla.gif'),
(0, 'Grimgor Guteater', 0, 670, 1115, 10, 0, '"Renat Ulderek.", "Ikem Rambo Zambo."', 'fire, poison, invisible', 0, 0, 'blood', 'grimgorguteater.gif'),
(0, 'Slim', 0, 580, 1025, 1, 0, '"Knooorrr!"', 'poison, paralyze', 0, 0, 'undead', 'slim.gif'),
(0, 'Spirit Of Earth', 0, 800, 1285, 1, 0, '', 'fire, poison, paralyze, drunk', 0, 1, 'undead', 'spiritofearth.gif'),
(0, 'Spirit Of Fire', 0, 950, 2140, 1, 0, '', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'spiritoffire.gif'),
(0, 'Spirit Of Water', 0, 850, 1430, 1, 0, '', 'fire, poison, paralyze, invisible', 0, 0, 'undead', 'spiritofwater.gif'),
(0, 'Darakan The Executioner', 0, 1600, 3500, 18, 0, '"FIGHT LIKE A BARBARIAN!", "VICTORY IS MINE!", "I AM your father!", "To be the man you have to beat the man!"', 'invisible', 0, 1, 'blood', 'darakantheexecutioner.gif'),
(0, 'Deathbringer', 0, 5100, 10000, 40, 0, '"YOU FOOLS WILL PAY!", "YOU ALL WILL DIE!!", "DEATH, DESTRUCTION!", "I will eat your soul!"', 'death, energy, invisible', 0, 0, 'undead', 'deathbringer.gif'),
(0, 'Gnorre Chyllson', 0, 4000, 7100, 80, 0, '"I am like the merciless northwind", "Snow will be your death shroud."', 'earth, ice, fire, paralyze, invisible', 0, 0, 'blood', 'gnorrechyllson.gif'),
(0, 'Norgle Glacierbeard', 0, 2100, 4300, 23, 0, '"I''ll extinguish you warmbloods.", "REVENGE!", "Far too hot.", "Revenge is sweetest when served cold."', 'invisible', 0, 1, 'undead', 'norgleglacierbeard.gif'),
(0, 'Svoren The Mad', 0, 3000, 6300, 20, 0, '"NO mommy NO. Leave me alone!"', 'energy, fire, poison', 0, 1, 'blood', 'svorenthemad.gif'),
(0, 'The Masked Marauder', 0, 3500, 6800, 15, 0, '"Didn''t you leave your house door open?", "Oops, your shoelaces are open!"', 'fire, paralyze, invisible', 0, 0, 'blood', 'themaskedmarauder.gif'),
(0, 'The Obliverator', 0, 6000, 10500, 30, 0, '"NO ONE WILL BEAT ME!"', 'fire, invisible', 0, 0, 'fire', 'theobliverator.gif'),
(0, 'The Pit Lord', 0, 2500, 4500, 30, 1, '"I''LL GET YOU ALL!", "I won''t let you escape!", "I''ll crush you beneath my feet!"', 'invisible', 0, 0, 'blood', 'thepitlord.gif'),
(0, 'Webster', 0, 1200, 1750, 40, 0, '"You are lost!", "Come my little morsel."', 'ice, invisible', 0, 0, 'undead', 'webster.gif'),
(0, 'Barbarian Bloodwalker', 590, 195, 305, 1, 1, '"YAAAHEEE!", "SLAUGHTER!", "CARNAGE!"', 'drunk, invisible', 0, 1, 'blood', 'barbarianbloodwalker.gif'),
(0, 'Barbarian Brutetamer', 0, 115, 145, 10, 0, '"To me, creatures of the wild!", "My instincts tell me about your cowardice."', 'lifedrain, paralyze, drunk, invisible', 0, 0, 'blood', 'barbarianbrutetamer.gif'),
(0, 'Barbarian Headsplitter', 0, 85, 100, 15, 0, '"I will regain my honor with your blood!", "Surrender is not option!", "Its you or me!"', 'poison, paralyze', 0, 0, 'blood', 'barbarianheadsplitter.gif'),
(0, 'Barbarian Skullhunter', 0, 85, 135, 25, 0, '"You will become my trophy.", "Fight harder, coward.", "Show that you are a worthy opponent."', 'drunk, paralyze', 0, 0, 'blood', 'barbarianskullhunter.gif'),
(0, 'Barbaria', 0, 355, 555, 30, 0, '"To me, creatures of the wild!", "My instincts tell me about your cowardice."', 'lifedrain, paralyze, drunk, invisible', 0, 0, 'blood', 'barbaria.gif'),
(0, 'Bear', 300, 23, 80, 1, 0, '"grrrr", "groar"', '', 1, 1, 'blood', 'bear.gif'),
(0, 'Panda', 300, 23, 80, 10, 0, '"Grrrr", "Groar"', 'earth', 1, 1, 'blood', 'panda.gif'),
(0, 'Polar Bear', 315, 28, 85, 1, 0, '"Grrrrrr", "GROARRR!"', '', 1, 1, 'blood', 'polarbear.gif'),
(0, 'Braindeath', 0, 895, 1225, 25, 0, '"You have disturbed my thoughts!", "Let me turn you into something more useful!", "Let me taste your brain!", "You will be punished!"', 'earth, death, invisible', 0, 0, 'undead', 'braindeath.gif'),
(0, 'Beholder', 0, 170, 260, 1, 0, '"Eye for eye!", "Here''s looking at you!", "Let me take a look at you!", "You''ve got the look!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'VENOM', 'beholder.gif'),
(0, 'Elder Beholder', 0, 280, 1100, 25, 0, '"Let me take a look at you!", "Inferior creatures, bow before my power!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'elderbeholder.gif'),
(0, 'Gazer', 0, 90, 120, 10, 1, '"Mommy!?", "Buuuuhaaaahhaaaaa!", "Me need mana!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'VENOM', 'gazer.gif'),
(0, 'The Evil Eye', 0, 1500, 1200, 10, 0, '"653768764!", "Let me take a look at you!", "Inferior creatures, bow before my power!", "659978 54764!"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'theevileye.gif'),
(0, 'Eye Of The Seven', 0, 90, 1, 1, 0, '', 'physical, holy, energy, fire, death, earth, ice, poison, lifedrain', 0, 0, 'VENOM', 'eyeoftheseven.gif'),
(0, 'Carniphila', 0, 150, 255, 1, 0, '', 'earth, invisible', 0, 0, 'VENOM', 'carniphila.gif'),
(0, 'Spit Nettle', 0, 20, 150, 1, 0, '', 'energy, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'spitnettle.gif'),
(0, 'The Abomination', 0, 25000, 38050, 60, 0, '"Blubb"', 'earth, energy, invisible', 0, 0, 'venom', 'theabomination.gif'),
(0, 'Son Of Verminor', 0, 5900, 8500, 1, 0, '"Blub!", "Blub! Blub!", "Come''on Daddy! Help me"', 'poison, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'sonofverminor.gif'),
(0, 'Defiler', 0, 3700, 3650, 13, 0, '"Blubb"', 'earth, paralyze, invisible', 0, 0, 'venom', 'defiler.gif'),
(0, 'Slime2', 0, 260, 150, 1, 0, '"Blubb"', 'poison', 0, 0, 'VENOM', 'slime2.gif'),
(0, 'Slime', 0, 160, 150, 1, 0, '', 'earth', 0, 0, 'VENOM', 'slime.gif'),
(0, 'Bog Raider', 0, 800, 1300, 40, 0, '"Tchhh!", "Slurp!"', 'paralyze, invisible', 0, 0, 'venom', 'bograider.gif'),
(0, 'Tiquandas Revenge', 0, 2635, 2400, 5, 1, '', 'earth, invisible', 0, 0, 'VENOM', 'tiquandasrevenge.gif'),
(0, 'Chicken', 220, 0, 15, 1, 0, '"gokgoooook", "cluck cluck"', '', 1, 1, 'blood', 'chicken.gif'),
(0, 'Dire Penguin', 0, 120, 173, 1, 0, '', 'fire, outfit', 0, 0, 'blood', 'direpenguin.gif'),
(0, 'Flamingo', 250, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'flamingo.gif'),
(0, 'Penguin', 300, 1, 33, 1, 0, '', '', 1, 1, 'blood', 'penguin.gif'),
(0, 'Terror Bird', 490, 150, 300, 30, 0, '"CRAAAHHH!", "Gruuuh Gruuuh.", "Carrah Carrah!"', '', 1, 1, 'blood', 'terrorbird.gif'),
(0, 'Bazir', 0, 30000, 110000, 155, 1, '"COME HERE! FREE ITEMS FOR EVERYONE!", "BOW TO THE POWER OF THE RUTHLESS SEVEN!", "Slay your friends and I will spare you!", "DON''T BE AFRAID! I AM COMING IN PEACE!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'bazir.gif'),
(0, 'Arabian', 10000, 20000, 30000, 155, 1, '"Become to Desert", "LEAVE!", "Attack ! Scarabs", "I am Arabian! Leave Now!", "DOOOWWN"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'arabian.gif'),
(0, 'The Fire Elemental', 850, 1000, 12000, 55, 0, '', 'fire', 0, 0, 'fire', 'thefireelemental.gif'),
(0, 'Infernatil', 0, 85000, 270000, 193, 1, '"Worship Zathroth pathetic mortal!", "Your soul will be mine!", "ASHES TO ASHES!", "YOU WILL ALL BURN!", "THE DAY OF RECKONING IS AT HAND!", "BOW TO THE POWER OF THE RUTHLESS SEVEN!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'infernatil.gif'),
(0, 'Zoralurk', 0, 30000, 55000, 90, 1, '"I AM ZORALURK, THE DEMON WITH A THOUSAND FACES!", "BRING IT, COCKROACHES!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'UNDEAD', 'zoralurk.gif'),
(0, 'Dark Wizard', 0, 2600, 2100, 48, 0, '"You will not live to tell anyone!", "You are my game today!"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 1, 'blood', 'darkwizard.gif'),
(0, 'The Spirit', 0, 2600, 2100, 65, 0, '"Revenge ... is so ... sweet!", "Life...force!", "Feed me your... lifeforce!"', 'earth, death, lifedrain, paralyze, invisible', 0, 0, 'undead', 'thespirit.gif'),
(0, 'Apocalypse', 0, 35000, 80000, 80, 1, '"BOW TO THE POWER OF THE RUTHLESS SEVEN!", "DESTRUCTION!", "CHAOS!", "DEATH TO ALL!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'apocalypse.gif'),
(0, 'King Of Baiak', 10000, 20000, 300000, 155, 1, '"This is my Castle", "LEAVE!", "Attack ! Soldiers!", "I am King of Baiak! Leave Now!", "DOOOWWN"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'kingofbaiak.gif'),
(0, 'Ghazbaran', 0, 15000, 60000, 98, 1, '"COME AND GIVE ME SOME AMUSEMENT!", "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", "FLAWLESS VICTORY!"', 'energy, earth, fire, paralyze, invisible', 0, 0, 'fire', 'ghazbaran.gif'),
(0, 'Morgaroth', 0, 15000, 55500, 90, 0, '"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS", "The triangle of terror will rise!", "Zathroth look at the destruction i am causing in your name!", "I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!"', 'energy, fire, poison, lifedrain, paralyze, invisible', 0, 0, 'fire', 'morgaroth.gif'),
(0, 'Abominator', 0, 50000, 40000, 140, 1, '"I AM ABOMINATOR, LORD OF THE TRIANGLE... AND YOU ARE LOST!", "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", "THE TRIANGLE OF TERROR WILL RISE!", "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!"', 'paralyze, invisible', 0, 0, 'undead', 'abominator.gif'),
(0, 'Dark Abominator', 0, 50000, 50000, 140, 1, '"I AM DARK ABOMINATOR, LORD OF THE TRIANGLE... AND YOU ARE LOST!", "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", "THE TRIANGLE OF TERROR WILL RISE!", "WELCOME TO HELL! YOU GO DIE!!"', 'paralyze, invisible', 0, 0, 'undead', 'darkabominator.gif'),
(0, 'Orshabaal', 0, 10000, 20500, 65, 1, '"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", "YOU ARE DOOMED!", "ORSHABAAL IS BACK!", "Be prepared for the day my masters will come for you!", "SOULS FOR ORSHABAAL!"', 'earth, fire, lifedrain, paralyze, invisible', 0, 0, 'fire', 'orshabaal.gif'),
(0, 'Magician', 0, 15000, 200000, 55, 1, '"Feel the power of my runes!", "Killing you is getting expensive", "My secrets are mine alone!"', 'invisible', 0, 0, 'blood', 'magician.gif'),
(0, 'Fada', 0, 2900, 2600, 48, 0, '"You will not live to tell anyone!", "You are my game today!"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 1, 'blood', 'fada.gif'),
(0, 'Shadow Warrior', 0, 2800, 3000, 98, 0, '"I am Shadow Warrior. Come to Hell"', 'poison', 0, 1, 'blood', 'shadowwarrior.gif'),
(0, 'Lord Frost Dragon', 390, 2500, 2100, 40, 0, '"CHHHRRRR", "HISSSS"', 'ice, fire, earth, paralyze, lifedrain, invisible', 0, 0, 'undead', 'lordfrostdragon.gif'),
(0, 'Lord Of The Elements', 0, 8000, 17000, 65, 0, '', 'holy, earth, physical, fire, death, invisible', 0, 0, 'undead', 'lordoftheelements.gif'),
(0, 'Dog', 220, 0, 20, 1, 0, '"hufhuf"', '', 1, 1, 'blood', 'dog.gif'),
(0, 'Hellhound', 0, 6800, 7500, 45, 0, '"GROOOWL!", "GRRRRR!"', 'fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hellhound.gif'),
(0, 'War Wolf', 0, 55, 140, 1, 0, '"Grrrrrrr", "Yoooohhuuuu!"', '', 0, 1, 'blood', 'warwolf.gif'),
(0, 'Winter Wolf', 260, 20, 30, 1, 0, '', '', 1, 1, 'blood', 'winterwolf.gif'),
(0, 'Wolf', 255, 18, 25, 1, 0, '', '', 1, 1, 'blood', 'wolf.gif'),
(0, 'Chakoya Toolshaper', 0, 40, 80, 25, 0, '"Chikuva!!", "Jinuma jamjam!"', 'energy', 0, 0, 'blood', 'chakoyatoolshaper.gif'),
(0, 'Chakoya Tribewarden', 305, 40, 68, 25, 0, '"Chikuva!", "Quisavu tukavi!", "Si siyoqua jamjam!", "Achuq! jinuma!", "Si ji jusipa!"', 'energy', 0, 1, 'blood', 'chakoyatribewarden.gif'),
(0, 'Chakoya Windcaller', 305, 48, 84, 25, 0, '"Chikuva!", "Siqsiq ji jusipa!", "Jagura taluka taqua!"', 'energy', 0, 1, 'blood', 'chakoyawindcaller.gif'),
(0, 'Blood Crab', 505, 160, 290, 1, 0, '', 'poison, lifedrain, invisible', 1, 0, 'blood', 'bloodcrab.gif'),
(0, 'Crab', 305, 30, 55, 1, 0, '"crab crab!"', 'poison', 1, 1, 'blood', 'crab.gif'),
(0, 'Ice Golem', 0, 295, 385, 8, 0, '"Chrr."', 'fire, ice, holy, death, lifedrain, paralyze, invisible', 0, 0, 'undead', 'icegolem.gif'),
(0, 'Yeti', 0, 460, 950, 25, 0, '"Yooodelaaahooohooo!", "Yooodelaaaheeeheee!"', 'energy, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'yeti.gif'),
(0, 'Acolyte Of The Cult', 0, 300, 390, 5, 0, '"Praise voodoo!"', 'fire, poison', 0, 0, 'blood', 'acolyteofthecult.gif'),
(0, 'Adept Of The Cult', 0, 400, 430, 1, 0, '', 'fire, poison', 0, 0, 'blood', 'adeptofthecult.gif'),
(0, 'Enlightened Of The Cult', 0, 500, 700, 1, 0, '', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'enlightenedofthecult.gif'),
(0, 'Novice Of The Cult', 0, 100, 285, 1, 0, '"Fear us!", "You will not tell anyone what you have seen.", "Your curiosity will be punished!"', 'poison, lifedrain, paralyze, outfit, drunk', 0, 0, 'blood', 'noviceofthecult.gif'),
(0, 'Grandfather Tridian', 0, 1400, 1800, 13, 0, '', 'paralyze, invisible', 0, 0, 'undead', 'grandfathertridian.gif'),
(0, 'Ungreez', 10000, 500, 8200, 30, 0, '"I''ll teach you that even heros can die", "You wil die Begging like the others did"', 'energy, fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'ungreez.gif'),
(0, 'Dark Torturer', 0, 4650, 7350, 33, 0, '"You like it, don''t you?", "IahaEhheAie!"', 'fire, invisible', 0, 0, 'blood', 'darktorturer.gif'),
(0, 'Demon', 10000, 6000, 8200, 28, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'demon.gif'),
(0, 'Lord Of Demon', 10000, 4000, 7000, 40, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'lordofdemon.gif'),
(0, 'Destroyer', 0, 2500, 3700, 25, 1, '"Destructiooooon!", "It''s a good day to destroy!"', 'energy, paralyze, invisible', 0, 0, 'blood', 'destroyer.gif'),
(0, 'Diabolic Imp', 0, 2900, 1950, 15, 1, '"Muahaha!", "He he he!"', 'fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'diabolicimp.gif'),
(0, 'Fire Devil', 530, 110, 200, 1, 0, '"Hot, eh?", "Hell, oh hell!"', 'fire', 1, 1, 'blood', 'firedevil.gif'),
(0, 'Fury', 0, 4500, 4100, 95, 0, '"Fire hot!", "Ahhhhrrrrr", "Carnage!"', 'fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'fury.gif'),
(0, 'Hand Of Cursed Fate', 0, 5000, 10500, 40, 1, '', 'death, energy, fire, poison, paralyze, invisible', 0, 0, 'undead', 'handofcursedfate.gif'),
(0, 'Juggernaut', 0, 8700, 20000, 80, 1, '"WAHHHH!", "RAAARRR!", "GRRRRRR!"', 'paralyze, invisible', 0, 0, 'blood', 'juggernaut.gif'),
(0, 'Nightmare', 0, 2150, 2750, 95, 1, '"Close your eyes... I want to show you something!", "I will haunt you forever!", "I will make you scream!"', 'death, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'nightmare.gif'),
(0, 'Plaguesmith', 0, 4500, 8250, 65, 1, '"You are looking a bit feverish today!", "Hachoo!", "Cough Cough!"', 'poison, paralyze, invisible', 0, 0, 'venom', 'plaguesmith.gif'),
(0, 'Blue Djinn', 0, 215, 330, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Be careful what you wish for.", "Wishes can come true."', 'paralyze, invisible', 0, 0, 'blood', 'bluedjinn.gif'),
(0, 'Efreet', 0, 325, 550, 10, 0, '"I grant you a deathwish!", "Muhahahaha!", "I wish you a merry trip to hell!", "Tell me your last wish!", "Good wishes are for fairytales"', 'paralyze, invisible', 0, 0, 'blood', 'efreet.gif'),
(0, 'Green Djinn', 0, 225, 330, 1, 0, '"I grant you a deathwish!", "Muhahahaha!", "I wish you a merry trip to hell!", "Tell me your last wish!", "Good wishes are for fairytales"', 'invisible', 0, 0, 'VENOM', 'greendjinn.gif'),
(0, 'Marid', 0, 325, 550, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Be careful what you wish for.", "Wishes can come true."', 'paralyze, invisible', 0, 0, 'blood', 'marid.gif'),
(0, 'Frost Dragon', 390, 2100, 1800, 20, 0, '"CHHHRRRR", "HISSSS"', 'ice, fire, earth, paralyze, lifedrain, invisible', 0, 0, 'undead', 'frostdragon.gif'),
(0, 'Wyrm', 0, 1450, 1825, 35, 0, '"GRRR!", "GRROARR!"', 'energy, paralyze, invisible', 0, 0, 'blood', 'wyrm.gif'),
(0, 'Sea Serpent', 390, 2300, 3200, 65, 0, '"CHHHRRRR", "HISSSS"', 'ice, paralyze, invisible', 0, 0, 'blood', 'seaserpent.gif'),
(0, 'Dragon Lord', 0, 2100, 1900, 13, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonlord.gif'),
(0, 'Dragon', 0, 700, 1000, 1, 0, '"GROOAAARRR", "FCHHHHH"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragon.gif'),
(0, 'Hydra', 0, 1900, 2250, 10, 0, '"FCHHHHH", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hydra.gif'),
(0, 'Dragon Hatchling', 0, 185, 380, 1, 0, '"Fchu?"', 'fire, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'dragonhatchling.gif'),
(0, 'Dragon Lord Hatchling', 0, 645, 750, 1, 0, '"Zchu?"', 'fire, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'dragonlordhatchling.gif'),
(0, 'Frost Dragon Hatchling', 0, 745, 800, 1, 0, '"Rooawwrr", "Fchu?"', 'fire, earth, ice, paralyze, invisible', 0, 0, 'undead', 'frostdragonhatchling.gif'),
(0, 'Demodras', 0, 3100, 4500, 40, 0, '"ZCHHHHH", "I WILL SET THE WORLD IN FIRE!", "I WILL PROTECT MY BROOD!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'demodras.gif'),
(0, 'Dwarf Geomancer', 0, 245, 380, 1, 0, '"Hail Durin!", "Earth is the strongest element.", "Dust to dust."', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'dwarfgeomancer.gif'),
(0, 'Dwarf Guard', 650, 165, 245, 1, 0, '"Hail Durin!"', 'invisible', 1, 1, 'blood', 'dwarfguard.gif'),
(0, 'Dwarf Soldier', 360, 70, 135, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarfsoldier.gif'),
(0, 'Dwarf', 320, 45, 90, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarf.gif'),
(0, 'Mad Technomancer', 0, 55, 1000, 1, 0, '"I''m going to make them an offer they can''t refuse.", "My masterplan cannot fail!", "Gentlemen, you can''t fight here! This is the War Room!"', 'invisible', 0, 0, 'blood', 'madtechnomancer.gif'),
(0, 'Dworc Fleshhunter', 0, 35, 85, 10, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', 'poison', 0, 1, 'blood', 'dworcfleshhunter.gif'),
(0, 'Dworc Venomsniper', 0, 30, 80, 10, 0, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', 'poison', 0, 1, 'blood', 'dworcvenomsniper.gif'),
(0, 'Dworc Voodoomaster', 0, 50, 80, 10, 1, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', 'poison', 0, 1, 'blood', 'dworcvoodoomaster.gif'),
(0, 'Elephant', 500, 160, 320, 10, 0, '"Hooooot-Toooooot!", "Tooooot.", "Troooooot!"', '', 1, 1, 'blood', 'elephant.gif'),
(0, 'Mammoth', 0, 160, 320, 10, 0, '"Moohhhhooooo!"', '', 0, 0, 'blood', 'mammoth.gif'),
(0, 'Elf Arcanist', 0, 175, 220, 5, 0, '"Feel my wrath!", "For the Daughter of the Stars!", "I''ll bring balance upon you!", "Tha''shi Cenath!", "Vihil Ealuel!"', 'energy, fire, poison, outfit, drunk, invisible', 0, 0, 'blood', 'elfarcanist.gif'),
(0, 'Elf Scout', 360, 75, 160, 3, 0, '"Tha''shi Ab''Dendriel!", "Feel the sting of my arrows!", "Thy blood will quench the soil''s thirst!", "Evicor guide my arrow.", "Your existence will end here!"', 'outfit, drunk, invisible', 1, 1, 'blood', 'elfscout.gif'),
(0, 'Elf', 320, 42, 100, 1, 0, '"Ulathil beia Thratha!", "Bahaha aka!", "You are not welcome here.", "Flee as long as you can.", "Death to the defilers!"', 'outfit, drunk, invisible', 1, 1, 'blood', 'elf.gif'),
(0, 'Dharalion', 0, 1200, 1200, 10, 1, '"You desecrated this temple!", "Noone will stop my ascension!", "My powers are divine!", "Muahahaha!"', 'fire, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'dharalion.gif'),
(0, 'Charged Energy Elemental', 0, 450, 500, 25, 0, '', 'energy, invisible', 0, 0, 'undead', 'chargedenergyelemental.gif'),
(0, 'Energy Elemental', 0, 450, 500, 15, 0, '', 'ice, fire, energy, invisible', 0, 0, 'undead', 'energyelemental.gif'),
(0, 'Massive Energy Elemental', 0, 850, 1100, 40, 0, '', 'ice, energy, fire, invisible', 0, 0, 'undead', 'massiveenergyelemental.gif'),
(0, 'Overcharged Energy Elemental', 0, 1300, 1700, 40, 0, '', 'ice, energy, invisible', 0, 0, 'undead', 'overchargedenergyelemental.gif'),
(0, 'Energy Overlord', 0, 2800, 4000, 35, 0, '', 'ice, energy, poison, invisible', 0, 0, 'undead', 'energyoverlord.gif'),
(0, 'Cat', 200, 0, 20, 1, 0, '"Mew!", "Meow Meow!"', '', 1, 1, 'blood', 'cat.gif'),
(0, 'Lion', 320, 30, 80, 1, 0, '"Grrrrh"', '', 1, 1, 'blood', 'lion.gif'),
(0, 'Tiger', 420, 40, 75, 10, 1, '', '', 1, 1, 'blood', 'tiger.gif'),
(0, 'Azure Frog', 305, 20, 60, 5, 0, '"ribbit!ribbit!"', '', 1, 0, 'blood', 'azurefrog.gif'),
(0, 'Coral Frog', 305, 20, 60, 5, 0, '"ribbit!"', '', 1, 0, 'blood', 'coralfrog.gif'),
(0, 'Crimson Frog', 305, 20, 60, 5, 0, '"Ribbit!Ribbit!"', '', 1, 0, 'blood', 'crimsonfrog.gif'),
(0, 'Orchid Frog', 0, 20, 60, 5, 0, '"Ribbit!Ribbit!"', '', 0, 0, 'blood', 'orchidfrog.gif'),
(0, 'Toad', 400, 60, 135, 10, 0, '"Ribbit!Ribbit!"', 'poison', 1, 0, 'blood', 'toad.gif'),
(0, 'Jagged Earth Elemental', 0, 1300, 1500, 30, 0, '"Stomp STOMP"', 'paralyze, invisible, earth', 0, 0, 'undead', 'jaggedearthelemental.gif'),
(0, 'Muddy Earth Elemental', 0, 450, 650, 20, 0, '', 'paralyze, invisible, earth', 0, 0, 'undead', 'muddyearthelemental.gif'),
(0, 'Earth Elemental', 0, 450, 650, 55, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'earthelemental.gif'),
(0, 'Massive Earth Elemental', 0, 850, 1330, 35, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'massiveearthelemental.gif'),
(0, 'Earth Overlord', 0, 2800, 4000, 55, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'earthoverlord.gif'),
(0, 'Gargoyle', 0, 150, 450, 15, 0, '"Harrrr Harrrr!", "Stone sweet stone.", "Feel my claws, softskin.", "Chhhhhrrrrk!", "There is a stone in your shoe!"', 'fire, poison, lifedrain', 0, 0, 'undead', 'gargoyle.gif'),
(0, 'Stone Golem', 590, 280, 270, 1, 0, '', 'fire, poison, paralyze', 1, 1, 'undead', 'stonegolem.gif'),
(0, 'Grorlam', 0, 2400, 3000, 30, 1, '', 'fire, poison, paralyze', 0, 0, 'undead', 'grorlam.gif'),
(0, 'Ghost', 100, 120, 150, 1, 0, '"Huh!", "Shhhhhh", "Buuuuuh"', 'physical, earth, death, lifedrain, paralyze', 0, 0, 'UNDEAD', 'ghost.gif'),
(0, 'Phantasm', 0, 0, 65, 15, 0, '"Oh my, you forgot to put your pants on!", "Weeheeheeheehee!", "Its nothing but a dream!", "Give in!"', '', 0, 0, 'undead', 'phantasm.gif'),
(0, 'Pirate Ghost', 0, 250, 275, 5, 0, '"Yooh Ho Hooh Ho!", "Hell is waiting for You!"', 'physical, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'UNDEAD', 'pirateghost.gif'),
(0, 'Spectre', 0, 1350, 1350, 15, 0, '"Revenge ... is so ... sweet!", "Life...force!", "Feed me your... lifeforce!"', 'earth, death, lifedrain, paralyze, invisible', 0, 0, 'undead', 'spectre.gif'),
(0, 'Wisp', 0, 65, 115, 1, 1, '', 'physical, paralyze, drunk', 0, 1, 'undead', 'wisp.gif'),
(0, 'Frost Giant', 490, 150, 270, 8, 0, '"Hmm Humansoup", "Stand still ya tasy snack!", "Joh Thun!", "Brore Smode!", "Horre Sjan Flan!"', 'ice', 0, 1, 'undead', 'frostgiant.gif'),
(0, 'Frost Giantess', 490, 150, 275, 3, 0, '"Ymirs Mjalle!", "No run so much, must stay fat!", "Horre, Sjan Flan!", "Damned fast food.", "Come kiss the cook!"', 'ice', 0, 1, 'undead', 'frostgiantess.gif'),
(0, 'Cyclops Smith', 490, 255, 435, 1, 0, '"Whack da humy", "Outis emoi g'' onoma."', '', 1, 1, 'blood', 'cyclopssmith.gif'),
(0, 'Cyclops Drone', 490, 200, 325, 1, 0, '"Fee! Fie! Foe! Fum!", "Luttl pest!"', '', 1, 1, 'blood', 'cyclopsdrone.gif'),
(0, 'Behemoth', 0, 2500, 4000, 30, 1, '"You''re so little!", "Human flesh - delicious!", "Crush the intruders!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'behemoth.gif'),
(0, 'Cyclops', 490, 150, 260, 1, 0, '"Il lorstok human!", "Toks utat.", "Human, uh whil dyh!", "Youh ah trak!", "Let da mashing begin!"', '', 1, 1, 'blood', 'cyclops.gif'),
(0, 'Stonecracker', 0, 3500, 4000, 45, 1, '"HUAHAHA"', 'paralyze, invisible', 0, 0, 'undead', 'stonecracker.gif'),
(0, 'Slick Water Elemental', 0, 450, 550, 30, 0, '"Blubb", "Splipsh Splash"', 'ice', 0, 0, 'undead', 'slickwaterelemental.gif'),
(0, 'Roaring Water Elemental', 0, 1300, 1750, 85, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'roaringwaterelemental.gif'),
(0, 'Ice Overlord', 0, 1950, 2800, 85, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'iceoverlord.gif'),
(0, 'Water Elemental', 0, 450, 550, 30, 0, '', 'ice, fire, poison, paralyze, invisible', 0, 0, 'undead', 'waterelemental.gif'),
(0, 'Massive Water Elemental', 0, 1950, 2350, 85, 0, '', 'fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'massivewaterelemental.gif'),
(0, 'Ancient Scarab', 0, 720, 1000, 55, 1, '', 'earth, paralyze, invisible', 0, 0, 'VENOM', 'ancientscarab.gif'),
(0, 'Bug', 250, 18, 29, 1, 0, '', '', 1, 1, 'venom', 'bug.gif'),
(0, 'Centipede', 335, 30, 70, 1, 0, '', 'poison', 1, 1, 'venom', 'centipede.gif'),
(0, 'Cockroach', 0, 0, 1, 1, 0, '', 'poison', 0, 0, 'venom', 'cockroach.gif'),
(0, 'Larva', 355, 40, 70, 1, 0, '', 'poison, paralyze', 1, 1, 'VENOM', 'larva.gif'),
(0, 'Scarab', 395, 120, 320, 1, 1, '', 'earth, paralyze', 1, 1, 'VENOM', 'scarab.gif'),
(0, 'Wasp', 280, 25, 35, 120, 0, '"Bsssssss"', 'poison', 1, 1, 'VENOM', 'wasp.gif'),
(0, 'Lizard Sentinel', 0, 110, 265, 10, 0, '"Tssss!"', 'earth, invisible', 0, 1, 'blood', 'lizardsentinel.gif'),
(0, 'Lizard Snakecharmer', 0, 210, 325, 1, 0, '"I ssssmell warm blood!", "Shhhhhhhh"', 'poison, outfit, drunk, invisible', 0, 0, 'blood', 'lizardsnakecharmer.gif'),
(0, 'Lizard Templar', 0, 115, 410, 1, 0, '"Hissss!"', 'earth', 0, 0, 'blood', 'lizardtemplar.gif'),
(0, 'Minotaur Archer', 390, 65, 100, 1, 0, '"Ruan Wihmpy!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurarcher.gif'),
(0, 'Minotaur Guard', 550, 160, 185, 1, 0, '"Kirll Karrrl!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurguard.gif'),
(0, 'Minotaur Mage', 0, 150, 155, 1, 0, '"#W Learrn tha secrret uf deathhh!", "Kaplar!"', 'energy, outfit, drunk, invisible', 0, 0, 'blood', 'minotaurmage.gif'),
(0, 'Minotaur', 330, 50, 100, 1, 0, '"kaplar!"', '', 1, 1, 'blood', 'minotaur.gif'),
(0, 'Apprentice Sheng', 0, 100, 95, 1, 0, '"I will protect the secrets of my master!", "This isle will become ours alone!", "Kaplar!"', 'energy', 0, 0, 'blood', 'apprenticesheng.gif'),
(0, 'The Horned Fox', 0, 200, 265, 1, 0, '"You will never get me!", "I''ll be back!", "Catch me, if you can!", "Help me, boys!"', 'outfit, drunk, invisible', 0, 0, 'blood', 'thehornedfox.gif'),
(0, 'General Murius', 0, 1300, 1200, 10, 0, '"Feel the power of the Mooh''Tah!", "You will get what you deserve!", "For the king!", "Guards!"', 'lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'generalmurius.gif'),
(0, 'Squirrel', 200, 0, 15, 1, 0, '"ChChCh"', '', 1, 1, 'blood', 'squirrel.gif'),
(0, 'Goblin Demon', 290, 25, 50, 1, 0, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', '', 1, 1, 'blood', 'goblindemon.gif'),
(0, 'Badger', 200, 5, 20, 1, 0, '', '', 1, 1, 'blood', 'badger.gif'),
(0, 'Bat', 250, 10, 30, 1, 0, '', '', 1, 1, 'blood', 'bat.gif'),
(0, 'Deer', 260, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'deer.gif'),
(0, 'The Halloween Hare', 0, 0, 2000, 1, 0, '', '', 0, 0, 'blood', 'thehalloweenhare.gif'),
(0, 'Hyaena', 275, 20, 60, 1, 0, '', '', 1, 1, 'blood', 'hyaena.gif'),
(0, 'Pig', 255, 0, 150, 1, 0, '', '', 1, 1, 'blood', 'pig.gif'),
(0, 'Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'rabbit.gif'),
(0, 'Silver Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'silverrabbit.gif'),
(0, 'Skunk', 200, 3, 20, 1, 0, '', 'poison', 1, 1, 'blood', 'skunk.gif'),
(0, 'Dark Monk', 0, 145, 1200, 1, 1, '"This is where your path will end!", "Your end has come.", "You are no match for us!"', 'outfit, drunk, invisible', 0, 1, 'blood', 'darkmonk.gif'),
(0, 'Monk', 600, 200, 240, 1, 1, '"''Repent heretic!, Feel my kick!. A prayer for Zathroth"', 'outfit, drunk, invisible', 1, 0, 'blood', 'monk.gif'),
(0, 'Tha Exp Carrier', 600, 2000, 1000000, 60, 1, '"Come kill me and get exp ^^"', 'outfit, drunk, invisible', 0, 0, 'blood', 'thaexpcarrier.gif'),
(0, 'Vip Trainer', 0, 0, 200000, 1, 0, '', 'invisible', 0, 0, 'blood', 'viptrainer.gif'),
(0, 'Fernfang', 0, 320, 250, 10, 1, '"You desecrated this place!", "I will cleanse this isle!", "Grrrrrrr", "Yoooohhuuuu!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'fernfang.gif'),
(0, 'Treiner', 0, 0, 200000, 1, 0, '', 'invisible', 0, 0, 'blood', 'treiner.gif'),
(0, 'Necromancer', 0, 580, 580, 1, 0, '"Your corpse will be mine!", "Taste the sweetness of death!"', 'earth, invisible', 0, 0, 'blood', 'necromancer.gif'),
(0, 'Priestess', 0, 420, 390, 1, 0, '"Your energy is mine.", "Now, your life has come to an end, hahahha!", "Throw the soul on the altar!"', 'invisible', 0, 0, 'blood', 'priestess.gif'),
(0, 'Necropharus', 0, 1100, 800, 10, 0, '"You will rise as my servant!", "Praise to my master Urgith!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'necropharus.gif'),
(0, 'Orc Berserker', 590, 195, 210, 15, 1, '"Utani Tempo Hur"', 'poison', 1, 1, 'blood', 'orcberserker.gif'),
(0, 'Orc Leader', 640, 270, 450, 5, 0, '"Ulderek futgyr human!"', 'fire, outfit, drunk, invisible', 1, 1, 'blood', 'orcleader.gif'),
(0, 'Orc Rider', 0, 110, 180, 60, 1, '"Grrrrrrr", "Orc arga Huummmak!"', '', 0, 1, 'blood', 'orcrider.gif'),
(0, 'Orc Shaman', 0, 110, 115, 1, 0, '', 'energy, poison, outfit, drunk, invisible', 0, 0, 'blood', 'orcshaman.gif'),
(0, 'Orc Spearman', 310, 38, 105, 1, 0, '"Ugaar!"', '', 1, 1, 'blood', 'orcspearman.gif'),
(0, 'Orc Warlord', 0, 670, 950, 15, 0, '"Ranat Ulderek!", "Orc buta bana!", "Ikem rambo zambo!", "Futchi maruk buta!"', 'fire, outfit, drunk, invisible', 0, 0, 'blood', 'orcwarlord.gif'),
(0, 'Orc Warrior', 360, 50, 125, 1, 0, '"Grow truk grrrr.", "Trak grrrr brik.", "Alk!"', '', 1, 1, 'blood', 'orcwarrior.gif'),
(0, 'Orc', 300, 25, 70, 1, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 1, 1, 'blood', 'orc.gif'),
(0, 'Warlord Ruzad', 0, 1700, 1950, 25, 0, '"Ranat Ulderek!", "Orc buta bana!", "Ikem rambo zambo!", "Futchi maruk buta!"', 'invisible', 0, 0, 'blood', 'warlordruzad.gif'),
(0, 'Goblin Leader', 290, 50, 75, 1, 0, '"Go go, Gobo attack !!", "Me the greenest and the meanest!", "Me have power to crush you!", "Goblinkiller! Catch him !!"', '', 1, 1, 'blood', 'goblinleader.gif'),
(0, 'Goblin Scavenger', 310, 37, 60, 1, 0, '"Shiny, Shiny!", "You mean!", "All mine!", "Uhh!"', '', 1, 1, 'blood', 'goblinscavenger.gif'),
(0, 'Goblin', 290, 25, 50, 1, 0, '"Me have him!", "Zig Zag! Gobo attack!", "Help! Goblinkiller!", "Bugga! Bugga!", "Me green, me mean!"', '', 1, 1, 'blood', 'goblin.gif'),
(0, 'Goblin Assassin', 360, 52, 75, 1, 0, '"Goblin Powahhh!"', '', 1, 1, 'blood', 'goblinassassin.gif'),
(0, 'Assasin', 450, 105, 175, 2, 1, '"Die!", "Feel the hand of death!", "You are on my deathlist!"', 'invisible', 0, 1, 'blood', 'assasin.gif'),
(0, 'Black Knight', 0, 1600, 1800, 60, 0, '"MINE!", "NO PRISONERS!", "NO MERCY!", "By Bolg''s Blood!", "You''re no match for me!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'blackknight.gif'),
(0, 'Hero', 0, 1200, 1400, 24, 0, '"Let''s have a fight!", "Welcome to my battleground.", "Have you seen princess Lumelia?", "I will sing a tune at your grave."', 'paralyze, invisible', 0, 0, 'blood', 'hero.gif'),
(0, 'Hunter', 0, 150, 150, 1, 0, '"Guess who we''re hunting, haha!"', 'poison', 0, 1, 'blood', 'hunter.gif'),
(0, 'Nomad', 420, 60, 160, 1, 0, '"We are swift as the wind of the desert", "We are the true sons of the desert!"', '', 1, 1, 'blood', 'nomad.gif'),
(0, 'Smuggler', 390, 48, 130, 1, 0, '"I will silence you forever!", "You saw something you shouldn''t!"', '', 1, 1, 'blood', 'smuggler.gif'),
(0, 'Stalker', 0, 90, 150, 1, 0, '', 'lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'stalker.gif'),
(0, 'Poacher', 0, 150, 150, 1, 0, '"You will not live to tell anyone!", "You are my game today!"', 'poison', 0, 1, 'blood', 'poacher.gif'),
(0, 'Wild Warrior', 420, 55, 120, 1, 1, '"An enemy!", "Gimme your money!"', '', 1, 1, 'blood', 'wildwarrior.gif'),
(0, 'Man In The Cave', 0, 555, 770, 1, 0, '"THE MONKS ARE MINE!", "I will rope you up! All of you!", "You have been roped up!", "A MIC to rule them all!"', 'fire, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'maninthecave.gif'),
(0, 'Rukor Zad', 450, 380, 380, 15, 1, '"I can kill a man in a thousand ways, and thats only with a spoon!", "You shouldn''t have come here"', 'invisible', 0, 0, 'blood', 'rukorzad.gif'),
(0, 'Smuggler Baron Silvertoe', 390, 170, 280, 5, 0, '"i will make your dead look like an accident!", "you should not have interferred with my bussiness"', '', 0, 0, 'blood', 'smugglerbaronsilvertoe.gif'),
(0, 'Ashmunrah', 0, 3100, 5000, 28, 0, '"Ahhhh all those long years.", "No mortal or undead will steal my secrets."', 'earth, death, paralyze, invisible', 0, 0, 'undead', 'ashmunrah.gif'),
(0, 'Dipthrah', 0, 2900, 4200, 35, 0, '"Come closer to learn the final lesson.", "You can''t escape death forever."', 'physical, death, invisible', 0, 0, 'undead', 'dipthrah.gif'),
(0, 'Mahrdis', 0, 3050, 3900, 30, 0, '"Ashes to ashes!", "Fire, Fire!", "The eternal flame demands its due!", "Burnnnnnnnnn!", "May my flames engulf you!"', 'death, fire, invisible', 0, 0, 'fire', 'mahrdis.gif'),
(0, 'Morguthis', 0, 3000, 4800, 30, 1, '"Vengeance!", "I am the supreme warrior!"', 'paralyze, invisible', 0, 0, 'undead', 'morguthis.gif'),
(0, 'Omruc', 0, 2950, 4300, 75, 0, '"Now chhhou shhhee me ... Now chhhou don''t!!", "Catchhhh me if chhhou can."', 'death, paralyze, invisible', 0, 0, 'blood', 'omruc.gif'),
(0, 'Rahemos', 0, 3100, 3700, 40, 0, '"It''s a kind of magic.", "Abrah Kadabrah!", "Nothing hidden in my warpings.", "It''s not a trick, it''s Rahemos.", "Meet my dear friend from hell.", "I will make you believe in magic."', 'death, ice, earth, paralyze, invisible', 0, 0, 'blood', 'rahemos.gif'),
(0, 'Thalas', 0, 2950, 4100, 50, 0, '"You will become a feast for my maggots.", "Death and decay!"', '', 0, 0, 'venom', 'thalas.gif'),
(0, 'Vashresamun', 0, 2945, 4000, 45, 1, '"Come my maidens, we have visitors!", "Are you enjoying my music?", "If music is the food of death, drop dead."', 'death, invisible, lifedrain', 0, 0, 'undead', 'vashresamun.gif'),
(0, 'Brutus Bloodbeard', 0, 1100, 1900, 40, 0, '', 'invisible', 0, 0, 'blood', 'brutusbloodbeard.gif'),
(0, 'Lethal Lissy', 0, 2700, 3000, 40, 0, '', 'invisible', 0, 0, 'blood', 'lethallissy.gif'),
(0, 'Deadeye Devious', 0, 800, 2200, 40, 0, '"Let''s kill ''em", "Arrrgh!", "You''ll never take me alive!"', 'invisible', 0, 0, 'blood', 'deadeyedevious.gif'),
(0, 'Ron The Ripper', 0, 1000, 2500, 40, 0, '', 'invisible', 0, 0, 'blood', 'rontheripper.gif'),
(0, 'Pirate Buccaneer', 595, 250, 425, 5, 0, '"Give up!"', '', 1, 0, 'blood', 'piratebuccaneer.gif'),
(0, 'Pirate Corsair', 775, 350, 675, 5, 0, '', 'invisible', 0, 1, 'blood', 'piratecorsair.gif'),
(0, 'Pirate Cutthroat', 495, 175, 325, 5, 0, '', '', 0, 1, 'blood', 'piratecutthroat.gif'),
(0, 'Pirate Marauder', 490, 125, 210, 5, 0, '"Plundeeeeer!"', '', 0, 1, 'blood', 'piratemarauder.gif'),
(0, 'The Plasmother', 0, 8900, 16050, 45, 0, '"Blubb"', 'poison, lifedrain, paralyze, invisible', 0, 0, 'venom', 'theplasmother.gif'),
(0, 'Dracola', 0, 7750, 16200, 65, 0, '"FEEEED MY ETERNAL HUNGER!"', 'earth, fire, death, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'dracola.gif'),
(0, 'The Handmaiden', 0, 8300, 16500, 115, 1, '', 'energy, fire, earth, poison, lifedrain, paralyze, invisible', 0, 0, 'undead', 'thehandmaiden.gif'),
(0, 'Mr. Punish', 0, 7550, 20000, 55, 0, '"I kept my axe sharp, especially for you!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'mr.punish.gif'),
(0, 'The Countess Sorrow', 0, 5150, 13500, 60, 0, '"Oh my, you forgot to put your pants on!", "Weeheeheeheehee!", "Welcome to my nightmare!", "Its nothing but a dream!", "Give in!"', 'physical, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'thecountesssorrow.gif'),
(0, 'The Imperor', 0, 8000, 15000, 55, 1, '"Muahaha!", "He he he!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'theimperor.gif'),
(0, 'Massacre', 0, 14000, 30000, 85, 1, '', 'earth, energy, fire, paralyze, invisible', 0, 0, 'blood', 'massacre.gif'),
(0, 'Guardian Of The Sea', 480, 400, 45000, 150, 0, '"I Am Guardian of The Sea", "Shrrrr"', 'ice, fire, lifedrain, paralyze, invisible', 0, 1, 'blood', 'guardianofthesea.gif'),
(0, 'Quara Abominator', 670, 550, 55000, 150, 0, '', 'fire, lifedrain, paralyze, ice, invisible', 0, 1, 'undead', 'quaraabominator.gif'),
(0, 'Spirit Of Jack', 495, 175, 15025, 5, 0, '', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 1, 'blood', 'spiritofjack.gif'),
(0, 'Fire Overlord', 0, 2800, 4000, 40, 0, '', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'fireoverlord.gif'),
(0, 'Massive Fire Elemental', 0, 950, 1800, 20, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'fire', 'massivefireelemental.gif'),
(0, 'Blistering Fire Elemental', 850, 1300, 1500, 5, 0, '', 'fire', 1, 1, 'fire', 'blisteringfireelemental.gif'),
(0, 'Blazing Fire Elemental', 850, 580, 580, 1, 0, '', 'fire', 1, 1, 'fire', 'blazingfireelemental.gif'),
(0, 'Fire Elemental', 650, 280, 280, 1, 0, '', 'fire, death, invisible', 1, 1, 'fire', 'fireelemental.gif'),
(0, 'Hellfire Fighter', 0, 2200, 3800, 23, 0, '"Fire!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'hellfirefighter.gif'),
(0, 'Quara Constrictor Scout', 670, 250, 450, 35, 0, '', 'fire, ice', 0, 1, 'undead', 'quaraconstrictorscout.gif'),
(0, 'Quara Hydromancer Scout', 0, 800, 1100, 30, 0, '"Qua hah tsh!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'quarahydromancerscout.gif');
INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Quara Mantassin Scout', 480, 100, 220, 25, 0, '"Zuerk Pachak!", "Shrrrr"', 'ice, fire, lifedrain, paralyze, invisible', 0, 1, 'blood', 'quaramantassinscout.gif'),
(0, 'Quara Pincher Scout', 0, 600, 775, 15, 0, '"Clank clank!", "Clap!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'quarapincherscout.gif'),
(0, 'Quara Predator Scout', 0, 400, 890, 35, 0, '"Gnarrr!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarapredatorscout.gif'),
(0, 'Quara Constrictor', 670, 250, 450, 150, 0, '', 'fire, ice', 0, 1, 'undead', 'quaraconstrictor.gif'),
(0, 'Quara Hydromancer', 0, 800, 1100, 45, 0, '"Qua hah tsh!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarahydromancer.gif'),
(0, 'Quara Mantassin', 480, 400, 800, 150, 0, '"Zuerk Pachak!", "Shrrrr"', 'ice, fire, lifedrain, paralyze, invisible', 0, 1, 'blood', 'quaramantassin.gif'),
(0, 'Quara Pincher', 0, 1200, 1800, 10, 0, '"Clank clank!", "Clap!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'quarapincher.gif'),
(0, 'Quara Predator', 0, 1600, 2200, 45, 0, '"Gnarrr!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarapredator.gif'),
(0, 'Thul', 0, 1800, 3000, 1, 0, '"Gaaahhh!"', 'ice', 0, 0, 'undead', 'thul.gif'),
(0, 'Cave Rat', 250, 10, 30, 1, 0, '"Meeeeep!", "Meep!"', '', 1, 1, 'blood', 'caverat.gif'),
(0, 'Rat', 200, 5, 20, 1, 0, '', '', 1, 1, 'blood', 'rat.gif'),
(0, 'Munster', 250, 23, 58, 1, 0, '"Meeeeep!"', '', 0, 0, 'blood', 'munster.gif'),
(0, 'Cobra', 275, 30, 65, 1, 0, '"zzzzzz"', 'poison', 1, 1, 'blood', 'cobra.gif'),
(0, 'Crocodile', 350, 40, 105, 1, 0, '', '', 1, 1, 'blood', 'crocodile.gif'),
(0, 'Serpent Spawn', 0, 5000, 5000, 60, 1, '"Ssssolus for the one", "HISSSS", "Tsssse one will risssse again", "I bring you deathhhh, mortalssss"', 'paralyze, invisible', 0, 0, 'VENOM', 'serpentspawn.gif'),
(0, 'Snake', 205, 10, 15, 1, 0, '"Zzzzzzt"', 'poison', 1, 1, 'blood', 'snake.gif'),
(0, 'Wyvern', 0, 515, 795, 48, 0, '"Shiiiiiek"', 'earth, drunk, invisible', 0, 0, 'blood', 'wyvern.gif'),
(0, 'Black Sheep', 250, 15, 20, 1, 0, '"maeh"', '', 1, 1, 'blood', 'blacksheep.gif'),
(0, 'Sheep', 250, 0, 20, 1, 0, '"Maeh"', '', 1, 1, 'blood', 'sheep.gif'),
(0, 'Mimic', 0, 70, 50, 390, 0, '', '', 0, 0, 'blood', 'mimic.gif'),
(0, 'Betrayed Wraith', 0, 3500, 4200, 25, 1, '"Rrrah!"', 'death, energy, fire, poison, lifedrain, paralyze, invisible', 0, 0, 'undead', 'betrayedwraith.gif'),
(0, 'Bonebeast', 0, 580, 515, 1, 0, '"Cccchhhhhhhhh!", "Knooorrrrr!"', 'death, earth, lifedrain, paralyze, invisible', 0, 0, 'UNDEAD', 'bonebeast.gif'),
(0, 'Demon Skeleton', 620, 240, 400, 5, 0, '', 'fire, poison, lifedrain, death, drunk', 1, 1, 'undead', 'demonskeleton.gif'),
(0, 'Lost Soul', 0, 4000, 8500, 30, 1, '"Forgive Meeeee!", "Mouuuurn meeee!"', 'fire, poison, death, paralyze, invisible', 0, 0, 'undead', 'lostsoul.gif'),
(0, 'Pirate Skeleton', 0, 85, 190, 5, 0, '', 'fire, invisible', 0, 0, 'UNDEAD', 'pirateskeleton.gif'),
(0, 'Skeleton', 300, 35, 50, 1, 0, '', 'poison, lifedrain', 1, 1, 'UNDEAD', 'skeleton.gif'),
(0, 'Skeleton Warrior', 350, 45, 65, 1, 0, '', 'death', 1, 1, 'undead', 'skeletonwarrior.gif'),
(0, 'Undead Dragon', 0, 7200, 8350, 40, 0, '"FEEEED MY ETERNAL HUNGER!"', 'death, earth, fire, drown, lifedrain, paralyze, invisible', 0, 0, 'undead', 'undeaddragon.gif'),
(0, 'Dark Apprentice', 0, 100, 225, 1, 0, '"Outch!", "I must dispose of my masters enemies!", "Oops, I did it again.", "From the spirits that I called Sir, deliver me!"', 'invisible', 0, 0, 'blood', 'darkapprentice.gif'),
(0, 'Dark Magician', 0, 185, 325, 5, 1, '"Feel the power of my runes!", "Killing you is getting expensive", "My secrets are mine alone!"', 'invisible', 0, 0, 'blood', 'darkmagician.gif'),
(0, 'Ice Witch', 0, 580, 540, 1, 0, '"So you think you are cool?", "I hope it is not too cold for you! HeHeHe.", "Freeze!"', 'ice, paralyze, invisible', 0, 0, 'undead', 'icewitch.gif'),
(0, 'Ferumbras', 0, 12000, 35000, 35, 1, '"NOONE WILL STOP ME THIS TIME!", "THE POWER IS MINE!", "I returned from death and you dream about defeating me?"', 'physical, energy, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'ferumbras.gif'),
(0, 'Warlock', 0, 4000, 3500, 23, 0, '"Learn the secret of our magic! YOUR death!", "Even a rat is a better mage than you.", "We don''t like intruders!"', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'warlock.gif'),
(0, 'Witch', 0, 120, 300, 1, 0, '"Horax pokti!", "Hihihihi!", "Herba budinia ex!"', 'energy, invisible', 0, 0, 'blood', 'witch.gif'),
(0, 'Elverick', 200, 30000, 20, 390, 0, '', '', 1, 1, 'blood', 'elverick.gif'),
(0, 'Zarabustor', 0, 8000, 5100, 23, 0, '"Killing is a splendid diversion for my studies."', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'zarabustor.gif'),
(0, 'Yakchal', 0, 600, 12400, 20, 0, '"YOU BETTER DIE TO MY MINIONS BECAUSE YOU''LL WHISH YOU DID IF I COME FOR YOU!", "You are mine!", "I will make you all pay!"', 'ice, paralyze, invisible', 0, 0, 'undead', 'yakchal.gif'),
(0, 'Annihilon', 0, 100000, 60000, 80, 1, '"Annihilation!"', 'lifedrain, invisible', 0, 0, 'fire', 'annihilon.gif'),
(0, 'Hellgorak', 0, 10000, 40000, 70, 0, '"??", "??"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'hellgorak.gif'),
(0, 'Latrivan', 0, 10000, 40000, 60, 0, '"I might reward you for killing my brother ~ with a swift dead!"', 'fire', 0, 0, 'fire', 'latrivan.gif'),
(0, 'Madareth', 0, 100000, 55000, 80, 0, '"I AM GOING TO PLAY WITH YOURSELF!"', 'energy, fire, invisible', 0, 0, 'fire', 'madareth.gif'),
(0, 'Zugurosh', 0, 10000, 95000, 60, 0, '"You will run out of resources soon enough!!", "One little mistake and your all are mine!", "I sense your strength fading!"', 'death, paralyze, invisible', 0, 0, 'fire', 'zugurosh.gif'),
(0, 'Ushuriel', 0, 10000, 50000, 65, 1, '', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'ushuriel.gif'),
(0, 'Golgordan', 0, 10000, 40000, 65, 0, '"Latrivan your fool"', 'death', 0, 0, 'fire', 'golgordan.gif'),
(0, 'Thornback Tortoise', 490, 150, 300, 1, 0, '', '', 0, 1, 'blood', 'thornbacktortoise.gif'),
(0, 'Tortoise', 445, 90, 150, 1, 0, '', '', 0, 1, 'blood', 'tortoise.gif'),
(0, 'Deathslicer', 0, 340, 2000, 75, 0, '', 'physical, holy, energy, fire, death, earth, ice, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'undead', 'deathslicer.gif'),
(0, 'Flamethrower', 0, 1200, 9950, 1, 0, '', 'physical, energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'flamethrower.gif'),
(0, 'Magicthrower', 0, 1200, 9950, 1, 0, '', 'physical, energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'magicthrower.gif'),
(0, 'Plaguethrower', 0, 1300, 9950, 1, 0, '', 'physical, energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'plaguethrower.gif'),
(0, 'Poisonthrower', 0, 1200, 9950, 1, 0, '', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'poisonthrower.gif'),
(0, 'Shredderthrower', 0, 18, 100, 1, 0, '', 'physical, energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'shredderthrower.gif'),
(0, 'Troll Champion', 340, 30, 75, 1, 0, '"Meee maity!", "Grrrr", "Whaaaz up!?", "Gruntz!"', '', 1, 1, 'blood', 'trollchampion.gif'),
(0, 'Frost Troll', 300, 23, 55, 1, 0, '"Brrrr", "Broar!"', '', 1, 1, 'blood', 'frosttroll.gif'),
(0, 'Island Troll', 290, 20, 50, 1, 0, '"Hmmm, turtles", "HHmmm, dogs", "Groar", "Gruntz!"', '', 1, 0, 'blood', 'islandtroll.gif'),
(0, 'Swamp Troll', 320, 65, 55, 1, 0, '"Grrrr", "Groar!", "Me strong! Me ate spinach!"', '', 1, 1, 'VENOM', 'swamptroll.gif'),
(0, 'Troll', 290, 20, 50, 1, 0, '"Grrrr", "Groar", "Gruntz!", "Hmmm, bugs.", "Hmmm, dogs."', '', 1, 1, 'blood', 'troll.gif'),
(0, 'Banshee', 0, 900, 1000, 1, 0, '"Are you ready to rock?", "That''s what I call easy listening!", "Let the music play!", "I will mourn your death!", "IIIIEEEeeeeeehhhHHHHH!", "Dance for me your dance of death!", "Feel my gentle kiss of death."', 'death, earth, fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'banshee.gif'),
(0, 'Blightwalker', 0, 3350, 8900, 25, 0, '"I can see you decaying!", "Let me taste your mortality!"', 'earth, death, lifedrain, paralyze, invisible', 0, 0, 'undead', 'blightwalker.gif'),
(0, 'Crypt Shambler', 0, 195, 330, 1, 0, '"Uhhhhhhh!", "Aaaaahhhh!", "Hoooohhh!", "Chhhhhhh!"', 'poison, lifedrain, paralyze', 0, 1, 'UNDEAD', 'cryptshambler.gif'),
(0, 'Ghoul', 450, 85, 100, 1, 0, '', 'death, lifedrain, paralyze, invisible', 1, 1, 'blood', 'ghoul.gif'),
(0, 'Lich', 0, 900, 880, 23, 0, '"Doomed be the living!", "You will endure agony beyond thy death!", "Death awaits all!", "Thy living flesh offends me!", "Death and Decay!"', 'death, earth, paralyze, invisible', 0, 0, 'UNDEAD', 'lich.gif'),
(0, 'Mummy', 0, 150, 240, 1, 0, '', 'earth, death, lifedrain, paralyze, invisible', 0, 0, 'UNDEAD', 'mummy.gif'),
(0, 'Vampire', 100, 305, 475, 18, 1, '"BLOOD!", "Let me kiss your neck.", "I smell warm blood.", "I call you, my bats! Come!"', 'earth, death, lifedrain, paralyze, invisible', 0, 0, 'undead', 'vampire.gif'),
(0, 'Grim Reaper', 0, 4500, 4100, 75, 0, '"Death!", "Come a little closer!", "The end is near!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'grimreaper.gif'),
(0, 'The Count', 0, 1750, 4600, 75, 0, '', 'lifedrain, death, invisible', 0, 0, 'undead', 'thecount.gif'),
(0, 'Gravelord Oshuran', 0, 2400, 3100, 30, 0, '"Your mortality is disgusting"', 'death, earth, paralyze, invisible', 0, 0, 'UNDEAD', 'gravelordoshuran.gif'),
(0, 'Arachir The Ancient One', 0, 1800, 1600, 40, 0, '"I was the shadow that haunted the cradle of humanity!", "I exist since eons and you want to defy me?", "Can you feel the passage of time, mortal?"', 'lifedrain, death, invisible', 0, 0, 'undead', 'arachirtheancientone.gif'),
(0, 'Diblis The Fair', 0, 1800, 1600, 30, 0, '"I envy you to be slain by someone as beautiful as me.", "I will drain your ugly corpses of the last drop of blood."', 'lifedrain, death, invisible', 0, 0, 'undead', 'diblisthefair.gif'),
(0, 'Sir Valorcrest', 0, 1800, 1600, 25, 0, '"I challenge you!"', 'lifedrain, death, invisible', 0, 0, 'undead', 'sirvalorcrest.gif'),
(0, 'Zevelon Duskbringer', 0, 1800, 1600, 45, 0, '"Human blood is not suitable for drinking", "Your short live is coming to an end", "Ashari Mortals. Come and stay forever!"', 'lifedrain, death, invisible', 0, 0, 'undead', 'zevelonduskbringer.gif'),
(0, 'Demon Vip', 10000, 8000, 8200, 28, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'demonvip.gif'),
(0, 'Hydra Vip', 0, 3900, 2250, 10, 0, '"FCHHHHH", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hydravip.gif'),
(0, 'Grim Reaper Vip', 0, 6500, 4100, 75, 0, '"Death!", "Come a little closer!", "The end is near!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'grimreapervip.gif'),
(0, 'Frost Dragon Vip', 390, 4100, 1800, 20, 0, '"CHHHRRRR", "HISSSS"', 'ice, fire, earth, paralyze, lifedrain, invisible', 0, 0, 'undead', 'frostdragonvip.gif'),
(0, 'Warlock Vip', 0, 6000, 3500, 23, 0, '"Learn the secret of our magic! YOUR death!", "Even a rat is a better mage than you.", "We don''t like intruders!"', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'warlockvip.gif'),
(0, 'Medusa Vip', 0, 6050, 4500, 10, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusavip.gif'),
(0, 'Bossing Of Baiak', 0, 19000, 50000, 140, 1, '"The Power of The Baiak Server!", "OMG You Is Noob !! MUAHAHAHAHAHAHAHA!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'bossingofbaiak.gif'),
(0, 'Ferumbras Vip', 0, 14000, 35000, 50, 1, '"NOONE WILL STOP ME THIS TIME!", "THE POWER IS MINE!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'ferumbrasvip.gif'),
(0, 'Demon Vip II', 10000, 8500, 7500, 28, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'fire, drown, paralyze, invisible', 0, 0, 'fire', 'demonvipii.gif'),
(0, 'Hydra Vip II', 0, 4100, 2450, 10, 0, '"FCHHHHH", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hydravipii.gif'),
(0, 'Grim Reaper Vip II', 0, 7100, 4300, 75, 0, '"Death!", "Come a little closer!", "The end is near!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'grimreapervipii.gif'),
(0, 'Frost Dragon Vip II', 390, 5400, 2000, 20, 0, '"CHHHRRRR", "HISSSS"', 'ice, fire, earth, paralyze, lifedrain, invisible', 0, 0, 'undead', 'frostdragonvipii.gif'),
(0, 'Medusa Vip II', 0, 6500, 4900, 40, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusavipii.gif'),
(0, 'Dragon Lord Vip II', 0, 5100, 2300, 13, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonlordvipii.gif'),
(0, 'Dragon Lord Vip III', 0, 6500, 2500, 13, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonlordvipiii.gif'),
(0, 'Bugzin', 0, 999999999, 7500000, 235, 0, '', 'invisible', 0, 0, 'venom', 'bugzin.gif'),
(0, 'Hydra Vip III', 0, 5500, 2650, 10, 0, '"FCHHHHH", "HISSSS"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hydravipiii.gif'),
(0, 'Medusa Vip III', 0, 8100, 5100, 40, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusavipiii.gif'),
(0, 'Harry Potter', 0, 40500, 50000, 673, 0, '"TU JA ERA SEU VIADO !"', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'harrypotter.gif'),
(0, 'Infernalist Vip', 0, 7100, 4000, 20, 0, '"Nothing will remain but your scorched bones!", "Some like it hot!", "It''s cooking time!", "Feel the heat of battle!"', 'energy, fire, paralyze, invisible', 0, 0, 'blood', 'infernalistvip.gif'),
(0, 'King Of Pandas', 300, 50000000, 15000000, 4890, 0, '"Grrrrr", "SpokPOKSopkpoKPOSkpokOKSpokpoKSPOko", "Groarr"', 'earth', 0, 1, 'blood', 'kingofpandas.gif'),
(0, 'Frost Dragon Vip III', 390, 6750, 2200, 20, 0, '"CHHHRRRR", "HISSSS"', 'ice, fire, earth, paralyze, lifedrain, invisible', 0, 0, 'undead', 'frostdragonvipiii.gif'),
(0, 'Bossing Vip3', 0, 85000000, 55000000, 2393, 1, '"O BAIAK E MEU PORRA !!", "VOCE JA ERA NOOB LIXO !! MUAHAHAHAHA!", "VOCE JA ERA NOOB LIXO !! MUAHAHAHAHA!", "O BAIAK E MEU PORRA !!", "O BAIAK E MEU PORRA !!", "VOCE JA ERA NOOB LIXO !! MUAHAHAHAHA!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'bossingvip3.gif'),
(0, 'King Minotaur', 330, 60000, 180000, 890, 0, '"I am the king", "MUAHAHAHA!", "You''ll die!!", "kaplar!"', '', 0, 0, 'blood', 'kingminotaur.gif'),
(0, 'King Knight', 0, 50000, 160000, 490, 0, '"MINE!", "NO PRISONERS!", "NO MERCY!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'kingknight.gif'),
(0, 'King Magician', 0, 60000, 200000, 573, 0, '"You''ll die motherfucker!!!!", "let''s see if you can deal with me.", "We don''t like intruders!"', 'energy, fire, ice, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'kingmagician.gif'),
(0, 'King Carniphila', 330, 60000, 90000, 890, 0, '"I am the king", "MUAHAHAHA!", "You''ll die!!", "kaplar!"', '', 0, 0, 'blood', 'kingcarniphila.gif'),
(0, 'King Pirate', 330, 60000, 90000, 890, 0, '"I am the king", "MUAHAHAHA!", "You''ll die!!", "kaplar!"', '', 0, 0, 'blood', 'kingpirate.gif'),
(0, 'King Hunter', 330, 60000, 90000, 890, 0, '"I am the king", "MUAHAHAHA!", "You''ll die!!", "kaplar!"', '', 0, 0, 'blood', 'kinghunter.gif'),
(0, 'Castle Guardian', 0, 0, 800000, 1, 0, '', 'paralyze, invisible', 0, 0, 'blood', 'castleguardian.gif'),
(0, 'Trainer', 0, 150, 2400000, 1, 0, '', 'invisible', 0, 0, 'blood', 'trainer.gif'),
(0, 'Forest Dragon', 0, 1100, 1200, 8, 0, '"GROOAAARRR", "FCHHHHH"', 'fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'forestdragon.gif'),
(0, 'Knight', 0, 2500, 2500, 85, 1, '"Power by Melee!"', 'paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'knight.gif'),
(0, 'Paladin', 0, 2500, 2000, 70, 1, '"Exori San"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'paladin.gif'),
(0, 'Druid', 0, 2500, 1500, 85, 1, '"Let''s have a fight!", "Welcome to my battleground.", "Have you seen princess Lumelia?", "I will sing a tune at your grave."', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'druid.gif'),
(0, 'Sorcerer', 0, 2500, 1500, 85, 1, '"Noob!!"', 'invisible', 0, 0, 'blood', 'sorcerer.gif'),
(0, 'Guard', 0, 800, 1000, 85, 1, '"Leave!", "Leave this town!", "Leave now!", "INTRUDER!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'guard.gif'),
(0, 'Mercenary', 0, 1600, 1800, 85, 0, '"MINE!", "NO PRISONERS!", "NO MERCY!", "By Bolg''s Blood!", "You''re no match for me!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'mercenary.gif'),
(0, 'Thief', 0, 500, 500, 35, 0, '"Sneak Sneak!", "Let me look in your backpack!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'thief.gif'),
(0, 'Toxiros', 0, 30000, 125000, 160, 1, '"Got antidote?", "The path of poisen!", "I''m Toxic!", "My dear scarab.."', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'toxiros.gif'),
(0, 'Pyramo', 0, 30000, 125000, 160, 1, '"You fear fire, I can feel it!", "Feel the heat!", "Hot Eh?", "HA HA HA HA HA.."', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'pyramo.gif'),
(0, 'Lazarus', 0, 30000, 125000, 160, 1, '"VOLTAGE!!", "The keeper of ENERGY", "BRrZzzZzZZZ"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'lazarus.gif'),
(0, 'Zathroth', 0, 9999, 28000, 85, 1, '"Want to feel some Aim?", "You can Run but never Hide!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'zathroth.gif'),
(0, 'Goshnar', 0, 4000, 10000, 167, 1, '"Renat Ulderek.", "Ikem King Zambo."', 'fire, outfit, drunk, invisible', 0, 0, 'blood', 'goshnar.gif'),
(0, 'Durin', 0, 4000, 10000, 168, 1, '"Fear my Axe!"', 'poison, outfit, drunk, invisible', 0, 1, 'blood', 'durin.gif'),
(0, 'Demora', 0, 400, 2000, 100, 0, '"MWIAHAIA!", "Your soul will be mine someday!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'demora.gif'),
(0, 'Orc Champion', 0, 505, 1010, 65, 1, '"CRARRGG GROARR!"', 'poison', 1, 1, 'blood', 'orcchampion.gif'),
(0, 'Lumenia', 0, 1350, 1500, 40, 0, '"Let''s have a fight!", "Wheres my Hero?", "OHH I NEED MY HERO...", "Welcome to my battleground!"', 'energy, fire, poison, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'lumenia.gif'),
(0, 'Dracula', 0, 2000, 5000, 40, 0, '"BLOOD!", "Let me kiss your neck.", "I smell warm blood.", "I call you, my bats! Come!"', 'poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'dracula.gif'),
(0, 'Alezzo', 0, 4000, 6000, 1, 0, '"Shhhhhhhh.", "I ssssmell warm blood!"', 'poison, outfit, drunk, invisible', 0, 0, 'blood', 'alezzo.gif'),
(0, 'Prince Almirith', 0, 2400, 5000, 20, 0, '"Im the Prince of this Forest!", "This is my forest!", "How did you get here?", "Stand still!"', 'energy, fire, poison, outfit, drunk, invisible', 0, 0, 'blood', 'princealmirith.gif'),
(0, 'Elf Warlord', 0, 1200, 2000, 1, 0, '"Protect the Prince!!", "Intruder!"', 'outfit, drunk, invisible', 0, 1, 'blood', 'elfwarlord.gif'),
(0, 'Random Noob', 390, 480000, 1950, 85, 0, '"Come here, free itenz!", "Come, look! A bug!", "I found a bug! Come and look!"', '', 0, 0, 'blood', 'randomnoob.gif'),
(0, 'Magebomb', 390, 480000, 1900, 75, 0, '"Noob!", "Noob 2x!"', '', 0, 0, 'blood', 'magebomb.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE IF NOT EXISTS `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--

INSERT INTO `z_news_tickers` (`date`, `author`, `image_id`, `text`, `hide_ticker`) VALUES
(1473817830, 1, 1, 'Bem vindo ao Gesior 0.4.1 Edited by [ADM]DaNgeR - [ADM] Forever!', 1),
(1476827016, 877075, 0, 'TESTE TESTE TESTE !!!', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `z_ots_comunication`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE IF NOT EXISTS `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_polls`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE IF NOT EXISTS `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_polls_answers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `z_shop_history_item`
--

INSERT INTO `z_shop_history_item` (`id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `offer_id`, `trans_state`, `trans_start`, `trans_real`) VALUES
(1, 'Rasthegue', 877075, '', 877075, 1, 0, 'realized', 1476822254, 1476822695),
(2, 'Rasthegue', 877075, '', 877075, 1, 0, 'realized', 1476822749, 1476822755);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shop_history_pacc`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12676 ;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`) VALUES
(12650, 7, 2343, 1, 0, 0, 'itemvip', '(Arm:100, protection all +2%)', 'Donate Helmet', 0),
(12654, 7, 2303, 1, 0, 0, 'itemvip', '(Arm:150, club fighting +8, sword fighting +8, axe fighting +8, protection holy +8%, death +6%)', 'Donate Knight Armor', 0),
(12651, 7, 2469, 1, 0, 0, 'itemvip', '(Arm:85, protection all +1%)', 'Donate Legs', 0),
(12652, 7, 3982, 1, 0, 0, 'itemvip', '(Arm:55, speed +150)', 'Donate Boots', 0),
(12653, 7, 7460, 1, 0, 0, 'itemvip', '(Def:175, protection all +3%)', 'Donate Shield', 0),
(12655, 7, 2505, 1, 0, 0, 'itemvip', '(Arm:85, distance fighting +8)', 'Donate Paladin Armor', 0),
(12666, 7, 2508, 1, 0, 0, 'itemvip', '(Arm:60, magic level +10, protection all +3%)', 'Donate Mage Robe', 0),
(12667, 15, 2435, 1, 0, 0, 'itemvip', '(Atk:170 physical + 30 holy, Def:55 +1)', 'Donate Axe', 0),
(12668, 15, 2446, 1, 0, 0, 'itemvip', '(Atk:170 physical + 30 holy, Def:55 +1)', 'Donate Sword', 0),
(12669, 15, 7432, 1, 0, 0, 'itemvip', '(Atk:170 physical + 30 holy, Def:55 +1)', 'Donate Hammer', 0),
(12671, 15, 8855, 1, 0, 0, 'itemvip', '(Range:10, Atk +55, Hit% +40)', 'Donate Bow', 0),
(12670, 15, 7735, 1, 0, 0, 'itemvip', 'properly by elder druids and master sorcerers of level 1 or higher.', 'Donate Staff', 0),
(7840, 1, 7840, 1, 0, 0, 'itemvip', '', 'Flaming vip arrow', 0),
(7850, 1, 7850, 1, 0, 0, 'itemvip', '', 'Earth vip arrow.', 0),
(7839, 1, 7839, 1, 0, 0, 'itemvip', '', 'Shiver vip arrow.', 0),
(7838, 1, 7838, 1, 0, 0, 'itemvip', '', 'Flash vip arrow.', 0),
(12673, 20, 11253, 1, 0, 0, 'item', 'Bless Infinita', 'Orb of Blessing', 0),
(12675, 15, 12505, 1, 0, 0, 'item', 'Stamina Infinita', 'Stamina Refil', 0),
(12672, 2, 12289, 1, 0, 0, 'item', 'Double Exp Potion 1h', 'Double Exp', 0),
(16, 10, 8267, 1, 0, 0, 'itemvip', '15 dias de VIP Donate.', 'Vip Scroll', 0),
(30, 15, 8981, 1, 0, 0, 'itemvip', '30 dias de VIP Donate.', 'Vip Scroll', 0),
(90, 35, 9004, 1, 0, 0, 'itemvip', '90 dias de VIP Donate.', 'Vip Scroll', 0),
(12674, 20, 11387, 1, 0, 0, 'itemvip', 'Amuleto Infinito. Use Somente para Red e Black Skull.', 'Skull Amulet', 0),
(6537, 50, 0, 0, 0, 0, 'unban', 'Retirar Ban', 'Unban', 0),
(9969, 15, 0, 0, 0, 0, 'redskull', 'Remover RED e Black Skull, o char tem que estar deslogado.', 'Remover Skull', 0),
(12649, 30, 0, 0, 0, 0, 'changename', 'Trocar de Nome, o char tem que estar deslogado.', 'ChangeName', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_spells`
--

CREATE TABLE IF NOT EXISTS `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_spells`
--

INSERT INTO `z_spells` (`name`, `spell`, `spell_type`, `mana`, `lvl`, `mlvl`, `soul`, `pacc`, `vocations`, `conj_count`, `hide_spell`) VALUES
('Conjure Arrow', 'exevo con', 'conjure', 100, 13, 0, 1, 'no', '', 10, 0),
('Food', 'exevo pan', 'conjure', 120, 14, 0, 1, 'no', '', 0, 0),
('Poisoned Arrow', 'exevo con pox', 'conjure', 130, 16, 0, 2, 'no', '', 7, 0),
('Conjure Bolt', 'exevo con mort', 'conjure', 140, 17, 0, 2, 'yes', '', 5, 0),
('Conjure Sniper Arrow', 'exevo con hur', 'conjure', 160, 24, 0, 3, 'yes', '', 5, 0),
('Explosive Arrow', 'exevo con flam', 'conjure', 290, 25, 0, 3, 'no', '', 8, 0),
('Conjure Piercing Bolt', 'exevo con grav', 'conjure', 180, 33, 0, 3, 'yes', '', 5, 0),
('Enchant Staff', 'exeta vis', 'conjure', 80, 41, 0, 0, 'yes', '', 0, 0),
('Enchant Spear', 'exeta con', 'conjure', 350, 45, 0, 3, 'yes', '', 0, 0),
('Power Bolt', 'exevo con vis', 'conjure', 800, 59, 0, 4, 'yes', '', 10, 0),
('Conjure Assassin', 'exevo con san', 'conjure', 500, 80, 0, 0, 'no', '1;3', 15, 0),
('Conjure Blank', 'adori blank', 'conjure', 200, 20, 0, 0, 'no', '', 1, 0),
('Poison Field', 'adevo grav pox', 'conjure', 200, 14, 0, 1, 'no', '', 3, 0),
('Light Magic Missile', 'adori min vis', 'conjure', 120, 15, 0, 1, 'no', '', 10, 0),
('Fire Field', 'adevo grav flam', 'conjure', 240, 15, 0, 1, 'no', '', 3, 0),
('Fireball', 'adori flam', 'conjure', 460, 27, 0, 3, 'yes', '', 5, 0),
('Energy Field', 'adevo grav vis', 'conjure', 320, 18, 0, 2, 'no', '', 3, 0),
('Stalagmite', 'adori tera', 'conjure', 400, 24, 0, 2, 'no', '', 10, 0),
('Great Fireball', 'adori mas flam', 'conjure', 530, 30, 0, 3, 'no', '', 4, 0),
('Heavy Magic Missile', 'adori vis', 'conjure', 350, 25, 0, 2, 'no', '', 10, 0),
('Poison Bomb', 'adevo mas pox', 'conjure', 520, 25, 0, 2, 'yes', '', 2, 0),
('Firebomb', 'adevo mas flam', 'conjure', 600, 27, 0, 4, 'no', '', 2, 0),
('Soulfire', 'adevo res flam', 'conjure', 600, 27, 0, 3, 'yes', '', 3, 0),
('Poison Wall', 'adevo mas grav pox', 'conjure', 640, 29, 0, 3, 'no', '', 4, 0),
('Explosion', 'adevo mas hur', 'conjure', 570, 31, 0, 4, 'no', '', 6, 0),
('Fire Wall', 'adevo mas grav flam', 'conjure', 780, 33, 0, 4, 'no', '', 4, 0),
('Energybomb', 'adevo mas vis', 'conjure', 880, 37, 0, 5, 'yes', '', 2, 0),
('Energy Wall', 'adevo mas grav vis', 'conjure', 1000, 41, 0, 5, 'no', '', 4, 0),
('Sudden Death', 'adori gran mort', 'conjure', 985, 45, 0, 5, 'no', '', 3, 0),
('Antidote Rune', 'adana pox', 'conjure', 200, 15, 0, 1, 'no', '', 1, 0),
('Intense Healing Rune', 'adura gran', 'conjure', 240, 15, 0, 2, 'no', '', 1, 0),
('Ultimate Healing Rune', 'adura vita', 'conjure', 400, 24, 0, 3, 'no', '', 1, 0),
('Convince Creature', 'adeta sio', 'conjure', 200, 16, 0, 3, 'no', '', 1, 0),
('Animate Dead', 'adana mort', 'conjure', 600, 27, 0, 5, 'yes', '', 1, 0),
('Chameleon', 'adevo ina', 'conjure', 600, 27, 0, 2, 'no', '', 1, 0),
('Destroy Field', 'adito grav', 'conjure', 120, 17, 0, 2, 'no', '', 3, 0),
('Desintegrate', 'adito tera', 'conjure', 200, 21, 0, 3, 'yes', '', 3, 0),
('Magic Wall', 'adevo grav tera', 'conjure', 750, 32, 0, 5, 'yes', '', 3, 0),
('Wild Growth', 'adevo grav vita', 'conjure', 600, 27, 0, 5, 'yes', '', 2, 0),
('Paralyze', 'adana ani', 'conjure', 1400, 54, 0, 3, 'yes', '', 1, 0),
('Icicle', 'adori frigo', 'conjure', 460, 28, 0, 3, 'yes', '', 5, 0),
('Avalanche', 'adori mas frigo', 'conjure', 530, 30, 0, 3, 'no', '', 4, 0),
('Stone Shower', 'adori mas tera', 'conjure', 430, 28, 0, 3, 'yes', '', 4, 0),
('Thunderstorm', 'adori mas vis', 'conjure', 430, 28, 0, 3, 'yes', '', 4, 0),
('Holy Missile', 'adori san', 'conjure', 350, 27, 0, 3, 'yes', '', 5, 0),
('Death Strike', 'exori mort', 'instant', 20, 16, 0, 0, 'yes', '', 0, 0),
('Flame Strike', 'exori flam', 'instant', 20, 12, 0, 0, 'yes', '', 0, 0),
('Energy Strike', 'exori vis', 'instant', 20, 12, 0, 0, 'yes', '', 0, 0),
('Whirlwind Throw', 'exori hur', 'instant', 40, 15, 0, 0, 'yes', '', 0, 0),
('Fire Wave', 'exevo flam hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Ethereal Spear', 'exori con', 'instant', 25, 23, 0, 0, 'yes', '', 0, 0),
('Energy Beam', 'exevo vis lux', 'instant', 40, 23, 0, 0, 'no', '', 0, 0),
('Great Energy Beam', 'exevo gran vis lux', 'instant', 110, 29, 0, 0, 'no', '', 0, 0),
('Groundshaker', 'exori mas', 'instant', 160, 33, 0, 0, 'yes', '', 0, 0),
('Berserk', 'exori', 'instant', 115, 35, 0, 0, 'yes', '', 0, 0),
('Energy Wave', 'exevo vis hur', 'instant', 170, 38, 0, 0, 'no', '', 0, 0),
('Rage of the Skies', 'exevo gran mas vis', 'instant', 650, 55, 0, 0, 'yes', '', 0, 0),
('Fierce Berserk', 'exori gran', 'instant', 340, 70, 0, 0, 'yes', '', 0, 0),
('Hells Core', 'exevo gran mas flam', 'instant', 1200, 60, 0, 0, 'yes', '', 0, 0),
('Divine Missile', 'exori san', 'instant', 20, 40, 0, 0, 'yes', '', 0, 0),
('Divine Caldera', 'exevo mas san', 'instant', 160, 50, 0, 0, 'yes', '', 0, 0),
('Eternal Winter', 'exevo gran mas frigo', 'instant', 1200, 60, 0, 0, 'yes', '', 0, 0),
('Ice Strike', 'exori frigo', 'instant', 20, 15, 0, 0, 'yes', '', 0, 0),
('Ice Wave', 'exevo frigo hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Terra Strike', 'exori tera', 'instant', 20, 13, 0, 0, 'yes', '', 0, 0),
('Terra Wave', 'exevo tera hur', 'instant', 210, 38, 0, 0, 'no', '', 0, 0),
('Wrath of Nature', 'exevo gran mas tera', 'instant', 770, 55, 0, 0, 'yes', '', 0, 0),
('Light Healing', 'exura', 'instant', 20, 9, 0, 0, 'no', '', 0, 0),
('Antidote', 'exana pox', 'instant', 30, 10, 0, 0, 'no', '', 0, 0),
('Antiflame', 'exana flam', 'instant', 35, 15, 0, 0, 'no', '', 0, 0),
('Intense Healing', 'exura gran', 'instant', 70, 11, 0, 0, 'no', '', 0, 0),
('Heal Friend', 'exura sio', 'instant', 140, 18, 0, 0, 'yes', '', 0, 0),
('Ultimate Healing', 'exura vita', 'instant', 160, 20, 0, 0, 'no', '', 0, 0),
('Mass Healing', 'exura gran mas res', 'instant', 150, 36, 0, 0, 'yes', '', 0, 0),
('Divine Healing', 'exura san', 'instant', 210, 35, 0, 0, 'yes', '', 0, 0),
('Wound Cleansing', 'exana mort', 'instant', 65, 30, 0, 0, 'yes', '', 0, 0),
('Light', 'utevo lux', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Find Person', 'exiva', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Magic Rope', 'exani tera', 'instant', 20, 9, 0, 0, 'yes', '', 0, 0),
('Levitate', 'exani hur', 'instant', 50, 12, 0, 0, 'yes', '', 0, 0),
('Great Light', 'utevo gran lux', 'instant', 60, 13, 0, 0, 'no', '', 0, 0),
('Magic Shield', 'utamo vita', 'instant', 50, 14, 0, 0, 'no', '', 0, 0),
('Haste', 'utani hur', 'instant', 60, 14, 0, 0, 'yes', '', 0, 0),
('Charge', 'utani tempo hur', 'instant', 100, 25, 0, 0, 'yes', '', 0, 0),
('Swift Foot', 'utamo tempo san', 'instant', 400, 55, 0, 0, 'yes', '', 0, 0),
('Challenge', 'exeta res', 'instant', 30, 20, 0, 0, 'yes', '', 0, 0),
('Strong Haste', 'utani gran hur', 'instant', 100, 20, 0, 0, 'yes', '', 0, 0),
('Creature Illusion', 'utevo res ina', 'instant', 100, 23, 0, 0, 'no', '', 0, 0),
('Ultimate Light', 'utevo vis lux', 'instant', 140, 26, 0, 0, 'yes', '', 0, 0),
('Cancel Invisibility', 'exana ina', 'instant', 200, 26, 0, 0, 'yes', '', 0, 0),
('Invisibility', 'utana vid', 'instant', 440, 35, 0, 0, 'no', '', 0, 0),
('Sharpshooter', 'utito tempo san', 'instant', 450, 60, 0, 0, 'yes', '', 0, 0),
('Protector', 'utamo tempo', 'instant', 200, 55, 0, 0, 'yes', '', 0, 0),
('Blood Rage', 'utito tempo', 'instant', 290, 60, 0, 0, 'yes', '', 0, 0),
('Train Party', 'utito mas sio', 'instant', 60, 32, 0, 0, 'yes', '', 0, 0),
('Protect Party', 'utamo mas sio', 'instant', 90, 32, 0, 0, 'yes', '', 0, 0),
('Heal Party', 'utura mas sio', 'instant', 120, 32, 0, 0, 'yes', '', 0, 0),
('Enchant Party', 'utori mas sio', 'instant', 120, 32, 0, 0, 'yes', '', 0, 0),
('Summon Creature', 'utevo res', 'instant', 0, 25, 0, 0, 'no', '', 0, 0),
('Undead Legion', 'exana mas mort', 'instant', 500, 30, 0, 0, 'yes', '', 0, 0);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
