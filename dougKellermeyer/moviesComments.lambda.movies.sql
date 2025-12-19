INSERT INTO movies (movie_id, title, year, plot, num_comments, lastupdated)
VALUES (
  $._id,          
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
