
select order_header.order_id ,order_header.customer_id ,concat(customer_fname,customer_lname) as customer_fullname ,
sum(product_quantity) as total_quantity› from order_header 

inner join online_customer on order_header.customer_id = online_customer.customer_id

inner join order_items on order_header.order_id = order_items.order_id 

where order_status = "Shipped" and order_items.order_id > 10060

group by order_id 