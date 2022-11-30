# 6  FIND the top 5 most commonly used hashtags.

USE ig_clone; 

SELECT tag_name, count(*) AS 'times_used'
FROM photo_tags
INNER JOIN tags
    ON tags.id = photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY times_used DESC
LIMIT 5;