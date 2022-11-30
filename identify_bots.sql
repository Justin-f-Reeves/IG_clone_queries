#7 Try to identify suspected bots by finding all users
# who liked every single photo on the site. 

USE ig_clone; 

SELECT username, `total likes`, `human status` 
    FROM (  SELECT username, 
            COUNT(photo_id) AS 'total likes',
            CASE 
                WHEN COUNT(likes.photo_id) = (SELECT COUNT(id) FROM photos) THEN 'Suspected Bot'
                ELSE 'Not Bot'
            END AS 'Human Status'        
            FROM users
            INNER JOIN likes
            ON users.id = likes.user_id
            GROUP BY likes.user_id
            ORDER BY `total likes` DESC
        
          ) AS t
     WHERE `Human Status` LIKE 'Suspected Bot';