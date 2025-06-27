# Airbnb Database Normalization to Third Normal Form (3NF)

## Objective
Apply normalization principles to ensure the Airbnb database schema is in **Third Normal Form (3NF)** by reviewing for redundancy and functional dependency violations, and making adjustments if necessary.

---

## ✅ What is 3NF?

A relation (table) is in **Third Normal Form (3NF)** if:
1. It is in **First Normal Form (1NF)**:
   - All columns contain **atomic (indivisible)** values.
   - There are no **repeating groups** or arrays.
2. It is in **Second Normal Form (2NF)**:
   - It is in 1NF.
   - All **non-key attributes** are **fully functionally dependent** on the whole primary key.
3. It has **no transitive dependencies**:
   - No non-key attribute is dependent on another non-key attribute.

---

## Normalization Review by Entity

### User

**Primary Key**: `user_id`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes                     |
|------------------|---------|------------------------|-------------------------|---------------------------|
| first_name       | ✅      | ✅                     | ❌                      | —                         |
| last_name        | ✅      | ✅                     | ❌                      | —                         |
| email            | ✅      | ✅                     | ❌                      | Unique constraint         |
| password_hash    | ✅      | ✅                     | ❌                      | —                         |
| phone_number     | ✅      | ✅                     | ❌                      | Nullable                  |
| role             | ✅      | ✅                     | ❌                      | ENUM (guest, host, admin) |
| created_at       | ✅      | ✅                     | ❌                      | Timestamp default         |

✅ **User** table is in 3NF.

---

### Property

**Primary Key**: `property_id`  
**Foreign Key**: `host_id → User(user_id)`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes                |
|------------------|---------|------------------------|-------------------------|----------------------|
| host_id          | ✅      | ✅                     | ❌                      | FK to User           |
| name             | ✅      | ✅                     | ❌                      | —                    |
| description      | ✅      | ✅                     | ❌                      | —                    |
| location         | ✅      | ✅                     | ❌                      | Could be normalized  |
| pricepernight    | ✅      | ✅                     | ❌                      | —                    |
| created_at       | ✅      | ✅                     | ❌                      | —                    |
| updated_at       | ✅      | ✅                     | ❌                      | ON UPDATE            |

✅ Property table is in 3NF.  
💡 Optional Improvement: If `location` is a compound string (e.g., "Ikeja, Lagos, Nigeria"), it could be normalized into a `Location` table with `city`, `state`, and `country` columns.

---

### Booking

**Primary Key**: `booking_id`  
**Foreign Keys**: `property_id → Property`, `user_id → User`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes                     |
|------------------|---------|------------------------|-------------------------|---------------------------|
| property_id      | ✅      | ✅                     | ❌                      | FK                        |
| user_id          | ✅      | ✅                     | ❌                      | FK                        |
| start_date       | ✅      | ✅                     | ❌                      | —                         |
| end_date         | ✅      | ✅                     | ❌                      | —                         |
| total_price      | ✅      | ✅                     | ❌                      | OK if not calculated on the fly |
| status           | ✅      | ✅                     | ❌                      | ENUM (pending, etc.)      |
| created_at       | ✅      | ✅                     | ❌                      | —                         |

✅ Booking is in 3NF.

---

### Payment

**Primary Key**: `payment_id`  
**Foreign Key**: `booking_id → Booking`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes                     |
|------------------|---------|------------------------|-------------------------|---------------------------|
| booking_id       | ✅      | ✅                     | ❌                      | FK                        |
| amount           | ✅      | ✅                     | ❌                      | —                         |
| payment_date     | ✅      | ✅                     | ❌                      | —                         |
| payment_method   | ✅      | ✅                     | ❌                      | ENUM (credit_card, etc.)  |

✅ Payment is in 3NF.

---

### Review

**Primary Key**: `review_id`  
**Foreign Keys**: `user_id → User`, `property_id → Property`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes         |
|------------------|---------|------------------------|-------------------------|---------------|
| user_id          | ✅      | ✅                     | ❌                      | FK            |
| property_id      | ✅      | ✅                     | ❌                      | FK            |
| rating           | ✅      | ✅                     | ❌                      | CHECK (1–5)   |
| comment          | ✅      | ✅                     | ❌                      | —             |
| created_at       | ✅      | ✅                     | ❌                      | —             |

✅ Review is in 3NF.

---

### ✉️ Message

**Primary Key**: `message_id`  
**Foreign Keys**: `sender_id → User`, `recipient_id → User`

| Attribute         | Atomic? | Fully Dependent on PK? | Transitive Dependency? | Notes         |
|------------------|---------|------------------------|-------------------------|---------------|
| sender_id        | ✅      | ✅                     | ❌                      | FK            |
| recipient_id     | ✅      | ✅                     | ❌                      | FK            |
| message_body     | ✅      | ✅                     | ❌                      | —             |
| sent_at          | ✅      | ✅                     | ❌                      | —             |

✅ Message is in 3NF.

---

## Summary of Normalization Status

| Table     | 1NF | 2NF | 3NF | Remarks                                     |
|-----------|-----|-----|-----|---------------------------------------------|
| User      | ✅  | ✅  | ✅  | Well-structured                             |
| Property  | ✅  | ✅  | ✅  | Location could optionally be normalized     |
| Booking   | ✅  | ✅  | ✅  | No redundancy                               |
| Payment   | ✅  | ✅  | ✅  | No changes needed                           |
| Review    | ✅  | ✅  | ✅  | No transitive dependencies                  |
| Message   | ✅  | ✅  | ✅  | Sender/recipient design is clean            |

---

## ✅ Conclusion

- The current database schema adheres to **3NF standards**.
- No tables require structural changes to eliminate redundancy or transitive dependencies.

