-- Query 1: Revenue by Continent
-- Description:
-- For each continent:
-- 1. Calculate total revenue (revenue)
-- 2. Calculate revenue from the category 'Bookcases & shelving units' (revenue_from_bookcases)
-- 3. Compute the percentage of revenue from 'Bookcases & shelving units' relative to the total revenue per continent (revenue_from_bookcases_percent)

SELECT 
    sp.continent,
    SUM(p.price) AS revenue,
    SUM(CASE WHEN p.category = 'Bookcases & shelving units' THEN p.price END) AS revenue_from_bookcases,
    ROUND(
        SUM(CASE WHEN p.category = 'Bookcases & shelving units' THEN p.price END) / SUM(p.price) * 100,
        2
    ) AS revenue_from_bookcases_percent
FROM 
    `data-analytics-mate.DA.order` o
JOIN 
    `data-analytics-mate.DA.session_params` sp
    ON o.ga_session_id = sp.ga_session_id
JOIN 
    `data-analytics-mate.DA.product` p
    ON o.item_id = p.item_id
GROUP BY 
    sp.continent
ORDER BY 
    SUM(p.price) DESC;