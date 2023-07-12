CREATE VIEW OrdersView AS 
SELECT 
O.order_id, quantity, menu_name, (quantity*unit_price) AS cost
FROM Orders as O
inner join Orderdetails as OD
On O.order_id = OD.order_id
inner join menu as M
on M.menu_id = OD.menu_id
where quantity > 1;