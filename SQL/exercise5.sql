--1. Напишите запрос, который возвращает всех сотрудников, которых взяли на работу в то же день, что и сотрудника John Smith.
select first_name, last_name, person_code from person where hiredate = (select hiredate from person where first_name = 'John' and last_name = 'Smith');

--2. Напишите запрос, который возвращает все товары, цена которых ниже средней цены.
select product_name from product where PRODUCT_PRICE < (select avg(product_price) from product);

--3. Напишите запрос, который возвращает все товары, которые продавались более одного раза.
select distinct product_name from purchase one where (select count(product_name) from purchase two where two.PRODUCT_NAME=one.product_name)>1;

--4. Выведите увеличенную на 15% цену товаров, которые продавались более одного раза.
select distinct product_price*1.15 from purchase join product one on purchase.PRODUCT_NAME = one.PRODUCT_NAME where (select count(product_name) from purchase two where two.PRODUCT_NAME=one.product_name)>1;

--5. Используя условие EXISTS, напишите запрос, который возвращает всех сотрудников, которые хотя бы один раз что-либо продали.
select first_name,last_name from PERSON one where EXISTS(select salesperson from purchase where salesperson = one.PERSON_CODE);

--6. Напишите запрос, который возвращает все товары из таблицы product, 
--цена которых меньше цены любого товара, проданного сотрудником с кодом 'GA'.
select product_name from product where product_price < (
select min(product_price) from product join purchase on product.PRODUCT_NAME=purchase.product_name where salesperson = 'GA');

--7. напишите запрос, который вернет все товары из таблицы product, 
--цена которых меньше цены хотя бы одного товара, проданного сотрудником с кодом 'GA'. 
--Убедитесь, что операторы SOME и ANY взаимозаменяемы.
select product_name from product where product_price < any (
select product_price from product join purchase on product.PRODUCT_NAME=purchase.product_name where salesperson = 'GA');