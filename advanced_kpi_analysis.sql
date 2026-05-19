-- Business Question:
-- How do product categories rank by total profit?

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(profit) DESC
    ) AS profit_rank
FROM orders
GROUP BY category;

-- Business Question:
-- Which regions generate the strongest average profit performance?

SELECT
    region,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY region
ORDER BY avg_profit DESC;

-- Business Question:
-- Which customers qualify as high-value customers based on sales performance?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY customer_name
HAVING SUM(sales) > 10000
ORDER BY total_sales DESC;

-- Business Question:
-- What percentage of total profit does each category contribute?

SELECT
    category,
    ROUND(SUM(profit), 2) AS category_profit,
    ROUND(
        SUM(profit) * 100.0 /
        (SELECT SUM(profit) FROM orders),
        2
    ) AS profit_contribution_pct
FROM orders
GROUP BY category
ORDER BY profit_contribution_pct DESC;

-- Business Question:
-- How can customers be segmented into sales performance tiers?

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    CASE
        WHEN SUM(sales) >= 20000 THEN 'High Value'
        WHEN SUM(sales) >= 10000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS customer_tier
FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC;

-- Business Question:
-- Which categories perform best across both sales and profit metrics?

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC, total_sales DESC;
