use webdb;
drop table if exists board_table;
create table board_table(
	id bigint primary key auto_increment,
    boardWriter varchar(50),
    boardPass varchar(20),
    boardTitle varchar(50),
    boardContents varchar(500),
    boardCreatedTime datetime default now(),
    boardHits int default 0,
    fileAttached int default 0
);

drop table if exists board_table;
create table board_file_table(
	id bigint primary key auto_increment,
    originaFileName varchar(100),
    storedFileName varchar(100),
    boardId bigint,
    constraint fk_board_file foreign key(boardId) references board_table(id) on delete cascade
);

drop table if exists comment_table;
create table comment_table(
    id bigint primary key auto_increment,
    commentWriter varchar(50),
    commentContents varchar(200),
    boardId bigint,
    commentCreatedTime datetime default now(),
    constraint fk_comment_table foreign key (boardId) references board_table(id) on delete cascade
);

select * from board_table;

delete from board_table where id = 16;


SELECT * FROM board_table;

-- 현페이지 3개식 출력
select * from board_table order by id desc limit 0, 3; -- 12, 11, 10
select * from board_table order by id desc limit 1, 3; -- 11, 10, 9
select * from board_table order by id desc limit 2, 3; -- 10, 9, 8
select * from board_table order by id desc limit 3, 3; -- 9, 8, 7

select * from board_table order by id desc limit 0, 5; -- 12, 11, 10, 9, 8

-- 1page: 12,11,10,  2page: 9, 8, 7,  3page: 6, 5, 4 
select * from board_table order by id desc limit 0, 3; -- 12, 11, 10
select * from board_table order by id desc limit 3, 3; -- 9, 8, 7
select * from board_table order by id desc limit 6, 3; -- 6, 5, 4
