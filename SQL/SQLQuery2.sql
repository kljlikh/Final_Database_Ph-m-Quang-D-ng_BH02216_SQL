create database database02
use database02
create table Student(
StudentID int primary key,
StudentName nvarchar(50),
StudentAge int
)
create table Course(
CourseID int primary key,
CourseName nvarchar(50)
)
create table StudentCourse(
StudentID int foreign key references Student(StudentID),
CourseId int foreign key references Course(CourseID),
Primary key (StudentId,CourseId)
)