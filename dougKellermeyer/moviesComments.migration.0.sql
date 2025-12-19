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
  created_at TEXT NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE INDEX idx_comments_movie_id ON comments (movie_id);

