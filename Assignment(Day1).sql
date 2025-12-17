CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(15) UNIQUE
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL
);
SELECT * FROM Book;

CREATE TABLE Librarian (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
SELECT * FROM Librarian;

CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);
SELECT * FROM Issue;

ALTER TABLE Member
ADD address VARCHAR(100);

DROP TABLE Librarian;

INSERT INTO Member VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9000001111', 'Chennai'),
(2, 'Priya Sharma', 'priya@gmail.com', '9000002222', 'Delhi');

INSERT INTO Book VALUES
(101, 'Database Systems', 'Navathe' ),
(102, 'Operating Systems', 'Silberschatz');

INSERT INTO Issue VALUES
(1, 1, 101, '2025-01-10', NULL),
(2, 2, 102, '2025-01-11', '2025-01-20');

UPDATE Book
SET author = 'Navathe B'
WHERE book_id = 101;

UPDATE Issue
SET return_date = '2025-01-18'
WHERE issue_id = 1;

DELETE FROM Issue
WHERE issue_id = 2;

DELETE FROM Member
WHERE member_id = 2;

SELECT * FROM Member;
