-- �������� : ���ϴ� ���� ���������� �Ѵ�.
-- * : ��� �÷��� ���������ϰڴ�.
-- 1. ������ȣ, �̸�, �̸���, �Ի��� ���
select employee_id, first_name, hire_date
from hr.employees;

-- 2. ������ȣ, �̸� , �޿�, �� ��� �޿��� 100���Ͻÿ�
select employee_id, first_name, salary, (salary + 100)
from hr.employees;

-- 3. ������ȣ, ��, �Ի���, ����, ������ ����Ͻÿ�
select employee_id, last_name, hire_date, job_id, salary * 12
from hr.employees;

-- �μ�����
select * from hr.departments;
--- 4. �ּ�, �μ���ȣ, �μ����ȣ, �μ�������� ���
select location_id, department_id, manager_id, department_name
from hr.departments;

-- 5. ������̺��� ������ȣ , �Ի���, ��, �޿������� ���
select employee_id, hire_date, last_name, salary
from hr.employees;

-- 6. ����:
-- ������̺��� �����ȣ, �μ���ȣ , ����, ������ ����ϴµ� 
-- �ſ� 300�� ���ʽ��� ������ �ȴ�.
select employee_id, department_id, job_id, salary, (salary + 300) * 12
from hr.employees;

-- 7. ������̺��� �����ȣ, �μ���ȣ , ����, ������ ����ϴµ� 
-- ������ �޿� 300�� Ư�� ���ʽ��� ������ �ȴ�.
select employee_id, department_id, job_id, salary, (salary * 12) + 300
from hr.employees;

-- 8. ������̺��� �����ȣ, ��, �̸��� , �޿��� ���� Ŀ�̼��� 30%�� �����̵� ��
-- Ŀ�̼� ���� ����Ͻÿ�.
select employee_id, last_name, email, salary, salary * 0.3
from hr.employees;

-- 9.  ������̺��� ������ȣ �̸��� �̸� �Ի��� �޿�, Ŀ�̼��ۼ�Ʈ�� ���
select employee_id, email, first_name, hire_date, salary, commission_pct
from hr.employees;

-- 10�� ����Ͻÿ�
select 10 
from dual; 
-- 10��  null�� ���Ͻÿ�.
select 10 * null 
from dual;
--DUAL�� �Լ� �� ����� ����� �� �� ����� �� �ִ� ���� ���̺��Դϴ�.

-- 10.  ������̺��� ������ȣ �̸��� �̸� �Ի��� �޿�, Ŀ�̼��ۼ�Ʈ�� ����ϴµ�
-- �� ����� �޴� Ŀ�̼��� �ݾ׵� ���� ����Ͻÿ�.
select employee_id, email, first_name, hire_date, salary ,commission_pct, salary * commission_pct 
from hr.employees;

select employee_id, email, hire_date, salary + null
from hr.employees;

select employee_id, email, hire_date, department_id, job_id, commission_pct * null  
from hr.employees;

-- 11. ������ȣ, �̸���, �̸�, �Ի���, ����ó, �μ���ȣ, �޿�, Ŀ�̼��ۼ�Ʈ, 
-- �׸��� Ŀ�̼��� ���ѵ� ������ ����Ͻÿ�
select employee_id, email, first_name, hire_date ,phone_number ,department_id ,salary ,commission_pct, (salary + salary * commission_pct)* 12
from hr.employees;

--12.  heading name�� ��Ī �ֱ�
select employee_id eid, email e, last_name lname, hire_date hd, phone_number ph, department_id did, salary sal, commission_pct comm, (salary + salary * commission_pct)* 12 year_sal  
from hr.employees;

-- 13. ��Ī�� as ���
select employee_id as eid, email as e, first_name as fname, salary as sal
from hr.employees;

--14.  ��Ī�� ���鹮�ڿ� ��ҹ��� �����ϱ�
select employee_id, first_name, salary, commission_pct
, salary + salary * 12 as "year sal"
, salary + salary * 12 "year sal"
, salary + salary * 12 as Year_Sal
, salary + salary * 12 "Year Sal"
, salary + salary * 12 as "Year Sal"
, salary + salary * 12 Year_Sal
from hr.employees;

-- �ڹٿ��� ������ ����� �־ ��Ī�� ���鹮�ڸ� ���� ?۰ ��ҹ��ڸ� ��������
-- �ʴ� ���� ����.
select '�̼���' from dual;

--- 15. ���ڿ� ���̱� ������( || )
select '��' || '����'
from dual;

select employee_id, '���� ����' || last_name, first_name, salary
from hr.employees;

select employee_id, last_name, salary, '2021-11-19', 35
from hr.employees;

--- 16. ������ȣ, last_name first_name(KingSteven),�޿�, ����
select employee_id, last_name || first_name, salary, job_id
from hr.employees;

--17. 16���������� ���� �̸��� ���鹮�ڸ� ����.
select employee_id, last_name ||' '|| first_name, salary, job_id
from hr.employees;

-- 18. �����ȣ�� �޿��� ����ϴ� ���̿� �Ʒ� ������ ��µǰ� �Ͻÿ�. 
-- "KingSteven�� ������ AD_PRES�Դϴ�"�� �������
select employee_id, last_name || first_name || '�� ������' || job_id || '�Դϴ�.' ,salary
from hr.employees;

-- 19. ������ �μ���ȣ�� ����Ͻÿ�.
select department_id 
from hr.employees;

-- 20. ������ �μ��� ��� ������� ���� �ѹ����� ����Ͻÿ�.
--     ������ �����ִ� �μ��� ��� �μ������� �˰� �ʹ�.
select DISTINCT department_id
from hr.employees;

select distinct job_id, department_id
from hr.employees;
--- ���� ���� ��� ���� ��� ���Ű� ������ ��� �ϳ��� �÷� ���� �ٸ��ٸ� ��µȴ�.
--      107                 12
--select  job_id, DISTINCT department_id
--from employees;
-- DISTINCT�� �߰��� ����� �� ���� �� �տ��� ����ؾ� �Ѵ�.

-- 21. ������ �Ի����� �ߺ����� ���� �͸� ����Ͻÿ�.
select distinct job_id, hire_date
from hr.employees;
---- select �÷�,..., �����
---- from ���̺��

---- selection------ ���ϴ� ���� ��������
-- ���ǽ� : where�� 
-- select �÷�,..., �����
-- from ���̺��
-- where ���ǽ�

-- 22. 90�� �μ��� ������� ����Ͻÿ�. 
select *
from hr.employees
where department_id = 90; --���ǽ�

-- 23. �����ȣ, ��, �̸�, �޿��� ���
select employee_id, last_name, first_name, salary
from hr.employees;

-- 24. 90�� �μ��� ������� ����� �� �����ȣ, �̸� , ��, �޿� ���
select employee_id, first_name, last_name, salary
from hr.employees
where department_id = 90;

-- 25. �̸��� 'Nancy'�� ����� �Ի��� , ����, �޿�, Ŀ�̼��ۼ�Ʈ�� ����ϼ���.
select hire_date, job_id, salary, commission_pct
from hr.employees
where first_name = 'Nancy';

select Hire_Date, Job_id, salary, commission_pct
from hr.employeeS;

select hire_date, job_id, salary, commission_pct
from hr.employees
where first_name = 'nancy';
-- ���ڿ� ���ͳ��� ��쿡�� ��ҹ��ڸ� �����Ͽ� ����ؾ� �Ѵ�.

-- 26. �Ի����� 06/01/03�� ����� ����Ͻÿ�.
-- hire_date�� ������ Ÿ���� date �� timestamp
select *
from hr.employees
where hire_date = '06/01/03';
select * from employees
where hire_date = '06-01-03';
select * from employees
where hire_date = '06.01.03';
select * from employees
where hire_date = '2006-01-03';

-- �� ����(���迬��) :  =, >, >=, <, <=, <>, !=, ^=
-- 27. �޿��� 3000�̻��� ������� ��, �޿��� ����Ͻÿ�.
select last_name, salary
from hr.employees
where salary >= 3000;

-- 28. �Ի����� 06/01/03���� �ʰ� �Ի��� ������ �����ȣ �̸� �޿��� ����Ͻÿ�.
select employee_id, first_name, salary
from hr.employees
where hire_date > '06/01/03';

-- 30. �޿��� 3000�� �ƴ� ����� ��� ����Ͻÿ�.
select *
from hr.employees
where salary != 3000;
select * from employees where salary <> 3000;
select * from employees where salary ^= 3000;

-- 31. �޿��� 2500���� 3500������ ����� �� �����ȣ�� �̸�, �޿�, ����, �Ի����� ���
select employee_id, first_name, salary, job_id, hire_date
from hr.employees
where salary between 2500 and 3500;

-- 32. ���� King����  Smith���̿� �ִ� ������� ����Ͻÿ�.
select *
from hr.employees
where last_name between 'King' and 'Smith';

-- 33. �Ի����� 02/06/07���� 06/01/03���̿� �Ի��� ������� ����Ͻÿ�.
select *
from hr.employees
where hire_date between '02/06/07' and '06/01/03';

--- 50�� �μ��� ����� ���
select *
from hr.employees
where department_id = 50;

-- 70�� �μ��� ����� ���
select *
from hr.employees
where department_id = 70;

-- 90�� �μ��� ����� ���
select *
from hr.employees
where department_id = 90;

-- 34. 50, 70, 90�� �μ��� ������� ����ϼ���.
select *
from hr.employees
where department_id in(50, 70, 90);

-- 35. ��簡 100,101,102�� ������� ���Ͻÿ�.



















