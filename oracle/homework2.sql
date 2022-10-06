---대문자를 소문자로 , 소문자를 대문자로
select email, lower(email)
     , first_name, upper(first_name)
     , email, initcap(email)
     ,length('이숭무'), lengthb('이숭무') -- b는 바이트 -- UTF-8 한글은 한글자당 3바이트
     ,length(first_name), lengthb(first_name)
     ,'이숭무'
from hr.employees;

--- 1. 이름이 'steven'인 사람을  출력하시오.
select first_name
from hr.employees
where first_name = initcap('steven');

select first_name
from hr.employees
where lower(first_name) = 'steven';

-- 2. 성이 KING인 직원을 출력하세요.
select *
from hr.employees
where upper(last_name) = 'KING';

select *
from hr.employees
where last_name = initcap('KING');

-- 3. 이름의 글자의 갯수가 5인 사원들을 출력하세요.
select *
from hr.employees
where length(first_name) = 5;

-- 4.  급여가 5자리 이상인 사원을 구하시오.
select*
from hr.employees
where length(salary) >= 5;

select *
from hr.employees
where salary >= 10000;

-- INSTR : instr('abcdefg', 'c')  -- 'abcdefg'에서 c가 몇번째에 있나?
-- 5. 이름에 's'를 가진 사원들 중 이름에 몇번째에 있는지 출력하세요.
select first_name, instr(first_name, 's')
from hr.employees;

 -- 6.  이름에 's'가 3번째에 있는 사원들을 출력하세요.
 select *
 from hr.employees
 where instr(first_name, 's') = 3;
 
 -- substr
 -- 7. 이름과 성과 급여와 직무, 이메일을 출력할 때 이메일은 3번째 글자 부터 출력하시오.
 select first_name, last_name, salary, job_id, email, substr(email, 3)
 from hr.employees;
 
 -- 8. 이메일에 'S'부터 출력하고, 급여, 입사일, 이름 ,성을 출력하세요.
 select email, substr(email, instr(email, 'S')),salary, hire_date, first_name, last_name
 from hr.employees;
 
 --9. 이름 , 급여, 직무, 부서를 출력할 때 이메일은 3번째 부터 4글자를 출력하시오.
 select first_name, salary, job_id, department_id, email, substr(email, 3, 4)
 from hr.employees;
 
 --10. 이메일에 3번째부터 4글자에 'ARTS'가 있는 사원을 출력하세요.
 select * 
 from hr.employees
 where substr(email, 3, 4) = 'ARTS';
 
 --11.이메일에 's'가 5번째에 있는 사원을 출력하시오.
 select *
 from hr.employees
 where  instr(lower(email), 's') = 5;
 
 -- 아이디 찾기 highland0 : high***** -- lpad, rpad
 select rpad('as', 10, '*') from dual;
 -- 12. 이메일에서 앞에서 2글자를 출력하고 나머지는 오른쪽에 *로 채워서 출력하세요.
 select email, rpad(substr(email, 1, 2), length(email), '*')
 from hr.employees;
 
-- 13. 입사일이 03/06/17 전화번호가 515.123.4567인 사원의 이메일을 
--     앞에서 3글자만 출력하고 나머지는 *로 출력하세요.
select email, rpad(substr(email, 1, 3), length(email), '*')
from hr.employees
where hire_date = '03/06/17' and phone_number = '515.123.4567';

-- REPLACE
select replace('JACK and JUE', 'J', 'BL')
from dual;
-- 14. 직무가 _AS가 있다면 abc로 변경하시오.
select job_id, replace(job_id, '_AS', 'abc')
from hr.employees
where job_id like '%\_AS%' escape '\';

-- str.trim()
select ' 이 숭무 ', trim(' 이 숭무 '), ltrim(' 이 숭무 '), rtrim(' 이 숭무 ')
from dual;
-- 15.이메일에 'A'가 처음과 끝에 있다면 이메일에서 삭제하여 출력하자.
select email, trim('A' from email), trim(email)
from hr.employees;

--- str = 'abcdefg'
--         0123456
--         7654321 -   
-- 16. 이메일에서 뒤에서 한글자가지고 오고 또 이메일에서 뒤에서 부터 2글자 가지고 오며,
--     이메일에서 뒤에서 3번째부터 2글자만 출력하세요.
select email, substr(email, -1, 1), substr(email, -2, 2), substr(email, -3, 2) 
from hr.employees;

select instr('010-7146-1970', '-', -1)
from dual;
-- 17. 010-7146-1970 , 010-****-1970, 02-314-1970 02-***-1970
select rpad(
        substr('010-1146-1970', 1, instr('010-1146-1970', '-')),
        length(substr('010-1146-1970', 1, instr('010-1146-1970', '-', -1)-1))
       ,'*') ||  substr('010-1146-1970', -5, 5)
from dual;

--- 18. 이름, 입사일, 부서번호, 급여, 년봉을 출력하세요.
select first_name, hire_date, department_id, salary, salary * 12
from hr.employees;

-- 19. 이름, 입사일, 부서번호, 급여 그리고 년봉을 출력할 때 
-- 년봉에는 커미션이 포함되어야 한다.
select first_name, hire_date, department_id, salary, commission_pct, (salary + salary * commission_pct)* 12
from hr.employees;

select commission_pct, nvl(commission_pct, 0)
from hr.employees;
-- 20. 커미션이 null이라면 커미션 값을 0으로 대입하여 이름, 부서, 입사일, 직무,
--     급여, 커미션, 그리고 년봉을 출력하세요.
select first_name, department_id, hire_date, job_id, salary
      , commission_pct, nvl(commission_pct,0)
      , (salary + salary * nvl(commission_pct,0)) *12
from hr.employees;

select nvl(commission_pct, 100)
from hr.employees;

--- 숫자함수 
--- round() : 반올림 
--- trunc() : 절삭       
--- mod() : 나머지
-- 21 . 반올림하세요.
--- 5부터 반올림된다.
select  ROUND(15.19345,3),  ROUND(15.19355,3) , round(145.5554,2),
        round(145.5554,1), round(145.5554,0),  round(145.4554,0), 
        round(145.5554,-1), round(145.5554,-2)
from dual;

-- 22. 절삭하세요.
select trunc(15.19345,3),  trunc(15.19355,3) , trunc(145.5554,2),
       trunc(145.5554,1), trunc(145.5554,0),  trunc(145.4554,0), 
       trunc(145.5554,-1), trunc(145.5554,-2)
from dual; 