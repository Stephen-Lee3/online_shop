module OrdersHelper

def format_time(order)
 order.created_at.strftime('%Y-%m-%d %H:%M:%S')
end
end
