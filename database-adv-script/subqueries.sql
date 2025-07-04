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




SELECT 
  u.id,
  u.name,
  u.email
FROM 
  users u
WHERE 
  (
    SELECT 
      COUNT(*) 
    FROM 
      bookings b 
    WHERE 
      b.user_id = u.id
  ) > 3;
