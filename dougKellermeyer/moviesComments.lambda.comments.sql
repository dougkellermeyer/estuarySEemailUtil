INSERT INTO comments (comment_id, movie_id, name, email, text, created_at)
VALUES (
  $_id,         
  $movie_id,     
  $name,
  $email,
  $text,
  $date          
)
ON CONFLICT(comment_id) DO UPDATE SET
  movie_id   = excluded.movie_id,
  name       = excluded.name,
  email      = excluded.email,
  text       = excluded.text,
  created_at = excluded.created_at;

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