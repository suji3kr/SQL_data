drop table student;

CREATE TABLE student(
ID  int auto_increment primary  KEY,
Name VARCHAR(20),
Email VARCHAR(20)
);


select * from student;

INSERT INTO student(Name, Email) VALUES('kim', 'kim@test.com');

INSERT INTO student(name, email) VALUES('lee', 'lee@test.com');