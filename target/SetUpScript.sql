-- Drop the table if it already exists
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS NonRegisteredUser;
DROP TABLE IF EXISTS RegisteredUser;

-- Create a table to mirror the Java class fields:
CREATE TABLE User (
                      id        INTEGER             PRIMARY KEY AUTOINCREMENT,
                      email     VARCHAR(100)    NOT NULL UNIQUE,
                      password  VARCHAR(100)    NOT NULL,
                      name      VARCHAR(100)    NOT NULL
);