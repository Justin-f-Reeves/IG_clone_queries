#4  Who got the most likes on a single photo?

USE ig_clone; 

SELECT username, image_url AS 'Photo', COUNT(*) AS 'Like_Total'
FROM users
INNER JOIN photos
    ON users.id = photos.user_id
INNER JOIN likes
    ON photos.id = likes.photo_id
GROUP BY likes.photo_id
ORDER BY Like_Total DESC
LIMIT 10;
