CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE,
    name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    caption VARCHAR(255),
    post_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE likes (
    like_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    post_id INT,
    comment_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

CREATE TABLE followers (
    follower_id INT,
    following_id INT,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES users(user_id),
    FOREIGN KEY (following_id) REFERENCES users(user_id)
);

INSERT INTO users (username, name, email, country) VALUES
('nithyesh', 'Nithyesh', 'nithu@gmail.com', 'India'),
('rahul', 'Rahul', 'rahul@gmail.com', 'India'),
('anjali', 'Anjali', 'anjali@gmail.com', 'India'),
('kiran', 'Kiran', 'kiran@gmail.com', 'USA'),
('priya', 'Priya', 'priya@gmail.com', 'UK');

INSERT INTO posts (user_id, caption, post_date) VALUES
(1, 'My first post', '2024-01-01'),
(2, 'Hello world', '2024-01-02'),
(3, 'SQL is fun', '2024-01-03'),
(1, 'Learning SQL', '2024-01-04'),
(4, 'Travel vibes', '2024-01-05');

INSERT INTO likes (user_id, post_id) VALUES
(2,1),(3,1),(4,1),
(1,2),(3,2),
(2,3),(5,3),
(1,4),(2,4),(3,4),
(5,5);

INSERT INTO comments (user_id, post_id, comment_text) VALUES
(2,1,'Nice post'),
(3,1,'Great'),
(1,2,'Awesome'),
(5,3,'Good one'),
(4,5,'Amazing');

INSERT INTO followers VALUES
(1,2),(1,3),
(2,1),(3,1),
(4,1),(5,1),
(2,3),(3,2);
