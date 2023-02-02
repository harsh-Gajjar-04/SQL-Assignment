-- World Database Queries

-- Q1 Display all columns and 10 rows from table “city”.(10 rows) 
-- Q2 Modify the above query to display from row # 16 to 20 with all columns. (5 rows) 
-- Q3 How many rows are available in the table city. (1 row)-4079. 
-- Q4 Using city table find out which is the most populated city. 
-- ('Mumbai (Bombay)', '10500000') 
-- Q5 Using city table find out the least populated city. 
-- ('Adamstown', '42') 
-- Q6 Display name of all cities where population is between 670000 to 700000. (13 rows) 
-- Q7 Find out 10 most populated cities and display them in a decreasing order i.e. most populated city to appear first. 
-- Q8 Order the data by city name and get first 10 cities from city table. 
-- Q9 Display all the districts of USA where population is greater than 3000000, from city table. (6 rows) 
-- Q10 What is the value of name and population in the rows with ID =5, 23, 432 and 2021. Pl. write a single query to display the same. (4 rows). 

use world_x;
show Tables ;
select * from city  limit 10;
select * from city where id between 16 and 20;
select count(*) from city;
select name, json_extract(info,'$.Population') as Population  from city order by json_extract(info,'$.Population') desc limit 1;
select name, json_extract(info,'$.Population') as Population  from city order by json_extract(info,'$.Population')  limit 1;
select name, json_extract(info,'$.Population') as Population  from city where json_extract(info,'$.Population') between 670000 and 700000 ;
select id,name, json_extract(info,'$.Population') as Population  from city order by json_extract(info,'$.Population') desc limit 10;
select * from city order by city.name limit 10; 
select district , info  from city where countryCode = 'USA' and json_extract(info,'$.Population')>=3000000;
select district , info  from city where countryCode = 'USA' order by json_extract(info,'$.Population') desc limit 6;
select name ,json_extract(Info,'$.Population') as population from city where id in(5,23,432,2021); 



-- World Database Queries  PART-2

use world_x;

-- Q1 Write a query in SQL to display the code, name, continent and GNP for all the countries whose country name last second word is 'd’, using “country” table. (22 rows) 

select country.code, country.name , json_unquote(Json_extract (countryinfo.doc,'$.geography.Continent')) as Continent  ,json_unquote(Json_extract (countryinfo.doc,'$.GNP')) as GNP from country 
	inner join countryinfo on country.code = Json_unquote(json_extract(countryinfo.doc,'$.Code'))
    where country.name like "%d_";
    
    
-- Q2 Write a query in SQL to display the code, name, continent and GNP of the 2nd and 3rd highest GNP from “country” table. (Japan & Germany)

select country.code ,name ,json_unquote(json_extract(countryinfo.doc , '$.geography.Continent')) as Continent , json_unquote(json_extract(countryinfo.doc,'$.GNP')) as GNP from country 
	inner join  countryinfo on country.code = json_unquote(json_extract(countryinfo.doc,'$.Code'))
    order by (json_extract(countryinfo.doc , '$.GNP')) desc limit 2 offset 1
	 
