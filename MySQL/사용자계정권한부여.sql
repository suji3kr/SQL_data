-- 데이터베이스 확인 및 생성
show databases;
create database webdb;

-- 사용자 확인
use mysql;
select user, host from user;

-- 사용자 계정 및 권한 부여 
create user dbuser@'%' identified by '12345';
grant all privileges on webdb.* to 'dbuser'@'%';
flush privileges;




-- 밑에만 실행 가능 -- 

grant all privileges on market_db.* to 'dbuser'@'%';
flush privileges;