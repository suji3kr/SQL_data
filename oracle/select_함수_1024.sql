--- job_id 가 IT_PROG 라면 employee_id, first_name , Last_name, salary,를 출력하되 salary가 9000이상이라면 '상위급여 ,
--- 6000~8999사이라면 중위급여 그외에는 하위급여라고 출력.



--- case문---
select employee_id, first_name, last_name, salary,
    case
        when salary >= 9000 then '상위급여'
        when salary BETWEEN  6000 AND 8999 THEN '중위급여'
        ELSE '하위급여'
    end as 급여등급
from employees
where job_id ='IT_PROG';



--Rank, Dense_Rank, Row_number 함수를 각각이용해 employees 테이블의 slary 값이 높은 순서대로 순위를 출력.
--- 순위매기기 --- (3가지 종류 구분)
SELECT employee_id, 
    salary,
    Rank() over (ORDER by  salary DESC) RANK_급여,
    Dense_Rank() over (order by  salary DESC) ENSE_RANK_급여,
    Row_number() over (order by  salary DESC) ROW_RANK_급여
from employees;


--- salary 의 합계와 평균을 구하고 AVG를 사용하지 말고 평균 출력 
--- 그룹 함수 

SELECT salary,
    round(SUM (salary),1) AS 합계,
    round(AVG (salary),1) AS 평균,
    round(SUM (salary)/ COUNT(salary),1) As 계산된_평균
from employees;


---salary의 최대값과 최소값 그리고 first_name의 최대값, 최소값 출력
SELECT max(salary)최대값, min(salary) 최소값,  max(first_name)최대문자, min(first_name)최소문자
from employees;

SELECT 
    ROUND(SUM(salary), 1) AS 합계,
    ROUND(AVG(salary), 1) AS 평균,
    ROUND(SUM(salary) / COUNT(salary), 1) AS 계산된_평균
FROM 
    employees;
    
--- employee_id 가 10 인상인 직원에 대해 job_id별로 그룹화 하여 job_id별 총급여와 job_id 별 평균급여를 구함.
--- job_id 별 총급을 기준으로 내림차순 정렬.  ( 평균 중위수의 차이 큰지 확인- 빅데이터 )

select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id
ORDER by 직무별_총급여 desc, 직무별_평균급여;

--- 조건 그룹화 having --- 
--- employee_id 가 10 인상인 직원에 대해 job_id별로 그룹화 하여 job_id별 총급여와 job_id 별 평균급여를 구함.
--- job_id 별 총급여가 30000보다 큰 값만 출력.
--- 출력결과는 job_id별 총급여를 기준으로 내림차순

select job_id 직무, sum(salary) 직무별_총급여, avg(salary) 직무별_평균급여
from employees
where employee_id >= 10
group by job_id having sum(salary) > 30000
ORDER by 직무별_총급여 desc, 직무별_평균급여;


--- 동등조인 --- 내 코드와 부서코드 동등
---employees 테이블과 deparments 테이블과 location  테이블을 조인하여 
---각 직원이 어느 부서에 속하는지와 부서의 소재지가 어디인지 조회

select a.employee_id, a.department_id, b.department_name, c.location_id, c.city
from employees A, departments B, locations C
where a.department_id = b.department_id
and b.location_id = c.location_id;



--- 외부조인----
--employees 테이블과 departments테이블을 department_id 로 외부 조인하여 department_id가 null값인 kimberely grant 도 함께 출력
SELECT a.employee_id, a.first_name, a.last_name, b.department_id, b.department_name
from employees A, departments B
where a.department_id(+) = b.department_id
order by a.employee_id;

--- 자체조인 --- 
---employees 테이블을 자체 조인하여 직원별 담당 매니저가 누구인지 조회
SELECT a.employee_id, a.first_name, a.last_name, a.manager_id, (b.first_name ||' '||b.last_name) manager_name
FROM employees A, employees B
where a.manager_id = b.employee_id
order by a.employee_id;

----**집합연산자******************
-- 합집합 
    ---UNION(중복이 없음), UNIONALL(중복이 있음)
---- employees 테이블에서 department_id 집합과 departments 테이블의 department_id 집합을 UNION 연산자를 사용하여 합침.
SELECT department_id
from employees
UNION
SELECT department_id
from departments;

SELECT department_id
from employees
UNION ALL
SELECT department_id
from departments;

--교집합
    ---INTERSET
---employees 테이블에서 department_id 집합과 departments 테이블의 department_id 집합을 INTERSET  사용하여 출력
SELECT department_id
from employees
INTERSECT
SELECT department_id
from departments;

    
    
--차집합 
    ---MINUS
SELECT department_id
from departments
MINUS
SELECT department_id
from employees;


------ QUIZ --------
--**서브쿼리퀴즈 employees 테이블의 last_name이 'De Haan'인 직원과 salary가 동일한 직원에는 누가 있는지 단 행 서브쿼리를 이용해서 출력

--단행 서브쿼리 
SELECT  
    last_name, 
    salary
FROM 
    employees
WHERE 
    salary = (SELECT (salary) FROM employees WHERE last_name = 'De Haan');
