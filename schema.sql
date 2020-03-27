-- ТАБЛИЦЫ --
CREATE TABLE `categories` (
  `id` int(10) AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `allas` varchar(25) NOT NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `lots` (
  `id` int(10) AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_price` decimal(10,0) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `bet_step` int(10) NOT NULL,

  `creator_id` int(10) NOT NULL,
  `winner_id` int(10),
  `category_id` int(10) NOT NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `bets` (
  `id` int(10) AUTO_INCREMENT,
  `bet_date` datetime NOT NULL,
  `bet_price` decimal(10,0) NOT NULL,

  `user_id` int(10) NOT NULL,
  `lot_id` int(10) NOT NULL,
  PRIMARY KEY(`id`)
);

CREATE TABLE `users` (
  `id` int(10) AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `reg_date` datetime NOT NULL,
  `contacts` varchar(50) NOT NULL,
  PRIMARY KEY(`id`)
);

-- ИНДЕКСЫ --
ALTER TABLE `bets`
  ADD KEY `bet_price` (`bet_price`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `lots`
  ADD KEY `start_price` (`start_price`),
  ADD KEY `bet_step` (`bet_step`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `winner_id` (`winner_id`);

-- СВЯЗИ --
ALTER TABLE `bets`
  ADD CONSTRAINT `ставки_на_лот` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `сделал_ставку` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `lots`
  ADD CONSTRAINT `категория_лота` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `владелец_лота` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `победитель_лота` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
