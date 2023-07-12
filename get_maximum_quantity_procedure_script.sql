CREATE PROCEDURE GetMaxQuantity()
Select max(quantity) as 'Max Quantity in Order' from orders as O
inner join orderdetails as OD
on O.order_id = OD.order_id;