# 2 What day of the week do most users register on?

USE ig_clone; 

SELECT DAYNAME(created_at) AS 'Day', COUNT(DAYNAME(created_at)) AS 'Day Count'
FROM users
GROUP BY DAYNAME(created_at)
ORDER BY 'Day Count' DESC;