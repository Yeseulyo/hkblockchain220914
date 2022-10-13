select * from hr.locations;
select * from hr.countries;
select * from hr.regions;
select * from hr.departments;
select * from hr.employees;
select * from hr.jobs;
select * from hr. job_history;


-- 1. ANSI-JOIN�� ����ؼ� �����ȣ, �̸�, �μ���ȣ, ��ġ�� ����ϴµ� ��簡 149�� ����鸸 ����Ͻÿ�.
select employee_id, first_name, e.manager_id
    , d.department_id, l.location_id
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and e.manager_id = d.manager_id
and e.manager_id = 149;

-- 2. ������ 4��°���� 6��°���� PRO�� �ִٸ� it_program���� ���
-- ACC�� �ִٸ� finance_account
-- �������� business�� ����Ͻÿ�. ????????????????????????????????????????
select job_id
    ,case when job_id like '___PRO%' then 'it_program'
          when job_id like '%ACC%' then 'finance_account'
     else 'business' end ����
from hr.jobs;

-- 3. ������ REP�� ���ԵǾ� �ִ� ������� ��� �޿��� �ּұ޿� �ִ�޿� �޿��� �հ踦 ���Ͻÿ�.
select job_id, avg(salary), min(salary), max(salary), sum(salary)
from hr.employees
where job_id like '%REP%'
group by job_id;


-- 5.  �μ��� �ִ� �޿��� 10000�̻��� �μ��� ����Ͻÿ�.
select department_id, max(salary)
from hr.employees 
group by department_id 
having max(salary) > 10000;

-- 6. ������ 'SA'�����ϰ� ���� ���� ������� ������ �޿��� �հ谡 
-- 10000�� �ʰ��ϴ� ������ �޿��� �հ踦 ����Ͻÿ�.
-- ���� �޿��� �հ踦 ������������ �����Ͽ� ���
select job_id, sum(salary)
from hr.employees
where job_id not like '%SA%'
group by job_id 
having sum(salary) > 10000
order by sum(salary) desc;

-- 7. �μ��� 20�̰ų� 50�� �μ��� �����ȣ�� �μ���ȣ �� �μ��� �׸��� ��ġ������ ����Ͻÿ�.
select employee_id, e.department_id, department_name, l.location_id
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and d.department_id in(20, 50);

-- 8. Matos��� ���� ������ �ִ� ����� �ִ�.
-- �� ����� �μ������� �����ȣ �׸��� ���� ����Ͻÿ�.
select e.department_id,department_name, employee_id, last_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and last_name = 'Matos';

-- 9. Matos��� ���� ������ �ִ� ����� King��� ���� ���� ����� �ִ�.
-- �� ����� �μ������� �����ȣ �׸��� ���� ����Ͻÿ�.
select e.department_id, department_name, last_name
from hr.employees e, hr.departments d
where e.department_id = d.department_id
and last_name in ('Matos', 'King');

-- 10. King��� ���� ������ �ִ� ����� �ִ�.
-- �� ����� �μ������� �����ȣ �׸��� ���� ����Ͻÿ�.
-- ANSI-JOIN�� ����� ��
select e.department_id, department_name, last_name
from hr.employees e join hr.departments d
on e.department_id = d.department_id
where last_name = 'King';

-- 12. �μ����̺��� �μ���ȣ�� �μ��� �׸��� �����ڵ�� 
--     �������� ����ϴµ� �����ڵ尡 1400�� ������ ���
-- T-SQL, ANSI JOIN
select department_id, department_name, l.location_id, street_address
from hr.departments d, hr.locations l
where l.location_id = 1400;

select department_id, department_name, l.location_id, street_address
from hr.departments d join hr.locations l
on l.location_id = 1400;

-- 14. ������ ������ ����� �� �μ������� �� �μ��� �ּҸ� ����Ͻÿ�.
select employee_id, first_name, d.department_id, l.location_id, street_address
from hr.employees e, hr.departments d, hr.locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;

-- 15. ���������� ����� �� �� ������ �μ������� �� ���� ���������� ����Ͻÿ�.
--      �μ���ȣ, �μ���, ������ȣ, ��������
select d.department_id, department_name, j.job_id, job_title
from hr.jobs j, hr.employees e, hr.departments d
where j.job_id = e.job_id
and e.department_id = d.department_id;


-- 16. ��������� �μ������� ����� �� ����� ���� �μ��� ����ϵ�
-- 200�� �μ����� 260�μ��� �����ϰ� ����Ͻÿ�.
select employee_id, first_name, d.department_id, department_name
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id
where d.department_id not between 200 and 260;


-- 17. ��������� �μ������� ����� �� ����� ���� �μ��� ����ϵ�
--�����ȣ�� Ȧ���� �� �� ����Ͻÿ�.
select employee_id, first_name, d.department_id, department_name
from hr.employees e right outer join hr.departments d
on e.department_id = d.department_id
where mod(employee_id , 2) = 1;


-- 18. ������ ���������� ���������� ����ϴ� ���������� ����
-- ������ ����Ͻÿ�. job_history�� �̿�




-- 19. ������ 4��°���� 6��°���� PRO�� �ִٸ� it_program���� ���
--                                 ACC�� �ִٸ� finance_account
--                                 �������� business�� ����Ͻÿ�.
-- 20. �޿��� 15000 �̻��̸� �ӿ����� ���
--             10000 �̻��̸� ����
--             7000  �̻��̸� ����
--             5000�̻��̸� �븮
--             �������� ������� ����Ͻÿ�.

-- 21. �μ��� �޿��� ����� 5000�̻��� �μ��� ����Ͻÿ�.

-- 22. �޿��� 10000�̻��� ������� �μ��� �޿� ����� 16000�̻��� �μ��� ����Ͻÿ�

-- 23. �Ի����� 2005�⵵  ������ �Ի��� ����� �� �μ��� �ִ�޿��� 8000�̻��� �μ��� �ִ� �޿��� ����Ͻÿ�.

-- 24. �μ��� �ִ� �޿��� 10000�̻��� �μ��� ����Ͻÿ�.

-- 25. ������ 'REP'�����ϰ� ���� ���� ������� ������ �޿��� �հ谡 3000�� �ʰ��ϴ� ������ �޿��� �հ踦 ����Ͻÿ�.
-- ���� �޿��� �հ踦 ������������ �����Ͽ� ���

-- 26.  ������ 25-10-2020������ �ٹ��ϼ��� ����Ͻÿ�.
-- ������ȣ, �μ���ȣ, �Ի���, �ٹ��ϼ�

-- 27. '01-01-2005'�� �Ի��� ����� ����Ͻÿ�.
-- ������ȣ, �μ���ȣ, �Ի���, �ٹ��ϼ�

-- 28. ����(�޿�*12) : �޿��� Ŀ�̼Ǳ��� ���Եȴ�.
-- ������ ����� ���Ͻÿ�.
-- ������ȣ, �μ���ȣ, �޿�, ���

-- 29.  'IT_PROG' �̸� �޿���  1.10*salary
--      'ST_CLERK' �̸� �޿���  1.15*salary
--      'SA_REP' �̸�  �޿��� 1.20*salary
--       ������ ������ salary �� �޿��� �����ϰ� heading name��      "REVISED_SALARY"�� �ǰ� �Ͻÿ�.
-- case�� decode�� ��� ����Ͻÿ�.

-- 30 Ŀ�̼��� ������ �޿��� ����� ���Ͻÿ�. Ŀ�̼��� �ٴ��� ���� ������ ����

-- 31. ���μ��� Ŀ�̼��� ������ �޿��� �հ踦 ���Ͻÿ�.

-- 32. �� �μ��� �������� 5�� �̻��� �μ��� ����Ͻÿ�. (join�ƴ�)

-- 33. �� �μ��� �ִ� ����� ������ �޿��� ����� ���Ͻÿ�.

-- 34. �����ȣ, �̸� , �޿�, �Ի��� , �μ���ȣ, �μ���, ������ȣ, �������� ����� �� ������� �ʴ� ������ ����ϰ� ����� ���� ������ ����Ͻÿ�.

-- 35. ������̺��� ������ MAN�� �����ϰ� �޿��� 10000�̻��� ����� 
-- �����ȣ�� ���� ���� �׸��� �޿��� ����Ͻÿ�.

-- 36. ������ SA_REP�� AD_PRES �̸鼭 �޿��� 15000�� �ʰ��ϴ� ����� ����Ͻÿ�.
-- ��, ��, ����, �޿��� ��� or�� and�� ���

-- 37. �� ������ in�����ڸ� ����Ͻÿ�.

-- 38. �μ��� ������������ �����ϰ� �Ի��ϵ� ������������ ����
-- �μ���ȣ , �޿�, �Ի���, ��

-- 39. �μ��� ������������ �����ϰ� �Ի����� ������������ �����Ͽ� ���
-- �μ���ȣ , �޿�, �Ի���, ��

-- 40. �μ��� ������������ �����ϰ� �Ի����� ������������ �����Ͽ� 
-- �޿��� ������������ �����Ͽ� ���
-- �μ���ȣ ,  �Ի���, �޿�, ��


