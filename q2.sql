select  product_class_desc , product_id ,product_desc ,product_quantity_avail ,

case

when product_class_desc in("Electronics","Computer") and product_quantity_avail <=10 then " Low stock" 

when product_class_desc in("Electronics","Computer") and product_quantity_avail >=11 and product_quantity_avail <=30 then " In stock" 

when product_class_desc in("Electronics","Computer") and product_quantity_avail >=31 then " Enough stock" 

when product_class_desc in("Stationery","Clothes") and product_quantity_avail <=20 then " Low stock" 

when product_class_desc in("Stationery","Clothes") and product_quantity_avail >=21 and product_quantity_avail <=80 then " In stock" 

when product_class_desc in("Stationery","Clothes") and product_quantity_avail >=81 then " Enough stock" 

when product_class_desc not in("Electronics","Computer","Stationery","Clothes") and product_quantity_avail <=15 then " Low stock" 

when product_class_desc not in("Electronics","Computer","Stationery","Clothes") and product_quantity_avail >=16 and product_quantity_avail <=50 then " In stock" 

when product_class_desc not in("Electronics","Computer","Stationery","Clothes") and product_quantity_avail >=51 then " Enough stock" 

when product_quantity_avail =0 then "Out of stock"

end as available_avg_quantity

from product_class 

inner join product on product_class.product_class_code = product.product_class_code

