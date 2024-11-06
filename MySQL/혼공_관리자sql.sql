
-- 다른 테이블 데이터를 한번에 입력하는 INSERT INTO ~ SELECT 

SELECT count(*) from world.city;   -- world 데이터의 city 테이블의 데이터 개수 확인  (관리자에서)
desc world.city;   				-- 필드명과 속성확인

select * from world.city limit 5;	-- 특정 범위만 출력할때
select * from world.city limit 5, 10;   -- 5 이후 부터 10개   // limit은 index를 기준으로 한다. 
select * from world.city limit 10, 10;    
-- ex. 게시판 페이지에 맞춰 보여주기 5페이지 (40, 10) 41~50 까지 보임

create table city_popul(
	city_name char(35),
    population int
);

insert into city_popul 
	select name, population from world.city;
    
select count(*)from city_popul;