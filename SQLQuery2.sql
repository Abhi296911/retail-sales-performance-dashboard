SELECT
    region,
    SUM(sales) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS RevenueRank
FROM orderss
GROUP BY region;

WITH CustomerRevenue AS
(
    SELECT
        region,
        customer_name,
        SUM(sales) AS Revenue,
        ROW_NUMBER() OVER(
            PARTITION BY region
            ORDER BY SUM(sales) DESC
        ) AS rn
    FROM orderss
    GROUP BY region, customer_name
)
SELECT *
FROM CustomerRevenue
WHERE rn = 1;

CREATE VIEW vw_customer_clv AS
SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(sales) AS LifetimeRevenue,
    SUM(profit) AS LifetimeProfit
FROM orderss
GROUP BY customer_name;

SELECT TOP 10 *
FROM vw_customer_clv
ORDER BY LifetimeRevenue DESC;