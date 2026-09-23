select * from cinema_sales limit 20;

select COUNT(*) as num_all , COUNT(DISTINCT(film_code , cinema_code, date)) as num_comb from cinema_sales;

select (COUNT(*) - COUNT(film_code)) as num_film_code_null,
(COUNT(*) - COUNT(cinema_code)) as num_cinema_code_null,
(COUNT(*) - COUNT(total_sales)) as num_total_sales_null,
(COUNT(*) - COUNT(tickets_sold)) as num_tickets_sold_null,
(COUNT(*) - COUNT(tickets_out)) as num_tickets_out_null,
(COUNT(*) - COUNT(show_time)) as num_show_time_null,
(COUNT(*) - COUNT(occu_perc)) as num_occu_perc_null,
(COUNT(*) - COUNT(ticket_price)) as num_ticket_price_null,
(COUNT(*) - COUNT(ticket_use)) as num_ticket_use_null,
(COUNT(*) - COUNT(capacity)) as num_capcity_null,
(COUNT(*) - COUNT(date)) as num_date_null,
(COUNT(*) - COUNT(month)) as num_month_null,
(COUNT(*) - COUNT(quarter)) as num_quarter_null,
(COUNT(*) - COUNT(day)) as num_day_null
from cinema_sales;

select MIN(total_sales) as min_total_sales ,MAX(total_sales) as max_total_sales, ROUND(AVG(total_sales),2)as avg_total_sales,
MIN(ticket_price) as min_ticket_price ,MAX(ticket_price) as max_ticket_price, ROUND(AVG(ticket_price),2)as avg_ticket_price,
MIN(tickets_sold) as min_ticket_sold ,MAX(tickets_sold) as max_ticket_sold, ROUND(AVG(tickets_sold),2)as avg_ticket_sold,
MIN(occu_perc) as min_occu_perc ,MAX(occu_perc) as max_occu_perc, ROUND(AVG(occu_perc),2)as avg_occu_perc,
MIN(capacity) as min_capacity ,MAX(capacity) as max_capacity, ROUND(AVG(capacity),2)as avg_capacity
from cinema_sales;

--tickets_out = num biglietti annulati o rimborsati
--dataset iraniano basato su valuta locale
--capcity non è un dato misurato ma calcolato,probabilmente da biglietti venduti e percentuale di occupazione
--min_capacity = -2 impossibile
--max occu perc = 147 impossibile
--106 righe in più rispetto alle combinazioni distinte (film,sala,giorno)
--125 null occu_perc e capacity,probabilmente le stesse righe in quanto capacity è calcolata da occu_perc (assunzione)

--controllo duplicati
select (film_code , cinema_code, date) as chiave_primaria from cinema_sales
group by chiave_primaria
having COUNT(*)>1;
