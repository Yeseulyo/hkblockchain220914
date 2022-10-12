-- ptojection :
-- select : 컬럼명, 연산식(사칙연산)
-- from : 테이블
-- selection : where : 비교연산자와 관계연산자

-- 이 명령만 기억하자(검색엔진 만들기)
-- select * from hr.employees
-- where job_id like '%REP%';
-- 단일행 : 행의 값을 하나만 이용해서 결과를 가지고 옴 
--         일반함수 : nvl, nvl2, nullif, 
--         문자열함수 : 
--         변환함수 : to_char, to_date

-- 다중행 함수 : 여러행을 이용해서 하나의 결과를 가지고 옴
--              sum(), avg(), min(), max(), count()
--              group by, having

-- employees : 직원에 대한 정보
-- departments : 부서들의 정보
-- 20인부서의 직원들을 출력하세요.
select * from hr.employees
where department_id = 20;
-- 20인부서의 부서명을 출력하세요.
select department_name
from hr.departments d -- 테이블명에도 별칭 쓸 수 있다.
where department_id = 20;

-- 20인부서의 직원들을 출력하세요.
-- T-SQL - join
select first_name, last_name, hire_date
     , hr.employees.department_id, department_name
from hr.employees , hr.departments
where hr.employees.department_id 
   = hr.departments.department_id
and hr.employees.department_id = '20';
   
select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;  

-- 1999 구문 : ansi - join
select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees e join hr.departments d
on e.department_id = d.department_id
where e.department_id = 20;

select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees e join hr.departments d
on e.department_id = d.department_id;

-- 직원들 중 직무가 SH_CLERK인 사원들을 출력하세요.
-- 사원번호, 이름, 급여, 부서명, 직무번호
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       JOB_ID
FROM HR.EMPLOYEES
WHERE JOB_ID ='SH_CLERK'; 
-- 직무 테이블인 JOBS에서 직무가 SH_CLERK인 직무명을 출력하세요.
SELECT JOB_TITLE FROM HR.JOBS
WHERE JOB_ID = 'SH_CLERK';
--- T - SQL -Join
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       HR.jobs.JOB_ID, JOB_TITLE
FROM HR.employees , HR.jobs
WHERE HR.employees.JOB_ID = HR.jobs.JOB_ID;
-- 1999구문 -- Ansi-Join
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       HR.jobs.JOB_ID, JOB_TITLE
FROM HR.employees join HR.jobs
on HR.employees.JOB_ID = HR.jobs.JOB_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       e.job_id, j.JOB_ID, JOB_TITLE
FROM HR.employees e join HR.jobs j
on e.JOB_ID = j.JOB_ID;

--- NATURAL JOIN (별칭 안쓴다.)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       JOB_ID, JOB_TITLE
FROM HR.employees NATURAL join HR.jobs ;
--on e.JOB_ID = j.JOB_ID
--- 두 테이블의 컬럼명이 같아야 한다.

select * from  hr.employees; --department_id,manager_id
select * from hr.departments; --department_id , manager_id
--
select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees  join hr.departments d
on e.department_id = d.department_id;


-- 직원들 중 부서장을 상사로 둔 직원들의 부서명을 출력하시오.
-- aNSI - jOIN
select first_name, last_name, hire_date, e.manager_id,
      d.manager_id, d.department_id, department_name
from hr.employees e  join hr.departments d
on e.department_id = d.department_id 
and e.manager_id = d.manager_id ;

select first_name, last_name, hire_date, e.manager_id,
      d.manager_id, d.department_id, department_name
from hr.employees e , hr.departments d
where e.manager_id = d.manager_id
and e.department_id = d.department_id;

select first_name, last_name, hire_date,
      manager_id, department_id, department_name
from hr.employees NATURAL  join  hr.departments;
--- NATURAL join은 비교할 컬럼을 적어주지 않아도 된다.

select first_name, last_name, hire_date,
      manager_id, department_id, department_name
from hr.employees e join  hr.departments d
USING (DEPARTMENT_ID, manager_id);

select first_name, last_name, hire_date,
      e.manager_id, department_id, department_name
from hr.employees e join  hr.departments d
USING (DEPARTMENT_ID);
--- using절에서 사용한 컬럼은 select 절에 테이블별칭을 주지 않는다.

-- T-SQL Join, Ansi Join, Natural Join, using절
-- 각 직원의 직원번호, 직무번호, 부서번호, 부서명
-- 이 때 20,30,50,80인 부서만 출력
-- T-SQL Join
select employee_id, job_id, e.department_id, department_name
from hr.employees e , hr.departments d
where e.department_id = d.department_id
and e.department_id in (20,30,50,80);

-- Ansi Join
select employee_id, job_id, e.department_id, department_name
from hr.employees e join hr.departments d
on e.department_id = d.department_id
and e.department_id in (20,30,50,80);

-- Natural Join
select employee_id, job_id, department_id, department_name
from hr.employees natural join hr.departments 
where department_id in (20,30,50,80);

-- using절
select employee_id, job_id, department_id, department_name
from hr.employees e join hr.departments d
using (department_id)
where department_id in (20,30,50,80);

select * from hr.locations;
-- 부서번호, 부서명, 우편번호, 주소를 출력할 때 우편번호가 1400만 출력
-- T-SQL join
select department_id, department_name, l.location_id, street_address
from hr.departments d, hr.locations l
where d.location_id = l.location_id
and l.location_id = '1400';

-- Ansi join
select department_id, department_name, l.location_id, street_address
from hr.departments d join hr.locations l
on d.location_id = l.location_id
where l.location_id = '1400';

-- natural join -- 컬럼명이 같은것끼리 비교
select department_id, department_name, location_id, street_address
from hr.departments  natural join hr.locations 
where l.location_id = '1400';

-- usting
select department_id, department_name, location_id, street_address
from hr.departments  join hr.locations 
using (location_id)
where location_id = '1400';

-- 3way join : 다중 조인 
-- SH_CLERK 직무를 가진 사원의 사원번호, 이름, 직무, 부서번호를 출력을하는데
-- SSH_CLERK의 직무 내용을 확인하고
-- SH_CLREK의 직무를 가지고 있는 사원의 부서명을 출력하시오.
select employee_id, first_name, job_id, department_id
from hr.employees
where job_id = 'SH_CLERK';

select department_id, department_name
from hr.departments
where department_id = '50';

select job_id, job_title
from hr.jobs
where job_id = 'SH_CLERK';

--- T-SQL Join
select employee_id, first_name, -- employees
         d.department_id, department_name, -- departments
         j.job_id, job_title --- jobs
from hr.jobs j, hr.employees e , hr.departments d
where j.job_id = e.job_id
and e.department_id = d.department_id
and e.job_id = 'SH_CLERK';

-- Ansi join
-- join은 join on join on 순으로 써야한다. 
-- join 비교할때 비교하는 테이블이랑 비교하는 컬럼이랑 같아야 한다.
select employee_id, first_name, -- employees
         d.department_id, department_name, -- departments
         j.job_id, job_title --- jobs
from hr.jobs j join hr.employees e 
on j.job_id = e.job_id join  hr.departments d
on e.department_id = d.department_id
where e.job_id = 'SH_CLERK';

-- natural join
select employee_id, first_name, -- employees
         department_id, department_name, -- departments
            job_id, job_title --- jobs
from hr.jobs  NATURAL join hr.employees 
               NATURAL join  hr.departments 
where job_id = 'SH_CLERK';

-- using               
select employee_id, first_name, -- employees
         department_id, department_name, -- departments
            job_id, job_title --- jobs
from hr.jobs join hr.employees
using (job_id) join  hr.departments 
using(department_id)
where job_id = 'SH_CLERK';

-- 직원정보 사원번호, 이름, 급여, 직무를 출력할 때
-- 부서정보 테이블에서 부서명, 우편번호를 출력하며
-- 주소테이블에서 우편번호에 해당하는 주소를 출력하세요.
select employee_id, first_name, salary, job_id
from hr.employees;

select department_name, department_id, location_id
from hr.departments;

select location_id, street_address
from hr.locations;

-- T-SQL Join
select employee_id, first_name, salary, job_id
     , d.department_id, department_name
     , l.location_id, street_address
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;


-- jobs, employees, departments, locations, countries 모델 순서 *****

-- 직원 정보 중 사원번호, 이름, 직무를 출력할 때 직무내용을 출력하고
-- 부서번호와 부서명을 출력하세요.
select employee_id, first_name
     , j.job_id, job_title
     , d.department_id, department_name
from hr.jobs j, hr.employees e, hr.departments d
where j.job_id = e.job_id
and e.department_id = d.department_id;

select employee_id, first_name
     , j.job_id, job_title
     , d.department_id, department_name
from hr.jobs j join hr.employees e
on j.job_id = e.job_id join hr.departments d
on e.department_id = d.department_id;

-- 직원 정보를 구하는 사원 번호, 이름, 급여, 입사일을 출력할 때
-- 급여의 상한값과 하한값을 출력하고
-- 각 부서의 부서명을 출력하고 부서의 우편번호와 주소를 출력하세요.
select employee_id, first_name, salary, hire_date
     , j.job_id, max_salary, min_salary
     , d.department_id, department_name
     , d.location_id
     , l.street_address
from hr.jobs j, hr. employees e, hr.departments d, hr.locations l
where j.job_id = e.job_id
and e.department_id = d.department_id
and d.location_id = l.location_id;
-- 최소 N-1개의 조건이 필요하다.

-- 부서가 없는 직원 출력
select employee_id, first_name, salary, department_id
from hr.employees
where department_id is null;

-- 사원번호, 이름, 급여, 직무, 부서번호, 부서명
-- outer join쓰면 널값이 있는 값도 다 가져온다. 
-- 조인은 양쪽 테이블을 비교해서 같은 값을 가져오는데 outer join은 left면 왼쪽에 있는 값을 널값도 다 포함해서 가져온다.                                           
-- 왼쪽에 있는 애를 다 출력 : left outer join
-- 오른쪽에 있는 애를 다  출력 : right outer join
-- 양쪽 다 : full outer join
select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from hr.employees e left outer join hr.departments d
on e.department_id = d.department_id;

select * from hr.departments;
select * from hr.employees;

select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from  hr.departments d right outer join  hr.employees e
on e.department_id = d.department_id;

select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from  hr.departments d full outer join  hr.employees e
on e.department_id = d.department_id;

-- T-SQL Join
select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from hr.employees e , hr.departments d
where e.department_id = d.department_id(+); -- 왼쪽거를 다 출력할 때 반대에 + 붙인다.

select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from hr.employees e , hr.departments d
where  d.department_id(+) = e.department_id ;

select * from hr.departments;
-- 내가 사용하는 부서만 출력(한번만 출력)
select distinct department_id
from hr.employees;

-- 사원부서를 출력하세요.
select e.department_id, d.department_id , department_name
from hr.employees e right outer join hr.departments d
ON e.department_id = d.department_id
where e.department_id is null;