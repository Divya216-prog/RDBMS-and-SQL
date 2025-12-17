USE StudentRepo;

CREATE TABLE Lab1 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(20) NOT NULL,
    mark INT NOT NULL,
    gender VARCHAR(10) NOT NULL
);

INSERT INTO Lab1 VALUES
(1, 'John Deo', 'Four', 75, 'female'),
(2, 'Max Ruin', 'Three', 85, 'male'),
(3, 'Arnold', 'Three', 55, 'male'),
(4, 'Krish Star', 'Four', 60, 'female'),
(5, 'John Mike', 'Four', 60, 'female'),
(6, 'Alex John', 'Four', 55, 'male'),
(7, 'My John Rob', 'Five', 78, 'male'),
(8, 'Asruid', 'Five', 85, 'male'),
(9, 'Tes Qry', 'Six', 78, 'male'),
(10, 'Big John', 'Four', 55, 'female');

SELECT * FROM Lab1;

UPDATE Lab1
SET mark = 70
WHERE name='Arnold';

DELETE FROM Lab1
WHERE name = 'Tes Qry';

SELECT * FROM Lab1
ORDER BY mark ASC;

SELECT * FROM Lab1
ORDER BY mark DESC;

SELECT * FROM Lab1
WHERE gender = 'female';

SELECT * FROM Lab1
WHERE mark = (SELECT MIN(mark) FROM Lab1);

SELECT * FROM Lab1
WHERE mark = (SELECT MAX(mark) FROM Lab1);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    age INT,
    marks INT
);

INSERT INTO students VALUES (1, 'Divya', 'CSE', 22, 95);

INSERT INTO students VALUES
(2, 'Priya', 'ECE', 22, 92),
(3, 'Rahul', 'MECH', 21, 88),
(4, 'Sneha', 'CSE', 22, 90);

SELECT * FROM students;

INSERT INTO students VALUES (5, 'Kiran', 'EEE', 20, NULL);

INSERT INTO students (student_id, name, department) VALUES (6, 'Anita', 'CSE');

INSERT INTO students VALUES (7, 'Vikas', 'IT', 21, 88);

SELECT * FROM students;

SELECT * FROM students
WHERE department = 'CSE';

SELECT * FROM students WHERE marks > 70;

SELECT * FROM students
WHERE age BETWEEN 18 AND 22;

SELECT * FROM students ORDER BY marks DESC;

SELECT COUNT(*) AS total_students
FROM students;

UPDATE students
SET marks = 85
WHERE student_id = 3;

UPDATE students SET marks = marks + 5;

UPDATE students
SET department = 'AI'
WHERE student_id = 2;

UPDATE students
SET marks = 0
WHERE marks IS NULL;

UPDATE students
SET age = 21
WHERE department = 'ECE';

DELETE FROM students
WHERE student_id = 6;

DELETE FROM students
WHERE marks < 40;

DELETE FROM students
WHERE department = 'MECH';

DELETE FROM students;







