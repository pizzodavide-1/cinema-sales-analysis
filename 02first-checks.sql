SELECT COUNT(*) FROM cinema_sales;
SELECT MIN(date), MAX(date) FROM cinema_sales;
SELECT COUNT(DISTINCT film_code) as count_film, COUNT(DISTINCT cinema_code) as count_cinema
FROM cinema_sales;
