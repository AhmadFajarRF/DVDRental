#1
select payment.customer_id ,payment.payment_date,customer.email 
from payment
join customer 
on customer.customer_id = payment.customer_id 
order by payment_date asc 
limit 10

#2
select payment.customer_id ,payment.payment_date,customer.email 
from payment
join customer 
on customer.customer_id = payment.customer_id 
order by payment_date desc 
limit 10

#3
select * from sales_by_film_category 
order by total_sales desc 

#4
with table1 as ( select rental.rental_date , rental.return_date , inventory.film_id , 
film.rental_duration , 
date_part ( 'day', rental.return_date :: timestamp - rental.rental_date ::timestamp  ) as selisih 
from rental
join inventory
on rental.inventory_id = inventory. film_id join film on inventory.film_id = film.rental_duration ) ,

table2 as ( select * , case when selisih < rental_duration then ' early ' when selisih > rental_duration then ' late ' else ' on time ' end as category from table1 ) 

select category , count ( category ) as result 
from table2 
group by category


#5. 
 select country,count (country) 
 from customer_list
 group by country 
 order by count desc

#6. 
  create view pc as
  select payment.payment_id ,customer.customer_id ,customer.first_name , payment.amount ,city.city ,country.country 
  from payment
  join customer
  on payment.customer_id =customer.customer_id 
  join address
  on address.address_id =customer.address_id 
  join city
  on city.city_id =address.city_id
  join country
  on country.country_id =city.country_id 
  
  #mencari dengan melihat jumlah keuntungan di negara tersebut
  select country ,sum(amount) as total 
  from pc
  group by country
  order by total desc
  limit 10
  
  #mencari tanpa melihat jumlah keuntungan di ngera tersebut
  select country,count(country) as total 
  from pc
  group by country
  order by total desc
  
#7 
create view fcnr as
select film.film_id ,film_category.category_id, category."name" ,film.rental_rate
from film
join film_category
on film.film_id = film_category.film_id 
join category
on category.category_id = film_category.category_id 

select name,avg(rental_rate) as rate
from fcnr 
group by name
order by rate desc



#harusnya nomer 5 sayang di apus
create view base as
 select rental.customer_id ,payment.rental_id,staff.store_id  ,country.country,staff.staff_id 
 from payment
 join rental
 on rental.rental_id =payment.rental_id 
 join staff
 on rental.staff_id = staff.staff_id 
 join address 
 on staff.address_id =address.address_id 
 join city 
 on city.city_id = address.city_id 
 join country
 on country.country_id =city.country_id 
 
 select country
 from  base 
 union 
 select country
 from base 










