create database hr_attrition;

use hr_attrition;
select 1;

SELECT COUNT(*)
FROM wa_fn_usec_hr_employee_attrition;

show tables;

SELECT *
FROM `wa_fn-usec_-hr-employee-attrition`
LIMIT 5;

DESCRIBE `wa_fn-usec_-hr-employee-attrition`;

SELECT COUNT(*) 
FROM `wa_fn-usec_-hr-employee-attrition`;

RENAME TABLE `wa_fn-usec_-hr-employee-attrition` TO employee_attrition;


SELECT
COUNT(*) AS employees,
COUNT(DISTINCT EmployeeNumber) AS unique_employees
FROM employee_attrition;

desc employee_attrition;


#easy 

select count(*) as employee_count from employee_attrition;

select attrition,count(*) as employee_count 
from employee_attrition
group by attrition;


select round( 100* sum(case when attrition="yes" then 1 else 0 end) / count(*),2) 
as attrition_rate 
from employee_attrition;

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY Department
ORDER BY attrition_rate DESC;

select 
Gender,
count(*) as employee_count,
sum( case when attrition='yes' then 1 else 0 end)as employee_left,
round(100 * sum(case when attrition='yes' then 1 else 0 end) /count(*),2) as attrition_rate			
from employee_attrition
group by Gender;


SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100 * sum (CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY Gender;

select gender,
count(*) as emp_count
from employee_attrition 
group by gender;

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY OverTime
ORDER BY attrition_rate DESC;

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY JobRole
ORDER BY attrition_rate DESC;


SELECT
CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 39 THEN '30-39'
    WHEN Age BETWEEN 40 AND 49 THEN '40-49'
    ELSE '50+'
END AS age_group,

COUNT(*) AS total_employees,

SUM(CASE
    WHEN Attrition='Yes'
    THEN 1
    ELSE 0
END) AS employees_left,

ROUND(
100.0 *
SUM(CASE
    WHEN Attrition='Yes'
    THEN 1
    ELSE 0
END)
/ COUNT(*),2
) AS attrition_rate

FROM employee_attrition

GROUP BY age_group

ORDER BY attrition_rate DESC;

DESC employee_attrition;

ALTER TABLE employee_attrition
RENAME COLUMN ï»¿Age TO Age;


SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


SELECT
CASE
    WHEN YearsAtCompany < 3 THEN '0-2 Years'
    WHEN YearsAtCompany < 6 THEN '3-5 Years'
    WHEN YearsAtCompany < 11 THEN '6-10 Years'
    ELSE '10+ Years'
END AS tenure_group,

COUNT(*) AS total_employees,

SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,

ROUND(
100.0 *
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS attrition_rate

FROM employee_attrition

GROUP BY tenure_group

ORDER BY attrition_rate DESC;


SELECT
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Income'
    WHEN MonthlyIncome < 10000 THEN 'Medium Income'
    ELSE 'High Income'
END AS income_group,

COUNT(*) AS total_employees,

SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,

ROUND(
100.0 *
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS attrition_rate

FROM employee_attrition

GROUP BY income_group

ORDER BY attrition_rate DESC;