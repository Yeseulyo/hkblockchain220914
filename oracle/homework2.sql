---�빮�ڸ� �ҹ��ڷ� , �ҹ��ڸ� �빮�ڷ�
select email, lower(email)
     , first_name, upper(first_name)
     , email, initcap(email)
     ,length('�̼���'), lengthb('�̼���') -- b�� ����Ʈ -- UTF-8 �ѱ��� �ѱ��ڴ� 3����Ʈ
     ,length(first_name), lengthb(first_name)
     ,'�̼���'
from hr.employees;

--- 1. �̸��� 'steven'�� �����  ����Ͻÿ�.
select first_name
from hr.employees
where first_name = initcap('steven');

select first_name
from hr.employees
where lower(first_name) = 'steven';

-- 2. ���� KING�� ������ ����ϼ���.
select *
from hr.employees
where upper(last_name) = 'KING';

select *
from hr.employees
where last_name = initcap('KING');

-- 3. �̸��� ������ ������ 5�� ������� ����ϼ���.
select *
from hr.employees
where length(first_name) = 5;

-- 4.  �޿��� 5�ڸ� �̻��� ����� ���Ͻÿ�.
select*
from hr.employees
where length(salary) >= 5;

select *
from hr.employees
where salary >= 10000;

-- INSTR : instr('abcdefg', 'c')  -- 'abcdefg'���� c�� ���°�� �ֳ�?
-- 5. �̸��� 's'�� ���� ����� �� �̸��� ���°�� �ִ��� ����ϼ���.
select first_name, instr(first_name, 's')
from hr.employees;

 -- 6.  �̸��� 's'�� 3��°�� �ִ� ������� ����ϼ���.
 select *
 from hr.employees
 where instr(first_name, 's') = 3;
 
 -- substr
 -- 7. �̸��� ���� �޿��� ����, �̸����� ����� �� �̸����� 3��° ���� ���� ����Ͻÿ�.
 select first_name, last_name, salary, job_id, email, substr(email, 3)
 from hr.employees;
 
 -- 8. �̸��Ͽ� 'S'���� ����ϰ�, �޿�, �Ի���, �̸� ,���� ����ϼ���.
 select email, substr(email, instr(email, 'S')),salary, hire_date, first_name, last_name
 from hr.employees;
 
 --9. �̸� , �޿�, ����, �μ��� ����� �� �̸����� 3��° ���� 4���ڸ� ����Ͻÿ�.
 select first_name, salary, job_id, department_id, email, substr(email, 3, 4)
 from hr.employees;
 
 --10. �̸��Ͽ� 3��°���� 4���ڿ� 'ARTS'�� �ִ� ����� ����ϼ���.
 select * 
 from hr.employees
 where substr(email, 3, 4) = 'ARTS';
 
 --11.�̸��Ͽ� 's'�� 5��°�� �ִ� ����� ����Ͻÿ�.
 select *
 from hr.employees
 where  instr(lower(email), 's') = 5;
 
 -- ���̵� ã�� highland0 : high***** -- lpad, rpad
 select rpad('as', 10, '*') from dual;
 -- 12. �̸��Ͽ��� �տ��� 2���ڸ� ����ϰ� �������� �����ʿ� *�� ä���� ����ϼ���.
 select email, rpad(substr(email, 1, 2), length(email), '*')
 from hr.employees;
 
-- 13. �Ի����� 03/06/17 ��ȭ��ȣ�� 515.123.4567�� ����� �̸����� 
--     �տ��� 3���ڸ� ����ϰ� �������� *�� ����ϼ���.
select email, rpad(substr(email, 1, 3), length(email), '*')
from hr.employees
where hire_date = '03/06/17' and phone_number = '515.123.4567';

-- REPLACE
select replace('JACK and JUE', 'J', 'BL')
from dual;
-- 14. ������ _AS�� �ִٸ� abc�� �����Ͻÿ�.
select job_id, replace(job_id, '_AS', 'abc')
from hr.employees
where job_id like '%\_AS%' escape '\';

-- str.trim()
select ' �� ���� ', trim(' �� ���� '), ltrim(' �� ���� '), rtrim(' �� ���� ')
from dual;
-- 15.�̸��Ͽ� 'A'�� ó���� ���� �ִٸ� �̸��Ͽ��� �����Ͽ� �������.
select email, trim('A' from email), trim(email)
from hr.employees;

--- str = 'abcdefg'
--         0123456
--         7654321 -   
-- 16. �̸��Ͽ��� �ڿ��� �ѱ��ڰ����� ���� �� �̸��Ͽ��� �ڿ��� ���� 2���� ������ ����,
--     �̸��Ͽ��� �ڿ��� 3��°���� 2���ڸ� ����ϼ���.
select email, substr(email, -1, 1), substr(email, -2, 2), substr(email, -3, 2) 
from hr.employees;

select instr('010-7146-1970', '-', -1)
from dual;
-- 17. 010-7146-1970 , 010-****-1970, 02-314-1970 02-***-1970
select rpad(
        substr('010-1146-1970', 1, instr('010-1146-1970', '-')),
        length(substr('010-1146-1970', 1, instr('010-1146-1970', '-', -1)-1))
       ,'*') ||  substr('010-1146-1970', -5, 5)
from dual;

--- 18. �̸�, �Ի���, �μ���ȣ, �޿�, ����� ����ϼ���.
select first_name, hire_date, department_id, salary, salary * 12
from hr.employees;

-- 19. �̸�, �Ի���, �μ���ȣ, �޿� �׸��� ����� ����� �� 
-- ������� Ŀ�̼��� ���ԵǾ�� �Ѵ�.
select first_name, hire_date, department_id, salary, commission_pct, (salary + salary * commission_pct)* 12
from hr.employees;

select commission_pct, nvl(commission_pct, 0)
from hr.employees;
-- 20. Ŀ�̼��� null�̶�� Ŀ�̼� ���� 0���� �����Ͽ� �̸�, �μ�, �Ի���, ����,
--     �޿�, Ŀ�̼�, �׸��� ����� ����ϼ���.
select first_name, department_id, hire_date, job_id, salary
      , commission_pct, nvl(commission_pct,0)
      , (salary + salary * nvl(commission_pct,0)) *12
from hr.employees;

select nvl(commission_pct, 100)
from hr.employees;

--- �����Լ� 
--- round() : �ݿø� 
--- trunc() : ����       
--- mod() : ������
-- 21 . �ݿø��ϼ���.
--- 5���� �ݿø��ȴ�.
select  ROUND(15.19345,3),  ROUND(15.19355,3) , round(145.5554,2),
        round(145.5554,1), round(145.5554,0),  round(145.4554,0), 
        round(145.5554,-1), round(145.5554,-2)
from dual;

-- 22. �����ϼ���.
select trunc(15.19345,3),  trunc(15.19355,3) , trunc(145.5554,2),
       trunc(145.5554,1), trunc(145.5554,0),  trunc(145.4554,0), 
       trunc(145.5554,-1), trunc(145.5554,-2)
from dual; 