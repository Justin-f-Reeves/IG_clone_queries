# 3 Find all the users who never uploaded a photo. 

USE ig_clone; 

SELECT username 
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE image_url IS NULL;