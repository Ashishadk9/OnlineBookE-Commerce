-- ===================================
-- UniqueBooks database - seed date
-- run this after uniquebooks.sql
-- ===================================

CREATE DATABASE IF NOT EXISTS uniquebooks;
USE uniquebooks;


-- Clear all initial data if there are any data
DROP TABLE if exists order_items;
DROP TABLE if exists orders;
DROP TABLE if exists  books;
DROP TABLE if exists users;





-- USERS TABLE
CREATE TABLE users (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       full_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       phone VARCHAR(20) UNIQUE NOT NULL,
                       password VARCHAR(225) NOT NULL,
                       role ENUM('admin','user') DEFAULT 'user',
                       status ENUM('pending', 'approved') DEFAULT 'pending',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE feedback(id INT PRIMARY KEY AUTO_INCREMENT,fmessage varchar(200) NOT NULL);


-- Books TABLE
CREATE TABLE books (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(200) NOT NULL,
                       isbn VARCHAR(20) UNIQUE NOT NULL,
                       genre VARCHAR(100),
                       author VARCHAR(100),
                       published_date DATE,
                       price DECIMAL(10,2),
                       stock INT DEFAULT 0,
                       description TEXT,
                       image_path VARCHAR(255)
);

-- Orders TABLE
CREATE TABLE orders (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        order_number VARCHAR(20) UNIQUE NOT NULL,
                        user_id INT NOT NULL,
                        order_date DATE NOT NULL,
                        total_amount DECIMAL(10,2),
                        status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
                        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- order items table
CREATE TABLE order_items (
                             id INT PRIMARY KEY AUTO_INCREMENT,
                             order_id INT NOT NULL,
                             book_id INT NOT NULL,
                             quantity INT NOT NULL,
                             price DECIMAL(10,2),
                             FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
                             FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);


ALTER TABLE users AUTO_INCREMENT =1;
ALTER TABLE books AUTO_INCREMENT =1;
ALTER TABLE orders AUTO_INCREMENT =1;
ALTER TABLE order_items AUTO_INCREMENT =1;



-- ADMIN USER (password: admin123)
INSERT INTO users (full_name, email, phone, password, role, status) VALUES
    ('Testuser', 'admin@uniquebooks.com','9812345678', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EfMlGqYVq6N9Xk0Yj6E2dm',
     'user', 'approved');

-- Regular users (approved and pending)
INSERT INTO users (full_name, email, phone, password, role, status) VALUES
                                                                        ('Neha Sharma', 'neha@example.com', '9812345688', '$2a$10$dummyhash','user','approved'),
                                                                        ('Karan kc', 'karan@example.com', '9812345689', '$2a$10$dummyhash','user','approved'),
                                                                        ('Dev Sharma', 'dev@example.com', '9812345680', '$2a$10$dummyhash','user','approved'),
                                                                        ('Ram Thapa', 'ram@example.com', '9812345691', '$2a$10$dummyhash','user','approved');

INSERT INTO users (full_name, email, phone, password, role, status) VALUES
                                                                        ('Aman Sharma', 'aman@example.com', '9801122334', '$2a$10$dummyhash','user','pending'),
                                                                        ('Anubhav Thapa', 'anubhav@example.com', '9801122335', '$2a$10$dummyhash','user','pending'),
                                                                        ('Binita Poudel', 'binita@example.com', '9801122336', '$2a$10$dummyhash','user','pending');

-- =========== UniqueBooks 10 Books ===============
INSERT INTO books (title,isbn, genre,author, published_date, price, stock,description, image_path) VALUES
                                                                                                       ('Think and Grow Rich', '978-1593302009', 'Self-Help', 'Napoleon Hill', '1937-04-12', 2350.00, 8,
                                                                                                        'A classic guide on mindset and wealth creation.','static/images/book1.png'),
                                                                                                       ('The Odyssey', '978-0393089059', 'Classic Epic', 'Emily Wilson', '2017-01-08', 990.00, 15,
                                                                                                        'A modern translation of odysseus.','static/images/book2.png'),
                                                                                                       ('Atomic Habits', '978-0735211292', 'Self-Help', 'James Clear', '2018-09-30', 1690.00, 11,
                                                                                                        'A system for building small, last habits.','static/images/book3.png'),
                                                                                                       ('Fundamentals of Data Engineering', '978-1098108304', 'Technology', 'Matt Housley', '2022-06-15', 2490.00, 6,
                                                                                                        'A Programming data lifecycle and tips.','static/images/book4.png'),
                                                                                                       ('The Correspondent', '978-1250330680', 'Fiction', 'Virginia Evans', '2024-11-02', 1390.00, 9,
                                                                                                        'A novel exploring truth and journalism.','static/images/book5.png'),
                                                                                                       ('History Matters', '978-1668052563', 'History', 'David McCullough', '2024-02-20', 2150.00, 5,
                                                                                                        'Collected essays on the important of the past.','static/images/book6.png'),
                                                                                                       ('The Second World War', '978-0316023740', 'History', 'Antony Beevor', '2012-08-05', 1450.00, 12,
                                                                                                        'A comprehensive global narrative of war two.','static/images/book7.png'),
                                                                                                       ('Project Hail Mary', '978-0593135204', 'Sci-Fi', 'Andy Weir', '2021-05-17', 1190.00, 20,
                                                                                                        'An amnesiac scientist must save earth.','static/images/book8.png'),
                                                                                                       ('Red Rising', '978-0345539786', 'Sci-Fi', 'Pierce Brown', '2014-05-17', 1550.00, 7,
                                                                                                        'A miner leads a revolution on mars.','static/images/book9.png'),
                                                                                                       ('Ting Css Projects', '978-1633439436', 'Technology', 'M. Dowden', '2023-10-25', 1850.00, 10,
                                                                                                        'Hand-on projects for web styling.','static/images/book10.png');


-- ========= Order (recent dates using for dashboard ==========
INSERT INTO orders (order_number, user_id, order_date, total_amount, status) VALUES
                                                                                 ('ORD-1042', (SELECT id FROM users WHERE email='neha@example.com'), DATE_SUB(CURDATE(), INTERVAL 3 DAY), 3050.00,'delivered'),
                                                                                 ('ORD-1041', (SELECT id FROM users WHERE email='karan@example.com'), DATE_SUB(CURDATE(), INTERVAL 3 DAY), 950.00,'shipped'),
                                                                                 ('ORD-1040', (SELECT id FROM users WHERE email='dev@example.com'), DATE_SUB(CURDATE(), INTERVAL 4 DAY), 650.00,'delivered'),
                                                                                 ('ORD-1039', (SELECT id FROM users WHERE email='ram@example.com'), DATE_SUB(CURDATE(), INTERVAL 5 DAY), 2060.00,'delivered'),
                                                                                 ('ORD-1038', (SELECT id FROM users WHERE email='binita@example.com'), DATE_SUB(CURDATE(), INTERVAL 6 DAY), 4400.00,'cancelled');

-- ====== Order items =======
INSERT INTO order_items (order_id, book_id, quantity, price) VALUES
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1042'),1,2,1450.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1042'),3,1,990.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1041'),6,1,1190.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1040'),2,1,2350.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1040'),4,2,1850.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1039'),5,1,1550.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1039'),7,1,2150.00),
                                                                 ((SELECT id FROM orders WHERE order_number='ORD-1038'),8,3,1390.00);