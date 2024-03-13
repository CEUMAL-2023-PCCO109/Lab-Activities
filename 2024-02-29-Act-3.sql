use employees;

-- 1. Get Min / Max salary of employees
SELECT emp_no, MIN(salary) AS lowestSalary, MAX(salary) AS highestSalary FROM salaries
GROUP BY emp_no;

-- 2. Get count of employees with birthdate today
SELECT DATE_FORMAT(NOW(), '%M %d') AS today, COUNT(emp_no) AS countBirthdayToday 
FROM employees WHERE DATE_FORMAT(birth_date, '%m-%d') = DATE_FORMAT(NOW(), '%m-%d');

-- 3. Build build output "Salutation FirstName LastName" (Salutation M = Mr. F = Ms.)
SELECT gender, CASE Gender WHEN 'M' THEN CONCAT('MR. ', first_name, ' ', last_name) ELSE CONCAT('MS. ', first_name, ' ', last_name) END AS result FROM employees;

-- 4. Get how long in DAYS does the manager manages the department
SELECT *, DATEDIFF(IF(to_date = '9999-01-01', DATE(NOW()), to_date), from_date) AS daysIntoDepartment FROM dept_manager;

-- 5. Get age of employees
SELECT first_name, last_name, birth_date, TIMESTAMPDIFF(YEAR, birth_date, NOW()) AS age FROM employees;
