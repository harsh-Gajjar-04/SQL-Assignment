select product.product_id , product_desc, sum(product_quantity ) as total_quantity
from product INNER JOIN order_items on product.product_id = order_items.product_id

where product.product_id != 201 and order_items.order_id like (select  max(order_id) from order_items group by  product_id having product_id =201 and max(product_quantity)) 

group by product_id 





-- select  max(product_quantity) from order_items group by  product_id having product_id =201 