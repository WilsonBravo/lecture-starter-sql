CREATE TABLE "File" (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(255) NOT NULL,
    key VARCHAR(255) UNIQUE NOT NULL,
    url VARCHAR(255) NOT NULL
);
CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar_id INT,
    FOREIGN KEY (avatar_id) REFERENCES "File"(id)
);
CREATE TABLE "Country" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE "Person" (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    biography TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    primary_photo_id INT,
    FOREIGN KEY (country_id) REFERENCES "Country"(id),
    FOREIGN KEY (primary_photo_id) REFERENCES "File"(id)
);
CREATE TABLE "Movie" (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    budget DECIMAL(15, 2) NOT NULL,
    release_date DATE NOT NULL,
    duration INT NOT NULL,
    director_id INT NOT NULL,
    country_id INT NOT NULL,
    poster_id INT,
    FOREIGN KEY (country_id) REFERENCES "Country"(id),
    FOREIGN KEY (director_id) REFERENCES "Person"(id),
    FOREIGN KEY (poster_id) REFERENCES "File"(id)
);
CREATE TABLE "Genre" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE "Movie_Genre" (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
    FOREIGN KEY (genre_id) REFERENCES "Genre"(id)
);
CREATE TABLE "Character" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    role VARCHAR(255) CHECK (role IN ('leading', 'supporting', 'background')) NOT NULL,
    movie_id INT NOT NULL,
    person_id INT,
    FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
    FOREIGN KEY (person_id) REFERENCES "Person"(id)
);
CREATE TABLE "Person_Photo" (
    person_id INT NOT NULL,
    file_id INT NOT NULL,
    PRIMARY KEY (person_id, file_id),
    FOREIGN KEY (person_id) REFERENCES "Person"(id),
    FOREIGN KEY (file_id) REFERENCES "File"(id)
);
CREATE TABLE "Favorite_Movies" (
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES "User"(id),
    FOREIGN KEY (movie_id) REFERENCES "Movie"(id)
);