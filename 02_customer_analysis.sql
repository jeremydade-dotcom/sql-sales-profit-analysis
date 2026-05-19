-- Business Question:
-- Which customers generate the most revenue?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_revenue
FROM orders
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Business Question:
-- Which customers place the most orders?

SELECT
    customer_name,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_name
ORDER BY total_orders DESC;

-- Business Question:
-- What is the average revenue generated per customer?

SELECT
    ROUND(AVG(customer_sales), 2) AS avg_customer_revenue
FROM (
    SELECT
        customer_name,
        SUM(sales) AS customer_sales
    FROM orders
    GROUP BY customer_name
);

-- Business Question:
-- How do customers rank by total revenue contribution?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS revenue_rank
FROM orders
GROUP BY customer_name;

-- Business Question:
-- Which customers qualify as high-value customers?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY customer_name
HAVING SUM(sales) > 10000
ORDER BY total_sales DESC;
