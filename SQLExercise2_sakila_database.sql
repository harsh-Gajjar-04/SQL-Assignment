-- sakila database part-1

-- Q1 Display all tables available in the database “sakila” 
-- Q2 Display structure of table “actor”. (4 row) 
-- Q3 Display the schema which was used to create table “actor” and view the complete schema using the viewer. (1 row) 
-- Q4 Display the first and last names of all actors from the table actor. (200 rows) 
-- Q5 Which actors have the last name ‘Johansson’. (3 rows) 
-- Q6 Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name. (200 rows) 
-- Q7 You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information? (1 row) 
-- Q8 Which last names are not repeated? (66 rows) 
-- Q9 List the last names of actors, as well as how many actors have that last 
-- Q10 Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables “staff” and “address”. (2 rows)

use sakila;

show tables;

describe actor;

select first_name, last_name from actor ;

select * from actor
	where last_name="Johansson";
    
select  concat(first_name,last_name) as actor_name from actor ;

select actor_id , first_name ,last_name from actor 
	where first_name = "joe";

select count(last_name) from actor
	group by last_name having count(last_name) = 1;
    

select first_name,last_name,address from staff 
	inner join address on staff.address_id = address.address_id;
    
    
-- sakila database part -2

-- Q1 Which actor has appeared in the most films? (‘107', 'GINA', 'DEGENERES', '42') 
-- Q2 What is the average length of films by category? (16 rows) 
-- Q3 Which film categories are long? (5 rows) 
-- Q4 How many copies of the film “Hunchback Impossible” exist in the inventory system? (6) 
-- Q5 Using the tables “payment” and “customer” and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name (599 rows) 

use sakila;

-- Q1   
select film_actor.actor_id ,actor.first_name ,actor.last_name ,count(film_actor.film_id) as total_films from film_actor
	inner join actor on film_actor.actor_id=actor.actor_id  
    group by film_actor.actor_id 
    order by count(film_actor.film_id) desc limit 1;

-- Q2
select name as category_type,avg(length) from film 
	inner join film_category on film.film_id = film_category.film_id
    inner join category on film_category.category_id =category.category_id
    group by film_category.category_id;
    
    
-- Q3 .LONG INTERMS OF LENGTH OF FILMS BASED ON THE CATEGORY TYPE
select name as category_type,avg(length) from film 
	inner join film_category on film.film_id = film_category.film_id
    inner join category on film_category.category_id =category.category_id
    group by film_category.category_id having avg(length) > 115
    order by avg(length) desc;
    
-- Q3 .LONG INTERMS OF NUMBER OF FILMS BASED ON THE CATEGORY TYPE
select name as category_type,count(film_category .film_id) as total_number_of_films from film 
	inner join film_category on film.film_id = film_category.film_id
    inner join category on film_category.category_id =category.category_id
    group by film_category.category_id having count(film_category .film_id) > 65
    order by count(film_category .film_id) desc ;
    
-- Q4
select count(inventory.film_id) from film 
	inner join inventory on film.film_id = inventory.film_id
		where title = 'Hunchback Impossible';
     
-- Q5
select last_name,sum(amount) as total_payment from customer 
	inner join payment on customer.customer_id = payment.customer_id
	group by payment.customer_id;

    
    