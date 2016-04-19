-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 19 2016 г., 09:27
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `statist`
--

-- --------------------------------------------------------

--
-- Структура таблицы `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) NOT NULL,
  `person_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name_2` varchar(255) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_keywords_persons` (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `keywords`
--

INSERT INTO `keywords` (`id`, `name`, `person_id`, `created_at`, `updated_at`, `name_2`, `distance`) VALUES
(1, 'путин', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(6, 'царь', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(7, 'путину', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(8, 'прохор', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(11, 'жулик', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(17, 'asldjkf', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'lskj', 3),
(25, 'dd', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(32, 'sds', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'dsfds', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) NOT NULL,
  `site_id` int(10) unsigned NOT NULL,
  `found_date_time` datetime DEFAULT NULL,
  `last_scan_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pages_sites` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `url`, `site_id`, `found_date_time`, `last_scan_date`, `created_at`, `updated_at`) VALUES
(1, 'https://www.lenta.ru', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'https://www.fffffff.ru', 19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'http://hhhhhhhhhh.com', 19, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `persons`
--

CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `persons`
--

INSERT INTO `persons` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Путин', NULL, NULL, NULL),
(8, 'Прохоров', NULL, NULL, NULL),
(9, 'Зюганов', NULL, NULL, NULL),
(10, '"путин"', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `person_page_ranks`
--

CREATE TABLE IF NOT EXISTS `person_page_ranks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  `rank` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ranks_persons` (`person_id`),
  KEY `fk_ranks_pages` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Дамп данных таблицы `sites`
--

INSERT INTO `sites` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(4, 'www.lenta.ru', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(19, 'www.vk.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(24, 'www.rbk.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL),
(26, 'www.sport.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `fk_keywords_persons` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_sites` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `person_page_ranks`
--
ALTER TABLE `person_page_ranks`
  ADD CONSTRAINT `fk_ranks_pages` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ranks_persons` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
