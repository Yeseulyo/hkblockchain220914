select * from hr.employees;

select employee_id, first_name, job_id
from hr.employees;

select employee_id, first_name, job_id, salary * 0.1
from hr.employees;

select *, department_id, location_id, manager_id
from hr.departments;

select first_name name, salary, commission_pct * salary sal
        ,department_id
from hr.employees;

select first_name || q'['s ]' || job_id
from hr.employees;
select first_name || '''s' || job_id
from hr.employees;


-----------------------------------------

--- projection ���ϴ� ���� ������� ��
--- selection ���ϴ� ���� ������� ��


select employee_id, first_name ,job_id
from hr.employees;

--- ������ ���
select job_id
from hr.employees;

--- ������� �ϰ� �ִ� ������ � ���� �ִ��� ����Ͻÿ�(������ �ѹ��� ��� �ݺ�����)
select distinct job_id
from hr.employees;

-- select first_name, distinct job_id
-- from hr.employees;

--- ������ �޿� ���
select salary, job_id
from hr.employees;

--- ������ �޿��� ���� ���� �ѹ��� ���
select distinct salary, job_id, department_id
from hr.employees;

select * from hr.employees; --- ��ü �÷� ���

desc hr.employees; --- �÷� ���Ӱ� �����͸� ���

select last_name, first_name, salary, job_id
from hr.employees;

select last_name || ' ' || first_name, salary, job_id
from hr.employees; --- ���� �̸��� �ٿ��� ���

select last_name || ' ' || first_name, salary, job_id, '���', '1999-10-14', 10, 10.5
from hr.employees;
--- ���ͳ� : �ڿ��� , �ڿ��� , �ο�, ��¥


--- selection
select * from hr.employees;

select * 
from hr.employees
where department_id = 90; --- ��ü�߿��� department_id�� 90�� �͸� ������ڴ�.


--- ������ AD_VP�� ����鸸 ����ϼ���.
select * from hr.employees
where job_id = 'AD_VP';

--- �����ȣ, ��, ����, �μ���ȣ�� ����� �� 60�� �μ��� ������ ������.
select employee_id, last_name, job_id ,department_id 
from hr.employees
where department_id = 60;


select last_name
from hr.employees;

--- Whalen �̶�� ������ ��, ����, �μ���ȣ�� ����ϼ���.
select last_name, job_id, department_id
from hr.employees
where last_name = 'Whalen';


select last_name, job_id, department_id --- �÷����̳� Ű����� ��ҹ��ڸ� ������ ������
from hr.employees
where last_name = 'whalen'; --- �����ʹ� ��ҹ��ڸ� �����ؾ��Ѵ�.

select last_name, job_id, department_id
from hr.employees
where job_id = 'AD_ASST';

select last_name, job_id, department_id
from hr.employees
where job_id = 'ad_ASST'; --- �����ʹ� ��ҹ��ڸ� ���� ��.

select hire_date ---��¥
from hr.employees;

-- 05/08/17�� �Ի��� ������� ���
select *
from hr.employees
where hire_date = '05/08/17';

select *
from hr.employees
where hire_date = '05-08-17';

select *
from hr.employees
where hire_date = '05.08.17'; --- ��¥�� ���ڸ��� ��� ���� /-. ����

select *
from hr.employees
where hire_date = '2005.08.17'; --- 2005 -> 05�� �����

--- 20   05   08   17   23   35   26
---����  �⵵   ��   ��   ��   ��    ��


select *
from hr.employees
where commission_pct is null;

--- �޿��� 3000 �̸��� �޿��� �޴� ����� ������ ���ÿ�
select * 
from hr.employees
where salary < 3000;

select * 
from hr.employees
where salary <= 3000; --- 3000����

--- ������ �޿��� 2500 �̻��̰� 3500 ������ ������ ����Ͻÿ�
--- �����ȣ, ��, �޿��� projection�Ͻÿ�.
select job_id, last_name, salary
from hr.employees
where salary >= 2500 and salary <= 3500;

select job_id, last_name, salary
from hr.employees
where salary between 2500 and 3500;


--- �����ȣ, ��, �޿�, ���(manager_id)
--- �μ���ȣ�� 30, 60, 90�� ������ ��� (and : && , or : ||)
select employee_id, last_name, salary ,manager_id
from hr.employees
where department_id = 30 
   or department_id = 60 
   or department_id = 90;

select employee_id, last_name, salary ,manager_id
from hr.employees
where department_id in (30, 60, 90); 

--- �����ڰ� 100, 101, 201�� ������� ���� �� �����ȣ, ��, �޿�, ��翡 ���� ������ ����ϼ���.
select employee_id, last_name, salary, manager_id
from hr.employees
where manager_id in(100, 101, 201);

select employee_id, last_name, salary, manager_id
from hr.employees
where manager_id = 100 or manager_id = 101 or manager_id = 201;

--- ���� 'Hartstein', 'Vargas' ������ �����ȣ, �޿�, ���, �μ���ȣ�� ���� ������ ����ϼ���.
select employee_id, salary, manager_id, job_id
from hr.employees
where last_name in('Hartstein', 'Vargas');

select employee_id, salary, manager_id, job_id
from hr.employees
where last_name = 'Hartstein' or last_name = 'Vargas';

select job_id
from hr.employees;
--- ������ MA�� ���ԵǾ� �ִ� �������� ����ϼ���.
select *
from hr.employees
where job_id like '%MA%'; --- MA%, %MA, 'MA'

--- ������ S�� ���ԵǾ� �ִ� �������� ����ϼ���.
select *
from hr.employees
where job_id like '%S%';

--- ������ K�� ���ԵǾ� �ִ� �������� ����ϼ���.
select *
from hr.employees
where job_id like '%K%';

--- ������ S�� ���۵Ǵ� �����
select *
from hr.employees
where employee_id like 'S%';
--- %�� 0�� �̻��� ���ڸ� ��Ÿ���ϴ�.

--- boarder��� ���̺� contents��� �ķ��� �ִ� ������ �� '�̼���'�� ���Ե� ���� ����Ͻÿ�
--- select *
--- from boarder
--- where contents like '%�̼���%';

--- ������ S�� ������ �����
select *
from hr.employees
where job_id like '%S'; --- 'S'

--- ������ �ι�° ���ڰ� s�� �����ϴ� ����� ����Ͻÿ�
select *
from hr.employees
where last_name like '_s%';
--- _�� ������ ���� ���ڸ� ��Ÿ���ϴ�.

--- ������ �ι�° ���ڰ� O�� �����ϴ� ����� ���
select *
from hr.employees
where last_name like '_o%';

--- ������ ����° ���ڰ� s�� �����ϴ� ����� ���
select *
from hr.employees
where last_name like '__s%';

--- ���� �ڿ��� �ι�° ���ڰ� s�� �����ϴ� ����� ���
select *
from hr.employees
where last_name like '%s_';

--- ������ IT_PROG�̰� �޿��� 6000�� ����� ���
select *
from hr.employees
where job_id = 'IT_PROG' and salary = 6000;

--- ������ MAN�� ���ԵǾ� �ְ� �޿��� 10000�̻��� ��� ����� �� �����ȣ, ��, ����, �޿� ���
select employee_id, last_name, job_id, salary 
from hr.employees
where job_id like '%MAN%' and salary >= 10000;

--- ������ 'MAN'�� ���ԵǾ� �ִ� ����� �޿��� 10000�̻��� ����� ��� �����ȣ, ��, ����, �޿� ���
select employee_id, last_name, job_id, salary 
from hr.employees
where job_id like '%MAN%' or salary >= 10000;

--- ������ 'IT_PROG', 'ST_CLERK', 'SA_REP'�� �ƴ� ������ ���� ����� ��� ��, ���� ���
select last_name, job_id
from hr.employees
where job_id != 'IT_PROG' and job_id != 'ST_CLERK' and job_id != 'SA_REP';

select last_name, job_id
from hr.employees
where job_id not in('IT_PROG', 'ST_CLERK', 'SA_REP');


--- ���� ���� �׸��� �޿��� ����ϴµ� 
--- �޿��� 15000 �ʰ� �̸鼭 ������ 'SA_REP' �� ������
--- �޿��� 15000 �ʰ� �̸鼭 ������ 'AD_PRES'�� ����� ���
select last_name, job_id, salary
from hr.employees
where salary > 15000 and job_id = 'SA_REP' or salary > 15000 and job_id = 'AD_PRES';

select last_name, job_id, salary
from hr.employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES') and salary > 15000;


--- select
--- from
--- [where] ���� ����
--- [order by] ���� ���� === ������ �� ����

--- 80�� �μ��� ����� ��  ��, ����, �μ���ȣ, �Ի����� ����ϴ� �� �Ի����� ���� �������� ���
--- ��������
select last_name, job_id, department_id, hire_date   -- 3
from hr.employees              -- 1
where department_id = 80       -- 2
order by hire_date asc; --- asc ����� �ȴ�.(��������)        -- 4 

--- ��������
--- 80�� �μ��� ����� ��  ��, ����, �μ���ȣ, �Ի����� ����ϴ� �� �Ի����� ���� �������� ���
select last_name, job_id, department_id, hire_date   -- 3
from hr.employees              -- 1
where department_id = 80       -- 2
order by hire_date desc;       -- 4

describe hr.employees; -- desc hr.employees


--- �����ȣ, ��, ������ ����ϴ� ������ ������������ ����Ͻÿ�.
--- ������ ��Ī���� annsal�̶�� ����.
select employee_id, last_name, salary * 12 annsal
from hr.employees
order by annsal desc;

---index       1        2        3(order by ������ ��� ����)
--- ��������
select employee_id, last_name, salary * 12 annsal
from hr.employees
order by 3 asc; --- select���� index�� order by ������ ��� ������.

select employee_id, last_name, salary * 12 annsal
from hr.employees
order by salary * 12 asc;

select employee_id, last_name, salary * 12 annsal
from hr.employees
order by department_id asc; --- select���� ���� �͵� ���ؿ��� ��� ����.


--- �ΰ� �̻����� ���ؿ��� ������.
--- �� �μ��� ������������ ���ĵǰ� �� �μ��� �޿��� ������������ ����
--- �����ȣ, ��, �μ���ȣ, �޿�
select employee_id, last_name, department_id, salary
from hr.employees
order by department_id desc, salary;

--- �μ��� ������������ �����ϰ� �� �μ��� ������ �Ի��� ���������Ǿ� ���� �� �μ��� ���� ���� ����� �޿��� ������������ �����Ͽ� ����Ͻÿ�.
--- �����ȣ, ��, �μ���ȣ, �Ի���, �޿�
select employee_id, last_name, department_id, hire_date, salary
from hr.employees
order by department_id asc, hire_date desc, salary asc; 

--- �μ��� ������������ �����ϰ� �� �μ����� ������ ������������ ���ĵ� ���¿��� ������ ���� �޿��� ���� ���� �޴� ������� ��µǰ� �ϼ���.
select *
from hr.employees 
order by department_id asc, job_id desc, salary desc;
desc hr.employees;

--- index ����Ͽ� ���
select *
from hr.employees 
order by 11 asc, 7 desc, 8 desc;

--- ���� Austin ���� Sciarra ���̿� �ִ� ������� ���
select *
from hr.employees
where last_name between 'Austin' and 'Sciarra';

select *
from hr.employees
where last_name >= 'Austin' and last_name <= 'Sciarra';
--- ���ڿ��� ��������

--- ���� Austin���� Sciarra���̿� �ִ� ������� 
--- ������, �޿��� ��� ������������ ����
select *
from hr.employees
where last_name between 'Austin' and 'Sciarra'
order by job_id desc, salary desc;

















































 


















