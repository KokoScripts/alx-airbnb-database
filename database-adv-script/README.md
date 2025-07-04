# SQL Joins Practice – Airbnb Clone Backend

## Objective
This project is designed to help you **master SQL joins** by writing practical queries using different types of JOINs: `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.

The queries are based on an **Airbnb-style database schema** with the following tables:
- `users`
- `bookings`
- `properties`
- `reviews`

---

## 🔧 Queries and Descriptions

### 1. 🔄 INNER JOIN: Bookings with Users
```sql
SELECT 
  bookings.id AS booking_id,
  users.id AS user_id,
  users.name AS user_name,
  bookings.start_date,
  bookings.end_date
FROM 
  bookings
INNER JOIN users 
  ON bookings.user_id = users.id;
SELECT 
  properties.id AS property_id,
  properties.title,
  reviews.rating,
  reviews.comment
FROM 
  properties
LEFT JOIN reviews 
  ON properties.id = reviews.property_id;
SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  users
FULL OUTER JOIN bookings 
  ON users.id = bookings.user_id;
-- Simulated FULL OUTER JOIN
SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  users
LEFT JOIN bookings 
  ON users.id = bookings.user_id

UNION

SELECT 
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.start_date,
  bookings.end_date
FROM 
  bookings
LEFT JOIN users 
  ON bookings.user_id = users.id;
```
---
# SQL Subqueries Practice – Airbnb Clone

## Objective
This mini-project focuses on using **subqueries** and **correlated subqueries** to extract meaningful insights from an Airbnb-style database. You'll practice writing powerful SQL queries that go beyond simple joins.

---

## Queries Overview

### 1.

Properties with Average Rating > 4.0
```sql
SELECT 
  properties.id,
  properties.title
FROM 
  properties
JOIN 
  reviews 
ON 
  properties.id = reviews.property_id
GROUP BY 
  properties.id, properties.title
HAVING 
  AVG(reviews.rating) > 4.0;
```
# SQL Aggregation & Window Functions – Airbnb Clone

## Objective
The goal of this task is to analyze Airbnb-style data using **SQL aggregation** and **window functions**. These tools help summarize and rank data without losing access to individual rows.

---

## Queries Overview

### 1. 🔢 Total Number of Bookings per User
```sql
SELECT 
  users.id AS user_id,
  users.name,
  COUNT(bookings.id) AS total_bookings
FROM 
  users
LEFT JOIN 
  bookings 
ON 
  users.id = bookings.user_id
GROUP BY 
  users.id, users.name;
```
