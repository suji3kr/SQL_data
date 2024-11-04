use market_db;
select * from member;

select addr 주소, debut_date 데뷔_일자, mem_name from member;
use webdb;
select * from market_db.member;

select * from member where mem_name= '블랙핑크';
select * from member where mem_number= 4;

select mem_id, mem_name
	from member
    Where height <= 162;
    
select mem_name, height, mem_number
	from member
    where height >= 165 And mem_number >6;
    
    select mem_name, height, mem_number
	from member
    where height >= 165 or mem_number >6;

-- --------------------------------------------------------
        select mem_name, height
	from member
    where height >= 163 And height <= 165;
    
 -- =
 select mem_name, height
	from member
    where height between 163 and 165;
 
 -- ---------------------------------------------------------
     select mem_name, addr
	from member
    where addr = '경기' or addr = '전남' or addr = '경남';
    
   -- =
   select mem_name, addr
	from member
    where addr IN('경기', '전남', '경남');
    -- ----------------------------------------------------------
    
    select *
		from member
        where mem_name like '우%';
        
      select *
		from member
        where mem_name like '__핑크';
        
        
-- ______________________________________________________________

select height FROM member WHERE mem_name = '에이핑크';   -- 에이핑크 평균키 구하기
select mem_name, height FROM member WHERE height > 164;  -- 164보다 평균키가 큰회원

select mem_name, height FROM member
	where height > (SELECT height FROM member WHERE mem_name = '에이핑크');
    
    
-- ___________________________________________________Order by

select mem_id, mem_name, debut_date
	from member
    ORDER BY debut_date;  -- 데뷔일자
    
    select mem_id, mem_name, debut_date
	from member
    ORDER BY debut_date DESC;  -- 데뷔일자 늦은 순
    
     select mem_id, mem_name, debut_date
	from member
    where height >= 164
    ORDER BY height DESC;
    
    select mem_id, mem_name, debut_date, height
		from member
        WHERE height  >= 164
        ORDER BY height DESC, debut_date asc;
        -- 키 순 정렬 + 키가 같으면 데뷔일자가 빠른순으로 정렬
        
select* 
    from member
    LIMIT 3;
    
select mem_name, debut_date
		from member
        ORDER BY debut_date
        LIMIT 3;  -- 데뷔일자 빠른 회원 3건 추출 LIMIT(0,3) = 0부터3건
  
  select mem_name, height
		from member
        ORDER BY height DESC
        LIMIT 3, 2;
        
-- ______________________________

    
select addr FROM member ORDER BY addr;
    
select distinct addr FROM member;
-- distinct를 열이름 앞에 붙이면, 중복된 값은 1개만 출력...!

-- ______________________________________________________ Group by

select mem_id, amount FROM buy ORDER BY mem_id; 

-- 집계함수사용 각회원 아이디별로 구매한 개수 (amount )를 합쳐서 출력 = sum(), GROP BY
select mem_id, sum(amount) from buy GROUP BY mem_id; 
select mem_id"회원 아이디", sum(amount) "총 구매 개수" 
	from buy GROUP BY mem_id; 

-- 회원이 구매한 금액의 총합을 출력, 금액(price)  *수량(amount) 합계sum()
select mem_id"회원 아이디", sum(price*amount) "총 구매 금액" 
	from buy GROUP BY mem_id; 
    
select AVG(amount) "평균 구매 개수" FROM buy;

select AVG(amount) "평균 구매 개수" 
	FROM buy
    GROUP BY mem_id;
    
select count(*) FROM member;
select count(phone1) "연락처가 있는 회원" FROM member;

-- select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" 
-- 	from buy GROUP BY mem_id;  사용하여

-- select mem_id"회원 아이디", sum(price*amount) "총 구매 금액" 
-- 	from buy
--     WHERE sum(price*amount) >1000;
--     GROUP BY mem_id;                            ---where쓰면 오류 남 ...!!!!

 select mem_id"회원 아이디", sum(price*amount) "총 구매 금액" 
	from buy
	GROUP BY mem_id
    Having sum(price*amount) >1000;                 -- Having 절은 집계함수에 대한 조건을 제시할 때 GROUP 뒤에 쓰임!!! 
    
-- 총 구매액이 큰 사용자 부터 나타내려면  ORDER BY 사용 
 select mem_id"회원 아이디", sum(price*amount) "총 구매 금액" 
	from buy
	GROUP BY mem_id
    Having sum(price*amount) >1000
    ORDER BY SUM(price*amount) DESC;