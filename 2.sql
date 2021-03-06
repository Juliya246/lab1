// Вивести значення наступних колонок: номер, код, новинка, назва, ціна, сторінки
SELECT n, code, new, name, price, pages FROM `library`;

// Вивести значення всіх колонок
SELECT * FROM `library`;

// Вивести значення колонок в наступному порядку: код, назва, новинка, сторінки, ціна, номер
SELECT code, name, new, pages, price, n FROM `library`;

// Вивести значення всіх колонок 10 перших рядків
SELECT * FROM `library` LIMIT 10;

// Вивести значення колонки код без повторення однакових кодів
SELECT DISTINCT cod FROM 2lab.library;

// Вивести всі книги новинки
SELECT * FROM `library` WHERE `new` = 'Yes';

// Вивести всі книги новинки з ціною від 20 до 30
SELECT * FROM `library` WHERE `new` = 'Yes' AND `price` BETWEEN 20 AND 30

// Вивести всі книги новинки з ціною менше 20 і більше 30
SELECT * FROM `library` WHERE `new` = 'Yes' AND `price` NOT BETWEEN 20 AND 30

// Вивести всі книги з кількістю сторінок від 300 до 400 і з ціною більше 20 і менше 30
SELECT * FROM `library` WHERE `pages` BETWEEN 300 AND 400 AND `price` BETWEEN 21 AND 29

// Вивести всі книги видані взимку 2000 року
SELECT * FROM `library` WHERE (`date` BETWEEN '2000-01-01' AND '2000-02-29') OR (`date` BETWEEN '2000-12-01' AND '2000-12-31')

// Вивести книги зі значеннями кодів 5110, 5141, 4985, 4241
SELECT * FROM `library` WHERE `code` = 5110 OR `code` = 5141 OR `code` = 4985 OR `code` = 4241

// Вивести книги видані в 1999, 2001, 2003, 2005 р
SELECT * FROM `library` WHERE `date` LIKE '1999-%-%' OR `date` LIKE '2001-%-%' OR `date` LIKE '2003-%-%' OR `date` LIKE '2005-%-%'

// Вивести книги назви яких починаються на літери А-К
SELECT * FROM `library` WHERE `name` BETWEEN 'А' AND 'Л'

// Вивести книги назви яких починаються на літери "АПП", видані в 2000 році з ціною до 20
SELECT * FROM `library` WHERE `name` LIKE 'Апп%' AND `dat` LIKE '2000-%-%' AND `price`<= 20

// Вивести книги назви яких починаються на літери "АПП", закінчуються на "е", видані в першій половині 2000 року
SELECT * FROM `library` WHERE `name` LIKE 'Апп%е' AND `dat` BETWEEN '2000-01-01' AND '2000-06-30'

// Вивести книги, в назвах яких є слово Microsoft, але немає слова Windows
SELECT * FROM `library` WHERE `name` LIKE '%Microsoft%' AND `name` NOT LIKE '%Windows%'

// Вивести книги, в назвах яких присутня як мінімум одна цифра.
SELECT * FROM `library` WHERE `name` RLIKE '[0-9]'

// Вивести книги, в назвах яких присутні не менше трьох цифр.
SELECT * FROM `library` WHERE `name` RLIKE '.*[0-9].*[0-9].*[0-9].*'

// Вивести книги, в назвах яких присутній рівно п'ять цифр.
SELECT * FROM `library` WHERE `name` NOT RLIKE '.*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*' AND `name` RLIKE '.*[0-9].*[0-9].*[0-9].*[0-9].*[0-9].*'
