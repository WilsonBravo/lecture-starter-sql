SELECT m.id, m.title, m.release_date, m.duration, m.description, 
       JSON_BUILD_OBJECT('id', f.id, 'file_name', f.file_name, 'url', f.url) AS poster,
       JSON_BUILD_OBJECT('id', d.id, 'first_name', d.first_name, 'last_name', 
                         'photo', JSON_BUILD_OBJECT('id', df.id, 'file_name', df.file_name, 'url', df.url)) AS director,
       JSON_AGG(JSON_BUILD_OBJECT('id', a.id, 'first_name', a.first_name, 'last_name', 
                                  'photo', JSON_BUILD_OBJECT('id', af.id, 'file_name', af.file_name, 'url', af.url))) AS actors,
       JSON_AGG(JSON_BUILD_OBJECT('id', g.id, 'name', g.name)) AS genres
FROM "Movie" m
JOIN "Person" d ON m.director_id = d.id
LEFT JOIN "File" f ON m.poster_id = f.id
LEFT JOIN "File" df ON d.primary_photo_id = df.id
LEFT JOIN "Character" c ON m.id = c.movie_id
LEFT JOIN "Person" a ON c.person_id = a.id
LEFT JOIN "File" af ON a.primary_photo_id = af.id
LEFT JOIN "Movie_Genre" mg ON m.id = mg.movie_id
LEFT JOIN "Genre" g ON mg.genre_id = g.id
WHERE m.id = 1
GROUP BY m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.url, d.id, d.first_name, d.last_name, df.id, df.file_name, df.url;
