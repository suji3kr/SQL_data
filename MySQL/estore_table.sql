--  estore DB (스키마)를 만들어라
CREATE DATABASE estore;   

-- UTF-8mb4 문자 세트와 utf8mb4_unicode_ci 콜레이션을 사용하는 것이 일반적으로 가장 권장되는 방법  (다양한 언어와 이모티콘 등의 문자를 지원)
CREATE DATABASE estore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 확인
show databases;


-- estore DB를 사용하겠다.
USE estore;

-- member table이 있다면 삭제해라 
DROP TABLE IF EXISTS member;


-- member 테이블을 ~~이런이런 조건(데이터 타입)으로 만들어라
CREATE TABLE member (
  username VARCHAR(10),
  userid VARCHAR(10),
  pwd VARCHAR(10),
  email VARCHAR(20),
  phone CHAR(13),
  admin TINYINT DEFAULT 0, -- 0: 사용자, 1: 관리자
  PRIMARY KEY (userid)
);

-- 테이블의 구조를 확인 
SHOW COLUMNS FROM member;


-- 테이블 확인
show tables;

-- insert문    
-- 1 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('유비', 'yoobi', '1234', 'gmd@naver.com', '010-1111-2222', 0);

-- 2 레코드 삽입member
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('관우', 'guanyu', '1234', 'ha12@naver.com', '010-2222-8888', 0);

-- 3 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('장비', 'jangbi', '1234', 'youn1004@naver.com', '010-3333-6666', 1);

-- 4 레코드 삽입
INSERT INTO member (username, userid, pwd, email, phone, admin)
VALUES ('손오공', 'ogong', '1234', 'youn1004@naver.com', '010-4444-9999', 0);

commit; -- 영구 저장

select *from member;

-- 검색
SELECT * FROM member WHERE userid = 'ogong';

-- update
UPDATE member SET phone = '010-7650-4321' WHERE userid = 'ogong';

-- 정렬
SELECT * FROM member ORDER BY email;
SELECT * FROM member ORDER BY username;


-- 이름역순 정렬
SELECT * FROM member ORDER BY username DESC;

-- 삭제
DELETE FROM member WHERE userid = 'ogong';

--  테이블 삭제 
drop table member;

show tables;

-- ---------------------------------------------

CREATE TABLE product (
  code INT AUTO_INCREMENT PRIMARY KEY,
  productname VARCHAR(100),
  price DECIMAL(8, 2),
  pictureurl VARCHAR(50),
  description VARCHAR(1000)
);


-- 테이블의 구조를 확인 
SHOW COLUMNS FROM product;

-- 테이블의 구조를 확인 
DESC product;

-- 테이블 확인
show tables;

-- insert문    
INSERT INTO product (productname, price, pictureurl, description)
VALUES ('개념을 콕콕 잡아주는 데이터베이스', 27000, 'db.jpg', '데이터 베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');

INSERT INTO product (productname, price, pictureurl, description)
VALUES ('웹표준을 위한 HTML5', 25000, 'html5.jpg', 'HTML5 가이드 북, 홈페이지 제작을 위한 필수 선택 HTML 기본 문법');

INSERT INTO product (productname, price, pictureurl, description)
VALUES ('Dynamic Programming book 시리즈 -오라클 11g+PL/SQL', 25000, 'oracle.jpg', 'Dynamic 실무 코칭 프로그래밍의 Book의 첫번째 책으로 11g의 새로운...');

INSERT INTO product (productname, price, pictureurl, description)
VALUES ('MySQL 성능 최적화', 26000, 'mysql.jpg', 'MYSQL을 더 빠르게, 성능 최적화 선택과 집중 :+');

INSERT INTO product (productname, price, pictureurl, description)
VALUES ('JQuery and jQuery Mobile: 이해하기 쉽게 풀어 쓴', 25000, 'jquery.jpg', '소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도...');


commit; -- 영구 저장

select *from product;  

-- 검색
SELECT * FROM product WHERE code = 1;

-- update
UPDATE product SET price = 99000  WHERE code = 2;


-- 정렬
SELECT * FROM product ORDER BY price;
SELECT * FROM product ORDER BY productname;

-- 이름역순 정렬
SELECT * FROM product ORDER BY price DESC;


show tables;

