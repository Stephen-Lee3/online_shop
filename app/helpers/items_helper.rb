module ItemsHelper
def item_quantity(order_id,product_id)
 Item.where("order_id = ? && product_id = ?",order_id,product_id )[0].quantity
 
end
end
