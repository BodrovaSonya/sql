--1. �������� ������, ��������� ��������� ������������ ������ product � purchase.
select * from product, purchase;

--2. �������� ������, ��������� ������������ ���������� ������ product_name, 
--���������� quantity (������� purchase) � quantity_on_hand (������� product).
select purchase.product_name, purchase.quantity, product.quantity_on_hand from purchase join product on purchase.PRODUCT_NAME = product.PRODUCT_NAME;

--3.�������� ������, ��������� ������������ ������ product_name ������� purchase), 
--���� ��������� �������� laststockdate (������� product) � ������� �������� last_name (������� person).
select purchase.product_name, product.laststockdate, person.last_name from product join PURCHASE on PURCHASE.PRODUCT_NAME = product.PRODUCT_NAME join PERSON on purchase.salesperson = person.person_code;

--4. �������� ������, ��������� ������� product_name, first_name, 
--last_name �������� ����������� ������ purchase � person. ����������� ��� ������ �������� ����������.
select product_name,first_name,last_name from PURCHASE full join PERSON on PURCHASE.salesperson = PERSON.PERSON_CODE;

--5. �������� ������, ������� ������� ��� ��������������� � purchase ���� ��������� salesperson �� ������� purchase_archive.
select DISTINCT salesperson from PURCHASE_ARCHIVE where salesperson not in (select SALESPERSON from PURCHASE);

--6. �������� ������, ������� ������� ���� ������ ��� ��������� salesperson �� ������� purchase, ������� ��� �� ����������� � ������� purchase_archive.
select purchase.salesperson from purchase inner join PURCHASE_ARCHIVE on purchase.salesperson = PURCHASE_ARCHIVE.SALESPERSON;

--7. �������� ������, ������� ������� ��� (� ��� ����� �������������) ���� 
--��������� salesperson �� ������ purchase � purchase_archive.
(select salesperson from purchase) union (select SALESPERSON from PURCHASE_ARCHIVE);