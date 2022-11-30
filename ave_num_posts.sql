# 5 How many times does the average user post photos?


USE ig_clone; 

SELECT 
    AVG(post) AS 'average'
FROM(
    SELECT
        username,
        COUNT(photos.id) AS post
        FROM users
    LEFT JOIN photos
        ON users.id = photos.user_id
    GROUP BY username
    ) as t;
    

# note SQL requires all *derived* tables be assinged an alias
# even if you're not using the alias, hence the 't' above. 
