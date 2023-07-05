--Q1: Who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1

--Q2:which country has most invoices?
select count(*) as c ,billing_country 
from invoice
group by billing_country
order by c desc

--Q3: what are top three values of total invoices
select * from invoice
order by total desc
limit 3

--Q4: which city has the best customers? We would like to throw a promotional Music
--festival in the city we made the most money. Write a query that returns one city
--we made the most money.Write a query that returns one city that has the highest sum of
--invoice totals.Return both the city name and sum of all invoice total

select sum(total) as invoice_total,billing_city
from invoice
group by billing_city
order by invoice_total desc

--Q5: who is the best customer? The customer who has spent the most money will be declared the best
--customer.Wtite a query that returns the person who has spent the most money

select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total)as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1
