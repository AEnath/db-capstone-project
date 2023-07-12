use africanjollofdb;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingdate Date, IN tablenumber INT)
BEGIN
START TRANSACTION;
Set  @my_variable = tablenumber;

If (tablenumber <> (SELECT table_number from bookings where booking_date = bookingdate and  table_number = tablenumber)) THEN
      INSERT INTO bookings(booking_date, table_number, customer_id) Values (bookingdate, tablenumber);
      COMMIT;
      Select concat('table ', @my_variable, ' successfully booked.') as 'Booking status';
ELSE 
	ROLLBACK;
    Select concat('table ', @my_variable, ' is already booked - booking cancelled.') as 'Booking status';
END IF;

END //

DELIMITER ;