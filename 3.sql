// Вивести книги у яких не введена ціна або ціна дорівнює 0
SELECT * FROM `library` WHERE `price` = 0 OR `price` = NULL

// Вивести книги у яких введена ціна, але не введений тираж
SELECT * FROM `library` WHERE `price` IS NOT NULL AND `circulation` = NULL

// Вивести книги, про дату видання яких нічого не відомо.
SELECT * FROM `library` WHERE `date` = NULL

// Вивести книги, з дня видання яких пройшло не більше року.
SELECT * FROM `library` WHERE YEAR(CURRENT_DATE) - YEAR(`date`) <= 1

// Вивести список книг-новинок, відсортованих за зростанням ціни
SELECT * FROM `library` WHERE `new` = 'Yes' ORDER BY `price`

// Вивести список книг з числом сторінок від 300 до 400, відсортованих в зворотному алфавітному порядку назв
SELECT * FROM `library` WHERE `pages` BETWEEN 300 AND 400 ORDER BY `name` DESC

// Вивести список книг з ціною від 20 до 40, відсортованих за спаданням дати
SELECT * FROM `library` WHERE `price` BETWEEN 20 AND 40 ORDER BY `date` DESC

// Вивести список книг, відсортованих в алфавітному порядку назв і ціною по спадаючій
SELECT * FROM `library` ORDER BY `name` ASC, `price` DESC

// Вивести книги, у яких ціна однієї сторінки < 10 копійок.
SELECT * FROM `library` WHERE `price`* 27.93 / `pages` < 0.1

// Вивести значення наступних колонок: число символів в назві, перші 20 символів назви великими літерами
SELECT LENGTH(`name`), LEFT(UPPER(`name`), 20) FROM `library`

// Вивести значення наступних колонок: перші 10 і останні 10 символів назви прописними буквами, розділені '...'
SELECT LOWER(CONCAT(LEFT(name, 10), '...', RIGHT(name, 10))) FROM `library`;

// Вивести значення наступних колонок: назва, дата, день, місяць, рік
SELECT name `Назва`, date `Дата`, DAYNAME(date) `День`, MONTHNAME(date) `Місяць`, YEAR(date) `Рік` FROM `library`;

// Вивести значення наступних колонок: назва, дата, дата в форматі 'dd/mm/yyyy'
SELECT name `Назва`, date `Дата`, DATE_FORMAT(date, '%d/%m/%Y') 'dd/mm/yyyy' FROM `library`;

// Вивести значення наступних колонок: код, ціна, ціна в грн., ціна в євро, ціна в руб.
SELECT code `Код`, price `Ціна`, ROUND(price*27.90,2) `Ціна в грн`, ROUND(price*0.82,2) `Ціна в євро`, ROUND(price*74.16,2) `Ціна в руб` FROM `library`;

// Вивести значення наступних колонок: код, ціна, ціна в грн. без копійок, ціна без копійок округлена
SELECT code `Код`, price `Ціна`, TRUNCATE(price*27.90, 0) `Ціна в грн без копійок`, ROUND(price*27.90, 0) `Ціна в грн округлена` FROM `library`;

// Додати інформацію про нову книгу (всі колонки)
INSERT INTO library (`n`, `code`, `new`, `name`, `price`, `publisher`, `pages`, `format`, `date`, `circulation`, `theme`, `category`)
VALUE (239, 1632, 'Yes', 'Этюд в багровых тонах', 6.8, 'Азбука-классика', 448, '130x200/16', '2017-04-04', 500, 'Шерлок Холмс', 'Детектив');
SELECT * FROM `library` WHERE 1

// Додати інформацію про нову книгу (колонки обов'язкові для введення)
INSERT INTO library (`n`, `code`, `name`, `price`, `publisher`, `pages`, `date`, `theme`, `category`)
VALUE (240, 1633, 'Harry Potter', 8.01, 'Bloomsbury', 448, '2017-04-04', 'Манічний світ', 'Фентезі');
SELECT * FROM `library` WHERE 1

// Видалити книги, видані до 1990 року
DELETE FROM `library` WHERE YEAR(date) < 1990;

// Проставити поточну дату для тих книг, у яких дата видання відсутня
UPDATE `library` SET `date` = CURRENT_DATE WHERE date = NULL;

// Установити ознаку новинка для книг виданих після 2005 року
UPDATE `library` SET `new` = 'Yes' WHERE YEAR(date) >= 2005;
