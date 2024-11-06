use market_db;
drop table hongong1;
create table hongong1(
	toy_id int,
    toy_name char(4),
    age int
);

select * from hongong1;
insert into hongong1 values(1, '우디', 25);
insert into hongong1 (toy_id, toy_name) values(2, '버즈');
insert into hongong1 (toy_name, age, toy_id) values('제시', 20, 3);

-- _____________________________________________________________________________________________
drop table hongong2;   

create Table hongong2(
	toy_id int auto_increment primary key,  -- auto increament 자동증가  -> primary key 같이 // 시퀀스: 설정 많음 
    toy_name char(4),
    age int);

select * from hongong2;

insert into hongong2 (toy_name, age) values('보핍', 25);
insert into hongong2 (toy_name, age) values('슬링키', 22);
insert into hongong2 (toy_name, age) values('렉스', 21);

-- delete from hongong2 where toy_id =1;  -- 고유 번호 설정이라 윗번호(1) 제거시 그대로 2,3,4... 

alter table hongong2 auto_increment=100;
insert into hongong2 (toy_name, age) values('재남', 35);

-- ___________________________________________________________________________________________


drop table hongong3;
create Table hongong3(
	toy_id int auto_increment primary key, 
    toy_name char(4),
    age int);

alter table hongong3 auto_increment=1000;  -- 1000부터 index지정 값 정해두기 
set @@auto_increment_increment = 3; -- 시스템 변수 값 3 으로 지정 + 3 단위

select * from hongong3;
select @@auto_increment_increment; -- 시스템 변수 실행 확인 


insert into hongong3 (toy_name, age) values('토마스', 20);
insert into hongong3 (toy_name, age) values('제임스', 20);
insert into hongong3 (toy_name, age) values('고든', 20);

-- ____________________________________________________________________________________________

-- 다른 테이블 데이터를 한번에 입력하는 INSERT INTO ~ SELECT 

SELECT count(*) from world.city;   -- world 데이터의 city 테이블의 데이터 개수 확인  (관리자에서)


select * from city_popul where city_name ='Seoul';

update city_popul
set city_name = '서울'
where city_name = 'Seoul';

select * from city_popul where city_name= '서울';

update city_popul
set city_name = '뉴욕', population = 0 
where city_name = 'New York';

select * from city_popul where city_name= '뉴욕';

Delete from city_popul




