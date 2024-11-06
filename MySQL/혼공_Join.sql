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