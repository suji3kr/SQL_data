-- ________내부조인

USE market_db;
select * 
From buy
    Inner join member
    ON buy.mem_id =member.mem_id
WHERE buy.mem_id ='GRL';

-- ________내부 조인을 간결하게 하는 방법 

select buy.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) 연락처   -- buy. 필드명 기입 member.
From buy
    Inner join member
    ON buy.mem_id =member.mem_id;
    
    
-- ________테이블 명이 길어질 때 별칭/ 약호로

Select * 
from buy B, member M;  -- 인식 후 

Select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(M.phone1, M.phone2) 연락처 
from buy B 
	inner join member M
    on B.mem_id = M.mem_id;
    
    
-- ________________ 내부 조인 중복 불허 

select distinct M.mem_id, M.mem_name, M.addr
from buy B 
	 inner join member M
     on B.mem_id = M.mem_id
order by M.mem_id desc;

-- __________________________________________ 외부조인 한쪽에만 결과가 있어도 결과를 추출 할 수 있다. Left /Right /Full양쪽

select  M.mem_id, M.mem_name, B.prod_name, M.addr
from member M 
	 Left outer join buy B
     on M.mem_id = B.mem_id
order by M.mem_id;   -- 왼쪽 기준 아웃조인  오른쪽 관련없는 null사항도 알려줘버림

-- _______________________ 오른쪽 회원테이블 기준으로 외부조인 

select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B
	 right outer join member M
     on M.mem_id = B.mem_id
order by M.mem_id;  

-- 외부조인 활용 NULL  한번도 구매한 내역이 없는 회원의 목록을 추출

select distinct M.mem_id, M.mem_name, B.prod_name, M.addr
from member M 
	 Left outer join buy B
     on M.mem_id = B.mem_id
where B.prod_name IS NULL
order by M.mem_id;


--  FULL 조인 생략 (left, right 모두 포함)

-- __________________________________________자체 조인 : 하나의 테이블을 두개의 테이블로 인식해야 하기 때문에  테이블 별칭으로 두개인 것 처럼 사용.(실체는 하나)
drop table emp_table;
create table emp_table (
	emp char(4),
	manager char(4),
	phone varchar(8)
);
select * from emp_table;
insert into emp_table values('대표', null,'0000');
insert into emp_table values('영업이사', '대표','1111');
insert into emp_table values('관리이사', '대표','2222');
insert into emp_table values('정보이사', '대표','3333');
insert into emp_table values('영업과장', '영업이사','1111-1');
insert into emp_table values('경리부장', '관리이사','1111-2');
insert into emp_table values('인사부장', '관리이사','2222-2');
insert into emp_table values('개발팀장', '정보이사','3333-1');
insert into emp_table values('개발주임', '정보이사','3333-1-1');

-- ____ 자체 관계 /한개의 테이블을 가지고 두개의 이름을 만들어서 합침.
select A.emp '직원',B.emp '직속상관', B.phone '직속상관 연락처'
	from emp_table A
		INner Join emp_table B
        On A.manager = B.emp 
	WHERE A.emp = '경리부장';
    

    