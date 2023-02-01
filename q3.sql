select country,count(city) as Number_of_cities from Address

 where country not in ("USA","MALAYSIA") 

group by country having count(city)>1