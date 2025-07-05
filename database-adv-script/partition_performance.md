# Partitioning Performance Report
### Objective:
Improve performance of queries filtering bookings by start_date.

### Method:
Partitioned bookings table by year using RANGE partitioning on start_date

Created partitions for 2023, 2024, and 2025

### Observation Before Partitioning:
EXPLAIN ANALYZE showed full table scan (~100ms+ for 1M+ rows)

High disk I/O and slow filters

### Observation After Partitioning:
Partition pruning reduced scan scope to only relevant child table

Execution time dropped to ~10–20ms

Indexes on partitioned tables further improved lookup speed

### Conclusion:
Partitioning the bookings table by start_date significantly improved query performance for date-range filters. This is especially useful in analytics and reporting workloads on time-based datasets.

