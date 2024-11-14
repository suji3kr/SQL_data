use mydb;

Create table tblRegister(
id			VARCHAR(20) NOT null,
pwd			VARCHAR(20) NOT null,
name 		char(6) null,
num1        char(7) null,
num2        char(7) null,
email        VARchar(30) null,
phone         VARchar(30) null,
zipcode     char(5) null,
address     VARchar(60) null,
job         VARchar(30) null
);

Alter table tblRegister
ADD PRIMARY KEY (ID);

select * from tblRegister;
DESC tblRegister;


INSERT INTO
	tblRegister(ID, PWD, NAME, NUM1, NUM2, EMAIL, PHONE, ZIPCODE, ADDRESS, JOB)
	value('rorod', '1234', '이경민', '1234567', '1234567', 
    'roro@naver.com', '010-6666-8888', '1234', '경기도 성남', '개발자');


