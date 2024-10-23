SELECT * FROM employees;

---//비교연산자
-------- where ------------
SELECT * 
FROM employees
Where employee_id = 100; 


----first_name이 David ----
SELECT * 
FROM employees
Where first_name = 'David'; 


----employee_id 가 105 이상인 직원의 정보--
SELECT * 
FROM employees
Where employee_id >= 105; 


---- salary가 10,000이상이고 20,000 이하인 직원의 정보
SELECT * 
FROM employees
Where salary BETWEEN 10000 and 20000;


---- salary가 10000, 17000, 24000인 직원정보

SELECT * 
FROM employees
Where salary IN (10000, 17000, 24000);


---- job_id값이 AD로 시작하는 모든 (%) 데이터를 출력 ---

SELECT * 
FROM employees
WHERE job_id like 'AD%';

--- AD로 시작하면서 뒤에 따라오는 문자열이 3자리인 데이터 출력---
SELECT * 
FROM employees
Where job_id like 'AD___';

---- manager_id가 null 인 값 ----
SELECT * 
FROM employees
Where manager_id IS null; 



----------//논리연산자 -----------
--- salary가 4000을 초과하면서 job_id 가 IT_PROG 인 값을 조회/ '' 따옴표안에는 대소문자 구별됨

SELECT *
FROM employees
where salary > 4000 AND job_id = 'IT_PROG';

--- salary가 4000을 초과하면서 job_id 가 IT_PROG 이거나 또는 FI_ACCOUNT인경우 
SELECT *
FROM employees
where salary > 4000
AND job_id = 'IT_PROG'  
OR job_id ='FI_ACCOUNT';

-----employee_id 가 105가 아닌 직원만 출력---

SELECT *
FROM employees
Where employee_id <>105;


------------------------------------------------------------------------------------
-------SQL 함수 
--문자표시
--last_name을 소문자lower와 대문자upper로 각각출력하고, email의 첫번쨰 문자는 대문자로 출력

SELECT last_name,
    lower(last_name) Lower적용, 
    upper(last_name) upper적용,
    email,
    initcap(email) Intcap적용
from employees;


--- job_id 데이터 값의 첫째 자리부터 시작해서 두개의 문자를 출력 ---
--특정글자 출력
SELECT job_id, substr(job_id,1,2)
FROM employees;


--- job_id 문자열 값이 ACCOUNT 이면 ACCNT 로 출력 ----
--글자바꾸기 (표시로만)
SELECT job_id, replace(job_id, 'ACCOUNT' ,'ACCNT')as 적용결과
FROM employees;


--- 특정 문자로 채우기 ---
---first_name에 대해 12자리의 문자열 자리를 만들되 first_name의 데이터 값이 12보다 작으면 왼쪽LPAD에서 부터 *을 채워 출력/RPAD 오른쪽
SELECT first_name, LPAD(first_name,12,'*') LPAD적용결과
FROM employees;

--자르기 (LTRIM, RTRIM, TRIM)---

select 'start'||'   - space -   '||'end'
from dual;

-- 좌우 공백 제외rtrim / ltrim
-- dual 테이블은 더미(dummy)임
select 'start'||trim('   - space -   ')||'end'
from dual;

-- 자리 올림
--salary를 30일로 나눈후 나눈값의 소수점 첫째자리, 소수점 둘째 자리,  첫째자리에서 반올림한 값을 출력
SELECT salary,
        salary/30 일급,
        round (salary/30,0) 적용결과_0,
        round (salary/30,1) 적용결과_1,
        round (salary/30,-1) 적용결과_마이너스1
FROM employees;        



--- 절삭
SELECT salary,
        salary/30 일급,
        trunc (salary/30,0) 적용결과_0,
        trunc (salary/30,1) 적용결과_1,
        trunc(salary/30,-1) 적용결과_마이너스1
FROM employees; 



--- 날짜계산 - 오늘날짜, 더하기1, 빼기1, 특정날짜 빼기, 시간더하기
select to_char(sysdate,'YY/MM/DD/HH24:MI') 오늘날짜,
    sysdate +1 더하기_1,
    sysdate -1 빼기_1,
    TO_DATE('20241023')- to_date('19940207')날짜빼기,
    sysdate + 13/24 시간더하기
from dual;

--- 두 날짜 사이에 개월 수 계산
---department_id 사 100인 직원에 대해 오늘 날짜, hire_date, 
---오늘날짜와 hire _date 사이의 개월 수 출력 

SELECT sysdate, hire_date, months_between(sysdate, hire_date)적용결과
from employees
where department_id =100; 

-- 월에 날짜 더하기 - add_months
-- employee_id 가 100과 106사이인직원의 hire_date에 3 개월의 더한 값, hire_date에 3개월을 뺀값
SELECT hire_date,
        add_months(hire_date, 3)더하기_적용결과,
        add_months(hire_date, -3)빼기_적용결과
from employees
where department_id =100; 


---NULL값 출력
SELECT salary * commission_pct
From employees
order by commission_pct;


---salary에 commission_pct 를 곱하되 commission_pct가 null 일때는 1로 치황하여 commission_pct 를 곱한 결과를 출력 
----NULL 값처리 NVL 
SELECT salary * NVL(commission_pct,1)
From employees
order by commission_pct;

--first_name, last_name, department_id, salary를 출력하되 
--department_id가 60 인경우에는 급여를 10%인상한 값을 계산하여 출력하고 
--나머지 경우에는 원래의 갑을 출력 
--그리고 department_id 가 60인 경우에는 '10%인상'을 출력하고 나머지 경우에는 '미인상'을 출력
-- decode 사용


-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
--DECODE를 case로 변경
SELECT first_name,
      last_name,
      department_id,
      salary 원래_급여,
      case department_id  when 60 then  salary*1.1  else salary end 조정된_급여,
      case department_id  when 60 then '10%인상' else '미인상' end 인상여부
from employees;




