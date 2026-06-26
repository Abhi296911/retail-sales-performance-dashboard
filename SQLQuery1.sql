create database retailanalytics
use retailanalytics
select top 10*
select *from orderss
select count(*) as totalrows
from orderss

SELECT
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit,
    COUNT(DISTINCT order_id) AS TotalOrders,
    COUNT(DISTINCT customer_name) AS TotalCustomers
FROM orderss;

SELECT COUNT(*) AS TotalRows
FROM orderss;

SELECT
    region,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit
FROM orderss
GROUP BY region
ORDER BY Revenue DESC;
SELECT TOP 10
    customer_name,
    COUNT(DISTINCT order_id) AS TotalOrders,
    ROUND(SUM(sales),2) AS LifetimeRevenue,
    ROUND(SUM(profit),2) AS LifetimeProfit
FROM orderss
GROUP BY customer_name
ORDER BY LifetimeRevenue DESC;

SELECT TOP 10
    product_name,
    ROUND(SUM(sales),2) AS Revenue,
    ROUND(SUM(profit),2) AS Profit
FROM orderss
GROUP BY product_name
ORDER BY Revenue DESC;

05_Advanced_SQL.sql