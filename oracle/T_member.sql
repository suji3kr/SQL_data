-- 기존 테이블 삭제
DROP TABLE T_MEMBER;

-- 테이블 생성 (Oracle 문법에 맞게 수정)
CREATE TABLE T_MEMBER (
    id VARCHAR2(10) PRIMARY KEY,
    pwd VARCHAR2(10),
    name VARCHAR2(50),
    email VARCHAR2(50),
    joinDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- 특정 데이터 삭제 (예: 'soon' 아이디로 된 데이터 삭제)
DELETE FROM T_MEMBER WHERE id = 'soon';

-- 데이터 삽입 (joinDate는 자동으로 CURRENT_TIMESTAMP가 설정됨)
INSERT INTO T_MEMBER (id, pwd, name, email)
VALUES ('soon', '1414', '김순수', 'kim@naver.com');

-- 데이터 삽입 (joinDate는 자동으로 CURRENT_TIMESTAMP가 설정됨)
INSERT INTO T_MEMBER (id, pwd, name, email)
VALUES ('choi', '1515', '최미삼', 'choi@naver.com');

-- 데이터 삽입 (joinDate는 자동으로 CURRENT_TIMESTAMP가 설정됨)
INSERT INTO T_MEMBER (id, pwd, name, email)
VALUES ('kyo', '1213', '교촌', 'kyochon@naver.com');

-- 전체 데이터 조회
SELECT * FROM T_MEMBER;
