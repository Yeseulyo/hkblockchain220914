select * from hr.employees;

select employee_id, first_name, job_id
from hr.employees;

select employee_id, first_name, job_id, salary * 0.1
from hr.employees;

select *, department_id, location_id, manager_id
from hr.departments;

select first_name name, salary, commission_pct * salary sal
        ,department_id
from hr.employees;

select first_name || q'['s ]' || job_id
from hr.employees;
select first_name || '''s' || job_id
from hr.employees;


-----------------------------------------

--- projection 원하는 열을 갖고오는 것
--- selection 원하는 행을 갖고오는 것


select employee_id, first_name ,job_id
from hr.employees;

--- 직무만 출력
select job_id
from hr.employees;

--- 사원들이 하고 있는 직무는 어떤 것이 있는지 출력하시오(직무를 한번만 출력 반복없이)
select distinct job_id
from hr.employees;

-- select first_name, distinct job_id
-- from hr.employees;

--- 직무와 급여 출력
select salary, job_id
from hr.employees;

--- 직무와 급여가 같은 것은 한번만 출력
select distinct salary, job_id, department_id
from hr.employees;

select * from hr.employees; --- 전체 컬럼 출력

desc hr.employees; --- 컬럼 네임과 데이터만 출력

select last_name, first_name, salary, job_id
from hr.employees;

select last_name || ' ' || first_name, salary, job_id
from hr.employees; --- 성과 이름을 붙여서 출력

select last_name || ' ' || first_name, salary, job_id, '사원', '1999-10-14', 10, 10.5
from hr.employees;
--- 리터널 : 자연어 , 자연수 , 부울, 날짜


--- selection
select * from hr.employees;

select * 
from hr.employees
where department_id = 90; --- 전체중에서 department_id가 90인 것만 갖고오겠다.


--- 직무가 AD_VP인 사원들만 출력하세요.
select * from hr.employees
where job_id = 'AD_VP';

--- 사원번호, 성, 직무, 부서번호를 출력할 때 60인 부서만 가지고 오세요.
select employee_id, last_name, job_id ,department_id 
from hr.employees
where department_id = 60;


select last_name
from hr.employees;

--- Whalen 이라는 직원의 성, 직무, 부서번호를 출력하세요.
select last_name, job_id, department_id
from hr.employees
where last_name = 'Whalen';


select last_name, job_id, department_id --- 컬럼명이나 키워드는 대소문자를 가리지 않지만
from hr.employees
where last_name = 'whalen'; --- 데이터는 대소문자를 구분해야한다.

select last_name, job_id, department_id
from hr.employees
where job_id = 'AD_ASST';

select last_name, job_id, department_id
from hr.employees
where job_id = 'ad_ASST'; --- 데이터는 대소문자를 구별 함.

select hire_date ---날짜
from hr.employees;

-- 05/08/17에 입사한 사원들을 출력
select *
from hr.employees
where hire_date = '05/08/17';

select *
from hr.employees
where hire_date = '05-08-17';

select *
from hr.employees
where hire_date = '05.08.17'; --- 날짜는 두자리씩 끊어서 적음 /-. 가능

select *
from hr.employees
where hire_date = '2005.08.17'; --- 2005 -> 05로 저장됨

--- 20   05   08   17   23   35   26
---세기  년도   월   일   시   분    초


select *
from hr.employees
where commission_pct is null;

--- 급여가 3000 미만인 급여를 받는 사원을 가지고 오시오
select * 
from hr.employees
where salary < 3000;

select * 
from hr.employees
where salary <= 3000; --- 3000포함

--- 직원의 급여가 2500 이상이고 3500 이하인 직원을 출력하시오
--- 사원번호, 성, 급여를 projection하시오.
select job_id, last_name, salary
from hr.employees
where salary >= 2500 and salary <= 3500;

select job_id, last_name, salary
from hr.employees
where salary between 2500 and 3500;


--- 사원번호, 성, 급여, 상사(manager_id)
--- 부서번호가 30, 60, 90인 직원만 출력 (and : && , or : ||)
select employee_id, last_name, salary ,manager_id
from hr.employees
where department_id = 30 
   or department_id = 60 
   or department_id = 90;

select employee_id, last_name, salary ,manager_id
from hr.employees
where department_id in (30, 60, 90); 

--- 관리자가 100, 101, 201인 사원들의 정보 중 사원번호, 성, 급여, 상사에 대한 내용을 출력하세요.
select employee_id, last_name, salary, manager_id
from hr.employees
where manager_id in(100, 101, 201);

select employee_id, last_name, salary, manager_id
from hr.employees
where manager_id = 100 or manager_id = 101 or manager_id = 201;

--- 성이 'Hartstein', 'Vargas' 직원의 사원번호, 급여, 상사, 부서번호에 대한 내용을 출력하세요.
select employee_id, salary, manager_id, job_id
from hr.employees
where last_name in('Hartstein', 'Vargas');

select employee_id, salary, manager_id, job_id
from hr.employees
where last_name = 'Hartstein' or last_name = 'Vargas';

select job_id
from hr.employees;
--- 직무에 MA가 포함되어 있는 직원들을 출력하세요.
select *
from hr.employees
where job_id like '%MA%'; --- MA%, %MA, 'MA'

--- 직무에 S가 포함되어 있는 직원들을 출력하세요.
select *
from hr.employees
where job_id like '%S%';

--- 직무에 K가 포함되어 있는 직원들을 출력하세요.
select *
from hr.employees
where job_id like '%K%';

--- 직무가 S로 시작되는 사원들
select *
from hr.employees
where employee_id like 'S%';
--- %는 0개 이상의 문자를 나타냅니다.

--- boarder라는 테이블에 contents라는 컴럼에 있는 데이터 중 '이숭무'가 포함된 것을 출력하시오
--- select *
--- from boarder
--- where contents like '%이숭무%';

--- 직무가 S로 끝나는 사원들
select *
from hr.employees
where job_id like '%S'; --- 'S'

--- 성에서 두번째 글자가 s로 시작하는 사원을 출력하시오
select *
from hr.employees
where last_name like '_s%';
--- _는 임의의 단일 문자를 나타냅니다.

--- 성에서 두번째 글자가 O로 시작하는 사원을 출력
select *
from hr.employees
where last_name like '_o%';

--- 성에서 세번째 글자가 s로 시작하는 사원을 출력
select *
from hr.employees
where last_name like '__s%';

--- 성이 뒤에서 두번째 글자가 s로 시작하는 사원을 출력
select *
from hr.employees
where last_name like '%s_';

--- 직무가 IT_PROG이고 급여가 6000인 사원을 출력
select *
from hr.employees
where job_id = 'IT_PROG' and salary = 6000;

--- 직무에 MAN이 포함되어 있고 급여가 10000이상인 사원 출력할 때 사원번호, 성, 직무, 급여 출력
select employee_id, last_name, job_id, salary 
from hr.employees
where job_id like '%MAN%' and salary >= 10000;

--- 직무에 'MAN'이 포함되어 있는 사원과 급여가 10000이상인 사원을 출력 사원번호, 성, 직무, 급여 출력
select employee_id, last_name, job_id, salary 
from hr.employees
where job_id like '%MAN%' or salary >= 10000;

--- 직무에 'IT_PROG', 'ST_CLERK', 'SA_REP'가 아닌 직무를 가진 사원을 출력 성, 직무 출력
select last_name, job_id
from hr.employees
where job_id != 'IT_PROG' and job_id != 'ST_CLERK' and job_id != 'SA_REP';

select last_name, job_id
from hr.employees
where job_id not in('IT_PROG', 'ST_CLERK', 'SA_REP');


--- 성과 직무 그리고 급여를 출력하는데 
--- 급여가 15000 초과 이면서 직무가 'SA_REP' 인 직원과
--- 급여가 15000 초과 이면서 직무가 'AD_PRES'인 사원을 출력
select last_name, job_id, salary
from hr.employees
where salary > 15000 and job_id = 'SA_REP' or salary > 15000 and job_id = 'AD_PRES';

select last_name, job_id, salary
from hr.employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES') and salary > 15000;


--- select
--- from
--- [where] 생략 가능
--- [order by] 생략 가능 === 정렬할 때 새용

--- 80인 부서의 사원들 중  성, 직무, 부서번호, 입사일을 출력하는 데 입사일이 빠른 직원부터 출력
--- 오름차순
select last_name, job_id, department_id, hire_date   -- 3
from hr.employees              -- 1
where department_id = 80       -- 2
order by hire_date asc; --- asc 안적어도 된다.(오름차순)        -- 4 

--- 내림차순
--- 80인 부서의 사원들 중  성, 직무, 부서번호, 입사일을 출력하는 데 입사일이 늦은 직원부터 출력
select last_name, job_id, department_id, hire_date   -- 3
from hr.employees              -- 1
where department_id = 80       -- 2
order by hire_date desc;       -- 4

describe hr.employees; -- desc hr.employees


--- 사원번호, 성, 연봉을 출력하는 연봉을 내림차순으로 출력하시오.
--- 연봉은 별칭으로 annsal이라고 주자.
select employee_id, last_name, salary * 12 annsal
from hr.employees
order by annsal desc;

---index       1        2        3(order by 에서만 사용 가능)
--- 오름차순
select employee_id, last_name, salary * 12 annsal
from hr.employees
order by 3 asc; --- select절의 index는 order by 에서만 사용 가능함.

select employee_id, last_name, salary * 12 annsal
from hr.employees
order by salary * 12 asc;

select employee_id, last_name, salary * 12 annsal
from hr.employees
order by department_id asc; --- select절에 없는 것도 기준열에 사용 가능.


--- 두개 이상으로 기준열을 만들자.
--- 각 부서가 내림차순으로 정렬되고 각 부서의 급여가 오름차순으로 정렬
--- 사원번호, 성, 부서번호, 급여
select employee_id, last_name, department_id, salary
from hr.employees
order by department_id desc, salary;

--- 부서를 오름차순으로 정렬하고 각 부서의 직원의 입사일 내림차순되어 있을 때 부서에 같이 들어온 사원의 급여는 오름차순으로 정렬하여 출력하시오.
--- 사원번호, 성, 부서번호, 입사일, 급여
select employee_id, last_name, department_id, hire_date, salary
from hr.employees
order by department_id asc, hire_date desc, salary asc; 

--- 부서를 오름차순으로 정렬하고 각 부서에서 직무가 내림차순으로 정렬된 상태에서 직무에 따른 급여를 제일 많이 받는 사람부터 출력되게 하세요.
select *
from hr.employees 
order by department_id asc, job_id desc, salary desc;
desc hr.employees;

--- index 사용하여 출력
select *
from hr.employees 
order by 11 asc, 7 desc, 8 desc;

--- 성이 Austin 부터 Sciarra 사이에 있는 사원들을 출력
select *
from hr.employees
where last_name between 'Austin' and 'Sciarra';

select *
from hr.employees
where last_name >= 'Austin' and last_name <= 'Sciarra';
--- 문자열은 사전순서

--- 성이 Austin부터 Sciarra사이에 있는 사원들을 
--- 직무별, 급여를 모두 내림차순으로 정렬
select *
from hr.employees
where last_name between 'Austin' and 'Sciarra'
order by job_id desc, salary desc;

















































 


















