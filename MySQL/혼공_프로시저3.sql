call ifproc2();
delimiter $$
	CREATE PROCEDURE ifproc3()
	BEGIN
		declare debutDate date;  -- 데뷔일자
        declare curDate date;     -- 오늘 
        declare days int;		-- 활동한 일 수 
        select debut_date into debutDate   -- select into = debuDate변수에 내용 저장 / select from 이랑 다름
        from market_db.member
        where mem_id = 'APN';
        
        set curDate = current_date();   -- 현재날짜
        set days = datediff(curDate, debutDate);
        
		IF (days/365) >= 5 THEN   -- 5년이 지났다면
			SELECT concat('데뷔한 지', days, '일이나 지났습니다. 핑순 축하');
		else
			SELECT concat('데뷔한 지', days, '일 밖에 안되었네요. 핑순화이팅');
		END IF;
	END $$
delimiter ;

call ifproc3();

-- ____________________________________________________

delimiter $$
	CREATE PROCEDURE caseproc()
	BEGIN
		declare point int;
        declare credit char(1);
        set point = 88;
		case 
        when point >= 90 then 
			set credit = 'A';
		when point >= 80 then 
			set credit = 'B';
		when point >= 70 then 
			set credit = 'C';
		when point >= 60 then 
			set credit = 'D';
		else
			set credit ='F';
		end case;
            
		select concat('취득점수==>', point), concat('학점===>',credit);
		
	END $$
delimiter ;

call caseproc();
