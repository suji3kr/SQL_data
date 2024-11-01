use webdb;
drop table member;
drop table product;
drop table product2;



create table member(
		member_id char(8) not null,
        member_name char(5) not null,
        member_addr char(20) not null
);

create table webdb.member(
		member_id char(8) not null,
        member_name char(5) not null,
        member_addr char(20) not null
);

ALTER TABLE member ADD PRIMARY KEY (member_id);

drop table product;
create table webdb.product(
		product_name char(4) not null,
        cost int not null,
        make_date Date,
        company char(5),
        amount int not null,
        primary key (product_name)
);

select * from member;

insert into member(member_id, member_name, member_addr)
	values('tess', '나훈아', '경기도 부천시 중동');
insert into member(member_id, member_name, member_addr)
	values('hreo', '임영웅', '서울 은평구 중산동');
insert into member(member_id, member_name, member_addr)
	values('iyou', '아이유', '인천 남구 주안동');
insert into member(member_id, member_name, member_addr)
	values('jyp', '박진영', '경기도 고양사 장항동');

insert into member(member_id, member_name, member_addr)
	values('carry', '머라이어', '미국 텍사스 사막');
    

DELETE FROM member
WHERE member_id = 'carry';
----------------------------------------------------------------
    
select * from product;

insert into product(product_name, cost, make_date, company, amount)
	values('바나나', 1500, '2021-07-01','델몬트', 17);
    
insert into product(product_name, cost, make_date, company, amount)
	values('카스', 2500, '2022-03-01','OB', 3);
    
insert into product(product_name, cost, make_date, company, amount)
	values('삼각김밥', 800, CURDATE(),'CJ', 22);
        
show tables;

------------------------------------------------------------------------
create table webdb.product2(
		product_name char(4) not null,
        cost int not null,
        make_date Date default (current_date),
        company char(5),
        amount int not null,
        primary key (product_name)
);

insert into product2(product_name, cost,  company, amount)
	values('바나나', 1500, '델몬트', 17);
    
insert into product2(product_name, cost, company, amount)
	values('카스', 2500, 'OB', 3);
    
insert into product2(product_name, cost, make_date, company, amount)
	values('삼각김밥', 800, '2023-09-01','CJ', 22);
    
 
select * from product2;