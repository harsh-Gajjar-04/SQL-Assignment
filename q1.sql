select product_class_code ,product_id ,product_desc ,product_price , 

case  

when product_class_code =2050 then product_price = product_price +2000

when product_class_code =2051 then product_price = product_price +500

when product_class_code =2052 then product_price = product_price +600

end

from product 



