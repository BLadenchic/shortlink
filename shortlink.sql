-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 28 2021 г., 02:49
-- Версия сервера: 5.7.33-log
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shortlink`
--
CREATE DATABASE IF NOT EXISTS `shortlink` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `shortlink`;

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortLink` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `links`
--

INSERT INTO `links` (`id`, `link`, `shortLink`) VALUES
(12, '/Greet', 'FMMMM'),
(13, '/fgdsrsegregreg/jhgfnhghjfgj/jytjy][p/;l.kjlkh,/qwewqrefvdzsmuyk65432/y6y65yh65', 'DMMMM'),
(15, '/y6y65yh65', 'AMMMM'),
(16, '/y6y65yh657', 'PMMMM'),
(17, '/y6y65yh65c', 'OMMMM'),
(18, '/y6y65yh6533', 'IMMMM'),
(19, '/авыфа/рап/иеыи/икыуи', 'UMMMM'),
(20, '/авыфа/рап/иеjыи/икыуи', 'qqqqq'),
(21, '/y6y65yh65йцу', 'TMMMM'),
(22, '/y6y65yh65йцуюж', 'RMMMM'),
(23, '/RMMMM', 'EMMMM'),
(24, '/GostTree', 'WMMMM'),
(25, '/y6y65yh655', 'QMMMM'),
(26, '/Greete', 'mMMMM'),
(27, '/Greete/ggg', 'nMMMM');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_link` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
