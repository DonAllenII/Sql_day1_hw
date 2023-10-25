--1. How many actors are there with the last name ‘Wahlberg’?
--Question 1 Solution/ Answer 2 'Wahlbergs'
SELECT * FROM actor 
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--Question 2 solution/ Answer: 0
select * from payment
where amount > 3.99 and amount < 5.99;

--3. What film does the store have the most of? (search in inventory)
--Answer: 72 films tied with 8 copies
select count(inventory.inventory_id) as Copies, film.title as Title
from inventory, film
where inventory.film_id = film.film_id 
group by Title
order by copies desc;

--4. How many customers have the last name ‘William’?
--Answer: Linda Williams
select * from customer
where last_name = 'Williams';

--5. What store employee (get the id) sold the most rentals?
--Answer: staff id 1, Mike Hillyer
select staff.staff_id, staff.first_name, staff.last_name, count(rental.rental_id) as rentals
from staff, rental
where staff.staff_id = rental.staff_id
group by staff.staff_id 
order by rentals desc;

--6. How many different district names are there?
--Answer: 378 districts
select count(district) as amount, district from address
group by district ;


--7. What film has the most actors in it?
--Answer: Lambs Cincinatti, 15 actors
select count(film_actor.actor_id) as actors, film.title  as movie
from film_actor, film
where film_actor.film_id = film.film_id
group by movie
order by actors desc;

--8. From store_id 1, how many customers have a last name ending
--with 'es'?
--13 customers
select count(customer.customer_id) as customers
from customer
where store_id = '1' and last_name like '%es';


--9. How many payment amounts had a number of rentals
--above 250 for customers with ids between 380 and 430?
--Answer: 3
select payment.amount as amount, count(rental.rental_id) as rentals
from payment
join rental
on payment.rental_id = rental.rental_id 
where rental.customer_id > 380 and rental.customer_id < 430 
group by amount
having count(rental.rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what
--has the most movies total?
--Answer: 5 categories, PG-13 has the most
select count(film_id) as films, rating
from film
group by rating;