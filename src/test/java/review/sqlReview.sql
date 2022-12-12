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







