drop table a cascade constraints;
-- 하위테이블에 있는 fk와 자기자신 삭제

insert into (select employee_id, last_name, email, job_id, hire_date, department_id
            from employees
            where department_id = 50 -- inline 뷰
            with check option) -- 조건에 맞는 경우에만 데이터를 저장하겠다.
values(501, '이', 'high', '강사', sysdate, 50); 

select * from employees;

-- inline 뷰 : 테이블 대신 사용하는 서브쿼리, from절에 있는 서브쿼리
select * 
from (select employee_id, salary, last_name, department_id
      from employees
      where job_id like '%REP%')
where department_id = 80;

-- 각 부서의 평균 급여보다 많은 급여를 받는 사원을 출력하시오.
-- 사원번호, 성, 급여, 부서, 평균급여
select employee_id, last_name, salary, department_id
from employees;

select department_id, avg(salary)
from employees
group by department_id;

select employee_id, last_name, salary, e.department_id, avgsal
from employees e, (select department_id, avg(salary) avgsal
                    from employees
                    group by department_id) s
where e.department_id = s.department_id
and salary > avgsal;

select employee_id, last_name, salary, e.department_id, avgsal
from employees e join (select department_id, avg(salary) avgsal
                    from employees
                    group by department_id) s
on e.department_id = s.department_id
where salary > avgsal;

select employee_id, last_name, salary, department_id, avgsal
from employees e natural join (select department_id, avg(salary) avgsal
                    from employees
                    group by department_id) 
where salary > avgsal;

-- 스칼라 서브쿼리 : case 안에 들어간 서브쿼리
-- location_id가 1800인 부서인 경우 부서번호를 usa를 출력하시오.
-- 아니면 korea
-- 사원번호, 이름, 급여, 부서번호
select department_id from departments where location_id = 1800;

select employee_id, first_name, salary,
       case when department_id = 20 then 'USA'
            else 'Korea' end locations
from employees;

select employee_id, first_name, salary,
       case when department_id = (select department_id from departments where location_id = 1800) then 'USA'
            else 'Korea' end locations
from employees;

create table ex7_3(
    emp_id number,
    emp_name varchar2(100)
);
insert all   -- 동시에 여러 행을 추가
    into ex7_3(emp_id, emp_name)
    values(1, '강감찬')
    into ex7_3(emp_id, emp_name)
    values(1, '이순신')
select * from dual;

create table emp
as
select * from hr.employees
where employee_id = 132;

select * from emp;
select * from employees;

-- merge : 행이 존재하는 경우 update 행이 없는 경우 insert ********중요*********
merge into emp e1
using (select * from employees) e2
on (e1. employee_id = e2.employee_id)
when matched then
update set 
    salary = salary * 1.1,
    hire_date = sysdate
when not matched then
insert values(e2.employee_id, e2.first_name, e2.last_name, e2.email, e2.phone_number, e2.hire_date, e2.job_id, e2.salary, e2.commission_pct, e2.manager_id, e2.department_id);

select * from emp;

-- merge : 있으면 update 없으면 insert
delete from emp where employee_id != 132;
select * from emp;

merge into emp c
using (select * from employees) e
on (c.employee_id = e.employee_id)
when matched then
update set
    salary = null
delete where e.employee_id = 132 -- matched 되면 삭제하라
when not matched then
insert values(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

select * from emp;

-- 각 부서의 급여를 제일 많이 받는 사원을 출력하시오.
select employee_id, first_name, salary maxsal, e.department_id
from employees e join (select department_id, max(salary) maxsal
                        from employees
                        group by department_id) e1
on e.department_id = e1.department_id
and salary = maxsal;

-- 쌍비교 (같이 묶어서 비교)  *******중요*******
select employee_id, first_name, salary, department_id
from employees
where (department_id, salary) in
    (select department_id, max(salary)
    from employees
    group by department_id);

-- 비쌍비교 (하나하나씩 비교)
select employee_id, first_name, salary, department_id
from employees
where department_id in (select department_id
                        from employees)
and salary in (select max(salary)
                from employees
                group by department_id);
                
-- window 함수
select window_function(arguments), column1, ...
        over (partition by 컬럼 order by windowing 절)
from table명;

-- employees 테이블의 첫 행부터 마지막행까지 직원번호, 이름, 급여, 급여의 총합계를 출력하시오.
select sum(salary) from employees;

select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between unbounded preceding and -- unbounded preceding : 처음부터
       unbounded following)total           -- unbounded following : 끝까지
from employees;

-- employees 테이블의 첫 행부터 마지막행까지 직원번호, 이름, 급여, 급여의 누적합계를 출력하시오.
select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between unbounded preceding and
       current row)total        -- current row : 현재
from employees;

-- employees 테이블의 첫 행부터 마지막행까지 직원번호, 이름, 급여, 급여의 합계를 현재 행 부터 마지막행까지의 합을 출력하시오.
select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between current row and
       unbounded following)total       
from employees;

-- 순위 관련된 window 함수
Rank();
select employee_id, salary,
        rank() over(order by salary desc) all_rank
from employees;

select employee_id, salary,
        rank() over(order by salary desc) all_rank,
        job_id,
        rank() over(partition by job_id order by salary desc)
        job_rank
from employees
order by job_id;

DENSE_RANK();
select employee_id, salary,
        rank() over(order by salary desc) all_rank,
        dense_rank() over(partition by job_id order by salary desc) den_rank
from employees;

ROW_NUMBER();
select employee_id, salary,
        rank() over(order by salary desc) all_rank,
        row_number() over(partition by job_id order by salary desc) row_number
from employees;

-- 부서별 급여의 합계를 구하시오.
select department_id, sum(salary)
from employees
group by department_id;

-- 부서별 급여의 합계를 구하는데 사원번호, 이름, 직무를 출력
select employee_id, first_name, job_id, department_id,
       sum(salary) over(partition by department_id) dep_sum
from employees;

-- 상사별 급여의 평균을 직원번호, 상사번호, 이름, 급여를 출력하세요.
select employee_id, manager_id, first_name, salary,
       avg(salary) over(partition by manager_id) manager_sum
from employees;

-- 부서별 급여를 제일 많이 받는 금액과 사원번호, 이름, 급여, 직무를 출력
select employee_id, first_name, salary, job_id,
       max(salary) over(partition by department_id)dept_sum
from employees;

-- 부서별 급여를 제일 많이 받는 급여 이름과 사원번호, 이름, 급여, 직무를 출력
select employee_id, first_name, salary, job_id,
       first_value(salary) over(partition by department_id order by salary desc    -- first_value는 salary만 갖고오는게 아니라 다른 것도 가져올 수 있다.
       rows unbounded preceding) max_salary
from employees; 

-- 부서별 급여를 제일 적게 받는 급여 이름과 사원번호, 이름, 급여, 직무를 출력
select employee_id, first_name, salary, job_id,
       min(salary) over(partition by department_id)dept_sum
from employees;

select employee_id, first_name, salary, job_id,
       first_value(salary) over(partition by department_id order by salary asc  
       rows unbounded preceding) max_salary
from employees; 

select employee_id, first_name, salary, job_id,
       last_value(first_name) over(partition by department_id order by salary desc  -- salary가 제일 적게 갖고있는 사람
       rows between unbounded preceding and unbounded following) max_salary
from employees; 