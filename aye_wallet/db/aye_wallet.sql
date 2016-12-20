DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  category VARCHAR(255) UNIQUE
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  item VARCHAR(255),
  value NUMERIC NOT NULL CHECK (value > 0),
  merchant VARCHAR(255),
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  budget NUMERIC
);

INSERT INTO users (budget) VALUES (500);
INSERT INTO tags (category) VALUES ('food');
INSERT INTO tags (category) VALUES ('clothing');
INSERT INTO tags (category) VALUES ('sport');
INSERT INTO tags (category) VALUES ('culture');
INSERT INTO tags (category) VALUES ('travel');
INSERT INTO tags (category) VALUES ('electronics');
INSERT INTO tags (category) VALUES ('household');
INSERT INTO tags (category) VALUES ('car');
INSERT INTO tags (category) VALUES ('entertainment');
INSERT INTO tags (category) VALUES ('family');
INSERT INTO tags (category) VALUES ('friends');
INSERT INTO tags (category) VALUES ('presents');
INSERT INTO tags (category) VALUES ('health care');
INSERT INTO tags (category) VALUES ('monthly regulars');
INSERT INTO tags (category) VALUES ('other');
