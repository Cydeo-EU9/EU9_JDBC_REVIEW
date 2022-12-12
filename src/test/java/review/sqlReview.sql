-- select
select * from EMPLOYEES;  -- ctrl + enter in windows    command + enter in mac

select FIRST_NAME from EMPLOYEES;

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES;

-- distinct   ruturning unique data
select distinct FIRST_NAME from EMPLOYEES;

-- where   condition to eliminate result
select FIRST_NAME from EMPLOYEES
where FIRST_NAME = 'David';

select FIRST_NAME from EMPLOYEES
where FIRST_NAME != 'David';

select FIRST_NAME from EMPLOYEES
where FIRST_NAME <> 'David';

select SALARY from EMPLOYEES
where SALARY >= 10000;

select SALARY from EMPLOYEES
where  SALARY > 5000 and SALARY < 9000;

select SALARY from EMPLOYEES
where  SALARY > 5000 and SALARY < 4000;

select SALARY from EMPLOYEES
where  SALARY = 10000 or SALARY = 9000;

select SALARY from EMPLOYEES
where  SALARY = 10000 or SALARY = 9000 or SALARY = 5000 or SALARY = 6000;

-- between is including edge values
select  SALARY from EMPLOYEES
where  SALARY between 5000 and 9000;

-- in operator  return values in a list
select SALARY from EMPLOYEES
where  SALARY in (10000, 9000, 6000, 5000, 7000, 8000);

select  FIRST_NAME from EMPLOYEES
where  FIRST_NAME in ('David', 'Steven');

select  FIRST_NAME from EMPLOYEES
where  FIRST_NAME not in ('David', 'Steven', 'Ellen');

-- order
-- we can order our result/data by ascending or descending order
select  SALARY from EMPLOYEES
order by SALARY; -- order default by ascending

select SALARY from EMPLOYEES
order by SALARY desc;

select FIRST_NAME from EMPLOYEES
order by FIRST_NAME;

select FIRST_NAME from EMPLOYEES
order by FIRST_NAME desc ;

select  FIRST_NAME , LAST_NAME from EMPLOYEES
order by FIRST_NAME desc , LAST_NAME asc ;

-- count  returning count of data
select  count(*) from EMPLOYEES;

-- count is only counting the data that has value, it's not counting null values.
select count(COMMISSION_PCT) from  EMPLOYEES;
select COMMISSION_PCT from EMPLOYEES;

-- like
-- % represents the missing part
select  FIRST_NAME from EMPLOYEES
where FIRST_NAME like 'M%';

select LAST_NAME from EMPLOYEES
where  LAST_NAME like '%et';

select JOB_ID from EMPLOYEES
where JOB_ID like '%';

select FIRST_NAME from EMPLOYEES
    where FIRST_NAME like '%v%';

-- underscore _ represents a single character
select  FIRST_NAME from EMPLOYEES
where FIRST_NAME like  '_____';

select FIRST_NAME, LAST_NAME from EMPLOYEES
where FIRST_NAME like 'D%_____';

select FIRST_NAME from  EMPLOYEES
where FIRST_NAME like 'D___%';

select COMMISSION_PCT from EMPLOYEES
where COMMISSION_PCT like '%';


-- aggregate functions
-- max
select  max(SALARY) from EMPLOYEES;

-- min
select  min(COMMISSION_PCT) from EMPLOYEES;

-- avg  returning average of that values
select avg(SALARY) from EMPLOYEES;

-- round  helps to round the decimal numbers to readable ones
select round(avg(SALARY)) from  EMPLOYEES;

-- round is changing decimal numbers to whole numbers in default
-- if we want to see decimal numbers, we have to provide how many numbers we want to see after decimal point

select round(avg(SALARY), 2) from EMPLOYEES;

-- sum   return sum of the numbers
select sum(COMMISSION_PCT) from EMPLOYEES;

select round(sum(COMMISSION_PCT)) from EMPLOYEES;

-- round function, if the number after decimal point is bigger or equal to 5, it will round to the whole number
-- if the number after decimal point is smaller than 5, it will not round to the whole number

-- group by    put same data into one group
select JOB_ID from EMPLOYEES;
select JOB_ID from  EMPLOYEES
group by JOB_ID;

select DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID;

select DEPARTMENT_ID , count(DEPARTMENT_ID) from EMPLOYEES
group by DEPARTMENT_ID;

select MANAGER_ID, avg(SALARY) from EMPLOYEES
group by MANAGER_ID;

-- having    after data is put to some groups, then filter the data by putting some condition
select MANAGER_ID, avg(SALARY) from EMPLOYEES
group by MANAGER_ID
having avg(SALARY) > 5000;

select JOB_ID, sum(SALARY) from EMPLOYEES
group by JOB_ID
having sum(SALARY) < 7000;

-- difference between having and where
-- where is put condition before group, applies to individual rows
-- having is put condition after group, applies to grouped rows


-- row number  return us the result with that row number
select FIRST_NAME from EMPLOYEES
where ROWNUM <= 10;


-- sub query
-- like nested if or nested for loop, it's query inside another query.
select round(avg(SALARY)) from EMPLOYEES;

select FIRST_NAME, SALARY from EMPLOYEES
where SALARY < (select round(avg(SALARY)) from EMPLOYEES);

select FIRST_NAME, SALARY from EMPLOYEES
order by SALARY desc ;

select max(SALARY) from EMPLOYEES;

select max(SALARY) from EMPLOYEES
where SALARY != (select max(SALARY) from EMPLOYEES);

select SALARY from (select distinct SALARY from EMPLOYEES
order by SALARY desc)
where ROWNUM < 15;

select SALARY from EMPLOYEES
order by SALARY desc ;

-- string functions
-- concatenation   first value || second value  ( it's like  string1 + string2 in java)
select email from EMPLOYEES;
select FIRST_NAME||LAST_NAME||'@gmail.com' as fullEmail from EMPLOYEES;

select EMPLOYEE_ID||FIRST_NAME as newId from EMPLOYEES;

-- upper
select upper(FIRST_NAME) from  EMPLOYEES;

-- lower
select lower(LAST_NAME) from EMPLOYEES;

-- length   return us the size of that string
select FIRST_NAME, length(FIRST_NAME) from EMPLOYEES;

-- intcap  converting the first character of the data to upper case or capitalizing it
select * from EMPLOYEES;
select initcap(EMAIl) from EMPLOYEES;

-- substring   index starts from 1
select FIRST_NAME, substr(FIRST_NAME,1,3) from  EMPLOYEES
order by FIRST_NAME asc ;
select LAST_NAME, substr(LAST_NAME,2,2) from  EMPLOYEES;

select substr(FIRST_NAME,1,1)|| substr(LAST_NAME,1,1) as newName from EMPLOYEES;

--view  create a virtual table
create view newEmail1 as select EMAIL as email from EMPLOYEES;













