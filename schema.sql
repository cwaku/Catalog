CREATE DATABSE IF NOT EXISTS `catalog`;

-- Create item table
CREATE TABLE IF NOT EXISTS `items` (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  author_id INT,
  archived BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
);

-- Create games table
CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(255),
  last_played_at DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES items (id)
);
-- Create authors table
CREATE TABLE authors (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY (id)
);

-- Create books table
CREATE TABLE books (
  id INT,
  title VARCHAR(100),
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY (id) REFERENCES items (id)
);

-- create labels table
CREATE TABLE labels (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100),
  PRIMARY KEY (id)
);
