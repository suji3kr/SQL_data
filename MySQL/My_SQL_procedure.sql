use market_db;
drop procedure if exists user_proc;
delimiter $$
	create procedure user_proc()
    begin 
		select * from member;
	end$$
delimiter ;

call user_proc();

drop procedure user_proc;