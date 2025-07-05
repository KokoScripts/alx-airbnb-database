# SQL Index Optimization – Airbnb Clone

## Objective
The goal of this task is to **identify performance-critical columns** in your database and create **indexes** to improve query speed—especially for frequent `JOIN`, `WHERE`, and `ORDER BY` operations.

---

## Step-by-Step Instructions

### 1. Identify High-Usage Columns
Based on typical query patterns, the following columns are likely candidates for indexing:

| Table     | Column         | Reason for Indexing                  |
|-----------|----------------|--------------------------------------|
| `users`   | `email`        | Frequently used in `WHERE`/login     |
| `bookings`| `user_id`      | Used in `JOIN` with `users`          |
| `bookings`| `listing_id`   | Used in `JOIN` with `properties`     |
| `bookings`| `start_date`   | Used in date filtering, `ORDER BY`   |
| `properties` | `location` | Common in search filters (`WHERE`)   |

---

### 2. Create Indexes

Saved in: `database_index.sql`

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


