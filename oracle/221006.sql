-- projection : ���ϴ� ���� ���, ������ ������ ���
-- selection : ���ϴ� ���� ���, where

select job_id
from hr.employees;

-- ����� ���� �� �����ȣ, �̸�, �޿�, ������ ����ϴµ� ������ 'FI_ACCOUNT'�� ����鸸 ����ϼ���.
select employee_id, first_name, salary, job_id
from hr.employees
where job_id = 'FI_ACCOUNT';

-- ������ '_A'�� �ִ� ������� ����Ͻÿ�.
select *
from hr.employees
where job_id like '%\_A%' ESCAPE '\'; -- ������ �ǹ̸� ����

-- projection : ���ϴ� ���� ���� : select
-- selection : ���ϴ� ���� ���� : where : if
--                              ��, �� ������
--                              like    not

-- AC_ACCOUNT, AD_PRES, PR_REP�� ������ �ƴ� ������� ���
select *
from hr.employees
where job_id not in ('AC_ACCOUNT', 'AD_PRES', 'PR_REP');

-- �μ��� ���� ������ ���
select *
from hr.employees
where department_id is null;

-- �μ��� �ִ� ������ ���
select *
from hr.employees
where department_id is not null;

-- �̸��� Douglas�� Susan ���̿� �ִ� ������ ����ϴµ� ������ 'K_'�� �����ϴ� ������ ���
select *
from hr.employees
where first_name between 'Douglas' and 'Susan' and job_id like '%K\_%' ESCAPE  '\';

select *
from hr.employees
where first_name >= 'Douglas' and first_name <= 'Susan' and job_id like '%K\_%' ESCAPE  '\';

select *
from hr.employees;

-- substring(index, index + 5) index ���� 5���� : �ڹٿ��� ���� ��
-- substring(index, 5) index���� 5���� : DB

select lower('SQL Course') -- �빮�ڸ� �ҹ��ڷ� �ٲ�
from dual;

select upper('SQL Course') -- �ҹ��ڸ� �빮�ڷ� �ٲ�
from dual;

select initcap('SQL Course') -- �ܾ��� �ձ��ڸ� �빮�ڷ� �ٲ�
from dual;

select last_name, lower(last_name)
, first_name, upper(first_name)
, job_id, initcap(job_id)
from hr.employees;

-- ���� higgins������ ������ ����ϼ���.
select *
from hr.employees
where last_name = initcap('higgins');

select *
from hr.employees
where lower(last_name) = 'higgins';

-- ���� KING�� ������ ����ϼ���.
select *
from hr.employees
where upper(last_name) = 'KING';

select *
from hr.employees
where last_name = initcap('KING');

select CONCAT('Hello', 'World') -- �� ���� �ܾ ��ħ
from dual;

-- ��� ����� ���� �̸��� �ٿ��� ����ϰ� �Ի��ϰ� ������ ����ϼ���.
-- OConnellDonald, 07/06/21, SH_CLERK
select last_name || first_name, hire_date, job_id
from hr.employees;

select concat(last_name, first_name), hire_date, job_id
from hr.employees;

-- OConnellDonald, 07/06/21, SH_CLERK
-- concat(�μ�1, �μ�2)
select concat(last_name, concat(' ', first_name)), hire_date, job_id
from hr.employees;

select last_name || ' ' || first_name, hire_date, job_id
from hr.employees;

-- substr
select SUBSTR('HelloWorld', 1,5) -- H���� 5����
from dual;
select SUBSTR('HelloWorld', -3,2) -- �ڿ������� ����� : r���� 2����(r,l)
from dual;
select SUBSTR('HelloWorld', -3,4) -- �ȵ�
from dual;

-- �μ��������� �μ���ȣ, �μ���, �μ����� ����ϴµ� �μ����� 2��° ���� 5���ڸ� ����Ͻÿ�.
select *
from hr.departments;

select department_id, substr('department_name', 2,5), manager_id
from hr.departments;

-- INSTR : indexOf('abcdefg', 'c')  -- 'abcdefg'���� c�� ��� �ֳ�?
select INSTR('HelloWorld', 'W')
from dual;

select INSTR('HelloWorld', 'a') -- 0
from dual;

select INSTR('HelloWorld', 'o') -- 5
from dual;

select INSTR('HelloWorld', 'o', 6) -- 7 HelloW�ڿ��ִ� o�� ã����� �� 6������ ã����� �ϴ� ��
from dual;

select INSTR('HelloWorld', 'o', -1) -- 7 �ڿ������� ã�ƶ�
from dual;

-- ������� �߿� �����ȣ, �̸�, �̸���, �̸��Ͽ��� 'S'�� �ִ� ��ġ�� ���
select employee_id, first_name, email, instr(email, 'S')
from hr.employees;

-- substr�� instr�� ���� ���
-- �����ȣ, �̸�, �޿�, �̸���, �̸��Ͽ��� 'S'�� �ִ� ��ġ���� 5���� ���
-- ��, 'S'�� ���� ��� ù���� ���� 5����
select employee_id, first_name, salary, email, substr(email, instr(email, 'S'), 5)
from hr.employees;

-- LENGTH
select LENGTH('HelloWorld') -- ���� ���� ��������
from dual;

select last_name, LENGTH(last_name)
, first_name, LENGTH(first_name)
, email, LENGTH(email)
from hr.employees;

-- �̸��� ���̰� 6�� �̻��� ������ ����Ͻÿ�.
select *
from hr.employees
where length(first_name) >= 6;

-- lpad, rpad
select LPAD('Hello', 10, '*') -- Hello5���ڸ� ����Ұǵ�, 10���� ����ҰŴ�, ���°����� ���ʿ� *�� ä����
from dual;

select RPAD('Hello', 10, '*') -- Hello5���ڸ� ����Ұǵ�, 10���� ����ҰŴ�, ���°����� �����ʿ� *�� ä����
from dual;

select rpad(first_name, 15, '*')
, lpad(salary, 10, '*')
from hr.employees;

-- highlan********
-- 010 -8***-***8

-- rpad, substr, instr, length
-- 010-7146-1970, 010-****-1970
-- 02-314-1970, 02-***-1970

select 
substr('010-7146-1970', 1, instr('010-7146-1970', '-', -1)-1)
,substr('010-7146-1970', -5, 5)
from dual;

select length(
substr('010-7146-1970', 1, instr('010-7146-1970', '-', -1)-1))
from dual;

select substr(
substr('010-7146-1970', 1, instr('010-7146-1970', '-', -1)-1),1,
instr('010-7146-1970', '-'))
from dual;

-- rpad, substr, instr, length
-- 010-7146-1970, 010-****-1970
-- 02-314-1970, 02-***-1970

-----------

select rpad( 
substr('010-7146-1970', 1, instr('010-7146-1970', '-')) --02
,
length(
substr('010-7146-1970', 1, instr('010-7146-1970', '-', -1)-1)
), -- 02-123�� ���� : 6
'*')
|| substr('010-7146-1970', -5, 5)
from dual;


----------
select instr('010-7146-1970', '-', -1) -- �ڿ������� -�� ã�ƶ�
from dual;


-- �̸��Ͽ��� �տ��� 2���ڸ� ����ϰ� �������� �����ʿ� *�� ä���� ����ϼ���.
select employee_id, first_name, email
, rpad(substr(email, 1, 2), length(email), '*')
from hr.employees;

-- REPLACE
select replace('JACK and JUE', 'J', 'BL')
from dual;

-- ������ _AS�� �ִٸ� abc�� �����Ͻÿ�.
-- �����ȣ, �̸�, ����, ����� ����
select employee_id, first_name, job_id, replace(job_id, '_AS', 'abc')
from hr.employees
where job_id like '%\_AS%' escape '\';

select '  hello world ', trim('  hello world ')
      ,rtrim('  hello world '),ltrim('  hello world ')
from dual;
select '  \hello world\  ', trim('\hello world\')
      ,rtrim('  \hello world\ '),ltrim('  \hello world\ ')
from dual;

-- �̸��� '   Donald   '�� ��� ������ ����Ͻÿ�.
select *
from hr.employees
where first_name = trim('   Donald   ');

-- round() : �ݿø�
select round(15.19435, 3) --- �Ҽ��� ���� 3�ڸ����� ���
from dual;

select round(15.19345, 3), round(15.19355, 3)
      , round(145.5554,2), round(145.5554,1)
      , round(145.5554,0), round(145.5554,-1)
      , round(145.5554,-2)
from dual;

--- trunc() : ����
select trunc(15.19345, 3), trunc(15.19355, 3)
      , trunc(145.5554,2), trunc(145.5554,1)
      , trunc(145.5554,0), trunc(145.5554,-1)
      , trunc(145.5554,-2)
from dual;

--- mod() : ������
select mod(10, 3)
from dual;

--- ��������� ����� �� �̸�, �޿�, �޿��� 5000���� ���� �������� ����Ͻÿ�.
--- ������ SA_REP�� ���
select first_name, salary, mod(salary, 5000)
from hr.employees
where job_id = 'SA_REP';

--- sysdate
select sysdate --- ���� ��¥ ���
from dual;

--- �����ȣ, �̸�, �޿�, �Ի���, �Ի��Ϸκ��� ��ĥ�� �������� ���
select employee_id, first_name, salary, hire_date
, trunc(sysdate - hire_date, 0)
, trunc((sysdate - hire_date) / 365, 0)
, trunc(mod((sysdate - hire_date), 365), 0)
from hr.employees;

--- �̸�, �޿�, �Ի���, �Ի��� ���κ��� ���ְ� �Ǿ����� ���
select first_name, salary, hire_date, trunc((sysdate - hire_date) / 7) week
from hr.employees;

--- �޿��� 500���� ���� �������� 400 �̻��� ������� ����Ͻÿ�.
--- employee_id, first_name, hire_date, job_id, salary
select employee_id, first_name, hire_date, job_id, salary
from hr.employees
where mod(salary, 500) >= 400;

--- ���� ��¥���� ���� �ݿ����� �����Դϱ�?
select next_day(sysdate, '��'), next_day(sysdate, '�ݿ���')
from dual;

-- �Ի��� ���� �������� ���� �ϱ��?
-- �̸�, ��, ����, �Ի���
select first_name, last_name, job_id, hire_date, next_day(hire_date, '��')
from hr.employees;

-- ���� ��¥�κ��� 5���� �� 
select add_months(sysdate, 5)
from dual;

-- Neena�� �Ի��ϰ� 3���� �İ� �������� �Ǵ� ���̴�.
-- �̸�, ��, �Ի���, ����, �����ȣ�� ���� ���
select first_name, last_name, hire_date, job_id, employee_id, add_months(hire_date, 3)
from hr. employees
where first_name = 'Neena' or last_name = 'Neena';

-- �Ի��� ���� ���� ������� '01/01/18'�� ����� ���Ͻÿ�.
select *
from hr.employees
where next_day(hire_date, '��') = '01/01/18';

-- �̹��� ������ ��¥
select last_day(sysdate)
from dual;

-- ������ ���� 29���� ������� ���
-- ��, �Ի���, �������� ���
select last_name, hire_date, last_day(hire_date)
from hr.employees
where last_day(hire_date) like '%/02/29';

-- �Ի��Ϸκ��� ����� �Ǿ�����, ������ �Ǿ�����, ���ְ� �Ǿ����� ���
-- employye_id, job_id, hire_date
select employee_id, job_id, hire_date
, trunc((sysdate - hire_date)/365) year
, trunc(sysdate - hire_date) day
, trunc((sysdate - hire_date)/7) weeks
, trunc(months_between(sysdate , hire_date)) months
from hr.employees;

-- �Ի����� 230������ ���� ������� ����Ͻÿ�
select * 
from hr.employees
where months_between(sysdate, hire_date) >= 230;

