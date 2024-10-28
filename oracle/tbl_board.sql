--drop table tbl_board;       //프로그램 기존 테이블 삭제
--drop SEQUENCE seq_board;    //기존 시퀀스 삭제 
--drop index pk_board;        //기존 보드 삭제
--기존 파일이 없는 곳에 드롭하면 에러남... 오라클말고 mySQL은 상시 드롭가능(mysql exists drop table) Drop table if exists<테이블명>


create SEQUENCE seq_board;

create table tbl_board(
    bno number(10,0),
    title varchar2 (200) not null,
    content varchar2(2000) not null,
    writer varchar(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate    
);
//수정
alter table tbl_board add constraint pk_board primary key(bno);  
//삽입
INSERT into tbl_board(bno, title, content, writer)
    values(seq_board.nextval, '텍스트 제목',' 테스트 내용', 'user00');
INSERT into tbl_board(bno, title, content, writer)
    values(seq_board.nextval, '텍스트 제목',' 테스트 내용', 'user00');
INSERT into tbl_board(bno, title, content, writer)
    values(seq_board.nextval, '텍스트 제목',' 테스트 내용', 'user00');
INSERT into tbl_board(bno, title, content, writer)
    values(seq_board.nextval, '텍스트 제목',' 테스트 내용', 'user00');
INSERT into tbl_board(bno, title, content, writer)
    values(seq_board.nextval, '텍스트 제목',' 테스트 내용', 'user00');    
    
select * from tbl_board;


//재귀 복사를 통해서 데이터 개수 늘리기
INSERT into tbl_board(bno, title, content, writer)
    (select seq_board.nextval, title, content, writer from tbl_board);
        
    
    
select * from tbl_board order by bno desc;  

select * from tbl_board order by bno+1 desc;   

-- 오라클 힌트 

--힌트 index를 명확하게  
 --단 오류 발생시 오류를 표시하지 않고 기본 값으로 출력 
select /*+ INDEX_DESC(tbl_board pk_board)*/* --전체를 보여줘 
from tbl_board
where bno>0;

select /*+ FULL(tbl_board)*/* from tbl_board order by bno desc;


-- rownum으로 1페이지 보기 
select /*+ INDEX_DESC(tbl_board) */ rownum rn, bno, title, content 
from tbl_board where ROWNUM <= 10;  --rn :게시판 번호  --bno :회원번호 

-- 2페이지 보기 
-- 머리 속에만 있고 실제로는 안됨.
select /*+ INDEX_DESC(tbl_board) */ rownum rn, bno, title, content 
from tbl_board where rownum>10 and rownum <=20;
--해결방안
--1단계: rownum은 반드시 1이 포함 되도록 해야 한다.
select /*+ INDEX_DESC(tbl_board) */ rownum rn, bno, title, content 
from tbl_board where rownum <=20; 

--2단계: 인라인 뷰를 사용...!!!
select bno, title, content 
from(select /*+ INDEX_DESC(tbl_board) */ rownum rn, bno, title, content 
    from tbl_board
    where rownum <=20) 
where rn >10;



