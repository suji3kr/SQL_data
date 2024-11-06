-- _____________________  프로시저  학습 시작 
USE market_db;


DROP PROCEDURE IF EXISTS ifproc1;

delimiter $$
	CREATE PROCEDURE ifproc1()
	BEGIN
		IF 100 = 100 THEN 
			SELECT '100은 100과 같습니다.';
		END IF;
	END $$
delimiter ;

call ifproc1();

delimiter $$
	CREATE PROCEDURE ifproc2()
	BEGIN
		declare myNum int;
        set myNum = 200;
		IF myNum = 100 THEN 
			SELECT '100입니다.';
		else
			select '100이 아닙니다.';
		END IF;
	END $$
delimiter ;

call ifproc2();

-- __________________________________



