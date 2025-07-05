### Refactored Version for Better Performance

```
-- Ensure indexes exist before running the optimized query
-- (these should already be in database_index.sql)
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_listing_id ON bookings(listing_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```
``` sql
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    u.email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.status AS payment_status
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.listing_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id;

