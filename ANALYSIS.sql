SELECT u.username, COUNT(p.post_id) AS total_posts
FROM users u
LEFT JOIN posts p ON u.user_id = p.user_id
GROUP BY u.username;
GO
SELECT post_id, COUNT(*) AS total_likes
FROM likes
GROUP BY post_id
ORDER BY total_likes DESC;
GO
SELECT following_id, COUNT(*) AS followers
FROM followers
GROUP BY following_id;
GO
SELECT * FROM COMMENTS
GO
SELECT * FROM followers
GO 
SELECT*FROM likes
GO
SELECT * FROM POSTS
GO 
SELECT*FROM USERS