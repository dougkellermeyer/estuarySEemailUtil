INSERT INTO movies (movie_id, title, year, plot, num_comments, updated_at)
VALUES (
  $_id,          
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
  updated_at  = excluded.updated_at;

SELECT
  c.comment_id,
  c.movie_id,
  c.name,
  c.email,
  c.text,
  c.created_at,
  m.title,
  m.year,
  m.plot
FROM comments c
LEFT JOIN movies m ON m.movie_id = c.movie_id
WHERE c.comment_id = $_id;
