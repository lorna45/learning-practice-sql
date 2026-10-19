--BASIC OF SQL
--PARK AND REACTION

SELECT*
from  employee_demographics;

-- selecting columns 
SELECT
    first_name,
    age
from  employee_demographics;

-- doing calculation with select 
   
   
   SELECT
    first_name,
    age,
    age + 10 AS New_Age
from  employee_demographics;

# CALCULATIONS WE USED PEMDAS THATS HOW THERE EXECUTED

 SELECT
    first_name,
    age,
    (age + 10)*20 AS New_Age
from  employee_demographics;

# DISTINCT

 SELECT
    distinct age
    
from  employee_demographics

--	SHIT HAVE COME BACK HERE THOUGHT I SAVED THE PREVIOUS WORK BUT I DIDNT
-- HAD WHERE,LIKE AND  OR GROUP BY ORDER BY COMPARISON ALSO BETWEEN WERE THE LAST USED WHICH DIDNT SAVE

--LETTS CONTINUE INNER JOIN AND OUTER JOIN SOUTH JOIN
SELECT*
from  employee_demographics
--
SELECT*
from  employee_salary
--
SELECT*
from  employee_demographics
inner join employee_salary
ON employee_demographics.employee_id = employee_salary.employee_id
;

SELECT dem.employee_id, age, occupation
from  employee_demographics AS dem
inner join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;
-- OUTER JOIN
SELECT *
from  employee_demographics AS dem
LEFT join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;

SELECT *
from  employee_demographics AS dem
RIGHT join employee_salary AS sal
ON dem.employee_id = sal.employee_id
;
--SELF JOIN

SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
    ON emp1.employee_id + 1 = emp2.employee_id;
    
--MULTIPLE TABLES

SELECT *
from  employee_demographics AS dem
inner join employee_salary AS sal
ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
on sal.dept_id = pd.department_id
;

--STRING FUNCTIONS
select length ('kelvin')
--
select first_name, Length (first_name)
from  employee_demographics
;

-- upper
select upper('kai')
;
--
select lower('KAI')
;
--
select first_name, UPPER(first_name)
from  employee_demographics
;
--TRIM

select trim('     sky   ')
from  employee_demographics
;

select ltrim('     sky   ')
from  employee_demographics
;

select birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
from  employee_demographics
;

--REPLACE
select last_name, REPLACE (last_name, 'a' ,'z')
from  employee_demographics
;

--locate
select locate( 's','james')
;
--concate
select first_name, last_name,
concat(first_name, last_name)
from  employee_demographics
;
--
select first_name, last_name,
concat(first_name ,  '  '    , last_name) AS full_names
from  employee_demographics
;

--CASE STATEMENT
select first_name, last_name,age,
CASE	
	WHEN age < 30 then 'young'
      end
from  employee_demographics
;

--
select first_name, last_name,age,
CASE	
	WHEN age between 30 and 100 then 'Older'
      end AS age_bracket
from  employee_demographics
;

--pay increase and bonus
select*
from employee_salary

--finance dept 10% increase
--<50000 5% increase
-->50000 7%

select first_name, last_name, salary,
case
  when salary < 50000 then salary + (salary * 0.05)
  when salary > 50000 then salary + (salary * 0.07)
  
	end as new_salary,
		case
			when dept_id = 6 then salary + (salary * 10)
				end as bonus
from employee_salary
;
--SUB QEURIES

select*
from  employee_demographics
 where employee_id In
	(select employee_id
		from employee_salary
         where dept_id = 1
	)
;

--window function

select gender, avg(salary) as avg_salary
 from employee_demographics dem
  join employee_salary sal
	on dem.employee_id = sal.employee_id
        group by gender
        ;

select gender, avg(salary)  over()
 from employee_demographics dem
  join employee_salary sal
	on dem.employee_id = sal.employee_id
        ;

select gender, avg(salary)  over(partition by gender)
 from employee_demographics dem
  join employee_salary sal
	on dem.employee_id = sal.employee_id
;

--CTE
With cte_example as 
 ( select gender, avg(salary) as avg_sal, min(salary) as min_sal,sum(salary) as ttl_sal, count(salary) as csal
 from employee_demographics dem
  join employee_salary sal
	on dem.employee_id = sal.employee_id
		group by gender
)
  select avg (avg_sal)
  from cte_example
  ;
		
---TEMPORARY TABLE

Create temporary table 
temp_table
(first_name varchar (100),
last_name varchar (100),
favourite_name varchar (500)

)
;

select*
from temp_table

--INSERT
insert into temp_table
values('kai','mwarabu','shawshank_redemption')
;

select*
from temp_table;

--PROCEDURE
create procedure large_salaries()
select*
from employee_salary
where salary >= 50000
;

call large_salaries();

--EVENTS

DELIMITER $$
 create event delete_retirees
	on schedule EVERY 30 second
		do
			begin
				DELETE
				from employee_demographics
                where age >= 60 ;
end $$
DELIMITER ;
                

SELECT*
from employee_demographics;
















































