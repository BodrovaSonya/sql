--1. ��������� ������� ��� ������ � ������ � �������, ����������, ������� ��� ������ ���.
    select MONTHS_BETWEEN
           (sysdate,TO_DATE('07-20-1995','MM-DD-YYYY'))/12 
            from dual;

--2. �������� ������ '� ���� ��������� �������' � ������� � ������ ��������.
Select upper('� ���� ��������� �������') from dual;
select lower('� ���� ��������� �������') from dual;

--3. ������� ����� ���� ������.
select length ('� ���� ��������� �������') from dual;

--4. ������� �� �������� purchase.product_name, ��������:
--������ ��� �������
select substr(product_name,1,3) from purchase;

--��� ���������� �������, ������� � ���������
select substr(product_name,4,length(product_name)) from purchase;

--������ ������
select product_name from purchase;

select substr(product_name,1,3),substr(product_name,4,length(product_name)),product_name from purchase;