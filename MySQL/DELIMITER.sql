DELIMITER //
create procedure myProc()
begin 
	select * from member where member_name = '나훈아';
    select * from product where product_name = '삼각김밥';
end //
DELIMITER ;
    