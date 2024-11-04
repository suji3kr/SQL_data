drop table users;

create table users (
	userid          varchar2(50)	primary key, 
	username		    varchar2(50)	not null,
	userpassword	  varchar2(50)	not null,
	userage			    number(3)		  not null,
	useremail		    varchar2(50)	not null
);


-----------------------------------------------------------


CREATE OR REPLACE PROCEDURE user_create (
    a_userid        IN  users.userid%TYPE, 
    a_username      IN  users.username%TYPE,
    a_userpassword  IN  users.userpassword%TYPE,
    a_userage       IN  users.userage%TYPE,
    a_useremail     IN  users.useremail%TYPE,
    a_rows          OUT PLS_INTEGER
) 
IS
BEGIN
    INSERT INTO users (userid, username, userpassword, userage, useremail)
    VALUES (a_userid, a_username, a_userpassword,  a_userage, a_useremail);
    a_rows := SQL%ROWCOUNT;
    COMMIT;
END;