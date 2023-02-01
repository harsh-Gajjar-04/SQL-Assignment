
select online_customer.customer_id ,concat(customer_fname,customer_lname)  as customer_fullname ,city ,
pincode ,order_header.order_id ,order_date,product_desc ,product_class_desc, (product_quantity_avail+ product_price) as sub_total from online_customer

INNER JOIN address ON online_customer.address_id = address.address_id

INNER JOIN order_header ON online_customer.customer_id = order_header.customer_id

INNER JOIN order_items ON order_header.order_id = order_items.order_id

INNER JOIN product ON order_items.product_id = product.product_id

INNER JOIN  product_class ON product.product_class_code = product_class.product_class_code

INNER JOIN shipper ON order_header.shipper_id = shipper.shipper_id 

where pincode Not like "%0%"  AND  order_status = "Shipped"

ORDER BY customer_fullname, order_date ,sub_total;