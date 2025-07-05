Create Indexes

```sql
-- Index on users.email (for login and lookup)
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id (JOIN with users)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.listing_id (JOIN with properties)
CREATE INDEX idx_bookings_listing_id ON bookings(listing_id);

-- Index on bookings.start_date (for date filtering and ordering)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index on properties.location (used in filtering)
CREATE INDEX idx_properties_location ON properties(location);
```
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 5
ORDER BY start_date DESC;
```
