CREATE DATABASE collegeDB;
USE collegeDB;

CREATE TABLE students1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);

INSERT INTO students1 (student_id, student_name, marks) VALUES
(1, 'Arjun', 75),
(2, 'Meera', 82),
(3, 'Rohit', 68);

SELECT * FROM students1;
------------------------------------------------------
-- Increase Meera’s marks and COMMIT
START TRANSACTION;

UPDATE students1
SET marks = marks + 5
WHERE student_name = 'Meera';

COMMIT;

SELECT * FROM students1;
------------------------------------------------------
-- Reduce Rohit’s marks and ROLLBACK

UPDATE students1
SET marks = marks - 10
WHERE student_name = 'Rohit';

ROLLBACK;

SELECT * FROM students1;
------------------------------------------------------
-- Update Arjun's marks and COMMIT

UPDATE students1
SET marks = 80
WHERE student_name = 'Arjun';

COMMIT;

SELECT * FROM students1;
------------------------------------------------------
-- Partial Rollback using SAVEPOINT

UPDATE students1
SET marks = marks + 3
WHERE student_name = 'Meera';

SAVEPOINT sp1;

UPDATE students1
SET marks = marks + 4
WHERE student_name = 'Rohit';

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

SELECT * FROM students1;





