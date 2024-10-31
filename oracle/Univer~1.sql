CREATE TABLE STUDENT 
        (STUDNO NUMBER(5) PRIMARY KEY,
         NAME VARCHAR2(10),
         USERID varchar2(10),
         GRADE VARCHAR2(1),
         IDNUM VARCHAR2(13),
         BIRTHDATE DATE,
         TEL VARCHAR2(13),
         HEIGHT NUMBER(5,2),
         WEIGHT NUMBER(5,2),
         DEPTNO NUMBER(4),
         PROFNO NUMBER(4),
         FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT (DEPTNO) ON DELETE CASCADE
);
         
         
         
CREATE TABLE PROFESSOR (
    PROFNO NUMBER(4) PRIMARY KEY,
    NAME VARCHAR2(10),
    USERID VARCHAR2(10),
    POSITION VARCHAR2(20),
    SAL NUMBER(10),
    HIREDATE DATE,
    COMM NUMBER(2),
    DEPTNO NUMBER(4),
    FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT (DEPTNO) ON DELETE CASCADE
);