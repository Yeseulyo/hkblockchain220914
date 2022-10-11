-- ptojection :
-- select : �÷���, �����(��Ģ����)
-- from : ���̺�
-- selection : where : �񱳿����ڿ� ���迬����

-- �� ��ɸ� �������(�˻����� �����)
-- select * from hr.employees
-- where job_id like '%REP%';
-- ������ : ���� ���� �ϳ��� �̿��ؼ� ����� ������ �� 
--         �Ϲ��Լ� : nvl, nvl2, nullif, 
--         ���ڿ��Լ� : 
--         ��ȯ�Լ� : to_char, to_date

-- ������ �Լ� : �������� �̿��ؼ� �ϳ��� ����� ������ ��
--              sum(), avg(), min(), max(), count()
--              group by, having

-- employees : ������ ���� ����
-- departments : �μ����� ����
-- 20�κμ��� �������� ����ϼ���.
select * from hr.employees
where department_id = 20;
-- 20�κμ��� �μ����� ����ϼ���.
select department_name
from hr.departments d -- ���̺���� ��Ī �� �� �ִ�.
where department_id = 20;

-- 20�κμ��� �������� ����ϼ���.
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

-- 1999 ���� : ansi - join
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

-- ������ �� ������ SH_CLERK�� ������� ����ϼ���.
-- �����ȣ, �̸�, �޿�, �μ���, ������ȣ
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       JOB_ID
FROM HR.EMPLOYEES
WHERE JOB_ID ='SH_CLERK'; 
-- ���� ���̺��� JOBS���� ������ SH_CLERK�� �������� ����ϼ���.
SELECT JOB_TITLE FROM HR.JOBS
WHERE JOB_ID = 'SH_CLERK';
--- T - SQL -Join
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       HR.jobs.JOB_ID, JOB_TITLE
FROM HR.employees , HR.jobs
WHERE HR.employees.JOB_ID = HR.jobs.JOB_ID;
-- 1999���� -- Ansi-Join
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       HR.jobs.JOB_ID, JOB_TITLE
FROM HR.employees join HR.jobs
on HR.employees.JOB_ID = HR.jobs.JOB_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       e.job_id, j.JOB_ID, JOB_TITLE
FROM HR.employees e join HR.jobs j
on e.JOB_ID = j.JOB_ID;

--- NATURAL JOIN (��Ī �Ⱦ���.)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID,
       JOB_ID, JOB_TITLE
FROM HR.employees NATURAL join HR.jobs ;
--on e.JOB_ID = j.JOB_ID
--- �� ���̺��� �÷����� ���ƾ� �Ѵ�.

select * from  hr.employees; --department_id,manager_id
select * from hr.departments; --department_id , manager_id
--
select first_name, last_name, hire_date
     , e.department_id, department_name
from hr.employees  join hr.departments d
on e.department_id = d.department_id;


-- ������ �� �μ����� ���� �� �������� �μ����� ����Ͻÿ�.
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
--- NATURAL join�� ���� �÷��� �������� �ʾƵ� �ȴ�.

select first_name, last_name, hire_date,
      manager_id, department_id, department_name
from hr.employees e join  hr.departments d
USING (DEPARTMENT_ID, manager_id);

select first_name, last_name, hire_date,
      e.manager_id, department_id, department_name
from hr.employees e join  hr.departments d
USING (DEPARTMENT_ID);
--- using������ ����� �÷��� select ���� ���̺�Ī�� ���� �ʴ´�.

-- T-SQL Join, Ansi Join, Natural Join, using��
-- �� ������ ������ȣ, ������ȣ, �μ���ȣ, �μ���
-- �� �� 20,30,50,80�� �μ��� ���
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

-- using��
select employee_id, job_id, department_id, department_name
from hr.employees e join hr.departments d
using (department_id)
where department_id in (20,30,50,80);

select * from hr.locations;
-- �μ���ȣ, �μ���, �����ȣ, �ּҸ� ����� �� �����ȣ�� 1400�� ���
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

-- natural join -- �÷����� �����ͳ��� ��
select department_id, department_name, location_id, street_address
from hr.departments  natural join hr.locations 
where l.location_id = '1400';

-- usting
select department_id, department_name, location_id, street_address
from hr.departments  join hr.locations 
using (location_id)
where location_id = '1400';

-- 3way join : ���� ���� 
-- SH_CLERK ������ ���� ����� �����ȣ, �̸�, ����, �μ���ȣ�� ������ϴµ�
-- SSH_CLERK�� ���� ������ Ȯ���ϰ�
-- SH_CLREK�� ������ ������ �ִ� ����� �μ����� ����Ͻÿ�.
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
from hr.jobs j NATURAL join hr.employees e 
               NATURAL join  hr.departments d
where e.job_id = 'SH_CLERK';

-- usting               
select employee_id, first_name, -- employees
         department_id, department_name, -- departments
            job_id, job_title --- jobs
from hr.jobs join hr.employees
using (job_id) join  hr.departments 
using(department_id)
where job_id = 'SH_CLERK';

-- �������� �����ȣ, �̸�, �޿�, ������ ����� ��
-- �μ����� ���̺��� �μ���, �����ȣ�� ����ϸ�
-- �ּ����̺��� �����ȣ�� �ش��ϴ� �ּҸ� ����ϼ���.
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


-- jobs, employees, departments, locations, countries �� ����

-- ���� ���� �� �����ȣ, �̸�, ������ ����� �� ���������� ����ϰ�
-- �μ���ȣ�� �μ����� ����ϼ���.
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

-- ���� ������ ���ϴ� ��� ��ȣ, �̸�, �޿�, �Ի����� ����� ��
-- ������ ���Ѱ��� ���Ѱ��� ����ϰ�
-- �� �μ��� �μ����� ����ϰ� �μ��� �����ȣ�� �ּҸ� ����ϼ���.
select employee_id, first_name, salary, hire_date
     , j.job_id, max_salary, min_salary
     , d.department_id, department_name
     , d.location_id
     , l.street_address
from hr.jobs j, hr. employees e, hr.departments d, hr.locations l
where j.job_id = e.job_id
and e.department_id = d.department_id
and d.location_id = l.location_id;
-- �ּ� N-1���� ������ �ʿ��ϴ�.

-- �μ��� ���� ���� ���
select employee_id, first_name, salary, department_id
from hr.employees
where department_id is null;

-- �����ȣ, �̸�, �޿�, ����, �μ���ȣ, �μ���
-- ���ʿ� �ִ� �ָ� �� ��� : left outer join
-- �����ʿ� �ִ� �ָ� ��  ��� : right outer join
-- ���� �� : full outer join
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
where e.department_id = d.department_id(+); -- ���ʰŸ� �� ����� �� �ݴ뿡 + ���δ�.

select employee_id, first_name, salary, job_id
     , e.department_id, d.department_id, department_name
from hr.employees e , hr.departments d
where  d.department_id(+) = e.department_id ;

select * from hr.departments;
-- ���� ����ϴ� �μ��� ���(�ѹ��� ���)
select distinct department_id
from hr.employees;

-- ����μ��� ����ϼ���.
select e.department_id, d.department_id , department_name
from hr.employees e right outer join hr.departments d
ON e.department_id = d.department_id
where e.department_id is null;