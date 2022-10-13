-- 카티시안 곱
-- A   B
-- 1   4
-- 2   5
-- 3   
-- {1,4}{1,5}{2,4}{2,5}{3,4}{3,5]     -- 3*2 = 6
select first_name, last_name, salary
    , e.department_id, department_name
from hr.employees e, hr.departments d;
-- 107 * 27 = 2889 조인 조건을 안주면 카티션곱으로 나온다.

select first_name, last_name, salary
    , e.department_id, department_name
from hr.employees e CROSS join hr.departments d;

select count(*) from hr.employees; -- 107
select count(*) from hr.departments; -- 27

select manager_id
from hr.employees
where employee_id = 103; -- 103번의 상사를 둔 102번의 정보를 알고싶다.

select e1.employee_id, e2.employee_id -- 내정보와 상사정보 둘다 필요.
from hr.employees e1, hr.employees e2
where e1.manager_id = e2.employee_id
and e1.employee_id = 103; 

select e1.employee_id, e2.employee_id
from hr.employees e1 join hr.employees e2
on e1.manager_id = e2.employee_id
and e1.employee_id = 103;

select manager_id
from hr.employees
where employee_id = 103;

select * from hr.employees
where employee_id = 102;

select * from hr.employees
where employee_id = (select manager_id from hr.employees where employee_id = 103); -- 쿼리문 안에 쿼리문이 있는 것 : 서브쿼리문
--                   102
select 100 + 2
from dual;

-- 90인 부서의 평균급여
select trunc(avg(salary), -3)
from hr.employees
where department_id = 90;

select * from hr.employees
where salary > 19000; -- 90인 부서의 평균급여보다 많이 받는 사람

select * from hr.employees
where salary > (select trunc(avg(salary), -3)
from hr.employees
where department_id = 90);

-- 성이 Rogers인 사원보다 먼저 입사한 사원을 구하시오.
select hire_date
from hr.employees
where last_name = 'Rogers';

select * from hr.employees
where hire_date < 06/08/26;

select * from hr.employees
where hire_date < (select hire_date
from hr.employees
where last_name = 'Rogers');

-- Rogers의 직무와 같고 Rogers 급여보다 많이 받는 사원을 구하시오.
select job_id
from hr.employees
where last_name = 'Rogers'; -- ST_CLERK

select salary
from hr.employees
where last_name = 'Rogers'; -- 2900

select * from hr.employees
where job_id = 'ST_CLERK'
and salary > 2900;

select * from hr.employees
where job_id = (select job_id
from hr.employees
where last_name = 'Rogers')
and salary > (select salary
from hr.employees
where last_name = 'Rogers');

-- 단일행 서브쿼리 : 비교연산자

-- 급여를 제일 적게 받는 직원을 출력하시오.
select min(salary)
from hr.employees;

select * from hr.employees
where salary = 2100;

select * from hr.employees
where salary = (select min(salary)
from hr.employees);

-- 사원번호, 이름, 직무, 급여를 출력하는데 Rogers의 입사일도 같이 출력하시오.
select hire_date from hr.employees
where last_name = 'Rogers';

select employee_id, first_name, job_id, salary, '06/08/26'
from hr.employees;

select employee_id, first_name, job_id, salary, (select hire_date from hr.employees
where last_name = 'Rogers') Rogers_hire_date
from hr.employees;

-- 각 부서의 최소급여가 50인 부서의 최소급여보다 큰 
-- 부서와 최소급여를 출력하세요.
select min(salary)
from hr.employees
where department_id = 50; -- 2100

select department_id, min(salary)
from hr.employees
group by department_id
having min(salary) > 2100;

select department_id, min(salary)
from hr.employees
group by department_id
having min(salary) > (select min(salary)
                      from hr.employees
                      where department_id = 50);

-- 다중행 서브쿼리
-- Taylor사원이 가진 직무와 같은 직무를 하고 있는 사원들을 출력
select job_id from hr.employees
where last_name = 'Taylor'; -- SA_REP -- SH_CLERK
-- 'SA_REP' 또는 'SH_CLERK'를 하는 사원들을 구하시오.
select * from hr.employees
where job_id = 'SA_REP' or job_id = 'SH_CLREK';

select * from hr.employees
where job_id in('SA_REP', 'SH_CLERK');

select * from hr.employees
where job_id in(select job_id from hr.employees
                where last_name = 'Taylor'); -- =을 쓰지 않고 in을 쓴 이유는 =은(비교연산자) 단일행이라서 다중행에 쓰지 못한다.
                
-- Rogers와 같은 직무를 하는 사원들을 구하세요.
select * from hr.employees
where job_id = (select job_id from hr.employees
                where last_name = 'Rogers'); -- 다중행으로 바꿔도 된다. 다중행은 한개 이상이기만 하면 가능 -- 크다 작다가 아니고 =으로 갖고올거면 다중행인지 단일행인지 모르면 다중행 in으로 쓰자.

select * from hr.employees
where job_id in (select job_id from hr.employees
                where last_name = 'Rogers');
                
-- Haas사원이 하는 직무와 같은 직무를 하는 직원들을 구하세요.
select * from hr.employees
where job_id in (select job_id from hr.employees
                where last_name = 'Hass');
                
-- 각 부서의 최소급여를 받는 사원들을 구하시오.
select min(salary) from hr.employees
group by department_id;

select * from hr.employees
where salary in(select min(salary) from hr.employees
                group by department_id);
                
-- 4200, 4800, 6000, 9000의 최소보다 큰 급여를 받는 사원을 구하시오.
select * from hr.employees
where salary > any(4200, 4800, 6000, 9000);
-- 60인 부서의 최소급여보다 더 많이 받는 직원들을 구하시오.
select * from hr.employees
where salary > (select min(salary) from hr.employees
                  where department_id = 60);
                  
select * from hr.employees
where salary > any (select salary from hr.employees
                  where department_id = 60);

-- 직무가 'IT_PROG'인 사원들 중 급여를 제일 많이 받는 사람보다 작게 받는 사원들을 구하시오.
select * from hr.employees
where salary < (select max(salary) from hr.employees
                where job_id = 'IT_PROG');
                
-- 다중행 연산자
select * from hr.employees
where salary < any (select salary from hr.employees
                where job_id = 'IT_PROG');
-- in, any, all
-- any (작은거보다 크고 큰거보다 작은거) in을 =any로 써도 됨.
-- all (큰거보다 크고 작은거보다 작은거)

-- 직무가 IT_PROG인 사원들의 급여중 제일 많이 받는 급여보다 더 많이 받는 사원을 구하시오.
select max(salary) from hr.employees
where job_id = 'IT_PROG'; -- 9000

select * from hr.employees
where salary > 9000; --단일행

select * from hr.employees
where salary > all (select salary from hr.employees
                where job_id = 'IT_PROG'); --다중행

-- 직무가 IT_PROG인 사원들의 급여중 제일 작게 받는 급여보다 더 작게 받는 사원을 구하시오.
select min(salary)from hr.employees
where job_id = 'IT_PROG';

select * from hr.employees
where salary < (select min(salary) from hr.employees
                where job_id = 'IT_PROG');
                
select * from hr.employees
where salary < all (select salary from hr.employees
                where job_id = 'IT_PROG');

-- 가장 많은 사원이 하는 직무는 무엇일까?
select max(count(*)) from hr.employees
group by job_id;

select job_id from hr.employees
group by job_id
having count(*) = 30;

select job_id from hr.employees
group by job_id
having count(*) = (select max(count(*)) from hr.employees
group by job_id);

select * from hr.employees
where job_id = (select job_id from hr.employees
                group by job_id
                having count(*) = (select max(count(*)) 
                                   from hr.employees
                                   group by job_id));
                                   
-- 다중행 연산자 사용
-- 직무가 IT_PROG에서 제일 많이 받는 급여보다 더 많이 받는 사원을 구하는데 IT_PROG는 제외해서 출력하시오.
select max(salary) from hr.employees
where job_id = 'IT_PROG'; -- 9000

select * from hr.employees
where salary > all ( select salary from hr.employees
                    where job_id = 'IT_PROG')
                    and job_id != 'IT_PROG';
---- in과 = any는 같다.                    
select * from hr.employees
where job_id in(select job_id from hr.employees
                where last_name = 'Taylor');
                
select * from hr.employees
where job_id = Any(select job_id from hr.employees
                where last_name = 'Taylor');
                
-- 90인 부서의 급여와 같은 급여를 받는 사원들을 구하시오.
select * from hr.employees
where salary in (select salary from hr.employees
                where department_id = 90);

-- 90인 부서의 급여와 같지 않은 급여를 받는 사원들을 구하시오.
select * from hr.employees
where salary not in (select salary from hr.employees
                where department_id = 90);

-- C : 생성 : create : insert
-- R : 일기 : read   : select
-- U : 수정 : update : update
-- D : 삭제 : delete : delete

select employee_id
from hr.employees
where last_name = 'Taylor';

-- UNION (두 개의 테이블에서 데이터를 가져오는데 중복은 한번만 출력)
-- 컬럼명이나 데이터는 중요 않고 타입이 중요하다. 
-- 열의 컬럼명의 갯수,열의 타입이 같아야 한다.
select employee_id, job_id from hr.employees
union
select employee_id, job_id from hr.job_history
order by 1;
desc hr.employees;

-- 아이디 확인할 때 쓰는 로직
-- select emp_id from employees where emp_id = 'highland0'
-- union 
-- select user_id from member where user_id = 'highland0';

-- 로그인 할 때 사용하는 로직
-- union( 합집합, 두개중에 하나라도 있으면 갖고와라 두개 다 있으면 한번만 출력)
-- select user_id, user_pw, user_email 
-- from member 
-- where user_id = 'highland0'
-- and user_pw = '12345'
-- union
-- select emp_id, emp_pw, emp_email
-- from employees
-- where emp_id = 'highland0'
-- and emp_id = '12345';
-- union
-- select user_id, user_pw, user_email 
-- from administrator 
-- where user_id = 'highland0'
-- and user_pw = '12345'

select employee_id, job_id from hr.employees
union all -- 중복 제거하지 않고 다 출력하자.
select employee_id, job_id from hr.job_history
order by 1;

-- INTERSECT : 교집합 (같은거 출력해라)
select employee_id, job_id from hr.employees
intersect
select employee_id, job_id from hr.job_history
order by 1;

-- minus (첫번째 테이블에 있는 것만 출력해라)
select employee_id, job_id from hr.employees
minus
select employee_id, job_id from hr.job_history
order by 1;

select employee_id, job_id from hr.job_history
minus
select employee_id, job_id from hr.employees
order by 1;

select employee_id, to_char(null) , salary , hire_date, to_number(null)
from hr.employees
union
select employee_id, job_id, to_number(null), to_date(null), department_id -- job_history에는 salary, hire_date가 없으므로 to_(null)써준다. 0을 써도 됨. 위에 테이블에서 departmemt_id 출력 안하고 싶으면 to_(null)써주면 됨.
from hr.job_history;

select * from hr.job_history;


-- 테이블 생성
desc hr.departments;

-- DEPARTMENT_ID   NOT NULL NUMBER(4)    
-- DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
-- MANAGER_ID               NUMBER(6)    
-- LOCATION_ID              NUMBER(4)

create table departments(
    department_id number not null,
    department_name varchar2(30) not null,
    manager_id number(6),
    location_id number(4)
);
desc departments;
select * from departments;

desc hr.employees;
drop table employees; -- 테이블 지우기
drop table departments;
create table employees(
    employee_id     number(6)    not null,
    first_name      varchar2(20), 
    last_name       varchar2(25) not null,
    email           varchar2(25) not null,
    phone_number    varchar2(20), 
    hire_date       date         default sysdate,
    job_id          varchar2(10) not null,
    salary          number(8,2), 
    commission_pct   number(2,2),  
    manager_id      number(6),    
    department_id   number(4)  
);

insert into departments(department_id, department_name, manager_id, location_id)
values (70, 'Public Relations', 100, 1700); 
select * from departments;

-- 199
-- Douglas
-- Grant
-- DGRANT
-- 650.507.9844
-- 08/01/13
-- SH_CLERK
-- 2600
-- 124
-- 50

-- 핸드폰번호는 010-0000-0000이라서 앞에 0이 알아서 자동형변환 돼서 0이사라진다.
-- 그러므로 숫자를 쓸 때 맨앞에 0을 쓸라면 문자로 써줘야한다. '010-0000-0000'

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (199, 'Douglas', 'Grant', 'Dgrant', '650.507.9844', '08/01/13', 'SH_CLERK', 2600, null, 124, 50);

select * from hr.employees;
select * from employees;

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
values(198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '07/06/21', 'SH_CLERK', 2600,	124, 50);

insert into employees -- 모든 컬럼에 데이터를 넣을때는 컬럼명을 안적어줘도 되지만, 모든 컬럼 리스트를  다 적어주자!
values(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '03/09/17', 'AD_ASST', 4400, null, 101, 10);

insert into employees (employee_id, first_name, last_name, email, phone_number,  job_id, salary, manager_id, department_id)
values(201,	'Michael', 'Hartstein', 'MHARTSTE',	'515.123.5555',	'MK_MAN', 13000, 100, 20);

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(202, 'Pat', 'Fay', 'PFAY', '603.123.6666', default,  'MK_REP', 6000, default, 201, 20); -- null은 default가 된다.

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(203,	'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', sysdate, 'HR_REP', 6500, null, 101, 40);

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values( (select max(employee_id) + 1 from employees), 'Hermann', 'Baer', 'HBAER',	'515.123.8888',	sysdate, 'PR_REP', 10000, default, 101, 70);
-- 마지막 사원 번호의 다음 값을 가지고 오시오.
select max(employee_id) + 1 from employees; -- ************중요************** ex) 게시글 : 번호 자체가 중요하진 않지만 1씩 증가하는 값을 가져야 하는 경우
