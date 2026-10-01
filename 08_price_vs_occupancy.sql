-- il prezzo del biglietto influenza quanto viene occupato un cinema

WITH cinema_metrics AS (
    SELECT
        cinema_code,
        COUNT(DISTINCT date) AS days_active,
        ROUND(SUM(total_sales) * 1.0 / NULLIF(SUM(tickets_sold), 0), 2) AS avg_ticket_price,
        ROUND(
            SUM(tickets_sold) FILTER (WHERE capacity IS NOT NULL) * 100.0 / SUM(capacity),
            2
        ) AS occupancy_pct
    FROM cinema_sales_clean
    GROUP BY cinema_code
    HAVING COUNT(DISTINCT date) >= 30
),
price_bands AS (
    SELECT
        *,
        NTILE(4) OVER (ORDER BY avg_ticket_price) AS price_band
    FROM cinema_metrics
    WHERE occupancy_pct IS NOT NULL
)
--occupazione per fascia di prezzo
--SELECT
 --   price_band,
 --   COUNT(*)                                                    AS cinemas,
 --   MIN(avg_ticket_price)                                       AS min_price,
--    MAX(avg_ticket_price)                                       AS max_price,
--    ROUND(AVG(avg_ticket_price), 2)                             AS avg_price,
--    ROUND(AVG(occupancy_pct), 2)                                AS avg_occupancy_pct,
--    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY occupancy_pct)::numeric, 2) AS median_occupancy_pct
--FROM price_bands
--GROUP BY price_band
--ORDER BY price_band;

--  correlazione tra prezzo medio e occupazione
SELECT
    COUNT(*)                                                    AS cinemas,
    ROUND(CORR(avg_ticket_price, occupancy_pct)::numeric, 3)    AS price_occupancy_corr
FROM price_bands;