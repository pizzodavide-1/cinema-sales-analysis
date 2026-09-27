--andamento settimanale
--tot biglietti venduti e incassi per ogni settimana
select * from cinema_sales_clean;

select DATE_TRUNC('week', date)::date as week_start,
COUNT(distinct date) as giorni,
SUM(tickets_sold) as biglietti_venduti,
ROUND(SUM(tickets_sold)*1.0/COUNT(distinct date),2) as biglietti_venduti_medi, --moltiplico per 1.0 per non avere gli zeri
SUM(total_sales) as vendite_totali,
ROUND(SUM(total_sales)*1.0/COUNT(distinct date),2) as vendite_medie
from cinema_sales_clean 
group by week_start
order by week_start asc;

SELECT d::date AS missing_date
FROM generate_series('2018-02-21'::date, '2018-11-04'::date, '1 day') AS d
WHERE d::date NOT IN (SELECT DISTINCT date FROM cinema_sales_clean)
ORDER BY missing_date;

--vendite medie per ogni giorno della settimana
WITH daily_totals AS (
    SELECT
        date,
        SUM(tickets_sold) AS tickets,
        SUM(total_sales)  AS revenue
    FROM cinema_sales_clean
    GROUP BY date
)
select EXTRACT(ISODOW FROM date) as day_num,
TO_CHAR(date, 'Day') as day_name,
COUNT(*) as days_count,
ROUND(AVG(tickets),2) as avg_daily_tickets,
ROUND(AVG(revenue),2) as avg_daily_revenue,
SUM(revenue)*1.0/SUM(tickets) as prezzo_medio_biglietto
from daily_totals
group by day_num,day_name
order by day_num;
