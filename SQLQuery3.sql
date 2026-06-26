ALTER VIEW vw_customer_clv AS
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS TotalOrders,
    ROUND(SUM(sales),2) AS LifetimeRevenue,
    ROUND(SUM(profit),2) AS LifetimeProfit
FROM orderss
GROUP BY customer_name;

SELECT TOP 10 *
FROM vw_customer_clv
ORDER BY LifetimeRevenue DESC;