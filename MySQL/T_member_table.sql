
drop table t_member;

CREATE TABLE T_member(
			id varchar(10)primary key,
            pwd varchar(10),
            name varchar(50),
            email varchar(50),
            joinDate Datetime default current_timestamp not null
);

delete from T_member where id = 'soon';

insert into T_member(id, pwd, name, email)  -- joindate 안쓰고 default 값으로 넣지 않기 = 현재 날짜시간
values('soon','1414','김순수','kim@naver.com');


insert into T_member(id, pwd, name, email)  -- joindate 안쓰고 default 값으로 넣지 않기 = 현재 날짜시간
values('choi','1515','최미삼','choi@naver.com');


insert into T_member(id, pwd, name, email)  -- joindate 안쓰고 default 값으로 넣지 않기 = 현재 날짜시간
values('kyo','1213','교촌','kyochon@naver.com');

select *from t_member;



