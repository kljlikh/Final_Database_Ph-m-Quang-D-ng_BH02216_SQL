create database Student_mng;
use Student_mng;
CREATE TABLE Tutor (
    Tutorkey nchar(10) primary key,
    TutorName nvarchar(50) not null,
    TutorEmail nvarchar(30)
);


select * FROM Tutor;

INSERT INTO Tutor (Tutorkey, TutorName, TutorEmail)
VALUES ('T1', 'An', 'an@gmai.com');

select * FROM Tutor;