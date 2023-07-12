use africanjollofdb;
#Task 3: create a new procedure called CancelBooking that African Jollof Restaurant 
# can use to cancel or remove a booking.
DELIMITER //

CREATE PROCEDURE CancelBooking(bookingid INT)
BEGIN
DELETE FROM bookings
WHERE booking_id = bookingid;

Select concat('Booking ', bookingid, ' cancelled') as Confirmation;

END //

DELIMITER ;

SET @bookingidvar = 4;
Call CancelBooking(@bookingidvar)

