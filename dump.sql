-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 21 2021 г., 22:05
-- Версия сервера: 8.0.27-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `nrp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_payouts`
--

CREATE TABLE `admin_payouts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` VARCHAR(36) NOT NULL,
  `server_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `payout` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX (`client_id`),
  INDEX (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `custdev`
--

CREATE TABLE `custdev` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME DEFAULT NULL,
  `finish_date` DATETIME DEFAULT NULL,
  `title` VARCHAR(128) NOT NULL,
  `url` VARCHAR(128) NOT NULL,
  `reward` INT UNSIGNED NOT NULL,
  `reward_type` VARCHAR(128) NOT NULL,
  `min_level` INT UNSIGNED DEFAULT NULL,
  `max_level` INT UNSIGNED DEFAULT NULL,
  `donate_total` BIGINT UNSIGNED DEFAULT NULL,
  `faction_id` INT UNSIGNED DEFAULT NULL,
  `is_active` TINYINT(1) NOT NULL DEFAULT 0,
  `for_all_users` TINYINT(1) NOT NULL DEFAULT 0,
  `client_ids` LONGTEXT,
  PRIMARY KEY (`id`),
  INDEX (`faction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `f4_cases`
--

CREATE TABLE `f4_cases` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(128) DEFAULT NULL,
  `cost` DECIMAL(10,2) DEFAULT NULL,
  `position` TINYINT UNSIGNED DEFAULT NULL,
  `temp_start` DATETIME DEFAULT NULL,
  `temp_end` DATETIME DEFAULT NULL,
  `temp_start_count` INT UNSIGNED DEFAULT NULL,
  `is_hit` TINYINT(1) NOT NULL DEFAULT 0,
  `is_new` TINYINT(1) NOT NULL DEFAULT 0,
  `versus` VARCHAR(128) DEFAULT NULL,
  `items` JSON DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `f4_cases_schedule`
--

CREATE TABLE `f4_cases_schedule` (
  `id` VARCHAR(36) NOT NULL,
  `temp_start` DATETIME DEFAULT NULL,
  `temp_end` DATETIME DEFAULT NULL,
  `temp_start_count` INT UNSIGNED DEFAULT NULL,
  `is_hit` TINYINT(1) NOT NULL DEFAULT 0,
  `is_new` TINYINT(1) NOT NULL DEFAULT 0,
  `versus` VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `global_cases_count`
--

CREATE TABLE `global_cases_count` (
  `ckey` VARCHAR(128) NOT NULL,
  `server` INT UNSIGNED DEFAULT NULL,
  `cvalue` INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`ckey`, `server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `global_config`
--

CREATE TABLE `global_config` (
  `ckey` VARCHAR(255) NOT NULL,
  `cvalue` LONGTEXT NOT NULL,
  `server` SMALLINT UNSIGNED NOT NULL,
  `comment` TEXT NOT NULL,
  PRIMARY KEY (`ckey`, `server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `last_infection_date`
--

CREATE TABLE `last_infection_date` (
  `server_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_apartments`
--

CREATE TABLE `nrp_apartments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` INT UNSIGNED NOT NULL,
  `meter_type` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `sale_state` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `user_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `paid_days` INT UNSIGNED NOT NULL DEFAULT 1,
  `time_to_pay` INT UNSIGNED NOT NULL DEFAULT 0,
  `paid_upgrade` INT UNSIGNED NOT NULL DEFAULT 0,
  `owner_change_time` INT UNSIGNED NOT NULL DEFAULT 0,
  `inventory_data` JSON DEFAULT NULL,
  `inventory_expand` SMALLINT UNSIGNED DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX (`user_id`),
  INDEX (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_bounty_orders`
--

CREATE TABLE `nrp_bounty_orders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_uid` INT UNSIGNED DEFAULT NULL,
  `target_uid` INT UNSIGNED DEFAULT NULL,
  `target_cid` INT UNSIGNED DEFAULT NULL,
  `target_client_id` CHAR(36) NOT NULL DEFAULT '',
  `source_client_id` CHAR(36) NOT NULL DEFAULT '',
  `target_skin_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `order_way` INT UNSIGNED NOT NULL DEFAULT 0,
  `last_position` TEXT,
  `last_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complete_date` DATETIME DEFAULT NULL,
  `time_passed` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX (`source_uid`),
  INDEX (`target_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_businesses`
--

CREATE TABLE `nrp_businesses` (
  `business_id` VARCHAR(36) NOT NULL,
  `userid` INT UNSIGNED NOT NULL DEFAULT 0,
  `client_id` CHAR(36) DEFAULT NULL,
  `balance` BIGINT NOT NULL DEFAULT 0,
  `materials` INT NOT NULL DEFAULT 0,
  `purchase_date` DATETIME DEFAULT NULL,
  `on_sale` TINYINT(1) NOT NULL DEFAULT 0,
  `sale_cost` INT NOT NULL DEFAULT 0,
  `gov_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `payment_date` DATETIME DEFAULT NULL,
  `level` INT NOT NULL DEFAULT 1,
  `succes_value` INT NOT NULL DEFAULT 0,
  `bribe_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`business_id`),
  INDEX (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_casino_lottery`
--

CREATE TABLE `nrp_casino_lottery` (
  `ckey` VARCHAR(128) NOT NULL,
  `cvalue` LONGTEXT NOT NULL,
  PRIMARY KEY (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_casino_statistics`
--

CREATE TABLE `nrp_casino_statistics` (
  `ckey` VARCHAR(128) NOT NULL,
  `cvalue` LONGTEXT NOT NULL,
  PRIMARY KEY (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_clans_data_new`
--

CREATE TABLE `nrp_clans_data_new` (
  `ckey` VARCHAR(128) NOT NULL,
  `cvalue` JSON DEFAULT NULL,
  PRIMARY KEY (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_clans_new`
--

CREATE TABLE `nrp_clans_new` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` JSON NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_discount_manager`
--

CREATE TABLE `nrp_discount_manager` (
  `key` VARCHAR(36) NOT NULL,
  `value` LONGTEXT NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_faction_boards`
--

CREATE TABLE `nrp_faction_boards` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` TEXT,
  `ads` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_faction_history`
--

CREATE TABLE `nrp_faction_history` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` INT UNSIGNED NOT NULL,
  `faction_id` VARCHAR(50) NOT NULL,
  `action` VARCHAR(255) NOT NULL,
  `timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` VARCHAR(255) NOT NULL,
  `rank` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX (`player_id`),
  INDEX (`faction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_fines`
--

CREATE TABLE `nrp_fines` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `source_uid` INT UNSIGNED NOT NULL,
  `target_uid` INT UNSIGNED DEFAULT NULL,
  `source_name` VARCHAR(255) NOT NULL,
  `target_name` VARCHAR(255) NOT NULL,
  `fine_id` INT UNSIGNED NOT NULL DEFAULT 1,
  `cost` INT UNSIGNED NOT NULL DEFAULT 0,
  `reason` TEXT,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `repayment_date` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`source_uid`),
  INDEX (`target_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_government`
--

CREATE TABLE `nrp_government` (
  `gov_id` INT UNSIGNED NOT NULL,
  `data` JSON DEFAULT NULL,
  PRIMARY KEY (`gov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Структура таблицы `nrp_gov_candidates`
--

CREATE TABLE `nrp_gov_candidates` (
  `user_id` INT UNSIGNED NOT NULL,
  `gov_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`user_id`, `gov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_gov_mayor`
--

CREATE TABLE `nrp_gov_mayor` (
  `gov_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED DEFAULT NULL,
  `name` VARCHAR(32) DEFAULT NULL,
  `end_time` DATETIME DEFAULT NULL,
  `history` JSON NOT NULL,
  `rating` DECIMAL(5,2) UNSIGNED NOT NULL DEFAULT 50.00,
  PRIMARY KEY (`gov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_gov_votes`
--

CREATE TABLE `nrp_gov_votes` (
  `user_id` INT UNSIGNED NOT NULL,
  `gov_id` INT UNSIGNED NOT NULL,
  `candidate_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `gov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_gov_voting_state`
--

CREATE TABLE `nrp_gov_voting_state` (
  `gov_id` INT UNSIGNED NOT NULL,
  `step` INT UNSIGNED NOT NULL,
  `start_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_house_sales`
--

CREATE TABLE `nrp_house_sales` (
  `hid` VARCHAR(36) NOT NULL,
  `house_type` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `seller_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `possible_buyer_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `sale_state` SMALLINT NOT NULL DEFAULT 0,
  `sale_cost` BIGINT NOT NULL DEFAULT 0,
  `sale_publish_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_rental_fee` INT NOT NULL DEFAULT 0,
  `location_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`hid`),
  INDEX (`seller_id`),
  INDEX (`possible_buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_jobs_timelimits`
--

CREATE TABLE `nrp_jobs_timelimits` (
  `key` VARCHAR(128) NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_players`
--

CREATE TABLE `nrp_players` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `accesslevel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `nickname` VARCHAR(32) NOT NULL,
  `level` INT UNSIGNED NOT NULL DEFAULT 1,
  `exp` INT UNSIGNED NOT NULL DEFAULT 150,
  `quests` JSON DEFAULT NULL,
  `quests_enabled` JSON DEFAULT NULL,
  `donate` INT UNSIGNED NOT NULL DEFAULT 0,
  `donate_total` BIGINT NOT NULL DEFAULT 0,
  `donate_transactions` INT UNSIGNED NOT NULL DEFAULT 0,
  `donate_last_date` DATETIME DEFAULT NULL,
  `premium_time_left` INT UNSIGNED DEFAULT NULL,
  `premium_total` BIGINT NOT NULL DEFAULT 0,
  `premium_transactions` INT UNSIGNED NOT NULL DEFAULT 0,
  `premium_last_date` DATETIME DEFAULT NULL,
  `premium_discounts_data` JSON DEFAULT NULL,
  `money` BIGINT NOT NULL DEFAULT 0,
  `health` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT 100.00,
  `calories` DECIMAL(6,2) DEFAULT 100.00,
  `armor` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `intro` TINYINT(1) NOT NULL DEFAULT 1,
  `last_vehicle_id` INT UNSIGNED DEFAULT NULL,
  `last_vehicle_seat` TINYINT UNSIGNED DEFAULT NULL,
  `licenses` JSON DEFAULT NULL,
  `phone` VARCHAR(15) DEFAULT NULL,
  `phone_balance` INT UNSIGNED DEFAULT 0,
  `items` JSON DEFAULT NULL,
  `vehicle_items` JSON DEFAULT NULL,
  `start_city` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `gender` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `skin` SMALLINT UNSIGNED DEFAULT NULL,
  `x` FLOAT DEFAULT NULL,
  `y` FLOAT DEFAULT NULL,
  `z` FLOAT DEFAULT NULL,
  `rotation` FLOAT DEFAULT NULL,
  `dimension` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `interior` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `client_id` CHAR(36) DEFAULT NULL,
  `reg_serial` VARCHAR(32) DEFAULT NULL,
  `last_serial` VARCHAR(32) DEFAULT NULL,
  `check_serial` TINYINT UNSIGNED DEFAULT NULL,
  `reg_ip` VARCHAR(45) DEFAULT NULL,
  `last_ip` VARCHAR(45) DEFAULT NULL,
  `now_ip` VARCHAR(45) DEFAULT NULL,
  `reg_date` DATETIME DEFAULT NULL,
  `last_date` DATETIME DEFAULT NULL,
  `last_enter_date` DATETIME DEFAULT NULL,
  `playing_time` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `birthday` DATETIME DEFAULT NULL,
  `muted` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `banned` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `banned_serials` JSON DEFAULT NULL,
  `all_vehicles_discount` JSON DEFAULT NULL,
  `social_rating` INT NOT NULL DEFAULT 0,
  `last_rating_donate` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `available_rating` INT NOT NULL DEFAULT 0,
  `available_dislike` INT UNSIGNED NOT NULL DEFAULT 0,
  `available_like` INT UNSIGNED NOT NULL DEFAULT 0,
  `last_date_like` DATETIME DEFAULT NULL,
  `last_rated_players` JSON DEFAULT NULL,
  `cases_exp` INT UNSIGNED NOT NULL DEFAULT 0,
  `cases_inc_chances` TINYINT(1) NOT NULL DEFAULT 0,
  `cases_discount_pur` JSON DEFAULT NULL,
  `cases_tuning` JSON DEFAULT NULL,
  `cases_vinyl` JSON DEFAULT NULL,
  `business_items` JSON DEFAULT NULL,
  `skins` JSON DEFAULT NULL,
  `weapons` JSON DEFAULT NULL,
  `clan_id` VARCHAR(128) DEFAULT NULL,
  `clan_exp` INT UNSIGNED NOT NULL DEFAULT 0,
  `clan_rank` INT UNSIGNED NOT NULL DEFAULT 0,
  `clan_role` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `clan_stats` JSON DEFAULT NULL,
  `clan_events_stats` JSON DEFAULT NULL,
  `wanted_data` JSON DEFAULT NULL,
  `party_id` INT UNSIGNED DEFAULT NULL,
  `job_class` VARCHAR(128) DEFAULT NULL,
  `job_id` VARCHAR(128) DEFAULT NULL,
  `faction_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `faction_level` INT UNSIGNED NOT NULL DEFAULT 0,
  `faction_exp` INT UNSIGNED NOT NULL DEFAULT 0,
  `faction_warns` INT UNSIGNED NOT NULL DEFAULT 0,
  `faction_reports` JSON DEFAULT NULL,
  `faction_thanks_last` INT UNSIGNED NOT NULL DEFAULT 0,
  `faction_timeout` INT UNSIGNED NOT NULL DEFAULT 0,
  `subscription_time_left` INT UNSIGNED NOT NULL DEFAULT 0,
  `subscription_total` BIGINT NOT NULL DEFAULT 0,
  `subscription_transactions` INT UNSIGNED NOT NULL DEFAULT 0,
  `subscription_last_date` DATETIME DEFAULT NULL,
  `subscription_reward_time` DATETIME DEFAULT NULL,
  `nickname_color` INT UNSIGNED NOT NULL DEFAULT 1,
  `nickname_color_timeout` INT UNSIGNED NOT NULL DEFAULT 0,
  `hide_nickname_time` INT UNSIGNED NOT NULL DEFAULT 0,
  `own_accessories` JSON DEFAULT NULL,
  `refferer` INT UNSIGNED DEFAULT NULL,
  `total_refferals` INT UNSIGNED DEFAULT NULL,
  `sessions_counter` INT UNSIGNED NOT NULL DEFAULT 0,
  `car_slots` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `megaphone_time_left` INT UNSIGNED DEFAULT NULL,
  `permanent_data` JSON DEFAULT NULL,
  `exp_bonus` JSON DEFAULT NULL,
  `job_money_bonus` JSON DEFAULT NULL,
  `gifts` JSON DEFAULT NULL,
  `admin_data` JSON DEFAULT NULL,
  `admin_payout` INT UNSIGNED DEFAULT NULL,
  `race_prizes` JSON DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`client_id`),
  INDEX (`nickname`),
  INDEX (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_players_common`
--

CREATE TABLE `nrp_players_common` (
  `client_id` VARCHAR(36) NOT NULL,
  `permanent_data` JSON DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_player_medbook`
--

CREATE TABLE `nrp_player_medbook` (
  `user_id` INT UNSIGNED NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_player_phone`
--

CREATE TABLE `nrp_player_phone` (
  `player_id` INT UNSIGNED NOT NULL,
  `phone_wallpaper` JSON NOT NULL,
  `phone_sounds` JSON NOT NULL,
  `current_wallpaper` JSON NOT NULL,
  `current_sounds` JSON NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_podium_bank`
--

CREATE TABLE `nrp_podium_bank` (
  `dance_id` INT UNSIGNED NOT NULL,
  `dance_pay` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`dance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_promocodes`
--

CREATE TABLE `nrp_promocodes` (
  `ckey` VARCHAR(128) NOT NULL,
  `type` VARCHAR(128) DEFAULT '',
  `rewards` JSON NOT NULL,
  `for_new_users` TINYINT(1) NOT NULL DEFAULT 0,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` DATETIME DEFAULT NULL,
  `end_date` DATETIME DEFAULT NULL,
  `client_ids` JSON DEFAULT NULL,
  `max_server_uses_count` INT UNSIGNED DEFAULT NULL,
  `max_uses_count` INT UNSIGNED DEFAULT NULL,
  `is_blocked` TINYINT(1) NOT NULL DEFAULT 0,
  `is_generated` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_promocodes_uses_count`
--

CREATE TABLE `nrp_promocodes_uses_count` (
  `ckey` VARCHAR(128) NOT NULL,
  `count` INT UNSIGNED NOT NULL,
  `server_id` SMALLINT NOT NULL,
  PRIMARY KEY (`ckey`, `server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_promocode_rewards`
--

CREATE TABLE `nrp_promocode_rewards` (
  `id` VARCHAR(128) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_race_season_winners`
--

CREATE TABLE `nrp_race_season_winners` (
  `season_number` INT UNSIGNED NOT NULL,
  `season_started` DATETIME NOT NULL,
  `season_data` JSON NOT NULL,
  PRIMARY KEY (`season_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_tuning_internal_cases`
--

CREATE TABLE `nrp_tuning_internal_cases` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL DEFAULT '',
  `en_name` VARCHAR(128) NOT NULL DEFAULT '',
  `description` JSON NOT NULL,
  `prices` JSON NOT NULL,
  `items` JSON NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_tuning_internal_parts`
--

CREATE TABLE `nrp_tuning_internal_parts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `names` JSON NOT NULL,
  `type` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `subtype` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `category` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `speed` SMALLINT NOT NULL DEFAULT 0,
  `acceleration` SMALLINT NOT NULL DEFAULT 0,
  `controllability` SMALLINT NOT NULL DEFAULT 0,
  `clutch` SMALLINT NOT NULL DEFAULT 0,
  `slip` SMALLINT NOT NULL DEFAULT 0,
  `price` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--

CREATE TABLE nrp_vehicles (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_pid` varchar(12) NOT NULL,
  `model` smallint UNSIGNED NOT NULL,
  `health` smallint NOT NULL DEFAULT 1000,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `rx` double DEFAULT NULL,
  `ry` double DEFAULT NULL,
  `rz` double DEFAULT NULL,
  `interior` smallint UNSIGNED NOT NULL DEFAULT 0,
  `dimension` smallint UNSIGNED NOT NULL DEFAULT 0,
  `fuel` float UNSIGNED NOT NULL DEFAULT 100,
  `mileage` float UNSIGNED NOT NULL DEFAULT 0,
  `mileage_since_lp` float UNSIGNED NOT NULL DEFAULT 0,
  `mileage_total` float UNSIGNED NOT NULL DEFAULT 0,
  `number_plate` varchar(32),
  `variant` smallint UNSIGNED NOT NULL DEFAULT 1,
  `windows_color` varchar(32),
  `locked` enum('on','off') NOT NULL DEFAULT 'off',
  `wheels_states` varchar(255),
  `panels_states` varchar(255),
  `doors_states` varchar(255),
  `lights_states` varchar(255),
  `color` varchar(255) NOT NULL DEFAULT '[[255, 255, 255, 0, 0, 0, 128, 128, 128, 64, 64, 64]]',
  `headlights_color` varchar(255) NOT NULL DEFAULT '[[]]',
  `flags` varchar(255) DEFAULT NULL,
  `condition` varchar(255),  
  `deleted` bigint DEFAULT NULL,  
  `last_owner` varchar(255),
  `comment` varchar(255),
  `custom_data` text,
  `blocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `parked` enum('yes','no') NOT NULL DEFAULT 'no',
  `hydraulics` enum('yes','no') NOT NULL DEFAULT 'no',
  `wheels` int UNSIGNED NOT NULL DEFAULT 0,
  `wheels_color` varchar(255) NOT NULL DEFAULT '[[255, 255, 255]]',
  `height_level` int NOT NULL DEFAULT 0,
  `black_platecolor` varchar(32),
  `tuning_internal` text,
  `tuning_external` text,
  `neon_data` text,
  `temp_timeout` int UNSIGNED DEFAULT NULL,
  `creation_date` int UNSIGNED NOT NULL,
  `dmg_total` float DEFAULT NULL,
  `dmg_since_lp` float DEFAULT NULL,
  `sell_last_date` int UNSIGNED DEFAULT NULL,
  `sell_count` int UNSIGNED DEFAULT NULL,
  `change_status_last_date` int UNSIGNED DEFAULT NULL,
  `evacuated` enum('yes','no') NOT NULL DEFAULT 'no',
  `race_circle_count` int UNSIGNED NOT NULL DEFAULT 0,
  `race_circle_points` int UNSIGNED NOT NULL DEFAULT 0,
  `race_drift_count` int UNSIGNED NOT NULL DEFAULT 0,
  `race_drift_points` int UNSIGNED NOT NULL DEFAULT 0,
  `race_drag_count` int UNSIGNED NOT NULL DEFAULT 0,
  `race_drag_points` int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `idx_owner_pid` (`owner_pid`),
  INDEX `idx_model` (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Структура таблицы `nrp_vehicle_auction`
--

CREATE TABLE nrp_vehicle_auction (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items` JSON NOT NULL,
  `finish_ts` int UNSIGNED NOT NULL,
  `last_bets` JSON NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_finish_ts` (`finish_ts`)  -- Додає індекс для швидкого пошуку по finish_ts
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_vehicle_auction_bets`
--

CREATE TABLE nrp_vehicle_auction_bets (
  player_id int UNSIGNED NOT NULL,
  player_name varchar(255) NOT NULL,
  skin_id int UNSIGNED NOT NULL,
  auction_id int UNSIGNED NOT NULL,
  item_id int UNSIGNED NOT NULL,
  value int UNSIGNED NOT NULL,
  timestamp int UNSIGNED NOT NULL,
  returned enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (player_id, auction_id, item_id),
  INDEX idx_auction_id (auction_id),
  INDEX idx_player_id (player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_viphouses`
--

CREATE TABLE nrp_viphouses (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  hid varchar(255),
  owner int UNSIGNED NOT NULL DEFAULT 0,
  sale_state smallint NOT NULL DEFAULT 0,
  meter_type smallint NOT NULL DEFAULT 0,
  settings text NOT NULL,
  inventory_data text,
  inventory_expand smallint UNSIGNED DEFAULT 0,
  PRIMARY KEY (id),
  INDEX idx_owner (owner)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `nrp_woodcutter_stock`
--

CREATE TABLE nrp_woodcutter_stock (
  stock_name varchar(32) NOT NULL,
  stock_value int UNSIGNED NOT NULL,
  PRIMARY KEY (stock_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `offers_comfort_start_test`
--

CREATE TABLE offers_comfort_start_test (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  group_name varchar(128) DEFAULT NULL,
  count int UNSIGNED NOT NULL DEFAULT 0,
  today_count int UNSIGNED NOT NULL DEFAULT 0,
  today_date int UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  INDEX idx_group_name (group_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `offers_packs_sold_count`
--

CREATE TABLE offers_packs_sold_count (
  pack_id int UNSIGNED NOT NULL,
  start_date int UNSIGNED NOT NULL,
  finish_date int UNSIGNED NOT NULL,
  count int UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (pack_id, start_date, finish_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `serial_ban_list`
--

CREATE TABLE serial_ban_list (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  serial varchar(32) NOT NULL DEFAULT '',
  admin_nickname varchar(32) NOT NULL DEFAULT '',
  reason varchar(128) NOT NULL DEFAULT '',
  server_create_ban smallint NOT NULL,
  server smallint NOT NULL,
  admin_id int UNSIGNED NOT NULL,
  date int UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX idx_serial (serial),
  INDEX idx_admin_id (admin_id),
  INDEX idx_date (date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `special_offers`
--

CREATE TABLE special_offers (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  class varchar(128) NOT NULL,
  model varchar(128) NOT NULL,
  name varchar(128) DEFAULT NULL,
  cost int UNSIGNED NOT NULL,
  cost_original int UNSIGNED DEFAULT NULL,
  start_date datetime DEFAULT NULL,
  finish_date datetime DEFAULT NULL,
  limit_count int UNSIGNED DEFAULT NULL,
  segment text,
  data text,
  PRIMARY KEY (id),
  INDEX idx_class (class),
  INDEX idx_model (model),
  INDEX idx_start_date (start_date),
  INDEX idx_finish_date (finish_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `special_offers_sold_count`
--

CREATE TABLE special_offers_sold_count (
  class varchar(128) NOT NULL,
  model varchar(128) NOT NULL,
  start_date int UNSIGNED NOT NULL,
  finish_date int UNSIGNED NOT NULL,
  count int UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (class, model, start_date, finish_date),
  INDEX idx_model (model)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
ALTER TABLE admin_payouts
  ADD PRIMARY KEY (client_id),
  ADD KEY idx_server_id (server_id);

--
-- Индексы таблицы `custdev`
--
ALTER TABLE custdev
  ADD PRIMARY KEY (id);

--
-- Индексы таблицы `f4_cases`
--
ALTER TABLE f4_cases
  ADD PRIMARY KEY (id);

--
-- Индексы таблицы `global_cases_count`
--
ALTER TABLE global_cases_count
  ADD PRIMARY KEY (ckey);

--
-- Индексы таблицы `last_infection_date`
--
ALTER TABLE last_infection_date
  ADD PRIMARY KEY (server_id);

--
-- Индексы таблицы `nrp_apartments`
--
ALTER TABLE nrp_apartments
  ADD PRIMARY KEY (id, number);

--
-- Индексы таблицы `nrp_bounty_orders`
--
ALTER TABLE nrp_bounty_orders
  ADD PRIMARY KEY (id);

--
-- Индексы таблицы `nrp_businesses`
--
ALTER TABLE nrp_businesses
  MODIFY business_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (business_id);

--
-- Индексы таблицы `nrp_casino_lottery`
--
ALTER TABLE nrp_casino_lottery
  ADD PRIMARY KEY (ckey),

--
-- Индексы таблицы `nrp_casino_statistics`
--
ALTER TABLE nrp_casino_statistics
  ADD PRIMARY KEY (ckey),

--
-- Индексы таблицы `nrp_clans_data_new`
--
ALTER TABLE nrp_clans_data_new
  ADD PRIMARY KEY (ckey),

--
-- Индексы таблицы `nrp_clans_new`
--
ALTER TABLE nrp_clans_new
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (id),

--
-- Индексы таблицы `nrp_discount_manager`
--
ALTER TABLE nrp_discount_manager
  ADD PRIMARY KEY (key),

--
-- Индексы таблицы `nrp_faction_history`
--
ALTER TABLE nrp_faction_history
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT,
  ADD PRIMARY KEY (id),

--
-- Індекси таблиці nrp_fines
ALTER TABLE nrp_fines
  DROP PRIMARY KEY,               -- Видаляємо старий ключ, якщо існує
  ADD PRIMARY KEY (id),           -- Додаємо первинний ключ
  ADD KEY IF NOT EXISTS target_uid (target_uid);  -- Додаємо індекс (якщо він не існує)

-- Індекси таблиці nrp_government
ALTER TABLE nrp_government
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (gov_id);

-- Індекси таблиці nrp_gov_candidates
ALTER TABLE nrp_gov_candidates
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (user_id);

-- Індекси таблиці nrp_gov_mayor
ALTER TABLE nrp_gov_mayor
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (gov_id);

-- Індекси таблиці nrp_gov_voting_state
ALTER TABLE nrp_gov_voting_state
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (gov_id);

-- Індекси таблиці nrp_house_sales
ALTER TABLE nrp_house_sales
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (hid);

-- Індекси таблиці nrp_jobs_timelimits
ALTER TABLE nrp_jobs_timelimits
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (key);   -- Використовуємо зворотні лапки для зарезервованих слів

--
-- Індекси таблиці nrp_players
ALTER TABLE nrp_players
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  ADD KEY client_id_idx (client_id),
  ADD KEY clan_id_idx (clan_id),
  ADD KEY nickname_idx (nickname),
  ADD KEY faction_id_idx (faction_id),
  ADD KEY banned_idx (banned),
  ADD KEY business_coins_idx (business_coins),
  ADD KEY phone_number_idx (phone_number),
  ADD KEY reg_date_idx (reg_date),
  ADD KEY level_idx (level),
  ADD KEY last_serial_idx (last_serial),
  ADD KEY reg_serial_idx (reg_serial),
  ADD KEY last_ip_idx (last_ip),
  ADD KEY now_ip_idx (now_ip);

-- Індекси таблиці nrp_players_common
ALTER TABLE nrp_players_common
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (client_id);

-- Індекси таблиці nrp_player_medbook
ALTER TABLE nrp_player_medbook
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (user_id);

-- Індекси таблиці nrp_player_phone
ALTER TABLE nrp_player_phone
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (player_id);

-- Індекси таблиці nrp_podium_bank
ALTER TABLE nrp_podium_bank
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (dance_id);

-- Індекси таблиці nrp_promocodes
ALTER TABLE nrp_promocodes
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (ckey);

-- Індекси таблиці nrp_promocodes_uses_count
ALTER TABLE nrp_promocodes_uses_count
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (ckey, server_id);

--
-- Індекси таблиці nrp_promocode_rewards
ALTER TABLE nrp_promocode_rewards
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці nrp_tuning_internal_cases
ALTER TABLE nrp_tuning_internal_cases
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці nrp_tuning_internal_parts
ALTER TABLE nrp_tuning_internal_parts
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці nrp_vehicles
ALTER TABLE nrp_vehicles
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  ADD KEY owner_pid_idx (owner_pid);  -- Додаємо індекс із унікальним іменем

-- Індекси таблиці nrp_vehicle_auction
ALTER TABLE nrp_vehicle_auction
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці nrp_viphouses
ALTER TABLE nrp_viphouses
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці nrp_woodcutter_stock
ALTER TABLE nrp_woodcutter_stock
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (stock_name);

-- Індекси таблиці offers_comfort_start_test
ALTER TABLE offers_comfort_start_test
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

--
-- Індекси таблиці offers_packs_sold_count
ALTER TABLE offers_packs_sold_count
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (pack_id);

-- Індекси таблиці serial_ban_list
ALTER TABLE serial_ban_list
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці special_offers
ALTER TABLE special_offers
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- Індекси таблиці special_offers_sold_count
ALTER TABLE special_offers_sold_count
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (class, model, start_date); -- Композитний ключ

-- AUTO_INCREMENT для збережених таблиць

-- AUTO_INCREMENT для таблиці custdev
ALTER TABLE custdev
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id); -- id повинен бути первинним ключем для AUTO_INCREMENT

-- AUTO_INCREMENT для таблиці nrp_bounty_orders
ALTER TABLE nrp_bounty_orders
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

-- AUTO_INCREMENT для таблиці nrp_clans_new
ALTER TABLE nrp_clans_new
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT для таблиці nrp_faction_history
ALTER TABLE nrp_faction_history
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_fines
ALTER TABLE nrp_fines
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_players
ALTER TABLE nrp_players
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_tuning_internal_cases
ALTER TABLE nrp_tuning_internal_cases
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_tuning_internal_parts
ALTER TABLE nrp_tuning_internal_parts
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_vehicles
ALTER TABLE nrp_vehicles
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці nrp_viphouses
ALTER TABLE nrp_viphouses
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці offers_comfort_start_test
ALTER TABLE offers_comfort_start_test
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT для таблиці serial_ban_list
ALTER TABLE serial_ban_list
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id),
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці special_offers
ALTER TABLE special_offers
  DROP PRIMARY KEY,                -- Видаляємо первинний ключ, якщо він уже існує
  ADD PRIMARY KEY (id),            -- Додаємо первинний ключ на стовпець id
  MODIFY id INT UNSIGNED NOT NULL AUTO_INCREMENT;  -- Застосовуємо AUTO_INCREMENT

COMMIT;  -- Підтверджуємо транзакцію
