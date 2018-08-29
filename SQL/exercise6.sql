--1. »спользую функции дл€ работы с датами и числами, посчитайте, сколько вам полных лет.
    select MONTHS_BETWEEN
           (sysdate,TO_DATE('07-20-1995','MM-DD-YYYY'))/12 
            from dual;

--2. ¬ыведите строку '€ «наё т≈к—товы≈ ф”нкци»' в верхнем и нижнем регистре.
Select upper('€ «наё т≈к—товы≈ ф”нкци»') from dual;
select lower('€ «наё т≈к—товы≈ ф”нкци»') from dual;

--3. ”знайте длину этой строки.
select length ('€ «наё т≈к—товы≈ ф”нкци»') from dual;

--4. –абота€ со столбцом purchase.product_name, выведите:
--первые три символа
select substr(product_name,1,3) from purchase;

--все оставшиес€ символы, начина€ с четвЄртого
select substr(product_name,4,length(product_name)) from purchase;

--полную строку
select product_name from purchase;

select substr(product_name,1,3),substr(product_name,4,length(product_name)),product_name from purchase;