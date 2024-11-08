use market_db;
drop procedure if exists user_proc1;
delimiter $$
	create procedure user_proc1(IN userName varchar(10))
    begin 
		select * from member where mem_name = userName;
	end$$
delimiter ;

call user_proc1('에이핑크');