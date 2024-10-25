------ QUIZ --------
--**서브쿼리퀴즈 employees 테이블의 last_name이 'De Haan'인 직원과 salary가 동일한 직원에는 누가 있는지 단 행 서브쿼리를 이용해서 출력.
select salary
from employees
where
 last_name= 'De Haan';
    

select * 
from employees A
where A.salary = 17000;



-- 변수화 간결--
SELECT  
    last_name, 
    salary
FROM 
    employees
WHERE 
    salary = (SELECT (salary) FROM employees WHERE last_name = 'De Haan');
    
----   단일행 서브쿼리_  SQLD 시험 기본 ----    
select * 
from employees A
where A.salary =( select salary 
                from employees
                where last_name = 'De Haan'
                );
                
--- 다중행 서브쿼리_ ----
----
select salary 
from employees
where last_name = 'Taylor';  --  결과 두개이상인 조건--

select * 
from employees A
where A.salary in(               --   = 아니고 in  
               select salary 
               from employees
               where last_name= 'Taylor'
);

---- department_id 별로 가장 낮은 salary가 얼마인지 찾고 찾아낸 salary 에 해당하는 직원은 누구인지 출력

SELECT min(salary)최저급여
from employees
group by department_id;

select *
from employees A
WHERE A.salary IN (SELECT min(salary)최저급여
        from employees
        group by department_id 
        )
order by a.salary desc;  -- 같은 금액끼리 모아서봄(내림차순) --


-------------- 다중열 -----
--- job_id별로 가장 낮은 salary 가 얼마인지 찾아보고, 찾아낸 job_id별 salary에 해당하는 직원이 누구인지 출력( 다중열 사용 )

select job_id, min(salary) 그룹별_급여
from employees
group by job_id;   --두개의열 


select * 
from employees A
where(A.job_id, A.salary) in(
select job_id, min(salary) 그룹별_급여
from employees
group by job_id
)
order by A.salary desc;

------ 인라인 뷰 (가상뷰) ----  가격이 높은 순 낮은 순, 업체순, 인기순 등등 중복 그룹 가상 뷰로 처리 코드 만들어 놓고 나중에 출력 ----
--서브쿼리가 가상뷰 같은 역할을 한다. 그러나 다른 명령어임 !! ---


---  From 절 서브쿼리 -> 인라인 뷰 == 가상뷰 
----- 직원 중에서 department_name이 IT인 직원의 정보를 인라인뷰를 사용해 출력
select * 
from employees A,(
            select department_id
            from departments
            where department_name = 'IT') B
where A.department_id = B.department_id;

-------------------------------------------------------------select 끝-------




------------------------insert into --------------------------------------------------


-----department 테이블에 department_id가 271, department_name이 'sample_Dept', manager_id가 200, location_id 가 1700 행삽입---

insert into departments(department_id, department_name, manager_id, location_id)
values (271, 'Sample_Dept', 200,1700);

select * from departments;
--- commit 안하면 삽입만 되고 출력이 안됨...! 연동이 안됨 Oracle의 특짐!


-----department 테이블에 department_id가 272, department_name이 'sample_Dept', manager_id가 200, location_id 가 1700 행삽입
--다른방법?
insert into departments    -----( 필드 ) 괄호 내용 없음  ** 데이터를 삽입할때 테이블 전체필드의 개수와 데이터의 개수가 일치하면 필드명 생략가능-----
values (272, 'Sample_Dept', 200,1700);
select * from departments;

---null 일때는 사실을 인정하고, 두 가지 있는 필드명 적으면 됨. :) 
insert into departments (department_id, department_name)  values (273, 'Sample_Dept');
select * from departments;


------------------update set---------------------------------------------------------
-----department 테이블에 department_name이 'sample_Dept'인 행을 찾아  manager_id를 201, location_id를 1800으로 변경

update departments
set manager_id =201,
    location_id =1800
where department_name = 'Sample_Dept';

----departments 테이블에 department_id가 40인 manager_id와 location_id의 데이터값을 찾아내고, department_name이 'Sample_Dept'인 행의 
---manager_id와 location_id를 찾아낸 데이터 값과 동일하게 변경

select manager_id, location_id
from departments
where department_id =40;

UPDATE departments
set (manager_id, location_id) = (
                select manager_id, location_id
                from departments
                where department_id =40
                )
where department_name ='Sample_Dept';


--------delete from -----
--departments 테이블에 department_name이 'Sample_Dept'인 행을 삭제

DELETE from departments where department_name ='Sample_Dept';
DELETE from departments where department_id =271;
select * from departments;

commit; 
ROLLBACK - > 커밋전에만 롤백가능  - 커밋 후 돌아가기 안되서 직접 설정 삭제한다음 커밋; 
--*** rollback은 commit 이전에나  가능 


