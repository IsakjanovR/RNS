-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 16 2016 г., 22:49
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rns`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id` tinyint(3) NOT NULL,
  `city_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `city_name`) VALUES
(1, 'Владимир'),
(2, 'Вологда'),
(3, 'Волгоград'),
(4, 'Казань'),
(5, 'Калининград'),
(6, 'Москва'),
(7, 'Сакт-Петербург'),
(8, 'Анапа');

-- --------------------------------------------------------

--
-- Структура таблицы `qualification`
--

CREATE TABLE `qualification` (
  `id` tinyint(3) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `qualification`
--

INSERT INTO `qualification` (`id`, `name`) VALUES
(1, 'Бакалавр'),
(2, 'Магистр'),
(3, 'Среднее');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` tinyint(3) NOT NULL,
  `users_name` varchar(128) NOT NULL,
  `qualification_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `users_name`, `qualification_id`) VALUES
(1, 'Андреев Борис Юрьевич', 1),
(2, 'Иванов Иван Иванович', 2),
(3, 'Петров Петр Перович', 1),
(4, 'Кузнецов Андрей Юрьевич', 3),
(5, 'Исакжанов РУстам Булатович', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users_city`
--

CREATE TABLE `users_city` (
  `city_id` tinyint(3) NOT NULL,
  `user_id` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_city`
--

INSERT INTO `users_city` (`city_id`, `user_id`) VALUES
(1, 2),
(7, 1),
(6, 1),
(5, 3),
(8, 3),
(4, 4),
(6, 4),
(7, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_id` (`qualification_id`);

--
-- Индексы таблицы `users_city`
--
ALTER TABLE `users_city`
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `qualification`
--
ALTER TABLE `qualification`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_qual_FK1` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_city`
--
ALTER TABLE `users_city`
  ADD CONSTRAINT `user_city_FK1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `user_city_FK2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
