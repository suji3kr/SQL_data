
-- 회원 등급과 총 구매액 계산
Select M.mem_id, M.mem_name, SUM(price*amount) "총구매액",
	case 
		when (SUM(price*amount) >= 1500) THEN '최우수고객'
        when (SUM(price*amount) >= 1000) THEN '우수고객'
        when (SUM(price*amount) >= 1) THEN '일반고객'
		else '유령고객'
        
	END "회원등급"
From buy B
		Right Outer join member M
        on B.mem_id = M.mem_id
Group By M.mem_id
ORDER BY SUM(price*amount) DESC;

-- ________________________________________________________
-- 1부터 100 까지의 합 계산 (4의 배수 제외, 합이 1000을 초과하면 종료) 
Drop PROCEDURE IF EXISTS whileProc2;
DELIMITER $$
create Procedure whileproc2()
begin 
	declare i int;-- 1에서 100까지 증가할 변수
    declare hap int;  -- 더한 값을 누적할 변수 
    SET i = 1;
    SET hap =0;
    
    myWhile:
    WHILE (i <= 100) Do
		IF (i%4 = 0 ) THEN
				SET i = i + 1;
                ITERATE myWhile; -- 지정한 albel 문으로 가서 계속 진행 
        END IF;
        SET hap = hap +i;
        IF (hap > 1000) THEN 
			LEAVE myWhile; -- 지정한 label 문을 떠남. 즉 while 종료
		END IF;
        SET i = i +1;
	END WHILE;
    
    SELECT '1부터 100 까지의 합 (4의 배수 제외), 100넘으면 종료-->', hap;
END $$
DELIMITER ;
CALL whileProc2();
		