-- 1. Find customers who live in Delhi and have more than 100 points.
SELECT * FROM customers
WHERE state = 'Delhi' AND points > 100;


-- 2. Display names and income between 50,000 and 100,000.
SELECT name, income FROM customers
WHERE income BETWEEN 50000 AND 100000;


-- 3. Find customers whose first name starts with 'A'.
SELECT * FROM customers
WHERE first_name LIKE 'A%';


-- 4. Find customers who live in Delhi OR have more than 100 points.
SELECT * FROM customers
WHERE state = 'Delhi' OR points > 100;


-- 5. Retrieve customers with the highest monthly income.
SELECT * FROM customers
WHERE monthly_income = (
    SELECT MAX(monthly_income) FROM customers
);


-- 6. Find customers with the second highest monthly income.
SELECT * FROM customers
WHERE monthly_income = (
    SELECT MAX(monthly_income)
    FROM customers
    WHERE monthly_income < (
        SELECT MAX(monthly_income) FROM customers
    )
);


-- 7. Find customers whose phone number is NULL or empty.
SELECT * FROM customers
WHERE phone IS NULL OR phone = '';


-- 8. Find customers whose sector is not missing.
SELECT * FROM customers
WHERE sector IS NOT NULL AND sector != '';


-- 9. Get unique states from the customer table.
SELECT DISTINCT state FROM customers;


-- 10. Count how many different cities customers come from.
SELECT COUNT(DISTINCT city) FROM customers;


-- 11. Find customers born before January 1, 1990.
SELECT * FROM customers
WHERE date_of_birth < '1990-01-01';


-- 12. Find customers born between 1985 and 2000.
SELECT * FROM customers
WHERE YEAR(date_of_birth) BETWEEN 1985 AND 2000;


-- 13. Find customers whose name is exactly 5 characters long.
SELECT name FROM customers
WHERE name LIKE '_____';


-- 14. Get top 5 customers with the highest points.
SELECT * FROM customers
ORDER BY points DESC
LIMIT 5;


-- 15. Find customers whose names contain only alphabets
-- and are at least 3 characters long.
SELECT * FROM customers
WHERE name REGEXP '^[A-Za-z]{3,}$';


-- 16. Find customers whose address includes the word 'Road'.
SELECT * FROM customers
WHERE address LIKE '%Road%';


-- 17. Find customers whose name ends with the letter 'n'.
SELECT * FROM customers
WHERE name LIKE '%n';


-- 18. Show all customers sorted by monthly income in descending order.
SELECT * FROM customers
ORDER BY monthly_income DESC;


-- 19. Display customers who do not live in Mumbai.
SELECT * FROM customers
WHERE city != 'Mumbai';


-- 20. Find customers with more than 100 points who live in Delhi, Pune, or Chennai.
SELECT * FROM customers
WHERE points > 100
AND city IN ('Delhi', 'Pune', 'Chennai');