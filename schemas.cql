MATCH (n)
DETACH DELETE n;

CREATE
(movie1: Movie {name: 'The Shawshank Redemption',
                     director: 'Frank Darabont',
                     year_of_publishing: 1994}),
       (movie2: Movie {name: 'The Godfather',
                     director: 'Francis Ford Coppola',
                     year_of_publishing: 1972}),
       (movie3: Movie {name: 'The Godfather: Part 2',
                     director: 'Francis Ford Coppola',
                     year_of_publishing: 1974}),
       (movie4: Movie {name: 'The Dark Knight',
                     director: 'Christopher Nolan',
                     year_of_publishing: 2008}),
       (movie5: Movie {name: '12 Angry Men',
                     director: 'Sidney Lumet',
                     year_of_publishing: 1957}),
       (movie6: Movie {name: 'Schindler List',
                     director: 'Stiven Spielberg',
                     year_of_publishing: 1993})

CREATE
(genre1: Genre {name: 'drama'}),
       (genre2: Genre {name: 'action'}),
       (genre3: Genre {name: 'crime'}),
       (genre4: Genre {name: 'history'}),
       (genre5: Genre {name: 'biography'})

CREATE
(rater1: Rater {name: 'Nikita', age: 19, sex: 'male'}),
       (rater2: Rater {name: 'Matvey', age: 22, sex: 'male'}),
       (rater3: Rater {name: 'Maxim', age: 45, sex: 'male'}),
       (rater4: Rater {name: 'Natasha', age: 45, sex: 'female'})
       
CREATE
((genre1)-[:is_genre_of]->(movie1)),
    ((genre1)-[:is_genre_of]->(movie2)),
    ((genre1)-[:is_genre_of]->(movie3)),
    ((genre1)-[:is_genre_of]->(movie4)),
    ((genre1)-[:is_genre_of]->(movie5)),
    ((genre1)-[:is_genre_of]->(movie6)),
       ((genre2)-[:is_genre_of]->(movie4)),
       ((genre3)-[:is_genre_of]->(movie2)),
       ((genre3)-[:is_genre_of]->(movie3)),
       ((genre3)-[:is_genre_of]->(movie4)),
       ((genre3)-[:is_genre_of]->(movie5)),
       ((genre4)-[:is_genre_of]->(movie6)),
       ((genre5)-[:is_genre_of]->(movie6))

CREATE
((rater1)-[:RATING {movie_rating: 10}]->(movie1)),
       ((rater1)-[:RATING {movie_rating: 4}]->(movie4)),
       ((rater1)-[:RATING {movie_rating: 7}]->(movie5)),
       ((rater1)-[:RATING {movie_rating: 9}]->(movie6)),

       ((rater2)-[:RATING {movie_rating: 3}]->(movie1)),
       ((rater2)-[:RATING {movie_rating: 9}]->(movie2)),
       ((rater2)-[:RATING {movie_rating: 9}]->(movie3)),
       ((rater2)-[:RATING {movie_rating: 9}]->(movie5)),
       ((rater2)-[:RATING {movie_rating: 8}]->(movie6)),

       ((rater3)-[:RATING {movie_rating: 7}]->(movie1)),
       ((rater3)-[:RATING {movie_rating: 7}]->(movie2)),
       ((rater3)-[:RATING {movie_rating: 6}]->(movie3)),
       ((rater3)-[:RATING {movie_rating: 7}]->(movie4)),
       ((rater3)-[:RATING {movie_rating: 10}]->(movie5)),
       ((rater3)-[:RATING {movie_rating: 8}]->(movie6)),

       ((rater4)-[:RATING {movie_rating: 3}]->(movie1)),
       ((rater4)-[:RATING {movie_rating: 3}]->(movie2)),
       ((rater4)-[:RATING {movie_rating: 2}]->(movie3)),
       ((rater4)-[:RATING {movie_rating: 10}]->(movie4)),
       ((rater4)-[:RATING {movie_rating: 4}]->(movie5)),
       ((rater4)-[:RATING {movie_rating: 6}]->(movie6))