🔹 1. INNER JOIN: Get all bookings with the users who made them
sql
Copy
Edit
SELECT 
  bookings.id AS booking_id,
  users.id AS user_id,
  users.name AS user_name,
  bookings.start_date,
  bookings.end_date
FROM 
  bookings
INNER JOIN 
  users 
ON 
  bookings.user_id = users.id;

This only returns bookings that have a valid user_id in the users table (i.e., users who actually made a booking).


🔹 2. LEFT JOIN: Get all properties and their reviews (even those without reviews)
sql
Copy
Edit
SELECT 
  properties.id AS property_id,
  properties.title,
  reviews.rating,
  reviews.comment
FROM 
  properties
LEFT JOIN 
  reviews 
ON 
  properties.id = reviews.property_id;

This shows all properties. If a property has no review, the rating and comment will be NULL.

🔹 3. FULL OUTER JOIN: Get all users and all bookings, even unmatched ones
sql
Copy
Edit
SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  users
FULL OUTER JOIN 
  bookings 
ON 
  users.id = bookings.user_id;

This shows:

Users who have bookings

Users who don't have bookings

Bookings that are not linked to any user (maybe due to data errors)

Note: Not all databases support FULL OUTER JOIN (e.g., MySQL doesn’t). You can simulate it using UNION of LEFT JOIN and RIGHT JOIN:

  
Edit For MySQL or systems without FULL OUTER JOIN

  SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  users
LEFT JOIN 
  bookings 
ON 
  users.id = bookings.user_id

UNION

SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  bookings
LEFT JOIN 
  users 
ON 
  bookings.user_id = users.id;
