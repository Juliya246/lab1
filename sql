DROP DATABASE IF EXISTS 1lab;
CREATE DATABASE IF NOT EXISTS 1lab;
USE 1lab;
CREATE TABLE IF NOT EXISTS library(
   n INT PRIMARY KEY,
  code INT NOT NULL,
  new BOOLEAN DEFAULT TRUE,
  name VARCHAR(255),
  price FLOAT,
  publisher VARCHAR(255),
  pages INT NOT NULL,
  format INT NOT NULL,
  date DATE NOT NULL,
  circulation INT NOT NULL,
  theme VARCHAR(255),
  category VARCHAR(255)
    )
  ENGINE = INNODB;
  INSERT INTO library(n, code, new, name, price, publisher, pages, date, circulation, category)
  VALUES(
   2, 5110, false, 'Аппаратные средства мультимедия. Видеосистема РС', 15.51, 'BHV C.-Путурбург', 400, '2000-07-24', 5000, 'Підручники'),
  (8, 4985, false, 'Освой самостоятельно модернизацию и ремонт ПК за 24 часа, 2-е изд.', 18.90, 'Вильямс', 288, '2000-07-07', 5000, 'Підручники'),
  (9, 5141, false, 'Структуры данных и алгоритмы', 37.80, 'Вильямс', 384, '2000-09-29', 5000, 'Підручники'),
  (20, 5127, true, 'Автоматизация инженерно-графических работ', 11.58, 'Питер', 256, '2000-06-15', 5000, 'Підручники'),
  (46, 5199, false, 'Железо IBM 2001', 30.07, 'МикроАрт', 3684, '2000-12-02', 5000, 'Апаратні засоби ПК'),
  (50, 3851, true, 'Защита информации и безопасность компьютерных систем', 26.00, 'DiaSoft', 480, '1999-02-04', 5000, 'Захист і безпека ПК'),
  (58, 3932, false, 'Как превратить персональный компьютер в измерительный комплекс', 7.65, 'ДМК', 144, '1999-06-09', 5000, 'Інші книги'),
  (59, 4713, false, 'Plugins. Встраиваемые приложения для музыкальных программ', 11.41, 'ДМК', 144, '2000-02-22', 5000, 'Інші книги'),
  (175, 5217, false, 'Windows МЕ. Новейшие версии программ', 16.57, 'Триумф', 320, '2000-08-25', 5000, 'Windows 2000'),
  (176, 4829, false, 'Windows 2000 Professional шаг за шагом с СD', 27.25, 'Эком', 320, '2000-04-28', 5000, 'Windows 2000'),
  (188, 5170, false, 'Linux Русские версии', 24.43, 'ДМК', 346, '2000-09-29', 5000, 'Linux'),
  (191, 860, false, 'Операционная система UNIX', 3.50, 'BHV C.-Путурбург', 395, '1997-05-05', 5000, 'Unix'),
  (203, 44, false, 'Ответы на актуальные вопросы по OS/2 Warp', 5.00, 'DiaSoft', 352, '1996-03-20', 5000, 'Інші операційні системи'),
  (206, 5176, false, 'Windows Ме. Спутник пользователя', 12.79, 'Русская редакция', 306, '2000-10-10', 5000, 'Інші операційні системи'),
  (209, 5462, false, 'Язык программирования С++. Лекции и упражнения', 29.00, 'DiaSoft', 656, '2000-12-12', 5000, 'C&C++'),
  (210, 4982, false, 'Язык программирования С. Лекции и упражнения', 29.00, 'DiaSoft', 432, '2000-07-12', 500, 'C&C++'),
  (220, 4687, false, 'Эффективное использование C++ .50 рекомендаций по улучшению ваших программ и проектов', 17.60, 'ДМК', 240, '2000-02-03', 5000, 'C&C++');
  UPDATE 1lab.library
	SET format =
	CASE
	    	WHEN code = 3851 OR code = 5462 OR code = 4982 THEN '84х108/16'
        	WHEN code = 3932 THEN '60х88/16'
		WHEN code = 860 THEN '84х100/16'
        	WHEN code = 44 THEN '60х84/16'
		WHEN code = 5176 THEN ' '
        	ELSE '70х100/16'
	END;
    UPDATE 1lab.library
	SET theme =
	CASE
	    	WHEN code = 5217 OR code = 4829 OR code = 5170 OR code = 860 OR code = 44 OR code = 5176 THEN 'Операційні системи'
        	WHEN code = 5462 OR code = 4982 OR code = 4687 THEN 'Програмування'
    		ELSE 'Використання ПК в цілому'
	END;
    
    CREATE UNIQUE INDEX idx_name ON 1lab.library (name);
    CREATE INDEX idx_code ON 1lab.library (code);

    ALTER TABLE 1lab.library ADD author VARCHAR(15);
    ALTER TABLE 1lab.library MODIFY COLUMN author VARCHAR(20);
    ALTER TABLE 1lab.library DROP COLUMN author;
    ALTER TABLE 1lab.library MODIFY COLUMN `n` SMALLINT(5) UNSIGNED UNIQUE;
    ALTER TABLE 1lab.library DROP COLUMN `n`;
