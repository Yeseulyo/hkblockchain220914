-- 1.  ����� ��, �޿� , �Ի���, ������ ����� �� ������ ���� ����Ͻÿ�.
select first_name,  salary, hire_date, job_id
     , department_name  
from hr.employees e, hr.departments d;

-- 2. �μ� ���̺��� 90�� �μ������� ����Ͻÿ�.
select *
from hr.departments
where department_id = 90;

-- 3. 90�� �μ��� ������ ���Ͻÿ�. -- employees�� department_id�� �����Ƿ� ���� ���� 
--                                 department_id �ܿ� employees���̺��� �������� ����
--                                 department_name, manager_id, location_id
--                                 �� �������� �ϸ� ����

select *
from hr.employees
where department_id = 90;

-- 4. 100�� ��� ������ ����Ͻÿ�.
select *
from hr.employees
where employee_id = '100';

-- 5. 2 ~ 4���� �ѹ��� ����ϼ���. ????????????????????????
select *
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.department_id = 90
and e.employee_id = 100;


-- 6. ������ȣ, ��, �̸�, �޿�, ����, �μ���ȣ, ������ȣ, �μ����� ���
select employee_id, last_name, first_name, salary, job_id
    , d.department_id, department_name, location_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 7. ������ȣ .��, �̸� �޿� �μ���ȣ, �μ����� 100����� ����Ͻÿ�.
select employee_id, last_name, first_name
     , e.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.department_id = '100';

-- 8. ���� ��ȣ, ��, �̸� , ����, �������� ����ϼ���.
select employee_id, last_name, first_name
    , j.job_id , job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id;

-- 9. �μ����� ����� ������ ���Ͻÿ�. ???????????????????????????????
-- ������ȣ, ��, �޿� �Ի���, �μ���ȣ, �μ����ȣ�� ����Ͻÿ�.
select employee_id, last_name, salary, hire_date
    , e.department_id, e.manager_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.manager_id = d.manager_id;

-- 10. �� �̸� ������ȣ , ��ȭ��ȣ , �޿� �μ���ȣ, �μ����� ���
select last_name, first_name, employee_id, salary
     , d.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 11. �� �μ��� �μ��� ������ �μ����� �̸��� ��� �Ͻÿ�
select first_name
     , e.department_id, e.manager_id, d.manager_id
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and e.manager_id = d. manager_id;

-- 12. ���� ��ȣ, ���� ��ȣ , ��������
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
from hr.employees  Natural join hr.jobs; -- ���� �÷����� �����༭ ������ �Ƚᵵ �ȴ�.

select employee_id, job_id
     , job_title
from hr.employees join hr.jobs 
using (job_id);

-- 13. ������ȣ, �μ���ȣ, �μ���
select employee_id
    , d.department_id, department_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id;

-- 14. �� ������ ������ȣ, ������ȣ, ���� ����, �μ���ȣ, �μ���
select employee_id
    , j.job_id, job_title
    , d.department_id, department_name
from hr.employees e, hr.departments d, hr.jobs j
where j.job_id = e.job_id
and e.department_id = d.department_id;

-- 15. �μ����� ���������� ����Ͻÿ�. �μ��� ��ȣ, ��������,
select e.manager_id
     , d.department_id
     , job_title
from hr.employees e, departments d, hr.jobs j
where e.manager_id = d.manager_id
and e.department_id = d.department_id;

-- 16. �μ��� ���� ������ ���� ���
select *                                            -- ������ ���ؼ� ���� ���� �������µ�
from hr.employees e left outer join hr.departments d -- ���ʿ� �ΰ��� �ִ� ���� �� �����Ͷ�
on e.department_id = d.department_id;

-- 17. ������ ���� �μ� �� ���
select *
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null;

-- 18. �μ��� ���� ������ ������ ���� �μ����� ��� ���
select *
from hr.employees e full outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null;


-- join ���� ������ --
-- 1. ������ �� ������ AD_VP�� ����� ���������� ����Ͻÿ�.
-- ���� �̸�, ������ȣ, ������ȣ, �������� ���
select first_name, employee_id
    , j.job_id, job_title
from hr.employees e, hr.jobs j
where e.job_id = j.job_id
and j.job_id = 'AD_VP';

--  �μ��� ���� ������ �ּҸ� ����Ͻÿ�.
-- �̸�, ������ȣ, �μ���ȣ, �ּ� ���
select first_name
    , j.job_id , street_address
    , d.department_id
from hr.employees e left outer join hr.departments d
on e.department_id = d.department_id join  hr.jobs j
on j.job_id = e.job_id join hr.locations l
on e.department_id is null;

-- 2. �μ����� ����� ������ �μ��̸��� ��������, �ְ����� ���Ͻÿ�.
-- �̸�, �μ����ȣ, �μ���ȣ, ��������, �ְ��� ���
select first_name
     , (max_salary) * 12, (min_salary) * 12
     , d.department_id, department_name  
from hr.employees e, hr.departments d, hr.jobs j
where e.department_id = d.department_id
and e.manager_id = d.manager_id;

-- 3. �Ի����� '03/06/17' ������ ������� �μ��� ������ȣ�� ���
-- �����ȣ, �̸�, �Ի���, �μ���ȣ, �μ���, ������ȣ ���
select employee_id, first_name, hire_date
    , d.department_id, department_name
    , l.location_id
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and hire_date = '03/06/17'; -- �����Ͱ� ��ġġ �ʰ� �ϳ��� ���� e. �Ⱥٿ��� ����

-- 4. �̸��� 'Payam' ������ ������� ���Ͻÿ�.
-- �����ȣ, �̸�, �μ���ȣ, �μ��̸�, ������� ���
select e.employee_id, first_name
    , d.department_id , department_name
    , end_date
from hr.employees e, hr.departments d, hr.job_history jh
where e.employee_id = jh.employee_id
and e.department_id = d.department_id
and e.department_id = jh.department_id
and d.department_id = jh.department_id
and first_name = 'Payam';

-- 5. ����� ���� �μ��� �ּҸ� ����ϼ���.
-- �μ���ȣ, �μ��̸�, �ּ� ���
select d.department_id, department_name
    , l.location_id
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id join hr.locations l
on d.location_id = l.location_id
where e.department_id is null;

-- 6. �μ��� ���� ������ ������ ���� �μ��� ����ϰ� �μ��� �̸����� ����Ͻÿ�.
select employee_id
    , d.department_id, department_name
from hr.employees e full outer join hr.departments d
on e.department_id = d.department_id
where e.department_id is null ;

-- 7. ������ȣ, �̸�, �μ���ȣ, �μ���, ������ȣ, �ּ�, city�� ����ϴµ� CITY�� 'London'�� ����� ����Ͻÿ�.
select employee_id, first_name
    , d.department_id, department_name
    , l.location_id, street_address, city
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and city = 'London';

-- 8. ������ 'IT'�� ���� ��� �� �޿��� 3000�̻��� ����� ����Ͻÿ�.
-- ������ȣ, �����̸�, ������ȣ, ����, �޿� ���
select employee_id, first_name, salary
    , d.department_id, department_name
    ,j.job_id
from hr.employees e, hr.departments d, hr.jobs j
where j.job_id = e.job_id
and e.department_id = d.department_id
and j.job_id like '%IT%'
and salary > 3000;

-- 9. ������ 'IT'�� ���� �ʴ� ����� �����ȣ, �̸�, �޿�, �μ���ȣ, �μ�, ������ ����Ͻÿ�.
-- �� �޿��� ������������ ����
select employee_id, first_name, salary
    , d.department_id, department_name
    , j.job_id
from hr.employees e, hr.departments d, hr.jobs j
where e.job_id = j.job_id
and e.department_id = d.department_id
order by salary desc;

-- 10. ������ȣ�� 1700�� ����� �����ȣ, ����̸�, �μ���ȣ, �μ��̸�, ������ȣ, �ּ�, ���ø� ���Ͻÿ�.
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
