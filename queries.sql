-- ДАННЫЕ --
INSERT INTO categories SET name = "Доски и лыжи", allas = "boards";
INSERT INTO categories SET name = "Крепления", allas = "attachment";
INSERT INTO categories SET name = "Ботинки", allas = "boots";
INSERT INTO categories SET name = "Одежда", allas = "clothing";
INSERT INTO categories SET name = "Инструменты", allas = "tools";
INSERT INTO categories SET name = "Разное", allas = "other";

INSERT INTO users SET name = "Иван", email = "ivan@mail.ru", password = "1234", avatar = "1.img", reg_date = "01.01.2019", contacts = "8(888)888-88-88";
INSERT INTO users SET name = "Александр", email = "axel@mail.ru", password = "0000", avatar = "2.img", reg_date = "01.02.2019", contacts = "8(888)888-88-88";
INSERT INTO users SET name = "Владимир", email = "vova@mail.ru", password = "abc", avatar = "4.img", reg_date = "05.01.2019", contacts = "8(888)888-88-88";

INSERT INTO lots SET name = "2014 Rossignol District Snowboard", description = "fsdgbfdgsfb", start_price = "10999", image_url = "img/lot-1.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "1", winner_id = "2", category_id = "1";
INSERT INTO lots SET name = "DC Ply Mens 2016/2017 Snowboard", description = "sdghgjnrbsftfh", start_price = "159999", image_url = "img/lot-2.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "1", winner_id = "2", category_id = "1";
INSERT INTO lots SET name = "Крепления Union Contact Pro 2015 года размер L/XL", description = "shdfghnsryhtrhgdfbgf", start_price = "8000", image_url = "img/lot-3.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "3", winner_id = "2", category_id = "2";
INSERT INTO lots SET name = "Ботинки для сноуборда DC Mutiny Charocal", description = "shbfnrtgbtjdhrtfdh", start_price = "10999", image_url = "img/lot-4.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "1", winner_id = "2", category_id = "3";
INSERT INTO lots SET name = "Куртка для сноуборда DC Mutiny Charocal", description = "tyfdhbtrhdtrhgthtf", start_price = "7500", image_url = "img/lot-5.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "1", winner_id = "2", category_id = "4";
INSERT INTO lots SET name = "Маска Oakley Canopy", description = "jsrtjtrhydksjhtryjdythtdyt", start_price = "5400", image_url = "img/lot-6.jpg", create_date = "01.01.2019", end_date = "01.01.2020", bet_step = "1000", creator_id = "2", winner_id = "1", category_id = "6";

INSERT INTO bets SET bet_date = "03.02.2019", bet_price = "10000", user_id = "2", lot_id = "3";
INSERT INTO bets SET bet_date = "05.02.2019", bet_price = "20000", user_id = "3", lot_id = "3";
INSERT INTO bets SET bet_date = "03.02.2019", bet_price = "15000", user_id = "1", lot_id = "5";

-- получить все категории --
SELECT name FROM categories;

-- получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену последней ставки, количество ставок, название категории --
SELECT l.name "Название", start_price "Стартовая цена", image_url "Ссылка на изображение", bp "Последняя ставка", bc "Колличество ставок", c.name "Категория" from lots l
left join (SELECT max(bet_price) bp, COUNT(id) bc, lot_id FROM `bets` GROUP by lot_id) b on b.lot_id = l.id
left join categories c on l.category_id = c.id;

-- показать лот по его id(2). Получите также название категории, к которой принадлежит лот
SELECT * from lots l inner join categories c on l.category_id = c.id where l.id = 2;

-- обновить название лота по его идентификатору(1) --
UPDATE lots SET name = "2015 Rossignol District Snowboard" WHERE id = "1";

-- получить список самых свежих ставок для лота по его идентификатору(3) --
SELECT l.id , b.* FROM lots l inner join bets b on l.id = b.lot_id WHERE b.lot_id = 3;