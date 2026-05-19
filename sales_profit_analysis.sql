-- Business Question:
-- What is the company’s overall sales and profit performance?

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders;

-- Business Question:
-- Which product categories generate the most profit?

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;

-- Business Question:
-- Which regions generate the highest sales revenue?

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Business Question:
-- Which products contribute the most overall profit?

SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Business Question:
-- Which categories have the strongest profit margins?

SELECT
    category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY category
ORDER BY profit_margin_pct DESC;
