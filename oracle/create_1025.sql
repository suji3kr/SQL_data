--DDL 

--create 
--alt  
--drop 삭제 

create table sample_product (
        product_id NUMBER PRIMARY key,    --  중복불허, 필수 입력   + index자동 생성 //정렬
        product_name varchar2(30) not null,
        manu_date date not null
        );
        
-- drop table sample_product;

select * from sample_product;
insert into sample_product VALUES(1, 'television', to_date('241010', 'YYMMDD'));
insert into sample_product VALUES(2, 'washer', to_date('241015', 'YYMMDD'));
insert into sample_product VALUES(3, 'cleaner', to_date('241024', 'YYMMDD'));


----  테이블 변경 
-- sample_product테이블에 factory(varchar(10))추가

alter table sample_product ADD factory varchar(10);
ALter table sample_product;

---  열삭제
alter table sample_product drop column factory; 

----- factory varchar(30)으로 열변경 
ALTER TABLE sample_product MODIFY factory CHAR(30); 

----- 테이블의 열과 내용 삭제
DELETE from sample_product;

select *from sample_product;
rollback;

-- 텝이블의 열(빈칸으로) 두고 내용 삭제
Truncate table sample_product;
-- 빠르며, 롤백할 수 없습니다!!
-- 삭제된 행의 수가 매우 많을 때 효율적.


