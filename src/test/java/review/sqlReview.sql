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

create view realEmail1 as select FIRST_NAME||'.'||LAST_NAME||'@gmail.com' as realEmail from EMPLOYEES;

create view realEmail as select FIRST_NAME||'.'||LAST_NAME||'@gmail.com' as realEmail from EMPLOYEES;

--join
-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

-- return job_id and manager_in in the same table
select JOB_ID, DEPARTMENTS.MANAGER_ID from EMPLOYEES
inner join DEPARTMENTS
on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- who works in which department
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from EMPLOYEES
left join DEPARTMENTS
on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from EMPLOYEES
                                                       left join DEPARTMENTS
                                                                 on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
where DEPARTMENT_NAME='Shipping';

-- find out the employees who left the company
select END_DATE from JOB_HISTORY;
select FIRST_NAME from EMPLOYEES;

select FIRST_NAME, END_DATE from EMPLOYEES
right join JOB_HISTORY
on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

select FIRST_NAME, END_DATE from EMPLOYEES
                                     left join JOB_HISTORY
                                                on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;


-- department name and city together
select DEPARTMENT_NAME, CITY from DEPARTMENTS
full join LOCATIONS
on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

-- we can put shortcut for those table name
select DEPARTMENT_NAME, CITY from DEPARTMENTS d
                                      full join LOCATIONS l
                                                on d.LOCATION_ID = l.LOCATION_ID;


select DEPARTMENT_NAME, CITY from DEPARTMENTS d
                                      full join LOCATIONS l
                                                on d.LOCATION_ID = l.LOCATION_ID
where CITY='Seattle';

-- self join,  joining the table with itself
-- all employees firstname, lastname and their managers first and lastname(we can use order by)
select e1.EMPLOYEE_ID, e1.FIRST_NAME, e1.LAST_NAME, e1.MANAGER_ID, e2.EMPLOYEE_ID from EMPLOYEES e1
join EMPLOYEES e2
on e1.MANAGER_ID=e2.EMPLOYEE_ID;



-- DDL & DML  (DDL is for data structure, DML is for data itself)
-- create
create table Teachers(
                         T_id integer primary key ,
                         T_name char(40),
                         T_branch char(40)
);

select * from Teachers;

create table Students(
                         S_id integer primary key ,
                         S_name char(40),
                         S_branch char(40)

);

-- insert value
insert into TEACHERS values (1,'Jamal','Automation');
insert into TEACHERS values (2,'Muhtar','Java');
insert into TEACHERS values (3,'Oscar','API');

insert into STUDENTS values (1,'Ahmet','Java');
insert into STUDENTS values (2,'Jenifer','API');
insert into STUDENTS values (3,'Suarez','Automation');

select * from Teachers;
select * from Students;

--update
update Students
set S_BRANCH = 'Database'
where S_ID = 1;

-- delete one row
delete Students
where S_ID = 2;

--alter functions
alter table Teachers
add Salary integer;

-- change column name
alter table Teachers rename column T_name to name;

--change table name
alter table Students rename to allStudents;

-- delete all the data, but keep the table
-- truncate
truncate table Students;


-- delete whole table
drop table TEACHERS;

-- set operators
-- union   delete repeated values, order them by alpahbetic order
select FIRST_NAME from EMPLOYEES
union
select LAST_NAME from EMPLOYEES;


-- union all    doesn't delete repeated values, doesn't order
select FIRST_NAME from EMPLOYEES
union all
select LAST_NAME from EMPLOYEES;

-- minus   common value for tow qury will be deleted
select SALARY from EMPLOYEES
minus
select COMMISSION_PCT from EMPLOYEES;

--intersect
select EMPLOYEE_ID from EMPLOYEES
intersect
select MANAGER_ID from EMPLOYEES;

--UNION -> combines, removes duplicates, sorts
--UNION ALL-> combines, does not remove duplicates, does not sort
--MINUS -> show records from query1 that are not present in query2
--INTERSECT -> show common records from




