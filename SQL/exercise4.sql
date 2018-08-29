--1. Напишите запрос, показывающий, какой будет цена продукта product_price после увеличения на 15%. 
select product_price*1.15 from product;

-- 2. Напишите запрос, показывающий, сколько всего имеется товаров в таблице product. 
select count(product_name) from PRODUCT;

-- 3.Напишите запрос, показывающий, для какого количества товаров (таблица product) не указана цена. 
select count(product_name) from product where PRODUCT_PRICE is null;

-- 4. Напишите запрос, выводящий минимальную и максимальную цену товаров product_price. 
select min(product_price), max(product_price) from PRODUCT;

-- 5. Напишите запрос, показывающий, какая сумма была выручена с продаж товаров каждого наименования. 
select product.PRODUCT_NAME,sum(quantity*product_price) from PURCHASE join product on PURCHASE.PRODUCT_NAME = product.PRODUCT_NAME group by product.PRODUCT_NAME;

--6. Напишите запрос, показывающий, какая сумма была выручена с продаж товаров каждого наименования. 
--Вывести только те записи, для которых сумма продаж больше 125.
select sum_product from (select product.PRODUCT_NAME,sum(quantity*product_price)as sum_product from PURCHASE join product on purchase.PRODUCT_NAME = product.PRODUCT_NAME group by product.PRODUCT_NAME) two where sum_product > 125;

