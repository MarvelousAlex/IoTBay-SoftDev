DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS UserAccessLog;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;

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

CREATE TABLE UserAccessLog (
                               userAccessLogId   INTEGER       PRIMARY KEY AUTOINCREMENT,
                               userId            INTEGER       NOT NULL,
                               userType          VARCHAR(50),
                               loginTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               logoutTime        DATETIME
);

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

-- speed lookups by email or name
CREATE INDEX idx_Staff_email
    ON Staff(email);
CREATE INDEX idx_Staff_name
    ON Staff(staff_name);

CREATE TABLE Category (
                          category_id INT PRIMARY KEY,
                          category VARCHAR(255)
);

CREATE TABLE Orders (
                        order_id INT PRIMARY KEY,
                        create_date TIMESTAMP,
                        order_status VARCHAR(50),
                        quantity INT,
                        buyer_id INT,
                        FOREIGN KEY (buyer_id) REFERENCES User(userId)
);

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


INSERT INTO Staff (
    staff_name, password, phone_num, email, position, status, address, city, postcode, state, country
) VALUES
      ('Alice Johnson', 'password123', 61412345678, 'alice.johnson@example.com', 'Manager', 'Active',
       '12 King St', 'Sydney', '2000', 'NSW', 'Australia'),

      ('Michael Chen', 'pass456', 61498765432, 'michael.chen@example.com', 'Customer Support', 'Active',
       '88 Harbour Rd', 'Melbourne', '3000', 'VIC', 'Australia'),

      ('Sophie Williams', 'secure789', 61455566777, 'sophie.williams@example.com', 'HR Officer', 'Inactive',
       '5 River Lane', 'Brisbane', '4000', 'QLD', 'Australia'),

      ('Daniel Kim', 'admin999', 61411223344, 'daniel.kim@example.com', 'Administrator', 'Active',
       '190 Oxford St', 'Perth', '6000', 'WA', 'Australia'),

      ('Emily Zhang', 'pw123456', 61466778899, 'emily.zhang@example.com', 'Finance Officer', 'On Leave',
       '77 Spring Blvd', 'Adelaide', '5000', 'SA', 'Australia');


INSERT INTO User (
    username, password, firstName, lastName, phone, type, email, status,
    address, city, state, postcode, country
) VALUES
      ('wendyzhou', 'password123', 'Wendy', 'Liu', 61411112222, 'Customer',
       'wendy.liu@example.com', 'Active',
       '10 Garden Road', 'Sydney', 'NSW', 2000, 'Australia'),

      ('johnsmith', 'jsmith456', 'John', 'Smith', 61422223333, 'Admin',
       'john.smith@example.com', 'Active',
       '22 Ocean Avenue', 'Melbourne', 'VIC', 3000, 'Australia'),

      ('emmabrown', 'emma789', 'Emma', 'Brown', 61433334444, 'Customer',
       'emma.brown@example.com', 'Inactive',
       '55 Park Street', 'Brisbane', 'QLD', 4000, 'Australia'),

      ('davidwang', 'secure999', 'David', 'Wang', 61444445555, 'Staff',
       'david.wang@example.com', 'Active',
       '78 Riverway Blvd', 'Perth', 'WA', 6000, 'Australia'),

      ('samanthachan', 'pass2024', 'Samantha', 'Chan', 61455556666, 'Customer',
       'samantha.chan@example.com', 'On Hold',
       '33 Sunset Drive', 'Adelaide', 'SA', 5000, 'Australia');
