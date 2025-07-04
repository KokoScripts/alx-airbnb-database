SQL Queries for Airbnb Clone Analysis
1. Total Bookings per User (COUNT with GROUP BY)
sql
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id
ORDER BY 
    total_bookings DESC;
2. Property Ranking by Booking Count (Window Function)
Option 1: Using ROW_NUMBER()
sql
SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id
ORDER BY 
    total_bookings DESC;
Option 2: Using RANK()
sql
SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id
ORDER BY 
    total_bookings DESC;
Key Differences:
ROW_NUMBER() assigns unique sequential integers (no ties)

RANK() leaves gaps in ranking when there are ties (same booking counts get same rank)
