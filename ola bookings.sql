Create database Ola;
use Ola;
#1retrieve all successfull bookings
Create view Successfull_bookings as 
Select *from bookings
 where Booking_Status="Success";

Select *from Successfull_bookings;

#2 find the average ride dist for each vehicle type
Create view Avg_ride as
Select Vehicle_Type, Avg(Ride_Distance)
as avg_distance From bookings
Group By Vehicle_type;

Select *from Avg_ride;

#3 Get the total number of rides cancelled by customer
Create view cancelled_by_cust as
Select count(*) from bookings where Booking_Status="Canceled by Customer";

Select *from cancelled_by_cust;

#4 List the top 5 customers who booked booked the highest number of rides
create view Top_5_cust as
Select Customer_ID,Count(Booking_ID) as total_rides from bookings
group by Customer_ID
order by total_rides desc limit 5;

Select *from Top_5_cust;

#5 Get the number of rides cancelled by drivers due to personal or car related issues;
create view Cancelled_by_drivers as
SELECT COUNT(*) 
FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

Select *from Cancelled_by_drivers;

#6 Find the mimnimum and max dricer ratings for prime sedan bookings
create view min_max_rating as
Select Max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings
from bookings where Vehicle_type="Prime Sedan";

Select *from min_max_rating;


#7 Retrieve all rides where payment was made by upi
create view Pay_upi as
Select *from bookings where Payment_Method="UPI";

select * from Pay_upi;

#8.Find the avg customer rating per vehicle type
create view avg_rating as
Select Vehicle_Type, Avg(Customer_Rating) as avg_cust_rating from bookings
group by Vehicle_Type;

Select *from avg_rating;

#9 Calc the total booking value of rides completed successfulyy
create view total_booking as
Select Sum(Booking_value) as total_booking_value from bookings
where Booking_Status="Success";

Select *from total_booking;

#10.List all incomplete rides along with reason
create view inc_rides as
Select Booking_ID,Incomplete_Rides_Reason from bookings
where Incomplete_Rides="Yes";

Select *from inc_rides;