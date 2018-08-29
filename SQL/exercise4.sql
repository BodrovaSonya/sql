--1. �������� ������, ������������, ����� ����� ���� �������� product_price ����� ���������� �� 15%. 
select product_price*1.15 from product;

-- 2. �������� ������, ������������, ������� ����� ������� ������� � ������� product. 
select count(product_name) from PRODUCT;

-- 3.�������� ������, ������������, ��� ������ ���������� ������� (������� product) �� ������� ����. 
select count(product_name) from product where PRODUCT_PRICE is null;

-- 4. �������� ������, ��������� ����������� � ������������ ���� ������� product_price. 
select min(product_price), max(product_price) from PRODUCT;

-- 5. �������� ������, ������������, ����� ����� ���� �������� � ������ ������� ������� ������������. 
select product.PRODUCT_NAME,sum(quantity*product_price) from PURCHASE join product on PURCHASE.PRODUCT_NAME = product.PRODUCT_NAME group by product.PRODUCT_NAME;

--6. �������� ������, ������������, ����� ����� ���� �������� � ������ ������� ������� ������������. 
--������� ������ �� ������, ��� ������� ����� ������ ������ 125.
select sum_product from (select product.PRODUCT_NAME,sum(quantity*product_price)as sum_product from PURCHASE join product on purchase.PRODUCT_NAME = product.PRODUCT_NAME group by product.PRODUCT_NAME) two where sum_product > 125;

