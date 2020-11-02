// 1
MATCH (r:Rater)
  WHERE r.name = 'Nikita'
RETURN r;

// 2
MATCH (rater)-[:RATING]->(movie)
  WHERE rater.name = 'Maxim'
RETURN movie;

// 3
MATCH (rater)-[r:RATING]->(movie)
  WHERE movie.name = 'The Godfather' AND r.movie_rating > 4
RETURN rater.name;

// 4
MATCH (genre)-[:is_genre_of]->(movie)
  WHERE genre.name = 'crime'
RETURN movie;

// 5
MATCH (m:Movie)
    WHERE m.year_of_publishing > 1990
RETURN m;

// 6
MATCH (movie: Movie {director: 'Francis Ford Coppola'})
WITH collect(DISTINCT movie) as movies_by_coppola
MATCH (movie: Movie)
WHERE NOT movie IN movies_by_coppola
RETURN movie.name, movie.director;

// 7
MATCH ((rater: Rater)-[curr_rating: RATING]->(movie: Movie))
WITH movie.name as movie_name, avg(curr_rating.movie_rating) as average_rating
WHERE average_rating > 6.5
RETURN movie_name, average_rating
ORDER BY average_rating;

// 8
MATCH ((rater: Rater)-[curr_rating: RATING]->(movie: Movie {name: '12 Angry Men'}))
WHERE rater.age > 25
RETURN rater.name;

// 9
MATCH (all_movies: Movie)
WITH count(all_movies) as number_of_all_movies
MATCH ((rater: Rater)-[curr_rating: RATING]->(movie: Movie))
WITH rater.name as rater_name,
     count(movie) AS number_of_movies_by_rater,
     number_of_all_movies as number_of_all_movies
WHERE number_of_movies_by_rater = number_of_all_movies
RETURN rater_name;

// 10
MATCH (genre)-[:is_genre_of]->(movie)
  WHERE movie.name = 'Schindler List'
RETURN genre;
