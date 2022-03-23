CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(255),
  last_played_at DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES items (id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY (id)
);