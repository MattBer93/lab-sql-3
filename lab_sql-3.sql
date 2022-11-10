use sakila;

-- How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor; -- 121

-- In how many different languages were the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as nr_original_languages
from film; -- 1 language

-- How many movies were released with "PG-13" rating?
select count(rating = 'PG-13') as 'PG-13' 
from film
where rating = 'PG-13'; -- 223

-- Get 10 the longest movies from 2006.
select * from film
where release_year = '2006'
order by length desc
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(last_update), min(last_update)) from rental;  -- 275

-- Show rental info with additional columns month and weekday. Get 20.
select rental_id, 
	monthname(rental_date) as 'rental_month', 
    dayname(rental_date) as 'rental_day'
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id, 
	monthname(rental_date) as 'rental_month', 
    dayname(rental_date) as 'rental_day',
    case dayname(rental_date)
		when 'Saturday' then 'Weekend'
        when 'Sunday' then 'Weekend'
	else 'Weekday'
    end as 'day_type'
from rental
limit 20;


-- How many rentals were in the last month of activity?
select * from rental
order by  last_update asc
limit 30;
