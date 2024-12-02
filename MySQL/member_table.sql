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