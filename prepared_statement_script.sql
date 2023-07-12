PREPARE GetOrderDetail FROM 
' Select customer_id,O.order_id, quantity, (quantity * unit_price) as cost
from orders as O
inner join orderdetails as OD
on O.order_id = OD.order_id
inner join menu as M
on M.menu_id = OD.menu_id
where customer_id = ?
';