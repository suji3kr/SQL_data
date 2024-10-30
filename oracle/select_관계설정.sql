DROP TABLE users CASCADE CONSTRAINTS;    --강제
drop table REVIEWS CASCADE CONSTRAINTS;


create table users(
    id INTEGER PRIMARY key,
    my_id INTEGER,                --Unique 있어야 1:1   속성이 관계설정을 바꿈   
    username varchar2(25) not null,
    enable char(1) default '1',
    last_login date default sysdate
);

create table addresses(
    user_id INTEGER PRIMARY key,    -- Primerary key 도 유니크 하기 때문에 ㅡmy_id 의 유니크가 사라져도, 주체가 바뀌게 관계설정을 하면된다.
    street VARCHAR2(30) not null,
    city VARCHAR2(30) not null,
    state VARCHAR2(30) not null
);

ALTER TABLE addresses ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (my_id);    --안에서 밖으로   pk -> fk
--CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (myid);
ALTER TABLE users ADD CONSTRAINT fk_addresses_id FOREIGN KEY (my_id) REFERENCES addresses (user_id);    --밖에서 안으로  fk-> pk


--- 1: 1 : 여러개 -> 기본키 or Unique 
