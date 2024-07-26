erDiagram
    USER {
        int id
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id
    }
    FILE {
        int id
        string file_name
        string mime_type
        string key
        string url
    }
    MOVIE {
        int id
        string title
        text description
        float budget
        date release_date
        int duration
        int director_id
        int country_id
        int poster_id
    }
    GENRE {
        int id
        string name
    }
    COUNTRY {
        int id
        string name
    }
    MOVIE_GENRE {
        int movie_id
        int genre_id
    }
    CHARACTER {
        int id
        string name
        text description
        enum role
        int movie_id
        int person_id
    }
    PERSON {
        int id
        string first_name
        string last_name
        text biography
        date date_of_birth
        string gender
        int country_id
        int primary_photo_id
    }
    PERSON_PHOTO {
        int person_id
        int file_id
    }
    FAVORITE_MOVIES {
        int user_id
        int movie_id
    }

    USER ||--o{ FILE : "avatar_id"
    MOVIE ||--o{ COUNTRY : "country_id"
    MOVIE ||--o{ FILE : "poster_id"
    MOVIE ||--o{ PERSON : "director_id"
    MOVIE ||--o{ CHARACTER : "movie_id"
    MOVIE ||--o{ MOVIE_GENRE : "movie_id"
    GENRE ||--o{ MOVIE_GENRE : "genre_id"
    CHARACTER ||--o{ PERSON : "person_id"
    PERSON ||--o{ COUNTRY : "country_id"
    PERSON ||--o{ PERSON_PHOTO : "primary_photo_id"
    USER ||--o{ FAVORITE_MOVIES : "user_id"
    MOVIE ||--o{ FAVORITE_MOVIES : "movie_id"
    PERSON ||--o{ PERSON_PHOTO : "primary_photo_id"
    PERSON_PHOTO ||--o{ FILE : "file_id"
