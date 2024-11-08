use market_db;
DESC noTable;    -- 있는지 확인 

drop procedure if exists user_proc3;
delimiter $$
	create procedure user_proc3(
    IN txtValue char(10),
    out outValue Int
    )
    begin
    insert into noTable values(null, txtValue);
	select max(id) Into outValue from noTable;
	end$$
delimiter ;

call user_proc3('테스트1', @myValue);
select concat('입력한 ID값 ==>', @myValue);

 
 -- _______________________________________________

create table if not exists noTable(
	id int auto_increment primary key,
    txt char(10)
);

-- _________________________________________________

-- 0	24	13:06:15	create procedure user_proc3(
--      IN userName varchar(10),
--      out txtValue Int
--      )
--      begin
--      insert into noTable values(null, txtValue);
--   select max(id) Into outValue from noTable;
--   end	Error Code: 1327. Undeclared variable: outValue	0.000 sec
  
  -- OUTEVALUE 변수가 없다.