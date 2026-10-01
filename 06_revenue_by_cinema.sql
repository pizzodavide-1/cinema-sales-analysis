select * from cinema_sales_clean;
-- classifica delle sale
SELECT
    cinema_code,
    COUNT(DISTINCT date)                                   AS days_active,
    COUNT(DISTINCT film_code)                              AS films_shown,
    SUM(tickets_sold)                                      AS total_tickets,
    SUM(total_sales)                                       AS total_revenue,
    ROUND(SUM(total_sales) * 1.0 / COUNT(DISTINCT date), 2) AS avg_daily_revenue
FROM cinema_sales_clean
GROUP BY cinema_code
ORDER BY total_revenue DESC;

--concentrazione degli incassi
WITH cinema_totals AS ( --totale per ogni sala
    SELECT
        cinema_code,
        SUM(total_sales) AS total_revenue
    FROM cinema_sales_clean
    GROUP BY cinema_code
)
SELECT
    ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS revenue_rank, --classifica per incasso
    cinema_code,
    total_revenue,
    ROUND(total_revenue * 100.0 / SUM(total_revenue) OVER (), 2) AS revenue_share_pct,
    ROUND(
        SUM(total_revenue) OVER (
            ORDER BY total_revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT row --mettere sempre per fare andare avanti 1 riga alla volta anche in caso di valori uguali
        ) * 100.0 / SUM(total_revenue) OVER (),2) AS cumulative_share_pct
FROM cinema_totals
ORDER BY revenue_rank;