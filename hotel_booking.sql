use project;

show tables;
# Total number of bookings:
SELECT COUNT(*) AS total_bookings
FROM hotel_bookings;

# Average total cost of bookings:

SELECT AVG(total_cost) AS average_booking_cost
FROM hotel_bookings;

# Confirmed vs Cancelled bookings:
SELECT booking_status, COUNT(*) AS count
FROM hotel_bookings
GROUP BY booking_status;

# Number of bookings per hotel type:
SELECT hotel_type, COUNT(*) AS bookings
FROM hotel_bookings
GROUP BY hotel_type;

# Total revenue from confirmed bookings:
SELECT SUM(total_cost) AS total_revenue
FROM hotel_bookings
WHERE booking_status = 'Confirmed';

#6. Average cost per room type:

SELECT room_type, AVG(total_cost) AS avg_cost
FROM hotel_bookings
GROUP BY room_type;

#Room type with highest total revenue:

SELECT room_type, SUM(total_cost) AS total_revenue
FROM hotel_bookings
GROUP BY room_type
ORDER BY total_revenue DESC
LIMIT 1;

# Room type with highest total revenue:

SELECT room_type, SUM(total_cost) AS total_revenue
FROM hotel_bookings
GROUP BY room_type
ORDER BY total_revenue DESC
LIMIT 1;

# Number of days each guest stayed:

SELECT booking_id, guest_name,
       DATEDIFF(checkout_date, checkin_date) AS duration_days
FROM hotel_bookings;

#9. Guest with the longest stay:

SELECT guest_name, DATEDIFF(checkout_date, checkin_date) AS stay_duration
FROM hotel_bookings
ORDER BY stay_duration DESC
LIMIT 1;

# Month with highest number of confirmed bookings:

SELECT MONTH(checkin_date) AS month, COUNT(*) AS confirmed_bookings
FROM hotel_bookings
WHERE booking_status = 'Confirmed'
GROUP BY MONTH(checkin_date)
ORDER BY confirmed_bookings DESC
LIMIT 1;

# Average cost per day for each room type:

SELECT room_type,
       AVG(total_cost / DATEDIFF(checkout_date, checkin_date)) AS avg_cost_per_day
FROM hotel_bookings
WHERE DATEDIFF(checkout_date, checkin_date) > 0
GROUP BY room_type;

