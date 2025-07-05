-- Initial Query: Retrieve all bookings with associated user, property, and payment details, including WHERE and AND conditions

SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    properties.id AS property_id,
    properties.title AS property_title,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.status AS payment_status
FROM 
    bookings
JOIN users 
    ON bookings.user_id = users.id
JOIN properties 
    ON bookings.listing_id = properties.id
LEFT JOIN payments 
    ON payments.booking_id = bookings.id
WHERE 
    bookings.status = 'confirmed'
    AND payments.status = 'completed';




-- 2. Analyze Performance with EXPLAIN

EXPLAIN ANALYZE
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    properties.id AS property_id,
    properties.title AS property_title,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.status AS payment_status
FROM 
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.listing_id = properties.id
LEFT JOIN payments ON payments.booking_id = bookings.id;

