select online_customer.customer_id , concat(customer_fname,customer_lname) as customer_fullname ,order_header.order_id ,
sum(product_quantity ) as total_orders_quantity from online_customer 

inner join  order_header on online_customer.customer_id =order_header.customer_id

inner join order_items on order_header.order_id = order_items.order_id

where order_status = "Shipped"

group by  order_id having sum(product_quantity) >10;