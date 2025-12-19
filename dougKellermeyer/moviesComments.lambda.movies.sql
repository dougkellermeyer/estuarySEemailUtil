-- moviesComments.lambda.movies.sql
-- Runs for each document from dougKellermeyer/atlas1/sample_mflix/movies


INSERT INTO movies (movie_id, title, year, plot, num_comments, lastupdated)
VALUES (
  $._id,          -- adapt: whatever field Flow exposes for the movie id
  $title,
  $year,
  $plot,
  $num_mflix_comments,
  $lastupdated
)
ON CONFLICT(movie_id) DO UPDATE SET
  title        = excluded.title,
  year         = excluded.year,
  plot         = excluded.plot,
  num_comments = excluded.num_comments,
  lastupdated  = excluded.lastupdated;
