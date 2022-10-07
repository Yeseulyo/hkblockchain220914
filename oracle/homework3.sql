-- 20. Ŀ�̼��� null�̶�� Ŀ�̼� ���� 0���� �����Ͽ� �̸�, �μ�, �Ի���, ����,
--     �޿�, Ŀ�̼�, �׸��� ����� ����ϼ���.
select first_name, department_id, hire_date, job_id, salary, commission_pct
       ,nvl(commission_pct, 0)
       ,(salary + salary * nvl(commission_pct, 0)) * 12
from hr.employees; 

-- to_date : ���ڸ� ��¥�� ���� / to_number : ���ڸ� ���ڷ� ����
-- to_char : ��¥�� ���ڷ� ���� / to_char : ���ڸ� ���ڷ� ����

---37. 03/06/17���Ŀ� �Ի��� �����?
select *
from hr.employees
where hire_date > '03/06/17';

select *
from hr.employees
where hire_date > to_date('03/06/17', 'yy-mm-dd');

---38. 17/06/03(�Ͽ���)���Ŀ� �Ի��� �����?
select * 
from hr.employees
where hire_date > to_date('17/06/03', 'dd/mm/yy');

-- 39. ���� ��ȯ�Լ� : ��¥�� ���� ��ȯ
select to_char(sysdate, 'yy-mm-dd'), sysdate, to_char(sysdate,'dd-mm-yy'),
       to_CHAR(sysdate, 'yyyy-mm-dd'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS.SSSSS AM'),
       TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS.SSSSS AM'),
       TO_CHAR(SYSDATE, 'YYYY-MONDD HH24:MI:SS.SSSSS AM')
from dual;

-- ��¥�� ���ڿ��� �����Ͽ� ��¥ ��   -- ���� ���� -- ���� �ȵȴ�.!
-- ���ڿ��� ��¥�� �����Ͽ� ��¥ ��
-- 40. 25-04-2003 ���� �ʰ� �Ի��� ����� ���
select *
from hr.employees
where hire_date > to_date('25-04-2003', 'dd-mm-yyyy');

--���ڸ� ���ڿ���
--- 1,234,567 => W1,234,567, $1,234,567, $1,234,567-
SELECT TO_CHAR(1234567.890, '9,999,999'),
        TO_CHAR(1234567.890, '9,999,999.00'),
        TO_CHAR(1234567.890, '$9,999,999.00'),
        TO_CHAR(1234567.890, 'L9,999,999.00'),
        TO_CHAR(-1234567.890, 'L9,999,999.00MI')
FROM DUAL;

-- 41. �̸�, ��, ���� �μ� �׸��� �޿��� ���ڸ��� ,�� ��� $�� ��µǰ� �Ͻÿ�.
select first_name, last_name, job_id, department_id
       ,to_char(salary, '$99,999,999')
       ,to_char(-salary, '99,999,999mi')
from hr.employees;

-- 42. janette�Ǵ� JANETTE �Ǵ� jaNette ���� ���� �޾Ҵ�.
---   �̸��� 'Janette'�� ����� ����Ͻÿ�.
select *
from hr.employees
where first_name = 'Janette' 
      or first_name = initcap('janette')
      or first_name = initcap('JANETTE');

--- ǥ���� :  SWITCH(����) ~ CASE ���� :  �����; break; default :�����
---          CASE ���� WHEN ���� THEN ����� else ����� end

-- 43. --- job_id�� 'IT_PROG' �޿��� 10%���
--                  'ST_CLERK' �޿��� 15%���
--                  'SA_REP' �޿��� 20%���
--                   ���ܴ̿� �޿�
-- ��, �̸�, �޿��� ���� ���
select last_name, first_name, salary, job_id,
       case job_id when 'IT_PROG' then salary + salary * 0.1
                   when 'ST_CLERK' then salary + salary * 0.15
                   when 'SA_REP' then salary + salary * 0.2
                   else salary end sal
from hr.employees;

-- decode
select last_name, first_name, salary, job_id,
       decode( job_id , 'IT_PROG' , salary + salary * 0.1
                      , 'ST_CLERK' , salary + salary * 0.15
                      , 'SA_REP' , salary + salary * 0.2
                      , salary ) sal
from hr.employees;

--- 44. ��, �̸�, ����, �޿�, �޿��� ���� ��å�� ���� ����ϼ���.
--- �޿��� 3000�����̸� ��� 
--        5000�����̸� ����
--        7000�����̸� �븮
--        9000�����̸� ����
--       11000�����̸� ����
--       13000�����̸� ����
--       �� �̻� �̸� �ӿ�
select last_name, first_name, job_id, salary, 
       case when salary <= 3000 then '���'
            when salary <= 5000 then '����'
            when salary <= 7000 then '�븮'
            when salary <= 9000 then '����'
            when salary <= 11000 then '����'
            when salary <= 13000 then '����'
            else '�ӿ�' end grade
from hr.employees;

