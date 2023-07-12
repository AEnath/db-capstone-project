use africanjollofdb;

#Task 2: create a new procedure called UpdateBooking that African Jollof Restaurant can use 
#to update existing bookings in the booking table.
DELIMITER //
CREATE PROCEDURE UpdateBooking(bookingid INT, bookingdate DATE)
BEGIN
Set @bookingidvar = bookingid;
UPDATE bookings
SET booking_date = bookingdate
WHERE booking_id = bookingid;
SELECT Concat('Booking ', @bookingidvar, ' updated') as Confirmation;
END//
DELIMITER ;

set @bid = 2;
set @bdate = '2023-12-12';
Call UpdateBooking(@bid, @bdate);
