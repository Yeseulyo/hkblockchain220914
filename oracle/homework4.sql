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
from hr.employees e, hr.jobs j;

-- 13. ������ȣ, �μ���ȣ, �μ���


select * from hr.jobs;
