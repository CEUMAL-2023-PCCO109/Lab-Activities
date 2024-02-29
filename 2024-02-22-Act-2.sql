use employees;

-- 1. Get all departments that has letter R in dept_name, sort records alphabetically using dept_name
SELECT 
    *
FROM
    departments
WHERE
    dept_name LIKE '%r%'
ORDER BY dept_name;

-- 2. Get all titles of emp_no 12626, sort records from oldest to latest using from_date
SELECT 
    *
FROM
    titles
WHERE
    emp_no = '12626'
ORDER BY from_date;

-- 3. Get all salaries of emp_no 10006 that is greater that 7000, sort records from highest to lowest using salary
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = '10006' AND salary > 7000
ORDER BY salary DESC;

-- 4. Get all employees of dept_no d008 that starts with emp_no 1, started within year 1999, and still in that department
SELECT 
    *
FROM
    dept_emp
WHERE
    dept_no = 'd008'
        AND (from_date BETWEEN '1999-01-01' AND '1999-12-31')
        AND to_date = '9999-01-01'
        AND emp_no LIKE '1%';

-- 5. Get all managers of dept_no d004 that manages the department in year 1992
SELECT 
    *
FROM
    dept_manager
WHERE
    dept_no = 'd004'
        AND (from_date BETWEEN '1992-01-01' AND '1992-12-31'
        OR to_date BETWEEN '1992-01-01' AND '1992-12-31');