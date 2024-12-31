use webdb;
drop table if exists hakjum_table;

create table hakjum_table(
    id bigint primary key auto_increment,
    boardID varchar(50),
    boardPass varchar(20),
    boardHakbun varchar(8) check (length(boardHakbun) = 8 and boardHakbun like '2024%'), -- 학번의 길이를 8로 제한하고 '2024'로 시작하도록
    boardName varchar(20),
    boardKo TINYINT UNSIGNED check (boardKo >= 0 and boardKo <= 100) default 0, -- 국어 점수 0~100 사이
    boardEg TINYINT UNSIGNED check (boardEg >= 0 and boardEg <= 100) default 0, -- 영어 점수 0~100 사이
    boardMath TINYINT UNSIGNED check (boardMath >= 0 and boardMath <= 100) default 0  -- 수학 점수 0~100 사이
);


INSERT INTO hakjum_table (boardID, boardPass, boardHakbun, boardName, boardKo, boardEg, boardMath)
VALUES ('suji', '1234', '20241948', '김수지', 80, 90, 100);



select * from hakjum_table;

drop table if exists hakjum_table;

-- ---------------------------------------------------------------

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
