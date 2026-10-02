--Come calano le vendite di un film dopo l'uscita?
--(data di uscita approssimata con il primo giorno di vendita nei dati.)
-- Esclusi i film comparsi nella prima settimana di dati (14-20 marzo), probabilmente già in sala prima.

WITH film_first_day AS (
    SELECT
        film_code,
        MIN(date) AS first_day
    FROM cinema_sales_clean
    GROUP BY film_code
),
film_weeks AS (
    SELECT
        s.film_code,
        (s.date - f.first_day) / 7 + 1 AS week_since_release,
        SUM(s.tickets_sold)            AS tickets
    FROM cinema_sales_clean s
    JOIN film_first_day f ON s.film_code = f.film_code
    WHERE f.first_day >= '2018-03-21'
    GROUP BY s.film_code, week_since_release
),
first_week AS (
    SELECT
        film_code,
        tickets AS week1_tickets
    FROM film_weeks
    WHERE week_since_release = 1
),
film_weeks_pct AS (
    SELECT
        fw.film_code,
        fw.week_since_release,
        fw.tickets,
        fw.tickets * 100.0 / NULLIF(w1.week1_tickets, 0) AS pct_of_week1
    FROM film_weeks fw
    JOIN first_week w1 ON fw.film_code = w1.film_code
)
SELECT
    week_since_release,
    COUNT(*)                                                         AS films,
    ROUND(AVG(tickets), 0)                                           AS avg_tickets,
    ROUND(AVG(pct_of_week1), 1)                                      AS avg_pct_of_week1,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY pct_of_week1)::numeric, 1) AS median_pct_of_week1
FROM film_weeks_pct
GROUP BY week_since_release
ORDER BY week_since_release;