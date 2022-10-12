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
select *
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.department_id = 90
and e.employee_id = 100;


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
from hr.employees e, hr.jobs j
where e.job_id = j.job_id;

select employee_id, e.job_id
     , job_title
from hr.employees e join hr.jobs j
on e.job_id = j.job_id;

select employee_id, job_id
     , job_title
from hr.employees  Natural join hr.jobs; -- 같은 컬럼명끼리 비교해줘서 조건을 안써도 된다.

select employee_id, job_id
     , job_title
from hr.employees join hr.jobs 
using (job_id);

-- 13. 직원번호, 부서번호, 부서명
select employee_id
    , d.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 14. 각 직원의 직원번호, 직무번호, 직무 내용, 부서번호, 부서명
select employee_id
    , j.job_id, job_title
    , d.department_id, department_name
from hr.employees e, hr.departments d, hr.jobs j
where j.job_id = e.job_id
and e.department_id = d.department_id;

-- 15. 부서장의 직무내용을 출력하시오. 부서장 번호, 직무내용,
select e.manager_id
     , d.department_id
     , job_title
from hr.employees e, departments d, hr.jobs j
where e.manager_id = d.manager_id
and e.department_id = d.department_id;

-- 16. 부서가 없는 직원도 같이 출력
select *                                            -- 조인은 비교해서 같은 값만 가져오는데
from hr.employees e left outer join hr.departments d -- 왼쪽에 널값이 있는 값도 다 가져와라
on e.department_id = d.department_id;

-- 17. 직원이 없는 부서 를 출력
select *
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null;

-- 18. 부서가 없는 직원과 직원이 없는 부서까지 모두 출력
select *
from hr.employees e full outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null;


-- join 문제 만들어보기 --
-- 1. 직원들 중 직무가 AD_VP인 사원의 직무내용을 출력하시오.
-- 직원 이름, 직원번호, 직업번호, 직무내용 출력
select first_name, employee_id
    , j.job_id, job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id
and j.job_id = 'AD_VP';

--  부서가 없는 직원의 주소를 출력하시오.
-- 이름, 직원번호, 부서번호, 주소 출력
select first_name
    , j.job_id , street_address
    , d.department_id
from hr.employees e left outer join hr.departments d
on e.department_id = d.department_id join  hr.jobs j
on j.job_id = e.job_id join hr.locations l
on e.department_id is null;

-- 2. 부서장이 상사인 직원의 부서이름과 최저연봉, 최고연봉을 구하시오.
-- 이름, 부서장번호, 부서번호, 최저연봉, 최고연봉 출력
select first_name
     , (max_salary) * 12, (min_salary) * 12
     , d.department_id, department_name  
from hr.employees e, hr.departments d, hr.jobs j
where e.department_id = d.department_id
and e.manager_id = d.manager_id;

-- 3. 입사일이 '03/06/17' 이후인 사원들의 부서와 지역번호를 출력
-- 사원번호, 이름, 입사일, 부서번호, 부서명, 지역번호 출력
select employee_id, first_name, hire_date
    , d.department_id, department_name
    , l.location_id
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and hire_date = '03/06/17'; -- 데이터가 겹치치 않고 하나인 것은 e. 안붙여도 가능

-- 4. 이름이 'Payam' 직원의 퇴사일을 구하시오.
-- 사원번호, 이름, 부서번호, 부서이름, 퇴사일을 출력
select e.employee_id, first_name
    , d.department_id , department_name
    , end_date
from hr.employees e, hr.departments d, hr.job_history jh
where e.employee_id = jh.employee_id
and e.department_id = d.department_id
and e.department_id = jh.department_id
and d.department_id = jh.department_id
and first_name = 'Payam';

-- 5. 사원이 없는 부서의 주소를 출력하세요.
-- 부서번호, 부서이름, 주소 출력
select d.department_id, department_name
    , l.location_id
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id join hr.locations l
on d.location_id = l.location_id
where e.department_id is null;

-- 6. 부서가 없는 직원과 직원이 없는 부서를 출력하고 부서의 이름까지 출력하시오.
select employee_id
    , d.department_id, department_name
from hr.employees e full outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null ;

-- 7. 직원번호, 이름, 부서번호, 부서명, 지역번호, 주소, city를 출력하는데 CITY가 'London'인 사원을 출력하시오.
select employee_id, first_name
    , d.department_id, department_name
    , l.location_id, street_address, city
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and city = 'London';

-- 8. 직무에 'IT'가 들어가는 사원 중 급여가 3000이상인 사원을 출력하시오.
-- 직원번호, 직원이름, 직무번호, 직무, 급여 출력
select employee_id, first_name, salary
    , d.department_id, department_name
    ,j.job_id
from hr.employees e, hr.departments d, hr.jobs j
where j.job_id = e.job_id
and e.department_id = d.department_id
and j.job_id like '%IT%'
and salary > 3000;

-- 9. 직무에 'IT'가 들어가지 않는 사원의 사원번호, 이름, 급여, 부서번호, 부서, 직무를 출력하시오.
-- 단 급여를 내림차순으로 정렬
select employee_id, first_name, salary
    , d.department_id, department_name
    , j.job_id
from hr.employees e, hr.departments d, hr.jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id
order by salary desc;

-- 10. 지역번호가 1700인 사원의 사원번호, 사원이름, 부서번호, 부서이름, 지역번호, 주소, 도시를 구하시오.
select employee_id, first_name
     , d.department_id, department_name
     , l.location_id, street_address, city
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.location_id = 1700;

select * from hr.employees;
select * from hr.departments;
select * from hr.jobs;
select * from hr.locations;
select * from hr.job_history;
select * from hr.regions;
