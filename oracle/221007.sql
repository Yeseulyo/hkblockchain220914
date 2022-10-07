-- select
-- projection : ���ϴ� ���� �������� : �÷�, �����(�������)
-- select
-- from ���̺�
-- selection : ���ϴ� ���� �������� : where
--             �ʿ��� ���� : ������, �񱳿���
-- select
-- from
-- where
-- �����͸� ������ �ؼ� ������ �� : �Լ�
-- ���ڿ� �Լ� : �빮��(��� �빮�ڷ� �ٲٱ�), �ҹ���, �����Լ�, �߶󳻱�, ������ ����, ��ü�Լ�, ���鹮�� ����, lpad, rpad
-- ���� �Լ� : round, trunc, mod
-- ��¥ �Լ� : LAST_DAY, NEXT_DAY

-- ��ȯ �Լ� : *****�߿�*****

select '10' + '10' -- �ڵ� ����ȯ
from dual;

-- to_char : ���� �ٲٰ� ���� ���� /to_date : ���� ��¥�� ���¸� ������·� �ٲٴ� ��
--           ���� ���ϴ� ���� ����           ���� ���� ���¸� ����

-- ���� ��ȯ �Լ� : ��¥�� ���� ��ȯ
select sysdate, -- yy/mm/dd ���·� �Ǿ������� ���� ���ϴ� ���·� �ٲ���
to_char(sysdate, 'yy-mm-dd'),
to_char(sysdate, 'dd-mm-yy'),
to_char(sysdate, 'fmdd-mm-yy'),
to_char(sysdate, 'yyy-mm-dd'),
to_char(sysdate, 'YYYY-MM-DD HH:MI:SS.SSSSS'),
to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS.SSSSS AM'),
to_char(sysdate, 'YYYY-MONDD HH24:MI:SS.SSSSS AM')
from dual;

-- 21-06-2007�� �Ի��� ������ ���
select * 
from hr.employees
where to_char(hire_date, 'dd-mm-yyyy')= '21-06-2007';
-- yy/mm/dd

-- 21-6-2007�� �Ի��� ������ ���
select * 
from hr.employees
where to_char(hire_date, 'dd-fmmm-yyyy')= '21-6-2007';

-- ���ڸ� ���ڿ��� (��ȭ�� �� �ַ� ���(ȭ��))
--1,020,222 -- ���ڸ� ȭ������� �ٲ� ��
--- 1234567 => W1,234,567, $1,234,567, $1,234,567- (-�� ���� �ڷ�)
select TO_CHAR(1234567.890, '9,999,999'),
       TO_CHAR(1234567.890, '9,999,999.00'), -- �Ҽ��� ���� ���ڸ� ���
       TO_CHAR(1234567.890, '$9,999,999.00'), -- �տ� �޷� ���̱�
       TO_CHAR(1234567.890, 'L9,999,999.00'), -- ����ȭ��
       TO_CHAR(-1234567.890, 'L9,999,999.00MI') -- ���̳ʽ�
from dual;

-- �̸�, ��, ����, �μ� �׸��� �޿��� ���ڸ��� ,�� ��� $�� ��µǰ� �Ͻÿ�
select first_name, last_name, job_id, department_id, to_char(salary, '$99,999,999'), to_char(-salary, '$99,999,999mi')
from hr.employees;

-- 03/06/17���Ŀ� �Ի��� �����
select *
from hr.employees
where hire_date > '03/06/17';

-- 17/06/03 ==> 03/06/17
-- 17��/06��/03�� -- dd-mm-yy ==> yy/mm/dd
select *
from hr.employees
where hire_date > to_date('17/06/03', 'dd/mm/yy'); -- ���ڸ� �������·� �ٲٴ� ��

-- 06/17/03 ==> mm/dd/yy
select *
from hr.employees
where hire_date > to_date('06/17/03', 'mm/dd/yy');
--    yy/mm/dd

-- 06/17/03 ������ �Ի��� ������ ��ȸ�ϼ���.
select * from hr.employees
where to_char(hire_date, 'mm/dd/yy') < '06/17/03';
-- ��¥�� ���ڷ� �ٲ�⿡ �������� : ���ϴ� ������ ������ ����
-- ��¥ ���Ҷ��� ��¥�� ���ڷ� �ٲ㼱 �ȵȴ�. to_char ���� �ȵȴ�.

select * from hr.employees
where hire_date < to_date('06/17/03', 'mm/dd/yy');
-- ��¥����
-- ���ڸ� ��¥�� �ٲ���Ѵ�.

-- NVL : NullValue null�� �Լ� null���� ���� ������ ��ȯ�Ѵ�.
-------------------------------------------------------------------------
-- ��, �޿�, ������ ���
-- ������ ��� �� �� �� Ŀ�̼ǵ� ����
select last_name, salary, (salary + salary * commission_pct) * 12
from hr.employees;

select last_name, salary, (1 + nvl(commission_pct, 0)) * 12
from hr.employees;

select last_name, salary, commission_pct,
       nvl2(commission_pct, 'null�� �ƴ�', 'null ��')
from hr.employees;

-- nvl2�� �̿��ؼ� Ŀ�̼��� ������ ������ ���ϼ���.
-- last_name, salary, ����
select last_name, salary, 
  salary * (1 + nvl2(commission_pct, commission_pct, 0))
from hr.employees;

-- nullif : �ΰ��� ���� ������ null Ʋ���� �տ���
select first_name, length(first_name) expr1,
       last_name, length(last_name) expr2,
       NULLIF(length(first_name), length(last_name)) result
       from hr. employees;
       
-- COALESCE
select last_name, employee_id, manager_id, commission_pct,
coalesce(to_char(commission_pct),
         to_char(manager_id),
         'No commission and no manager') aa
from hr.employees;

-- null���� �Լ� -- �Ϲ��Լ�
-- NVL : ������ ��ȯ ***�� �߿��ϴ�***
-- NVL2 : ���� �ƴϸ� �ι�°�� ���̸� ����°��
-- NULLIF : �ΰ��� ������ �� �ٸ��� �տ���
-- COALESCE : ù��°�� ���� �ƴϸ� ù��°�� ù��°�� ���̸� �ι�°�� ù��° �ι�°�� ���̸� ����°��,,,

-- ���Ǻ� ǥ���� : switch ~ case
-- CASE
--DECODE
-- �޿��� ���� ������ ����ϰ� �ʹ�.
-- �̸�, ��, �޿�, ����, ������ ����Ͻÿ�.
-- �޿��� 2000���� ���� ���� 0�̸� �޿��� 0%
--                        1�̸� �޿��� 9%
--                        2�̸� �޿��� 20%
--                        3�̸� �޿��� 30%
--                        4�̸� �޿��� 40%
--                        5�̸� �޿��� 42%
--                        6�̸� �޿��� 44%
--                        �̿� �޿��� 45% �����̴�.
-- �� ���ϱ� : trunc(salary / 2000)
select first_name, last_name, salary, 
       case trunc(salary / 2000) when 0 then salary * 0.00
                                 when 1 then salary * 0.09
                                 when 2 then salary * 0.20
                                 when 3 then salary * 0.30
                                 when 4 then salary * 0.40
                                 when 5 then salary * 0.42
                                 when 6 then salary * 0.44
                                 else salary * 0.45 end tex
from hr.employees;

select first_name, last_name, salary, 
          case when trunc(salary / 2000) = 0 then salary * 0.00
               when trunc(salary / 2000) = 1 then salary * 0.09
               when trunc(salary / 2000) = 2 then salary * 0.20
               when trunc(salary / 2000) = 3 then salary * 0.30
               when trunc(salary / 2000) = 4 then salary * 0.40
               when trunc(salary / 2000) = 5 then salary * 0.42
               when trunc(salary / 2000) = 6 then salary * 0.44
                                 else salary * 0.45 end tex
from hr.employees;

select first_name, last_name, salary,
       case when salary < 2000 then salary * 0.00
            when salary < 4000 then salary * 0.09
            when salary < 6000 then salary * 0.20
            when salary < 8000 then salary * 0.30
            when salary < 10000 then salary * 0.40
            when salary < 12000 then salary * 0.42
            when salary < 14000 then salary * 0.44
            else salary * 0.45 end tex
from hr.employees;

-- ��, �̸�, ����, �޿�, �޿��� ���� ��å�� ���� ����ϼ���.
-- �޿��� 3000���ϸ� ���
--       5000���ϸ� ����
--       7000���ϸ� �븮
--       9000���ϸ� ����
--       11000���ϸ� ����
--       13000���ϸ� ����
--       �� �̻� �̸� �ӿ�
select last_name, first_name, job_id, salary,
       case when salary <= 3000 then '���'
            when salary <= 5000 then '����'
            when salary <= 7000 then '�븮'
            when salary <= 9000 then '����'
            when salary <= 11000 then '����'
            when salary <= 13000 then '����'
            else '�ӿ�' end grade 
from hr.employees
order by salary;

select first_name, last_name, salary, 
       decode (trunc(salary / 2000) , 0 , salary * 0.00
                                    , 1 , salary * 0.09
                                    , 2 , salary * 0.20
                                    , 3 , salary * 0.30
                                    , 4 , salary * 0.40
                                    , 5 , salary * 0.42
                                    , 6 , salary * 0.44
                                    , salary * 0.45 ) tex
from hr.employees;

select last_name, job_id, salary,
case job_id when 'IT_PROG' then 1.10 * salary
            when 'ST_CLERK' then 1.15 * salary
            when 'SA_REP' then 1.20 * salary
            else salary end "REVISED_SALARY"
from hr.employees;
-- decode�� �ٲٱ�
select last_name, job_id, salary,
decode( job_id , 'IT_PROG' , 1.10 * salary
               , 'ST_CLERK' , 1.15 * salary
               , 'SA_REP' , 1.20 * salary
               , salary ) "REVISED_SALARY"
from hr.employees;

-- ȸ���� ��ü ��� �޿�, �޿��� �հ�, �ִ�޿�, �ּұ޿�, �޿��� �޴� ����� �� (�����Լ����� null���� ī��Ʈ ���� �ʴ´�.) �׷��Լ��� ����� ��쿡�� �Ϲ� �÷� ��� �Ұ���.
select avg(salary), sum(salary), max(salary), min(salary),
       count(salary)
from hr.employees;

select salary from hr.employees;

-- ������ REP�� ������ �ִ� ����� �޿��� �հ�, ��ձ޿�, �޿��� �޴� ����� ��
select sum(salary), avg(salary), count(salary)
from hr.employees
where job_id like '%REP%';

select sum(salary), avg(salary), count(salary),
       sum(salary) / count(salary)
from hr.employees
where job_id like '%REP%';

-- �Ի����� ���� ���� ���� ���� ���� ���� ���
select min(hire_date), max(hire_date)
from hr.employees;

-- 80�μ��� ���� ���� ���� ����� �Ի��ϰ� ���� �ʰ� ���� ����� �Ի����� ���
SELECT min(hire_date), max(hire_date)
from hr.employees
where department_id = 80;

-- count�Լ� : null�� �ƴ� �� ���� ��ȯ�մϴ�.
select count(employee_id), count(first_name), count(salary), count(commission_pct), count(department_id), count(*)
from hr.employees;
-- count(*)�� ���� ��ü

select avg(salary), sum(salary) / count(*), sum(salary) / count(department_id)
from hr.employees;

-- ������ �����ִ� �μ��� ����?
select count(department_id)
from hr.employees;

-- �μ��� �ִ� ����� ��
select count(distinct department_id)
from hr.employees;

-- �� ����� Ŀ�̼��� ����� ���Ͻÿ�
select avg(commission_pct),
       sum(commission_pct) / count(*),
       avg(nvl(commission_pct, 0))
from hr.employees;

-- �� ���
select sum(salary), avg(salary), min(salary), max(salary)
from hr.employees;

-- 80�μ��� 
select sum(salary), avg(salary), min(salary), max(salary)
from hr.employees
where department_id = 80;

-- �� �μ���
select sum(salary), avg(salary), min(salary), max(salary), department_id -- �׷���� ���� �ִ� Į���� ����Ʈ���� ��� ����
from hr.employees
group by department_id ; 

-- �� ������ �޿��� ���, �հ�, �ּ�, �ִ븦 ���Ͻÿ�
select job_id, avg(salary), sum(salary), min(salary), max(salary) 
from hr.employees
group by job_id;

-- �Ի����� ���� ��� �޿��� ���, �հ�, �ּ�, �ִ븦 ���Ͻÿ�
select  hire_date, avg(salary), sum(salary), min(salary), max(salary)
from hr.employees
group by hire_date;

-- ������ REP�� ������ �ִ� ����� �޿��� �հ�, ��� �޿�, �ּ�, �ִ�
-- �� �μ��� ����� ���Ͻÿ�.
select department_id, avg(salary), sum(salary), min(salary), max(salary)
from hr.employees
where job_id like '%REP%'
group by department_id;

-- �� �μ��� ��� �޿� �� ���� ���� �޴� �μ��� ��� �޿���
select max(avg(salary))
from hr.employees
group by department_id;

select department_id, hire_date, first_name, salary
from hr.employees
order by department_id, hire_date;

-- �� �μ��� ������ �޿��� ���, �հ�, �ִ�, �ּ�, ������
-- �μ��� ������������ ����
select department_id, job_id, avg(salary), sum(salary), max(salary), min(salary), count(*)
from hr.employees
group by department_id, job_id
order by department_id; 

-- �� �μ����� ������ ���� ����� �� �Ի����� ���� ����� ���� ���Ͻÿ�.
-- count(*) : �׷��� �� ���� ����
select department_id, job_id, hire_date, avg(salary), sum(salary), max(salary), min(salary), count(*)
from hr.employees
group by department_id, job_id, hire_date;

-- ������ REP�� ���� �� �μ��� ����� 8000�̻��� �μ��� ��ձ޿�, �հ�, �ּ�, �ִ븦 ���Ͻÿ�.
select department_id, avg(salary), sum(salary), min(salary), max(salary), count(*) ---5
from hr.employees ---1
where job_id like '%REP%'---2
group by department_id ---3
having avg(salary) >= 8000 ---4
order by department_id; ---6
-- group by ���� ���� ������ �ֱ� ���� having���� ���. group�Լ��� where���� �� �� ����.

-- �� �μ����� ������ ���� ����� �� �Ի����� ���� ����� ���� ���Ͻÿ�
-- ������� 2�� �̻� ���
select department_id, job_id, avg(salary), sum(salary), min(salary), max(salary), count(*)
from hr.employees
group by department_id, job_id, hire_date
having count(*) >= 2;

-- �μ��� ���� ���� 10�� �̸��� �μ��� ����Ͻÿ�.
select department_id, count(*) 
from hr.employees
group by department_id
having count(*) < 10;

SELECT job_id, SUM(salary) PAYROLL
FROM hr.employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY PAYROLL;

select * from hr.employees
order by employee_id;

-- ���� ��� ��ȣ�� ����ϼ���. (*****�߿�*****)
select max(employee_id)+ 1 from hr.employees;