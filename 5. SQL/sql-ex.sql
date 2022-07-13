-- 1) Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd
FROM pc
WHERE price < 500
===============================================================
-- 2) Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT maker
FROM product
WHERE type = 'Printer'
===============================================================
-- 3) Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen 
FROM laptop
WHERE price > 1000
===============================================================
-- 4) Найдите все записи таблицы Printer для цветных принтеров.
SELECT *
FROM printer
WHERE color = 'y'
===============================================================
-- 5) Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT model, speed, hd
FROM pc
WHERE cd in ('12x', '24x') and price < 600
===============================================================
-- 6) Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT maker, speed
FROM Product 
INNER JOIN Laptop ON Product.model = Laptop.model 
WHERE hd >= 10
===============================================================
-- 7) Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT laptop.model, price
FROM product
INNER JOIN laptop on product.model = laptop.model
WHERE maker = 'B'
UNION
SELECT pc.model, price
FROM product
INNER JOIN pc on product.model = pc.model
WHERE maker = 'B'
UNION
SELECT printer.model, price
FROM product
INNER JOIN printer on product.model = printer.model
WHERE maker = 'B'
===============================================================
-- 8) Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker
FROM product
where type IN ('Laptop', 'PC')
EXCEPT
SELECT maker
FROM product
where type IN ('Laptop')

===============================================================
-- 9) Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker
FROM product INNER JOIN pc ON product.model = pc.model
WHERE pc.speed >= 450 AND type = 'PC'
===============================================================
-- 10) Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT model, price
FROM printer
WHERE price IN (SELECT max(price) FROM printer)
===============================================================
-- 11) Найдите среднюю скорость ПК.
SELECT sum(speed)/count(speed) as avg_speed_pc
FROM pc
===============================================================
-- 12) Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT sum(speed)/count(speed) as avg_speed_laptop
FROM laptop
WHERE price > 1000
===============================================================
-- 13) Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT sum(speed)/count(speed) as avg_speed_pc
FROM pc INNER JOIN product ON pc.model = product.model
where maker = 'A'
===============================================================
-- 14) Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT ships.class, name, country
FROM ships
INNER JOIN classes ON ships.class = classes.class
where numGuns >= 10
===============================================================
-- 15) Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd FROM pc
GROUP BY hd
HAVING count(hd) >= 2
===============================================================
-- 16) Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
--     В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i).
--     Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
FROM pc AS pc1, pc AS pc2
WHERE pc1.speed = pc2.speed AND pc1.ram = pc2.ram AND pc1.model > pc2.model
===============================================================
-- 17) Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed
SELECT DISTINCT type, product.model, speed
FROM laptop INNER JOIN product ON laptop.model = product.model
WHERE speed < (SELECT min(speed) FROM pc)
===============================================================
-- 18) Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT maker, price
FROM printer INNER JOIN product ON printer.model = product.model
WHERE color = 'y' AND price IN (SELECT min(price) FROM printer WHERE color = 'y')
===============================================================
-- 19) Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
--     Вывести: maker, средний размер экрана.
SELECT maker, (sum(screen) / count(maker)) AS avg_screen
FROM laptop INNER JOIN product ON laptop.model = product.model
GROUP BY maker
===============================================================
--  20) Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT maker, count(model) AS all_model_pc
FROM product
WHERE type = 'PC'
GROUP BY maker
HAVING count(model) >= 3
===============================================================
-- 21) Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
--     Вывести: maker, максимальная цена.
SELECT maker, max(pc.price) AS max_price
FROM product INNER JOIN pc ON product.model = pc.model
WHERE type = 'PC'
GROUP BY maker
===============================================================
-- 22) Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
SELECT speed, (sum(price) / count(price)) AS avg_price
FROM pc
GROUP BY speed
HAVING speed > 600
===============================================================
-- 23) Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker
SELECT maker
FROM product INNER JOIN pc ON product.model = pc.model
WHERE speed >= 750
INTERSECT
SELECT maker
FROM product INNER JOIN laptop ON product.model = laptop.model
WHERE speed >= 750
===============================================================
-- 24) Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
WITH all_max_price AS (
    SELECT model, price
    FROM pc
    WHERE price IN (SELECT max(price) FROM pc)
UNION
    SELECT model, price
    FROM laptop
    WHERE price IN (SELECT max(price) FROM laptop)
UNION
    SELECT model, price
    FROM printer
    WHERE price IN (SELECT max(price) FROM printer))
SELECT model
FROM all_max_price
WHERE price in (SELECT max(price) FROM all_max_price)
===============================================================
-- 25) Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
SELECT DISTINCT maker 
FROM PC
JOIN product ON pc.model=product.model
WHERE maker IN
(SELECT DISTINCT maker FROM Product WHERE type = 'printer')
AND speed = (SELECT MAX(speed) FROM PC WHERE ram = (SELECT MIN(ram) FROM PC))
AND ram = (SELECT MIN(ram) FROM PC)
-- 26) Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
SELECT SUM(price)/SUM(models) AS avgPrice
FROM (
SELECT 
COUNT(pc.Model) models, 
SUM(price) price 
FROM PC
JOIN product ON product.Model=PC.model
WHERE maker= 'A'
UNION
SELECT 
COUNT(laptop.Model) models, 
SUM(price) price 
FROM laptop
JOIN product ON product.Model=laptop.model
WHERE maker= 'A'
) newTable
===============================================================
-- 27) Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
SELECT maker, (sum(hd) / count(hd)) as avg_hd
FROM pc inner join product ON pc.model = product.model
GROUP BY maker
HAVING maker in(SELECT DISTINCT maker FROM Product WHERE type = 'printer')
===============================================================
-- 28) Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
SELECT count(maker) AS qty
FROM (SELECT maker, count(model) AS all_model
FROM product
GROUP BY maker
HAVING count(model) = 1) new_table
===============================================================
-- 29) В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)],
-- написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
SELECT Income_o.point, Income_o.[date], inc, out
FROM Income_o LEFT JOIN Outcome_o ON Income_o.point = Outcome_o.point
AND Outcome_o.[date] = Income_o.[date]
UNION
SELECT Outcome_o.point, Outcome_o.[date], inc, out
FROM Outcome_o LEFT JOIN Income_o ON Outcome_o.point = Income_o.point
AND Outcome_o.[date] = Income_o.[date]
===============================================================
-- 30) В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code),
-- требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
-- Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
WITH a AS  
(SELECT i.point, i.date, SUM(inc) AS q, NULL AS w FROM Income i
GROUP BY i.point, i.date
UNION
SELECT o.point, o.date, NULL AS q, SUM(out) AS w FROM Outcome o
GROUP BY o.point, o.date)
SELECT point, date, SUM(w) AS out, SUM(q) AS inc FROM a
GROUP BY point, date
ORDER BY point
===============================================================