DROP TABLE IF EXISTS User;

CREATE TABLE User (
                      userId     INTEGER       PRIMARY KEY AUTOINCREMENT,
                      username   VARCHAR(50)   NOT NULL UNIQUE,
                      password   VARCHAR(255)  NOT NULL,
                      firstName  VARCHAR(100)  NOT NULL,
                      lastName   VARCHAR(100)  NOT NULL,
                      phone      BIGINT,
                      type       VARCHAR(50),
                      email      VARCHAR(150)  NOT NULL UNIQUE,
                      status     VARCHAR(50),
                      address    VARCHAR(255),
                      city       VARCHAR(100),
                      state      VARCHAR(100),
                      postcode   INTEGER,
                      country    VARCHAR(100)
);

DROP TABLE IF EXISTS UserAccessLog;

CREATE TABLE UserAccessLog (
                               userAccessLogId   INTEGER       PRIMARY KEY AUTOINCREMENT,
                               userId            INTEGER       NOT NULL,
                               userType          VARCHAR(50),
                               loginTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               logoutTime        DATETIME
);

DROP TABLE IF EXISTS Staff;

CREATE TABLE Staff (
                       staff_id    INTEGER       PRIMARY KEY AUTOINCREMENT,
                       staff_name  VARCHAR(100)  NOT NULL,
                       password   VARCHAR(255)  NOT NULL,
                       phone_num   BIGINT,
                       email      VARCHAR(150)  NOT NULL UNIQUE,
                       position   VARCHAR(100),
                       status     VARCHAR(50),
                       address    VARCHAR(255),
                       city       VARCHAR(100),
                       postcode   VARCHAR(20),
                       state      VARCHAR(100),
                       country    VARCHAR(100)
);

-- Optional: speed lookups by email or name
CREATE INDEX idx_Staff_email
    ON Staff(email);
CREATE INDEX idx_Staff_name
    ON Staff(staff_name);

DROP TABLE IF EXISTS Category;

CREATE TABLE Category (
                          category_id INT PRIMARY KEY,
                          category VARCHAR(255)
);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
                        order_id INT PRIMARY KEY,
                        create_date TIMESTAMP,
                        order_status VARCHAR(50),
                        quantity INT,
                        buyer_id INT,
                        FOREIGN KEY (buyer_id) REFERENCES User(userId)
);

DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
                         product_id INT PRIMARY KEY,
                         product_name VARCHAR(255),
                         quantity INT,
                         price DECIMAL(10, 2),
                         description TEXT,
                         image VARCHAR(512),
                         category_id INT,
                         FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
