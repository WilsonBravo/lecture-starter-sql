SELECT u.id, u.username, ARRAY_AGG(fm.movie_id) AS favorite_movie_ids
FROM "User" u
LEFT JOIN "Favorite_Movies" fm ON u.id = fm.user_id
GROUP BY u.id, u.username;
