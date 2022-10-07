-- 20. 커미션이 null이라면 커미션 값을 0으로 대입하여 이름, 부서, 입사일, 직무,
--     급여, 커미션, 그리고 년봉을 출력하세요.
select first_name, department_id, hire_date, job_id, salary, commission_pct
       ,nvl(commission_pct, 0)
       ,(salary + salary * nvl(commission_pct, 0)) * 12
from hr.employees; 

-- to_date : 문자를 날짜로 변경 / to_number : 문자를 숫자로 변경
-- to_char : 날짜를 문자로 변경 / to_char : 숫자를 문자로 변경

---37. 03/06/17이후에 입사한 사람은?
select *
from hr.employees
where hire_date > '03/06/17';

select *
from hr.employees
where hire_date > to_date('03/06/17', 'yy-mm-dd');

---38. 17/06/03(일월년)이후에 입사한 사람은?
select * 
from hr.employees
where hire_date > to_date('17/06/03', 'dd/mm/yy');

-- 39. 문자 변환함수 : 날짜를 문자 변환
select to_char(sysdate, 'yy-mm-dd'), sysdate, to_char(sysdate,'dd-mm-yy'),
       to_CHAR(sysdate, 'yyyy-mm-dd'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS.SSSSS AM'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS.SSSSS AM'),
       TO_CHAR(SYSDATE, 'YYYY-MONDD HH24:MI:SS.SSSSS AM')
from dual;

-- 날짜를 문자열로 변경하여 날짜 비교   -- 사전 순서 -- 쓰면 안된다.!
-- 문자열을 날짜로 변경하여 날짜 비교
-- 40. 25-04-2003 보다 늦게 입사한 사람을 출력
select *
from hr.employees
where hire_date > to_date('25-04-2003', 'dd-mm-yyyy');

--숫자를 문자열로
--- 1,234,567 => W1,234,567, $1,234,567, $1,234,567-
SELECT TO_CHAR(1234567.890, '9,999,999'),
        TO_CHAR(1234567.890, '9,999,999.00'),
        TO_CHAR(1234567.890, '$9,999,999.00'),
        TO_CHAR(1234567.890, 'L9,999,999.00'),
        TO_CHAR(-1234567.890, 'L9,999,999.00MI')
FROM DUAL;

-- 41. 이름, 성, 직무 부서 그리고 급여를 세자리씩 ,를 찍고 $가 출력되게 하시오.
select first_name, last_name, job_id, department_id
       ,to_char(salary, '$99,999,999')
       ,to_char(-salary, '99,999,999mi')
from hr.employees;

-- 42. janette또는 JANETTE 또는 jaNette 값을 전달 받았다.
---   이름이 'Janette'인 사원을 출력하시오.
select *
from hr.employees
where first_name = 'Janette' 
      or first_name = initcap('janette')
      or first_name = initcap('JANETTE');

--- 표현식 :  SWITCH(변수) ~ CASE 조건 :  연산식; break; default :연산식
---          CASE 변수 WHEN 조건 THEN 연산식 else 연산식 end

-- 43. --- job_id이 'IT_PROG' 급여를 10%상승
--                  'ST_CLERK' 급여를 15%상승
--                  'SA_REP' 급여를 20%상승
--                   그이외는 급여
-- 성, 이름, 급여도 같이 출력
select last_name, first_name, salary, job_id,
       case job_id when 'IT_PROG' then salary + salary * 0.1
                   when 'ST_CLERK' then salary + salary * 0.15
                   when 'SA_REP' then salary + salary * 0.2
                   else salary end sal
from hr.employees;

-- decode
select last_name, first_name, salary, job_id,
       decode( job_id , 'IT_PROG' , salary + salary * 0.1
                      , 'ST_CLERK' , salary + salary * 0.15
                      , 'SA_REP' , salary + salary * 0.2
                      , salary ) sal
from hr.employees;

--- 44. 성, 이름, 직무, 급여, 급여에 따른 직책도 같이 출력하세요.
--- 급여가 3000이하이면 사원 
--        5000이하이면 주임
--        7000이하이면 대리
--        9000이하이면 과장
--       11000이하이면 차장
--       13000이하이면 부장
--       그 이상 이면 임원
select last_name, first_name, job_id, salary, 
       case when salary <= 3000 then '사원'
            when salary <= 5000 then '주임'
            when salary <= 7000 then '대리'
            when salary <= 9000 then '과장'
            when salary <= 11000 then '차장'
            when salary <= 13000 then '부장'
            else '임원' end grade
from hr.employees;

