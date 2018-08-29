--1. Ќапишите запрос, вывод€щий декартово произведение таблиц product и purchase.
select * from product, purchase;

--2. Ќапишите запрос, вывод€щий наименование проданного товара product_name, 
--количество quantity (таблица purchase) и quantity_on_hand (таблица product).
select purchase.product_name, purchase.quantity, product.quantity_on_hand from purchase join product on purchase.PRODUCT_NAME = product.PRODUCT_NAME;

--3.Ќапишите запрос, вывод€щий наименование товара product_name таблица purchase), 
--дату последней поставки laststockdate (таблица product) и фамилию продавца last_name (таблица person).
select purchase.product_name, product.laststockdate, person.last_name from product join PURCHASE on PURCHASE.PRODUCT_NAME = product.PRODUCT_NAME join PERSON on purchase.salesperson = person.person_code;

--4. Ќапишите запрос, вывод€щий столбцы product_name, first_name, 
--last_name внешнего объединени€ таблиц purchase и person. »спользуйте дл€ таблиц короткие псевдонимы.
select product_name,first_name,last_name from PURCHASE full join PERSON on PURCHASE.salesperson = PERSON.PERSON_CODE;

--5. Ќапишите запрос, который выводит все неповтор€ющиес€ в purchase коды продавцов salesperson из таблицы purchase_archive.
select DISTINCT salesperson from PURCHASE_ARCHIVE where salesperson not in (select SALESPERSON from PURCHASE);

--6. Ќапишите запрос, который выводит коды только тех продавцов salesperson из таблицы purchase, которые так же содержатьс€ в таблице purchase_archive.
select purchase.salesperson from purchase inner join PURCHASE_ARCHIVE on purchase.salesperson = PURCHASE_ARCHIVE.SALESPERSON;

--7. Ќапишите запрос, который выводит все (в том числе повтор€ющиес€) коды 
--продавцов salesperson из таблиц purchase и purchase_archive.
(select salesperson from purchase) union (select SALESPERSON from PURCHASE_ARCHIVE);