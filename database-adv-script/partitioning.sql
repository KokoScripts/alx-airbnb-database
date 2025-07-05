-- Drop the original bookings table if it exists (only for setup/testing)
DROP TABLE IF EXISTS bookings CASCADE;

-- Step 1: Create the partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    listing_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT bookings_date_check CHECK (start_date IS NOT NULL)
) PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions by year (adjust range as needed)

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Create indexes on partitioned child tables if needed
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);


EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
