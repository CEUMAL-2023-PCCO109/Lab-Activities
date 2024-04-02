use classicmodels;

-- 1. Get office address of Employee Barry Jones.
SELECT 
    employees.firstName,
    employees.lastName,
    offices.city,
    offices.country
FROM
    employees
        JOIN
    offices ON employees.officeCode = offices.officeCode
WHERE
    employees.firstName = 'Barry'
        AND employees.lastName = 'Jones';

-- 2. Get customers of Employee Barry Jones.
SELECT 
    customers.customerName
FROM
    customers
        JOIN
    employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE
    employees.firstName = 'Barry'
        AND employees.lastName = 'Jones';

-- 3. How many orders does customer Mini Wheels Co. has?
SELECT 
    COUNT(1) AS 'orderCount'
FROM
    orders
        JOIN
    customers ON orders.customerNumber = customers.customerNumber
WHERE
    customers.customerName = 'Mini Wheels Co.';

-- 4. Get products that has never been purchased.
SELECT 
    products.productCode, products.productName
FROM
    products
        LEFT JOIN
    orderdetails ON products.productCode = orderdetails.productCode
WHERE
    orderdetails.productCode IS NULL;

-- 5. Get customers with >= 10 orders.
SELECT 
    customers.customerName, COUNT(1) AS 'orderCount'
FROM
    customers
        JOIN
    orders ON customers.customerNumber = orders.customerNumber
GROUP BY customers.customerNumber
HAVING COUNT(1) >= 10;