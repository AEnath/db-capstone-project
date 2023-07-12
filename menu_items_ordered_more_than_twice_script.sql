select menu_name from menu
where menu_id in 
(
select menu_id from orders as O
inner join orderdetails as OD
on O.order_id = OD.order_id
group by menu_id
having count(menu_id) > 2
);