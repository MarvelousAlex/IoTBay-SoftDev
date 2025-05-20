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
-- Drop Payments table if it already exists
DROP TABLE IF EXISTS Payments;

-- Create Payments table
CREATE TABLE Payments (
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          userId INTEGER NOT NULL,
                          method TEXT NOT NULL,
                          cardNumber TEXT NOT NULL,
                          amount REAL NOT NULL,
                          date TEXT NOT NULL,
                          status TEXT NOT NULL,
                          FOREIGN KEY (userId) REFERENCES User(id)
);