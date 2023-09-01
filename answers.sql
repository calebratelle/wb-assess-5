--Problem 1

SELECT email FROM customers;

--Problem 2

SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE fname = 'Elizabeth' AND lname = 'Crocker');

--Problem 3

SELECT SUM(num_cupcakes) FROM orders WHERE processed = 'f';

--Problem 4

SELECT cupcakes.name, SUM(orders.num_cupcakes) AS sum
FROM cupcakes
LEFT JOIN orders ON cupcakes.id = orders.cupcake_id
GROUP BY cupcakes.name
ORDER BY cupcakes.name;

--Problem 5

SELECT customers.email, SUM(orders.num_cupcakes) AS total
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.email
ORDER BY total DESC;

--Problem 6

SELECT fname, lname, email
FROM customers
WHERE id = (SELECT customer_id
            FROM orders
            WHERE cupcake_id = 5 AND processed = 't'
            GROUP BY customer_id);