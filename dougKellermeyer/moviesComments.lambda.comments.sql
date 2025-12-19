INSERT INTO comments (comment_id, movie_id, name, email, text, created_at)
SELECT
  $_id        AS comment_id,
  $movie_id   AS movie_id,
  $name       AS name,
  $email      AS email,
  $text       AS text,
  $date       AS created_at
WHERE EXISTS (
  SELECT 1
  FROM movies m
  WHERE m.movie_id = $movie_id
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