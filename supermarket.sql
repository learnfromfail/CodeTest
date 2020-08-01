-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-08-01 09:05:38
-- 伺服器版本： 10.4.13-MariaDB
-- PHP 版本： 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `supermarket`
--

-- --------------------------------------------------------

--
-- 資料表結構 `t_branch`
--
-- 讀取資料表 supermarket.t_branch 的結構時出現錯誤： #1932 - Table 'supermarket.t_branch' doesn't exist in engine
-- 讀取資料表 supermarket.t_branch 的資料時出現錯誤： #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `supermarket`.`t_branch`' at line 1

-- --------------------------------------------------------

--
-- 資料表結構 `t_categoryrate`
--
-- 讀取資料表 supermarket.t_categoryrate 的結構時出現錯誤： #1932 - Table 'supermarket.t_categoryrate' doesn't exist in engine
-- 讀取資料表 supermarket.t_categoryrate 的資料時出現錯誤： #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `supermarket`.`t_categoryrate`' at line 1

-- --------------------------------------------------------

--
-- 資料表結構 `t_product`
--
-- 讀取資料表 supermarket.t_product 的結構時出現錯誤： #1932 - Table 'supermarket.t_product' doesn't exist in engine
-- 讀取資料表 supermarket.t_product 的資料時出現錯誤： #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `supermarket`.`t_product`' at line 1

-- --------------------------------------------------------

--
-- 資料表結構 `t_receipt`
--
-- 讀取資料表 supermarket.t_receipt 的結構時出現錯誤： #1932 - Table 'supermarket.t_receipt' doesn't exist in engine
-- 讀取資料表 supermarket.t_receipt 的資料時出現錯誤： #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `supermarket`.`t_receipt`' at line 1
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
