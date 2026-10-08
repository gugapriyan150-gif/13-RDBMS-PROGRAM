CREATE DATABASE GUGAN;
USE GUGAN;
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL
);


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);


CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Faculty VALUES
(1, 'Engineering'),
(2, 'Science');


INSERT INTO Department VALUES
(101, 'Computer Science', 1),
(102, 'Information Technology', 1),
(103, 'Physics', 2);


INSERT INTO Course VALUES
(1001, 'BCA', 101),
(1002, 'BSc IT', 102),
(1003, 'BSc Physics', 103);


INSERT INTO Student VALUES
(1, 'Arun', 1001),
(2, 'Priya', 1002),
(3, 'Rahul', 1003),
(4, 'Kavin', 1001);


SELECT
    S.StudentID,
    S.StudentName,
    C.CourseName,
    D.DepartmentName,
    F.FacultyName
FROM Student S
JOIN Course C
    ON S.CourseID = C.CourseID
JOIN Department D
    ON C.DepartmentID = D.DepartmentID
JOIN Faculty F
    ON D.FacultyID = F.FacultyID;
