SELECT 
c.customer_id,
concat(c.first_name, ' ', c.last_name)
email,
phone_no,
address,
town,
o.order_id,
menu_name,
(quantity*unit_price) as cost
FROM customers as c
inner join Orders as o
on c.customer_id = o.customer_id
inner join Orderdetails as OD
on O.order_id = OD.order_id
inner join Menu as M
on M.menu_id = OD.menu_id
where (quantity*unit_price) > 100;
