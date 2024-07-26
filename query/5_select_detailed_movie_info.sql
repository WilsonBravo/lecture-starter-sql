SELECT m.id, m.title, m.release_date, m.duration, m.description, 
       JSON_BUILD_OBJECT('id', f.id, 'file_name', f.file_name, 'url', f.url) AS poster,
       JSON_BUILD_OBJECT('id', d.id, 'first_name', d.first_name, 'last_name', d.last_name) AS director
FROM "Movie" m
JOIN "Person" d ON m.director_id = d.id
LEFT JOIN "File" f ON m.poster_id = f.id
JOIN "Movie_Genre" mg ON m.id = mg.movie_id
JOIN "Genre" g ON mg.genre_id = g.id
WHERE m.country_id = 1
  AND m.release_date >= '2022-01-01'
  AND m.duration > 135
  AND g.name IN ('Action', 'Drama')
GROUP BY m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.url, d.id, d.first_name, d.last_name;
