select carton_id , (len * width * height) as carton_vol from carton 

where  len*width *height  > (select  sum(len* width * height *product_quantity)  from product 

inner join order_items on product.product_id = order_items.product_id where order_id =10006 )

order by carton_vol ASC limit 1