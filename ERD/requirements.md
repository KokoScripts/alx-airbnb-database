## **Entities & Attributes**

### 1. **User**

* `user_id` *(Primary Key, UUID, Indexed)*
* `first_name` *(VARCHAR, NOT NULL)*
* `last_name` *(VARCHAR, NOT NULL)*
* `email` *(VARCHAR, UNIQUE, NOT NULL)*
* `password_hash` *(VARCHAR, NOT NULL)*
* `phone_number` *(VARCHAR, NULL)*
* `role` *(ENUM: guest, host, admin, NOT NULL)*
* `created_at` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*

---

### 2. **Property**

* `property_id` *(Primary Key, UUID, Indexed)*
* `host_id` *(Foreign Key → User.user\_id)*
* `name` *(VARCHAR, NOT NULL)*
* `description` *(TEXT, NOT NULL)*
* `location` *(VARCHAR, NOT NULL)*
* `pricepernight` *(DECIMAL, NOT NULL)*
* `created_at` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*
* `updated_at` *(TIMESTAMP, ON UPDATE CURRENT\_TIMESTAMP)*

---

### 3. **Booking**

* `booking_id` *(Primary Key, UUID, Indexed)*
* `property_id` *(Foreign Key → Property.property\_id)*
* `user_id` *(Foreign Key → User.user\_id)*
* `start_date` *(DATE, NOT NULL)*
* `end_date` *(DATE, NOT NULL)*
* `total_price` *(DECIMAL, NOT NULL)*
* `status` *(ENUM: pending, confirmed, canceled, NOT NULL)*
* `created_at` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*

---

### 4. **Payment**

* `payment_id` *(Primary Key, UUID, Indexed)*
* `booking_id` *(Foreign Key → Booking.booking\_id)*
* `amount` *(DECIMAL, NOT NULL)*
* `payment_date` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*
* `payment_method` *(ENUM: credit\_card, paypal, stripe, NOT NULL)*

---

### 5. **Review**

* `review_id` *(Primary Key, UUID, Indexed)*
* `property_id` *(Foreign Key → Property.property\_id)*
* `user_id` *(Foreign Key → User.user\_id)*
* `rating` *(INTEGER, 1–5, NOT NULL)*
* `comment` *(TEXT, NOT NULL)*
* `created_at` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*

---

### 6. **Message**

* `message_id` *(Primary Key, UUID, Indexed)*
* `sender_id` *(Foreign Key → User.user\_id)*
* `recipient_id` *(Foreign Key → User.user\_id)*
* `message_body` *(TEXT, NOT NULL)*
* `sent_at` *(TIMESTAMP, DEFAULT CURRENT\_TIMESTAMP)*

---

## 🔗 **Relationships Between Entities**

### **1. User ↔ Property**

* **One-to-Many**: A user (host) can own multiple properties.
* `User.user_id` → `Property.host_id`

---

### **2. User ↔ Booking**

* **One-to-Many**: A user (guest) can make many bookings.
* `User.user_id` → `Booking.user_id`

---

### **3. Property ↔ Booking**

* **One-to-Many**: A property can have many bookings.
* `Property.property_id` → `Booking.property_id`

---

### **4. Booking ↔ Payment**

* **One-to-One**: Each booking has one corresponding payment.
* `Booking.booking_id` → `Payment.booking_id`

---

### **5. Property ↔ Review**

* **One-to-Many**: A property can receive many reviews.
* `Property.property_id` → `Review.property_id`

---

### **6. User ↔ Review**

* **One-to-Many**: A user can write multiple reviews.
* `User.user_id` → `Review.user_id`

---

### **7. User ↔ Message**

* **Self-referencing Many-to-Many**: A user can send and receive many messages.

  * `sender_id` → `User.user_id`
  * `recipient_id` → `User.user_id`

---

### Summary of Relationship Cardinalities:

| Relationship       | Type                          |
| ------------------ | ----------------------------- |
| User → Property    | One-to-Many                   |
| User → Booking     | One-to-Many                   |
| Property → Booking | One-to-Many                   |
| Booking → Payment  | One-to-One                    |
| Property → Review  | One-to-Many                   |
| User → Review      | One-to-Many                   |
| User ↔ Message     | Many-to-Many (self-reference) |

