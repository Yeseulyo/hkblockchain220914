-- 1.  사원의 성, 급여 , 입사일, 직무를 출력할 대 직무명도 같이 출력하시오.
select first_name,  salary, hire_date, job_id
     , department_name  
from hr.employees e, hr.departments d;

-- 2. 부서 테이블에서 90인 부서정보를 출력하시오.
select *
from hr.departments
where department_id = 90;

-- 3. 90인 부서의 직원을 구하시오. -- employees에 department_id가 있으므로 조인 없이 
--                                 department_id 외에 employees테이블이 갖고있지 않은
--                                 department_name, manager_id, location_id
--                                 를 가져오라 하면 조인

select *
from hr.employees
where department_id = 90;

-- 4. 100번 사원 정보를 출력하시오.
select *
from hr.employees
where employee_id = '100';

-- 5. 2 ~ 4번을 한번에 출력하세요. ????????????????????????



-- 6. 직원번호, 성, 이름, 급여, 직무, 부서번호, 지역번호, 부서명을 출력
select employee_id, last_name, first_name, salary, job_id
    , d.department_id, department_name, location_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 7. 직원번호 .성, 이름 급여 부서번호, 부서명을 100사원만 출력하시오.
select employee_id, last_name, first_name
     , e.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.department_id = '100';

-- 8. 직원 번호, 성, 이름 , 직무, 직무명을 출력하세요.
select employee_id, last_name, first_name
    , j.job_id , job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id;

-- 9. 부서장이 상사인 직원을 구하시오. ???????????????????????????????
-- 직원번호, 성, 급여 입사일, 부서번호, 부서장번호를 출력하시오.
select employee_id, last_name, salary, hire_date
    , e.department_id, e.manager_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.manager_id = d.manager_id;

-- 10. 성 이름 직원번호 , 전화번호 , 급여 부서번호, 부서명을 출력
select last_name, first_name, employee_id, salary
     , d.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 11. 각 부서의 부서의 정보와 부서장의 이름을 출력 하시오
select first_name
     , e.department_id, e.manager_id, d.manager_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.manager_id = d. manager_id;

-- 12. 직원 번호, 직무 번호 , 직무내용
select employee_id, e.job_id
     , job_title
from hr.employees e, hr.jobs j;

-- 13. 직원번호, 부서번호, 부서명


select * from hr.jobs;
