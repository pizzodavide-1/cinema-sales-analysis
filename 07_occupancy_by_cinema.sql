select * from cinema_sales_clean;
--quali cinema si riempiono di più e quali restano più vuoti?
--(un cinema può incassare poco perchè magari è molto piccolo a differenza di un cinema
-- enorme che può incassare tanto anche solo occupando metà posti)
select cinema_code,
COUNT(distinct date) as days_active,
ROUND(SUM(show_time)*1.0/COUNT(distinct date),2) as avg_daily_shows,
ROUND(SUM(tickets_sold)/SUM(capacity)*100,2) as occupancy_pct
from cinema_sales_clean
where capacity is not null
group by cinema_code
having COUNT(distinct date) >=30
order by  occupancy_pct DESC;

--incasso e occupazione
-- Confine tra "alto" e "basso": mediana. Inclusi solo cinema con almeno 30 giorni di attività.
-- prodotta tramite LLM data la difficoltà della query

WITH cinema_metrics AS (
    SELECT
        cinema_code,
        COUNT(DISTINCT date) AS days_active,
        ROUND(SUM(total_sales) * 1.0 / COUNT(DISTINCT date), 2) AS avg_daily_revenue,
        ROUND(
            SUM(tickets_sold) FILTER (WHERE capacity IS NOT NULL) * 100.0 / SUM(capacity),
            2
        ) AS occupancy_pct
    FROM cinema_sales_clean
    GROUP BY cinema_code
    HAVING COUNT(DISTINCT date) >= 30
),
medians AS (
    SELECT
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY avg_daily_revenue) AS median_revenue,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY occupancy_pct)     AS median_occupancy
    FROM cinema_metrics
),
segments AS (
    SELECT
        cm.cinema_code,
        cm.days_active,
        cm.avg_daily_revenue,
        cm.occupancy_pct,
        CASE
            WHEN cm.avg_daily_revenue >= md.median_revenue
             AND cm.occupancy_pct     >= md.median_occupancy THEN 'Punti di forza'
            WHEN cm.avg_daily_revenue >= md.median_revenue
             AND cm.occupancy_pct     <  md.median_occupancy THEN 'Potenziale non sfruttato'
            WHEN cm.avg_daily_revenue <  md.median_revenue
             AND cm.occupancy_pct     >= md.median_occupancy THEN 'Piccoli ma pieni'
            ELSE 'Da analizzare'
        END AS segment
    FROM cinema_metrics cm
    CROSS JOIN medians md
    WHERE cm.occupancy_pct IS NOT NULL
)
SELECT cinema_code from segments
where segment = 'Potenziale non sfruttato';
--SELECT *
--FROM segments
--ORDER BY segment, avg_daily_revenue DESC;



