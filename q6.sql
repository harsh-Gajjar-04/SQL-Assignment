select online_customer.customer_id ,order_status,concat(customer_fname,customer_lname)as customer_name ,
customer_email , order_header.order_id , product_desc , product_quantity ,(product_quantity * product_price )as sub_total
from online_customer 

left join order_header on online_customer.customer_id = order_header.customer_id 

left join order_items on order_header.order_id = order_items.order_id 

left  join product on order_items.product_id = product.product_id

