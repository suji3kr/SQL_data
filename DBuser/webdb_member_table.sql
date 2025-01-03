CREATE DATABASE webdb;

USE webdb;

use webdb;

drop table if exists member_table;

create table member_table(
    id bigint primary key auto_increment,
    memberEmail varchar(20) unique,
    memberPassword varchar(20),
    memberName varchar(20),
    memberAge int,
    memberMobile varchar(30)
);

SELECT *FROM member_table;

INSERT INTO member_table (memberEmail, memberPassword, memberName, memberAge, memberMobile) VALUES('aa', 'aa', 'aa', 11,  'aa');
INSERT INTO member_table (memberEmail, memberPassword, memberName, memberAge, memberMobile) VALUES('bb', 'bb','bb',  22,  'bb');
INSERT INTO member_table (memberEmail, memberPassword, memberName, memberAge, memberMobile) VALUES('cc', 'cc', 'cc', 33,  'cc');