--Creazione vista

create or REPLACE VIEW cinema_sales_clean AS
SELECT DISTINCT
    film_code,
    cinema_code,
    total_sales,
    tickets_sold,
    tickets_out,
    show_time,
    case when occu_perc <0 or occu_perc>100 then NULL else occu_perc end as occu_perc,
    ticket_price,
    ticket_use,
    case when capacity <0 or occu_perc<0 or occu_perc>100 then NULL else capacity end as capacity,
    date,
    month,
    quarter,day
FROM cinema_sales
where ticket_use >=0
;

select COUNT(*) from cinema_sales_clean;

--check
select COUNT(*) from cinema_sales_clean
where occu_perc <0 or occu_perc >100;  --ok

select COUNT(*) from cinema_sales_clean  where capacity <0; --ok
select COUNT(*) from cinema_sales_clean  where ticket_use <0; --ok

select COUNT(*) from cinema_sales_clean where occu_perc <0 or occu_perc >100;
select COUNT(*) from cinema_sales_clean where tickets_out >0; --6060
select ROUND((SUM(tickets_out)*100.0/SUM(tickets_sold)),2) from cinema_sales_clean; -- 0,15% di biglietti venduti,è un dato trascurabile epr le domande future di business
--dati sistemati

