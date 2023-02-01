select address.country ,product_class_desc ,sum(product_quantity) as total_quantity ,sum(product_quantity *product_price ) as total_value› ,

(count(product.product_class_code)) as shipped_quantity from online_customer 

inner join  order_header on online_customer.customer_id = order_header.customer_id

inner join  address on online_customer.address_id = address.address_id

inner join order_items on order_header.order_id = order_items.order_id

inner join product on  order_items.product_id = product.product_id 

inner join product_class on product.product_class_code = product_class.product_class_code

where country  != "India" and country not in("USA")

group by  order_items.order_id,product.product_id ,product_class_desc 

order by count(product_class.product_class_desc) desc limit 1
