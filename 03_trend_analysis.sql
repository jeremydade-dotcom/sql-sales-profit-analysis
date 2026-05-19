-- Business Question:
-- How do sales trends change over time?

SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Business Question:
-- How does profitability fluctuate month-to-month?

SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM orders
GROUP BY month
ORDER BY month;

-- Business Question:
-- What is the cumulative growth of sales over time?

SELECT
    order_date,
    SUM(sales) OVER (
        ORDER BY order_date
    ) AS running_total_sales
FROM orders;

-- Business Question:
-- What is the average monthly sales performance?

SELECT
    ROUND(AVG(monthly_sales), 2) AS avg_monthly_sales
FROM (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY month
);

-- Business Question:
-- Which month generated the highest sales revenue?

SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY month
ORDER BY total_sales DESC
LIMIT 1;
