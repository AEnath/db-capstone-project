use africanjollofdb;

DELIMITER //

CREATE PROCEDURE AddBooking(customerid INT, bookingdate DATE, tablenumber INT)
BEGIN
INSERT INTO bookings(customer_id, booking_date, table_number) 
VALUES (customerid, bookingdate, tablenumber);
Select 'New booking added' as Confirmation;
END //

DELIMITER ;

set @customer = 2;
set @bdate = '2023-07-12';
set @tbn = 4;

Call AddBooking(@customer, @bdate, @tbn);

drop procedure AddBooking;
