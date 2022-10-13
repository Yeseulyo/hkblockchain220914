-- īƼ�þ� ��
-- A   B
-- 1   4
-- 2   5
-- 3   
-- {1,4}{1,5}{2,4}{2,5}{3,4}{3,5]     -- 3*2 = 6
select first_name, last_name, salary
    , e.department_id, department_name
from hr.employees e, hr.departments d;
-- 107 * 27 = 2889 ���� ������ ���ָ� īƼ�ǰ����� ���´�.

select first_name, last_name, salary
    , e.department_id, department_name
from hr.employees e CROSS join hr.departments d;

select count(*) from hr.employees; -- 107
select count(*) from hr.departments; -- 27

select manager_id
from hr.employees
where employee_id = 103; -- 103���� ��縦 �� 102���� ������ �˰�ʹ�.

select e1.employee_id, e2.employee_id -- �������� ������� �Ѵ� �ʿ�.
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
where employee_id = (select manager_id from hr.employees where employee_id = 103); -- ������ �ȿ� �������� �ִ� �� : ����������
--                   102
select 100 + 2
from dual;

-- 90�� �μ��� ��ձ޿�
select trunc(avg(salary), -3)
from hr.employees
where department_id = 90;

select * from hr.employees
where salary > 19000; -- 90�� �μ��� ��ձ޿����� ���� �޴� ���

select * from hr.employees
where salary > (select trunc(avg(salary), -3)
from hr.employees
where department_id = 90);

-- ���� Rogers�� ������� ���� �Ի��� ����� ���Ͻÿ�.
select hire_date
from hr.employees
where last_name = 'Rogers';

select * from hr.employees
where hire_date < 06/08/26;

select * from hr.employees
where hire_date < (select hire_date
from hr.employees
where last_name = 'Rogers');

-- Rogers�� ������ ���� Rogers �޿����� ���� �޴� ����� ���Ͻÿ�.
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

-- ������ �������� : �񱳿�����

-- �޿��� ���� ���� �޴� ������ ����Ͻÿ�.
select min(salary)
from hr.employees;

select * from hr.employees
where salary = 2100;

select * from hr.employees
where salary = (select min(salary)
from hr.employees);

-- �����ȣ, �̸�, ����, �޿��� ����ϴµ� Rogers�� �Ի��ϵ� ���� ����Ͻÿ�.
select hire_date from hr.employees
where last_name = 'Rogers';

select employee_id, first_name, job_id, salary, '06/08/26'
from hr.employees;

select employee_id, first_name, job_id, salary, (select hire_date from hr.employees
where last_name = 'Rogers') Rogers_hire_date
from hr.employees;

-- �� �μ��� �ּұ޿��� 50�� �μ��� �ּұ޿����� ū 
-- �μ��� �ּұ޿��� ����ϼ���.
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

-- ������ ��������
-- Taylor����� ���� ������ ���� ������ �ϰ� �ִ� ������� ���
select job_id from hr.employees
where last_name = 'Taylor'; -- SA_REP -- SH_CLERK
-- 'SA_REP' �Ǵ� 'SH_CLERK'�� �ϴ� ������� ���Ͻÿ�.
select * from hr.employees
where job_id = 'SA_REP' or job_id = 'SH_CLREK';

select * from hr.employees
where job_id in('SA_REP', 'SH_CLERK');

select * from hr.employees
where job_id in(select job_id from hr.employees
                where last_name = 'Taylor'); -- =�� ���� �ʰ� in�� �� ������ =��(�񱳿�����) �������̶� �����࿡ ���� ���Ѵ�.
                
-- Rogers�� ���� ������ �ϴ� ������� ���ϼ���.
select * from hr.employees
where job_id = (select job_id from hr.employees
                where last_name = 'Rogers'); -- ���������� �ٲ㵵 �ȴ�. �������� �Ѱ� �̻��̱⸸ �ϸ� ���� -- ũ�� �۴ٰ� �ƴϰ� =���� ����ðŸ� ���������� ���������� �𸣸� ������ in���� ����.

select * from hr.employees
where job_id in (select job_id from hr.employees
                where last_name = 'Rogers');
                
-- Haas����� �ϴ� ������ ���� ������ �ϴ� �������� ���ϼ���.
select * from hr.employees
where job_id in (select job_id from hr.employees
                where last_name = 'Hass');
                
-- �� �μ��� �ּұ޿��� �޴� ������� ���Ͻÿ�.
select min(salary) from hr.employees
group by department_id;

select * from hr.employees
where salary in(select min(salary) from hr.employees
                group by department_id);
                
-- 4200, 4800, 6000, 9000�� �ּҺ��� ū �޿��� �޴� ����� ���Ͻÿ�.
select * from hr.employees
where salary > any(4200, 4800, 6000, 9000);
-- 60�� �μ��� �ּұ޿����� �� ���� �޴� �������� ���Ͻÿ�.
select * from hr.employees
where salary > (select min(salary) from hr.employees
                  where department_id = 60);
                  
select * from hr.employees
where salary > any (select salary from hr.employees
                  where department_id = 60);

-- ������ 'IT_PROG'�� ����� �� �޿��� ���� ���� �޴� ������� �۰� �޴� ������� ���Ͻÿ�.
select * from hr.employees
where salary < (select max(salary) from hr.employees
                where job_id = 'IT_PROG');
                
-- ������ ������
select * from hr.employees
where salary < any (select salary from hr.employees
                where job_id = 'IT_PROG');
-- in, any, all
-- any (�����ź��� ũ�� ū�ź��� ������) in�� =any�� �ᵵ ��.
-- all (ū�ź��� ũ�� �����ź��� ������)

-- ������ IT_PROG�� ������� �޿��� ���� ���� �޴� �޿����� �� ���� �޴� ����� ���Ͻÿ�.
select max(salary) from hr.employees
where job_id = 'IT_PROG'; -- 9000

select * from hr.employees
where salary > 9000; --������

select * from hr.employees
where salary > all (select salary from hr.employees
                where job_id = 'IT_PROG'); --������

-- ������ IT_PROG�� ������� �޿��� ���� �۰� �޴� �޿����� �� �۰� �޴� ����� ���Ͻÿ�.
select min(salary)from hr.employees
where job_id = 'IT_PROG';

select * from hr.employees
where salary < (select min(salary) from hr.employees
                where job_id = 'IT_PROG');
                
select * from hr.employees
where salary < all (select salary from hr.employees
                where job_id = 'IT_PROG');

-- ���� ���� ����� �ϴ� ������ �����ϱ�?
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
                                   
-- ������ ������ ���
-- ������ IT_PROG���� ���� ���� �޴� �޿����� �� ���� �޴� ����� ���ϴµ� IT_PROG�� �����ؼ� ����Ͻÿ�.
select max(salary) from hr.employees
where job_id = 'IT_PROG'; -- 9000

select * from hr.employees
where salary > all ( select salary from hr.employees
                    where job_id = 'IT_PROG')
                    and job_id != 'IT_PROG';
---- in�� = any�� ����.                    
select * from hr.employees
where job_id in(select job_id from hr.employees
                where last_name = 'Taylor');
                
select * from hr.employees
where job_id = Any(select job_id from hr.employees
                where last_name = 'Taylor');
                
-- 90�� �μ��� �޿��� ���� �޿��� �޴� ������� ���Ͻÿ�.
select * from hr.employees
where salary in (select salary from hr.employees
                where department_id = 90);

-- 90�� �μ��� �޿��� ���� ���� �޿��� �޴� ������� ���Ͻÿ�.
select * from hr.employees
where salary not in (select salary from hr.employees
                where department_id = 90);

-- C : ���� : create : insert
-- R : �ϱ� : read   : select
-- U : ���� : update : update
-- D : ���� : delete : delete

select employee_id
from hr.employees
where last_name = 'Taylor';

-- UNION (�� ���� ���̺��� �����͸� �������µ� �ߺ��� �ѹ��� ���)
-- �÷����̳� �����ʹ� �߿� �ʰ� Ÿ���� �߿��ϴ�. 
-- ���� �÷����� ����,���� Ÿ���� ���ƾ� �Ѵ�.
select employee_id, job_id from hr.employees
union
select employee_id, job_id from hr.job_history
order by 1;
desc hr.employees;

-- ���̵� Ȯ���� �� ���� ����
-- select emp_id from employees where emp_id = 'highland0'
-- union 
-- select user_id from member where user_id = 'highland0';

-- �α��� �� �� ����ϴ� ����
-- union( ������, �ΰ��߿� �ϳ��� ������ ����Ͷ� �ΰ� �� ������ �ѹ��� ���)
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
union all -- �ߺ� �������� �ʰ� �� �������.
select employee_id, job_id from hr.job_history
order by 1;

-- INTERSECT : ������ (������ ����ض�)
select employee_id, job_id from hr.employees
intersect
select employee_id, job_id from hr.job_history
order by 1;

-- minus (ù��° ���̺� �ִ� �͸� ����ض�)
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
select employee_id, job_id, to_number(null), to_date(null), department_id -- job_history���� salary, hire_date�� �����Ƿ� to_(null)���ش�. 0�� �ᵵ ��. ���� ���̺��� departmemt_id ��� ���ϰ� ������ to_(null)���ָ� ��.
from hr.job_history;

select * from hr.job_history;


-- ���̺� ����
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
drop table employees; -- ���̺� �����
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

-- �ڵ�����ȣ�� 010-0000-0000�̶� �տ� 0�� �˾Ƽ� �ڵ�����ȯ �ż� 0�̻������.
-- �׷��Ƿ� ���ڸ� �� �� �Ǿտ� 0�� ����� ���ڷ� ������Ѵ�. '010-0000-0000'

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values (199, 'Douglas', 'Grant', 'Dgrant', '650.507.9844', '08/01/13', 'SH_CLERK', 2600, null, 124, 50);

select * from hr.employees;
select * from employees;

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
values(198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '07/06/21', 'SH_CLERK', 2600,	124, 50);

insert into employees -- ��� �÷��� �����͸� �������� �÷����� �������൵ ������, ��� �÷� ����Ʈ��  �� ��������!
values(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '03/09/17', 'AD_ASST', 4400, null, 101, 10);

insert into employees (employee_id, first_name, last_name, email, phone_number,  job_id, salary, manager_id, department_id)
values(201,	'Michael', 'Hartstein', 'MHARTSTE',	'515.123.5555',	'MK_MAN', 13000, 100, 20);

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(202, 'Pat', 'Fay', 'PFAY', '603.123.6666', default,  'MK_REP', 6000, default, 201, 20); -- null�� default�� �ȴ�.

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(203,	'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', sysdate, 'HR_REP', 6500, null, 101, 40);

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values( (select max(employee_id) + 1 from employees), 'Hermann', 'Baer', 'HBAER',	'515.123.8888',	sysdate, 'PR_REP', 10000, default, 101, 70);
-- ������ ��� ��ȣ�� ���� ���� ������ ���ÿ�.
select max(employee_id) + 1 from employees; -- ************�߿�************** ex) �Խñ� : ��ȣ ��ü�� �߿����� ������ 1�� �����ϴ� ���� ������ �ϴ� ���
