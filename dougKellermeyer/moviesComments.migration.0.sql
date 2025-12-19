
-- Use migrations to create or alter tables that your derivation will use.
-- Each migration is run only once, and new migrations will be applied as needed.
--
-- For example, create the join table below, and then use it across multiple lambdas:
--
-- A first lambda that updates indexed state:
--
--   INSERT INTO my_join_table (id, joined_value) VALUES ($id, $my::value)
--     ON CONFLICT REPLACE;
--
-- A second lambda that reads out and joins over the indexed state:
--
--    SELECT $id, $other$value, j.joined_value FROM my_join_table WHERE id = $id;

-- Example structure only; adjust columns to match your actual schemas.

CREATE TABLE movies (
  movie_id   TEXT PRIMARY KEY NOT NULL,
  title      TEXT NOT NULL,
  year       INTEGER,
  updated_at TEXT NOT NULL,
  plot       TEXT NOT NULL,
  num_mflix_comments    INTEGER
);

CREATE TABLE comments (
  comment_id TEXT PRIMARY KEY NOT NULL,
  movie_id   TEXT NOT NULL,
  name       TEXT,
  email      TEXT,
  text       TEXT,
  date TEXT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE INDEX idx_comments_movie_id ON comments (movie_id);

