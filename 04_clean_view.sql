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

--dati sistemati

