USE market_db;

CREATE TABLE hongong4 (
	tinyin_col TINYINT,
	SMALLINT_col SMALLINT,
	int_col int,
	bigint_col bigint);
	
SELECT * FROM market_db; 


-- 최대값  
INSERT INTO hongong4 VALUES (127, 32767, 214783647, 9000000000000000000); 
-- 쓸 수 있는 해당 범위 맞춰서 쓰면 메모리 절약됨.  


INSERT INTO hongong4 VALUES (127, 32767, 214783647, 90000000000000000000);
-- Out of range value 범위 초과 오류 


-- cast () 함수는 데이터를 문자로 변경 
SELECT  num, concat(CAST(price AS char), 'x',  CAST(amount AS char), '=')
'가격 x 수량', price* amount '구매액'
FROM buy;