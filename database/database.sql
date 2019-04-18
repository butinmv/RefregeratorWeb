-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 18, 2019 at 07:39 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Refrigerator`
--

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ingredient`
--

INSERT INTO `Ingredient` (`id`, `name`) VALUES
(1, 'Хлеб'),
(2, 'Помидоры'),
(3, 'Огурец'),
(4, 'Крабовые палочки'),
(5, 'Молоко'),
(6, 'Кукуруза'),
(7, 'Мясо'),
(8, 'Горошек'),
(9, 'Колбаса'),
(10, 'Майонез'),
(11, 'Картошка'),
(12, 'Лук'),
(13, 'Яйца'),
(14, 'Масло'),
(15, 'Гречка'),
(16, 'Рис');

-- --------------------------------------------------------

--
-- Table structure for table `Recipe`
--

CREATE TABLE `Recipe` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RecipeIngredients`
--

CREATE TABLE `RecipeIngredients` (
  `id` int(11) NOT NULL,
  `fk_recipe` int(11) NOT NULL,
  `fk_incredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RecipeUser`
--

CREATE TABLE `RecipeUser` (
  `id` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_recipe` int(11) NOT NULL,
  `fk_time` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Time`
--

CREATE TABLE `Time` (
  `id` int(11) NOT NULL,
  `duration` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Time`
--

INSERT INTO `Time` (`id`, `duration`) VALUES
(1, 15),
(2, 20),
(3, 40),
(4, 60);

-- --------------------------------------------------------

--
-- Table structure for table `Type`
--

CREATE TABLE `Type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Type`
--

INSERT INTO `Type` (`id`, `name`) VALUES
(1, 'Завтрак'),
(2, 'Обед'),
(3, 'Полдник'),
(4, 'Ужин');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sirname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Recipe`
--
ALTER TABLE `Recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RecipeIngredients`
--
ALTER TABLE `RecipeIngredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_recipe` (`fk_recipe`),
  ADD KEY `fk_ingredient` (`fk_incredient`);

--
-- Indexes for table `RecipeUser`
--
ALTER TABLE `RecipeUser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_time` (`fk_time`),
  ADD KEY `fk_type` (`fk_type`),
  ADD KEY `fk_recipe_user` (`fk_recipe`);

--
-- Indexes for table `Time`
--
ALTER TABLE `Time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Ingredient`
--
ALTER TABLE `Ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Recipe`
--
ALTER TABLE `Recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RecipeIngredients`
--
ALTER TABLE `RecipeIngredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `RecipeUser`
--
ALTER TABLE `RecipeUser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Time`
--
ALTER TABLE `Time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Type`
--
ALTER TABLE `Type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `RecipeIngredients`
--
ALTER TABLE `RecipeIngredients`
  ADD CONSTRAINT `fk_ingredient` FOREIGN KEY (`fk_incredient`) REFERENCES `Ingredient` (`id`),
  ADD CONSTRAINT `fk_recipe` FOREIGN KEY (`fk_recipe`) REFERENCES `Recipe` (`id`);

--
-- Constraints for table `RecipeUser`
--
ALTER TABLE `RecipeUser`
  ADD CONSTRAINT `fk_recipe_user` FOREIGN KEY (`fk_recipe`) REFERENCES `Recipe` (`id`),
  ADD CONSTRAINT `fk_time` FOREIGN KEY (`fk_time`) REFERENCES `Time` (`id`),
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`fk_type`) REFERENCES `Type` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`fk_user`) REFERENCES `User` (`id`);