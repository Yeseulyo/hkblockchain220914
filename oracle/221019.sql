drop table a cascade constraints;
-- �������̺� �ִ� fk�� �ڱ��ڽ� ����

insert into (select employee_id, last_name, email, job_id, hire_date, department_id
            from employees
            where department_id = 50 -- inline ��
            with check option) -- ���ǿ� �´� ��쿡�� �����͸� �����ϰڴ�.
values(501, '��', 'high', '����', sysdate, 50); 

select * from employees;

-- inline �� : ���̺� ��� ����ϴ� ��������, from���� �ִ� ��������
select * 
from (select employee_id, salary, last_name, department_id
      from employees
      where job_id like '%REP%')
where department_id = 80;

-- �� �μ��� ��� �޿����� ���� �޿��� �޴� ����� ����Ͻÿ�.
-- �����ȣ, ��, �޿�, �μ�, ��ձ޿�
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

-- ��Į�� �������� : case �ȿ� �� ��������
-- location_id�� 1800�� �μ��� ��� �μ���ȣ�� usa�� ����Ͻÿ�.
-- �ƴϸ� korea
-- �����ȣ, �̸�, �޿�, �μ���ȣ
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
insert all   -- ���ÿ� ���� ���� �߰�
    into ex7_3(emp_id, emp_name)
    values(1, '������')
    into ex7_3(emp_id, emp_name)
    values(1, '�̼���')
select * from dual;

create table emp
as
select * from hr.employees
where employee_id = 132;

select * from emp;
select * from employees;

-- merge : ���� �����ϴ� ��� update ���� ���� ��� insert ********�߿�*********
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

-- merge : ������ update ������ insert
delete from emp where employee_id != 132;
select * from emp;

merge into emp c
using (select * from employees) e
on (c.employee_id = e.employee_id)
when matched then
update set
    salary = null
delete where e.employee_id = 132 -- matched �Ǹ� �����϶�
when not matched then
insert values(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

select * from emp;

-- �� �μ��� �޿��� ���� ���� �޴� ����� ����Ͻÿ�.
select employee_id, first_name, salary maxsal, e.department_id
from employees e join (select department_id, max(salary) maxsal
                        from employees
                        group by department_id) e1
on e.department_id = e1.department_id
and salary = maxsal;

-- �ֺ� (���� ��� ��)  *******�߿�*******
select employee_id, first_name, salary, department_id
from employees
where (department_id, salary) in
    (select department_id, max(salary)
    from employees
    group by department_id);

-- ��ֺ� (�ϳ��ϳ��� ��)
select employee_id, first_name, salary, department_id
from employees
where department_id in (select department_id
                        from employees)
and salary in (select max(salary)
                from employees
                group by department_id);
                
-- window �Լ�
select window_function(arguments), column1, ...
        over (partition by �÷� order by windowing ��)
from table��;

-- employees ���̺��� ù ����� ����������� ������ȣ, �̸�, �޿�, �޿��� ���հ踦 ����Ͻÿ�.
select sum(salary) from employees;

select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between unbounded preceding and -- unbounded preceding : ó������
       unbounded following)total           -- unbounded following : ������
from employees;

-- employees ���̺��� ù ����� ����������� ������ȣ, �̸�, �޿�, �޿��� �����հ踦 ����Ͻÿ�.
select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between unbounded preceding and
       current row)total        -- current row : ����
from employees;

-- employees ���̺��� ù ����� ����������� ������ȣ, �̸�, �޿�, �޿��� �հ踦 ���� �� ���� ������������� ���� ����Ͻÿ�.
select employee_id, first_name, salary, 
       sum(salary) over(order by salary
       rows between current row and
       unbounded following)total       
from employees;

-- ���� ���õ� window �Լ�
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

-- �μ��� �޿��� �հ踦 ���Ͻÿ�.
select department_id, sum(salary)
from employees
group by department_id;

-- �μ��� �޿��� �հ踦 ���ϴµ� �����ȣ, �̸�, ������ ���
select employee_id, first_name, job_id, department_id,
       sum(salary) over(partition by department_id) dep_sum
from employees;

-- ��纰 �޿��� ����� ������ȣ, ����ȣ, �̸�, �޿��� ����ϼ���.
select employee_id, manager_id, first_name, salary,
       avg(salary) over(partition by manager_id) manager_sum
from employees;

-- �μ��� �޿��� ���� ���� �޴� �ݾװ� �����ȣ, �̸�, �޿�, ������ ���
select employee_id, first_name, salary, job_id,
       max(salary) over(partition by department_id)dept_sum
from employees;

-- �μ��� �޿��� ���� ���� �޴� �޿� �̸��� �����ȣ, �̸�, �޿�, ������ ���
select employee_id, first_name, salary, job_id,
       first_value(salary) over(partition by department_id order by salary desc    -- first_value�� salary�� ������°� �ƴ϶� �ٸ� �͵� ������ �� �ִ�.
       rows unbounded preceding) max_salary
from employees; 

-- �μ��� �޿��� ���� ���� �޴� �޿� �̸��� �����ȣ, �̸�, �޿�, ������ ���
select employee_id, first_name, salary, job_id,
       min(salary) over(partition by department_id)dept_sum
from employees;

select employee_id, first_name, salary, job_id,
       first_value(salary) over(partition by department_id order by salary asc  
       rows unbounded preceding) max_salary
from employees; 

select employee_id, first_name, salary, job_id,
       last_value(first_name) over(partition by department_id order by salary desc  -- salary�� ���� ���� �����ִ� ���
       rows between unbounded preceding and unbounded following) max_salary
from employees; 