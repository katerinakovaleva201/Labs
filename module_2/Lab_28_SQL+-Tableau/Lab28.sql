# 1. Find the running total of rental payments for each customer in the payment table, ordered by payment date.

use sakila;
CREATE OR REPLACE VIEW rental_payments_view AS
SELECT 
	customer_id, 
    payment_date, 
    amount,
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total 
FROM sakila.payment;
select * from rental_payments_view;

# 2. Find the rank and dense rank of each payment amount within each payment date by selecting the payment_date
# and amount columns from the payment table.

use sakila;
SELECT 
    DATE(payment_date), 
    amount, 
    RANK() OVER (PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS transaction_rank,
    DENSE_RANK() OVER (PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS dense_transaction_rank
FROM payment;

# 3. Find the ranking of each film based on its rental rate, within its respective category. 
SELECT f.rental_rate, title, fc.film_id, category_id,
RANK() OVER (PARTITION BY DATE(rental_rate) ORDER BY category_id DESC) AS rnk
from film f INNER JOIN film_category fc ON f.film_id=fc.film_id;

select film_id, film.title, rental_rate, c.name,
		dense_rank() over(partition by c.name order by rental_rate desc)
from film
join film_category using(film_id)
join category c using(category_id);

# 4. Update the previous query from above to retrieve only the top 5 films within each category.
select * from
(select film_id, film.title as title, rental_rate, c.name as category,
		dense_rank() over(partition by c.name order by rental_rate desc, film.title) as 'rank',
        row_number() over(partition by c.name order by rental_rate desc, film.title) as row_num
from film
join film_category using(film_id)
join category c using(category_id)) sub_q
where row_num <=5;

# 5. Find the difference between the current and previous payment amount 
# and the difference between the current and next payment amount, for each customer in the payment table
# Hint: select the payment_id, customer_id, amount, and payment_date columns from the payment table, 
# and then applying the LAG and LEAD functions to the amount column, partitioning by customer_id and ordering by payment_date.

select payment_id, customer_id, amount,  payment_date,
		(amount - lag(amount) over(partition by customer_id order by payment_date)) as 'lag',
        (amount - lead(amount) over(partition by customer_id order by payment_date)) as 'lead'
from payment;