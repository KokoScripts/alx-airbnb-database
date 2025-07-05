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
