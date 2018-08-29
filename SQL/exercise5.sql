--1. �������� ������, ������� ���������� ���� �����������, ������� ����� �� ������ � �� �� ����, ��� � ���������� John Smith.
select first_name, last_name, person_code from person where hiredate = (select hiredate from person where first_name = 'John' and last_name = 'Smith');

--2. �������� ������, ������� ���������� ��� ������, ���� ������� ���� ������� ����.
select product_name from product where PRODUCT_PRICE < (select avg(product_price) from product);

--3. �������� ������, ������� ���������� ��� ������, ������� ����������� ����� ������ ����.
select distinct product_name from purchase one where (select count(product_name) from purchase two where two.PRODUCT_NAME=one.product_name)>1;

--4. �������� ����������� �� 15% ���� �������, ������� ����������� ����� ������ ����.
select distinct product_price*1.15 from purchase join product one on purchase.PRODUCT_NAME = one.PRODUCT_NAME where (select count(product_name) from purchase two where two.PRODUCT_NAME=one.product_name)>1;

--5. ��������� ������� EXISTS, �������� ������, ������� ���������� ���� �����������, ������� ���� �� ���� ��� ���-���� �������.
select first_name,last_name from PERSON one where EXISTS(select salesperson from purchase where salesperson = one.PERSON_CODE);

--6. �������� ������, ������� ���������� ��� ������ �� ������� product, 
--���� ������� ������ ���� ������ ������, ���������� ����������� � ����� 'GA'.
select product_name from product where product_price < (
select min(product_price) from product join purchase on product.PRODUCT_NAME=purchase.product_name where salesperson = 'GA');

--7. �������� ������, ������� ������ ��� ������ �� ������� product, 
--���� ������� ������ ���� ���� �� ������ ������, ���������� ����������� � ����� 'GA'. 
--���������, ��� ��������� SOME � ANY ���������������.
select product_name from product where product_price < any (
select product_price from product join purchase on product.PRODUCT_NAME=purchase.product_name where salesperson = 'GA');