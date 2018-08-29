create table person (person_code varchar(3) primary key,
first_name varchar(15),
last_name varchar (20),
hiredate date);

create table product (product_name varchar(25) primary key,
product_price number (8,2),
quantity_on_hand number (5,0),
laststockdate date);

create table purchase (product_name varchar(25),
salesperson varchar (3),
purchase_date date,
quantity number (4,2),
constraint fk_product_name
FOREIGN key (product_name)
references product (product_name),
constraint fk_salesperson
FOREIGN key (salesperson)
references person (person_code));
commit;

create table purchase_archive (product_name varchar(25),
salesperson varchar(3),
purchase_date date,
quantity number (4,2));

create table old_item (item_id char (20),
item_desc char (25));

insert into person (PERSON_CODE, first_name, last_name, hiredate)
values
('BB', 'Bobby', 'Barkenhagen', '28.02.2010');
insert into person (PERSON_CODE, first_name, last_name, hiredate)
values('CA', 'Charlene', 'Atlas', '01.02.2010');
insert into person (PERSON_CODE, first_name, last_name, hiredate)
values('DS', 'Dany', 'Smith', '15.02.2002');
insert into person (PERSON_CODE, first_name, last_name, hiredate)
values('GA', 'Gary', 'Anderson', '15.02.2010');
insert into person (PERSON_CODE, first_name, last_name, hiredate)
values('JS', 'John', 'Smith', '15.02.2002');
insert into person (PERSON_CODE, first_name, last_name, hiredate)
values('LB', 'Laren', 'Baxter', '01.03.2010');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Chrome Phoobar', 50.00, 100, '15.01.2011');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Extra Huge Mega Phoobar +', 9.5, 1234, '15.01.2012');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Large Widget', NULL, 5, '11.01.2011');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Medium Widget', 75.00, 1000, '15.01.2010');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Round Chrome Snaphoo', 25.00, 10000, NULL);

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Small Widget', 99.00, 1, '15.01.2011');

insert into product (product_name,product_price,quantity_on_hand,laststockdate)
values
('Square Zinculator', 45.00, 1, '31.12.2010');

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Small Widget','CA','14.07.2011', 1.00);

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Medium Widget','BB','14.07.2011', 75.00);

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Chrome Phoobar','GA','14.07.2011', 2.00);

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Small Widget','GA','15.07.2011', 8.00);

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Medium Widget','LB','15.07.2011', 20.00);

insert into purchase (product_name,salesperson,purchase_date,quantity)
values
('Round Chrome Snaphoo','CA','16.07.2011', 5.00);
commit;

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Round Snaphoo', 'BB', '21.06.2001', 10.00);

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Large Harf linger', 'GA', '22.06.2001', 50.00);

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Medium Wodget', 'LB', '23.06.2001', 20.00);

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Small Widget', 'ZZ', '24.06.2002', 80.00);

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Chrome Phoobar', 'CA', '25.06.2002', 2.00);

insert into PURCHASE_ARCHIVE (product_name,salesperson, purchase_date, quantity)
values
('Small Widget', 'JT', '26.06.2002', 50.00);

commit;

--1. �������� ������, ��������� ������������ ������� purchase.
select * from purchase;

--2. �������� ������, ���������� ������� product_name � quantity �� ������� Purchase.
select product_name,quantity from PURCHASE;

--3. �������� ������, ���������� ��� ������� � �������� �������.
select quantity, product_name from PURCHASE;

--4. �������� ������, ��������� ��� ������ ������ ������� person ��������� �����:

--<first_name> <first_name> started work <hiredate>*. ����������� ������� ��������� ��������� "Started Work�.

select first_name ||' ' || last_name ||  ' started work ' ||  hiredate Started_Work from person;

--5. �������� ������,��������� ������������ ��������� product_name (������� product), ��� ������� ���� �� ���������� (NULL).
select product_name from product where PRODUCT_PRICE is null;

--6. �������� ������, ��������� ������������ ��������� product_name (������� purchase), ������� ������� �� 3 �� 23 ����.
select product_name from PURCHASE where QUANTITY>=3 and  QUANTITY<= 23;

--7. �������� ������, ��������� ������� �����������, ������� ������� �� ������ 1��, 15�� � 28�� ������� 2010 ����.
select last_name from PERSON where HIREDATE='01.02.2010' or HIREDATE='15.02.2010' or HIREDATE='28.02.2010';

--8. �������� ������, ��������� ������������ ��������� product_name (������� purchase), ��������� ������������, ������� ������� ���������� �� "B�.
select product_name from purchase join PERSON on purchase.SALESPERSON = PERSON.PERSON_CODE where PERSON.LAST_NAME like 'B%';

--9. �������� ������, ��������� ������������ ��������� product_name (������� purchase), ��������� ������������, ������� ������� �� ���������� �� "B�.
select product_name from purchase join PERSON on purchase.SALESPERSON = PERSON.PERSON_CODE where PERSON.LAST_NAME not like 'B%';

--10. �������� ������, ��������� ������� � ���� ������ �� ������ �����������, ������� ������� ���������� �� "B� � ������� ������� �� ������ ������ 1 ����� 2010 ����.
select last_name, hiredate from PERSON where LAST_NAME like 'B%' and hiredate < '01.03.2010';

--11. �������� ������, ��������� ������������ ��������� product_name � ���� ��������� �������� laststockdate (������� product), ������������ ������� Small Widget, Medium Widget � Large Widget ��� ��, ��� ������� �� ������� ���� ��������� ��������. ������������ �� �������� ���� ��������� ��������.
select product_name,laststockdate from product where product_name in ('Small Widget', 'Medium Widget', 'Large Widget') or LASTSTOCKDATE is null order by LASTSTOCKDATE desc;