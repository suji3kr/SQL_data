-- 사용자 정보를 저장하는 테이블
CREATE TABLE users (
  id INTEGER,                     -- 사용자 고유 ID
  myid INTEGER UNIQUE,            -- 사용자 ID (고유)
  username VARCHAR2(25) NOT NULL, -- 사용자 이름 (NULL 불가)
  enabled CHAR(1) DEFAULT '1',    -- 사용자 활성화 상태 ('1'이면 활성화)
  last_login DATE DEFAULT SYSDATE, -- 마지막 로그인 날짜 (기본값: 현재 날짜)
  PRIMARY KEY (id)                -- 기본 키 설정: id
);

-- 사용자 주소 정보를 저장하는 테이블
CREATE TABLE addresses (
  user_id INTEGER NOT NULL,        -- 사용자 ID (NULL 불가)
  street VARCHAR2(30) NOT NULL,    -- 거리 주소 (NULL 불가)
  city VARCHAR2(30) NOT NULL,      -- 도시 (NULL 불가)
  state VARCHAR2(30) NOT NULL,     -- 주 (NULL 불가)
  PRIMARY KEY (user_id),           -- 기본 키 설정: user_id
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (myid) -- 외래 키 설정: users(myid) 참조
  -- users와 addresses 간의 1:N 관계: 한 사용자는 여러 주소를 가질 수 있음
);

-- 도서 정보를 저장하는 테이블
CREATE TABLE books (
  id INT,                          -- 도서 고유 ID
  title VARCHAR(100) NOT NULL,     -- 도서 제목 (NULL 불가)
  author VARCHAR(100) NOT NULL,    -- 저자 이름 (NULL 불가)
  published_date TIMESTAMP NOT NULL, -- 발행 날짜 (NULL 불가)
  isbn INT,                        -- ISBN 번호
  PRIMARY KEY (id),                -- 기본 키 설정: id
  UNIQUE (isbn)                    -- ISBN 고유 제약 조건 (중복 불가)
);

/*
  한 권의 도서는 여러 개의 리뷰를 가질 수 있는 1:N 관계
*/

-- 리뷰 정보를 저장하는 테이블
DROP TABLE IF EXISTS reviews;     -- 기존 리뷰 테이블이 존재하면 삭제
CREATE TABLE reviews (
  id INT,                          -- 리뷰 고유 ID
  book_id INT NOT NULL,            -- 도서 ID (NULL 불가)
  user_id INT NOT NULL,            -- 사용자 ID (NULL 불가)
  review_content VARCHAR2(255),    -- 리뷰 내용
  rating INT,                      -- 평점
  published_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 리뷰 발행 날짜 (기본값: 현재 시간)
  PRIMARY KEY (id),                -- 기본 키 설정: id
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE, -- 외래 키 설정: books(id) 참조 (삭제 시 연쇄 삭제)
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE  -- 외래 키 설정: users(id) 참조 (삭제 시 연쇄 삭제)
  -- books와 reviews 간의 1:N 관계: 한 도서는 여러 리뷰를 가질 수 있음
  -- users와 reviews 간의 1:N 관계: 한 사용자는 여러 리뷰를 남길 수 있음
);

/*
  사용자와 도서 간의 다대다 관계를 위한 조인 테이블
*/

-- 사용자와 도서의 대출 기록을 저장하는 테이블
CREATE TABLE users_books (
  user_id INT NOT NULL,            -- 사용자 ID (NULL 불가)
  book_id INT NOT NULL,            -- 도서 ID (NULL 불가)
  checkout_date TIMESTAMP,         -- 대출 날짜
  return_date TIMESTAMP,           -- 반납 날짜
  PRIMARY KEY (user_id, book_id),  -- 복합 기본 키 설정: (user_id, book_id)
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE, -- 외래 키 설정: users(id) 참조 (수정 시 연쇄 수정)
  FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE  -- 외래 키 설정: books(id) 참조 (수정 시 연쇄 수정)
  -- users와 books 간의 다대다 관계: 사용자는 여러 도서를 대출할 수 있고, 한 도서도 여러 사용자에 의해 대출될 수 있음
);
