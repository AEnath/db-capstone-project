use africanjollofdb;

CREATE PROCEDURE CancleOrder(IN orderID INT)
DELETE FROM Orders
where order_id = orderID;

