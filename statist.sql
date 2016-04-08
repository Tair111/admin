-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 08 2016 г., 18:12
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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(2048) NOT NULL,
  `PersonID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `keywords`
--

INSERT INTO `keywords` (`ID`, `Name`, `PersonID`) VALUES
(1, 'путин', 1),
(2, 'путину', 1),
(3, 'путина', 1),
(4, 'медвежёнок', 2),
(5, 'медвежонок', 2),
(6, 'медведевы', 2),
(7, 'прохор', 3),
(8, 'прохорову', 3),
(9, 'прохорова', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `persons`
--

CREATE TABLE IF NOT EXISTS `persons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(2048) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `persons`
--

INSERT INTO `persons` (`ID`, `Name`) VALUES
(1, 'Путин'),
(2, 'Медведев'),
(3, 'Прохоров'),
(6, 'Зюганов'),
(7, 'Емельяненко');

-- --------------------------------------------------------

--
-- Структура таблицы `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `sites`
--

INSERT INTO `sites` (`ID`, `Name`) VALUES
(1, 'www.lenta.ru'),
(2, 'www.sportbox.ru'),
(3, 'www.rbc.ru'),
(10, 'www.sport.com'),
(17, 'www.matchtv.ru');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
