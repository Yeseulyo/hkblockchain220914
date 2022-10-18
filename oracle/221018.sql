drop table d;
drop table c;
drop table b;
drop table a;

create table a( -- ������
    a1 number constraint a_a1_pk primary key,
    a2 varchar2(20)
);
create table b(
    b1 number,
    b2 varchar2(20),
    a1 number constraint b_a1_fk references a(a1) on delete cascade,
    constraint b_a1_b1_pk primary key(a1, b1)
);
create table c(
    c1 number,
    c2 varchar2(20),
    a1 number,
    b1 number,
    constraint c_a1_b1_c1_pk primary key(a1, b1, c1), -- 2���� �Ӽ��� �Ѳ����� �Ѿ���� ���� ������ ��� �Ұ� (b���̺��� �ϳ��� ���� �����̸Ӹ�Ű�� 2�� ����ִ� ���� �Ѿ�� a1, b1)
    constraint c_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1)on delete cascade
);
create table d(
    d1 number constraint d_d1_pk primary key,
    d2 varchar2(20),
    a1 number,
    b1 number,
    constraint d_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1) on delete set null -- �� ������ �� null���� ���� �ϰڴ�. (ȸ�� Ż�� ����)
);
-- pk �� ��� ����, �ϳ��� �־�� �Ѵ�.
-- uu �� ��� �� (�ߺ������ʹ� ������ �ȵ�), ������ ���� �� �ִ�.

create table e(
    e number 
);

create table CHECKEXAM(
    city varchar2(20)    -- ,������ ���̺����� check�� ������ ���̺��� ����.
    constraint chj_city_CK check(city in('����', '�λ�', '�뱸', '����'))
);
insert into CHECKEXAM
values ('��õ'); -- üũ ��������(SMRIT.CHJ_CITY_CK)�� ����Ǿ����ϴ�

insert into CHECKEXAM
values ('����');
select * from CHECKEXAM;

drop table CHECKEXAM1;
create table CHECKEXAM1(
    eid number check (eid > 0),
    value1 number not null,
    value2 number not null,
    name1 varchar2(20),
    name2 varchar2(20),
    constraint ch_value1_ck check (value1 between 1 and 100),
    constraint ch_name2_ck check (name2 in('a', 'b')),
    constraint ch_value2_ck check (value2 > value1)
);
insert into CHECKEXAM1
values (1, 1000, 2000, 'a', 'b'); -- üũ ��������(SMRIT.CH_VALUE1_CK)�� ����Ǿ����ϴ�

insert into CHECKEXAM1
values (1, 99, 80, 'a', 'b'); -- üũ ��������(SMRIT.CH_VALUE2_CK)�� ����Ǿ����ϴ�

insert into CHECKEXAM1
values (1, 99, 100, 'a', 'b');

-- �б� / ���� ����
-- alter table employees read only -- select�� ���� 
-- alter table employees read write -- select, insert ���� (update, delete ����)

create table departments
as 
select * from hr.departments;

create table employees
as 
select * from hr.employees;

insert into employees
select * from hr.employees;

select employee_id, first_name, salary * (1 + nvl(commission_pct, 0)) year_sal
from employees;
-- view ����
create view year_sal
as
select employee_id, first_name, salary * (1 + nvl(commission_pct, 0)) year_sal
from employees;

select * from year_sal; -- from�� �ڿ��� view�� �Ǵ� table���� �;��Ѵ�.

create view emp80
as
select * from employees
where department_id = 80;

select * from emp80;

-- 50�� �μ��� �̸�, ����, �����ȣ, ������ ����ϴ� �並 ���弼��.
-- ����� salvu50
drop view salvu50;

select first_name, job_id, employee_id, salary * 12
from employees
where department_id = 80;

create view salvu50
as
select first_name, job_id, employee_id, salary * 12 year_sal
from employees
where department_id = 80;

create view salvu50 (id_number, name, job_id, ann_salary, did)
as
select employee_id, first_name, job_id,  salary * 12, department_id
from employees
where department_id = 80;

-- ���� OR REPLACE view
create or replace view salvu50 (id_number, name, job_id, ann_salary, did)
as
select employee_id, first_name, job_id,  salary * 12, department_id
from employees
where department_id = 80;

select * from salvu50;

create or replace view salvu50 
as
select employee_id id_number, first_name name, job_id job_id,  salary * 12, department_id ann_salary, did
from employees
where department_id = 80;

-- �� �μ��� �޿��� �ּҰ�, �޿��� �ִ밪, �޿��� ���, �հ踦 ����� �� �ִ� �並 ����ÿ�.
-- ����� dept_sum_vu
-- �÷����� ��Ī�� �μ����� name, �ּҰ��� minsal, �ִ밪�� maxsal, ����� avgsal, �հ�� sumsal
create or replace view dept_sum_vu (name, minsal, maxsal, avgsal, sumsal)
as
select department_id, min(salary), max(salary), avg(salary), sum(salary)
from employees
group by department_id;

select * from dept_sum_vu;

-- �μ���ȣ, �μ���, �޿� ���
select e.department_id, department_name, salary
from employees e, departments d
where e.department_id = d.department_id;

-- �μ���, �޿� ���
select department_name, salary
from employees e, departments d
where e.department_id = d.department_id;

-- �μ���, �޿��� �հ�, ���, �ִ밪, �ּҰ��� ���Ͻÿ�.
select department_name, sum(salary), avg(salary), min(salary), max(salary)
from employees e, departments d
where e.department_id = d.department_id
group by department_name;

-- �� �μ��� �޿��� �ּҰ�, �޿��� �ִ밪, �޿��� ���, �հ踦 ����� �� �ִ� �並 ����ÿ�.
-- ����� dept_sum_vu
-- �÷����� ��Ī�� �μ����� name, �ּҰ��� minsal, �ִ밪�� maxsal, ����� avgsal, �հ�� sumsal
create or replace view dept_sum_vu (name, sumsal, avgsal, minsal, maxsal)
as
select department_name, sum(salary), avg(salary), min(salary), max(salary)
from employees e, departments d
where e.department_id = d.department_id
group by department_name;

create or replace view dept_sum_vu (name, sumsal, avgsal, minsal, maxsal)
as
select department_name, sum(salary), avg(salary), min(salary), max(salary)
from employees e join departments d
on e.department_id = d.department_id
group by department_name;

-- �信 ���� DML�۾� : �Լ��� ���� DML�� �� ����.(insert, delete) select�� ����

-- 70�� �μ��� �����ȣ, �̸�, ����, �޿�, �Ի����� ����ϴ� �並 ����ÿ�.
-- ����� empvu70
create or replace view empvu70
as
select employee_id, first_name, job_id, salary, hire_date
from employees
where department_id = 70;

select * from empvu70;

-- DML �۾�
select * from employees;

select * from empvu70;

desc employees;

create or replace view empvu70
as
select employee_id, last_name, email, job_id,  hire_date, salary, department_id
from employees
where department_id = 70; -- 70�� �μ��� ����Ͷ�

select * from employees;
select * from empvu70;

insert into empvu70(employee_id, last_name, email, job_id, hire_date, salary, department_id)
values(300, '��', 'high', '����', sysdate, 10000, 50); -- "DEPARTMENT_ID": �������� �ĺ��� (���̺� �����ϴ� �ְ� �ƴϴ�.)

insert into empvu70(employee_id, last_name, email, job_id, hire_date, salary)
values(300, '��', 'high', '����', sysdate, 10000);

select * from empvu70; -- �並 ���ؼ��� ���� insert�Ѱ� ������ ������ �並 ���ؼ� ���� ���̺� insert�� �� �� �ִ�. �並 ���ؼ� ����� department_id�� view�� �߰��ؾ��Ѵ�.
select * from employees; -- ���⿡�� ���δ�.

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '��', 'highland', '�л�', sysdate, 100, 70);

delete from empvu70
where employee_id = 301; -- 0�� �� ��(��) �����Ǿ����ϴ�. �信�� ������ �ʴ� �� ������ �� ����.

delete from empvu70
where employee_id = 302; -- 1 �� ��(��) �����Ǿ����ϴ�. �並 ���ؼ��� ���� �����ϴ�. (view ���� ���̴� �͸� ���� ����) -- employee������ ������.
select * from empvu70;
select * from employees;

update empvu70
set salary = 100; -- 1 �� ��(��) ������Ʈ�Ǿ����ϴ�. view���� ���̴� �͸� update�� �����ϴ�. -- employee������ ���� �ȵ�.

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '��', 'highland', '�л�', sysdate, 100, 30);
select * from empvu70;
---- �信�� ���̴� �͸� insert�� �ǰų� update�� �ǵ��� ����.
update empvu70
set department_id = 50; -- ������ ���� �ʴ� �̻� �� �ٲ�.
select * from empvu70;

select * from empvu70;
update employees
set department_id = 70
where employee_id = 204;

create or replace view empvu70
as
select employee_id, last_name, email, job_id,  hire_date, salary, department_id
from employees
where department_id = 70
with check option constraint empvu70_CK;

select * from empvu70; -- ���� ���̺� �ƴϴ�.
select * from employees; -- ���� ���̺�

update empvu70
set department_id = 50; -- ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '��', 'highland', '�л�', sysdate, 100, 30); -- ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ�

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(303, '��', 'high11', '�л�', sysdate, 100, 70);

select * from empvu70;
select * from employees;

create table viewupd1(
    c1 number,
    c2 int
);
create table viewupd2(
    c1 number,
    c3 number
);
insert into viewupd1
values(1,1);
insert into viewupd2
values(1,1);

create view v_viewupd
as
select v1.c1, c2, c3
from viewupd1 v1, viewupd2 v2
where v1.c1 = v2.c1;

select * from v_viewupd;
update v_viewupd
set c2 = 10  -- viewupd1�� ����
where c1 = 1;
select * from v_viewupd; -- ���� �䵿 ������Ʈ ����

select * from v_viewupd;
update v_viewupd
set c3 = 10  -- viewupd2�� ����  -- join�������� ���̺� ���ε��� update�� �ϴϱ� update�� �� �� �� �� �ִ�.
where c1 = 1;
select * from v_viewupd;
-- join�� �� ��� ���̺��� update�� �ϸ� ������ �ȴ�.

update v_viewupd
set c2 = 20, c3 = 20
--  ù��° ���̺�   �ι�° ���̺�
where c1 = 1; -- ���� �信 ���Ͽ� �ϳ� �̻��� �⺻ ���̺��� ������ �� �����ϴ�. -- ���պ��ϰ�� �ϳ� �ϳ��� update�� ���������� ���ÿ��� update �ȵȴ�. delete, inset�� ��������

select * from empvu70;

create or replace view empvu70
as
select employee_id, last_name, email, job_id,  hire_date, salary, department_id
from employees
where department_id = 70
with read only; -- DML�� �۾� �ź�, �б� ����
 -- �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.
insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(305, '��', 'high11', '�л�', sysdate, 100, 70); -- �б� ���� �信���� DML �۾��� ������ �� �����ϴ�.
-- ��� ������ �������� �ܼ�ȭ�� �� ����. �Ϻ��÷��� �ִ� ���븸 ������ �� ����.
drop view empvu70;

-- ������ : ������ �ǹ̴� �߿����� ������ ����ũ �� �� ���(�Խ���)
create sequence empseq; -- 1���� 999999����
select empseq.nextval from dual;
select empseq.currval from dual;

CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 400
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- ����   -- ���۰��� ���� x
alter SEQUENCE dept_deptid_seq
INCREMENT BY 20
MAXVALUE 999999
NOCACHE
NOCYCLE;

-- ����
drop sequence dept_deptid_seq;

select dept_deptid_seq.nextval from dual; -- ��� ���� �������� ������ �� ��� : ������
select dept_deptid_seq.currval from dual; -- ���� ���� �˷��ش�. : ���簪

insert into employees(employee_id, last_name, email, job_id, hire_date, salary)
values( (select max(employee_id) + 10 from employees) , '�̼���', 'high', '������', sysdate, 10000);
select * from employees;

insert into employees(employee_id, last_name, email, job_id, hire_date, salary)
values( dept_deptid_seq.nextval , '�̼���', 'high', '������', sysdate, 10000);
select * from employees;

insert into departments(department_id, department_name)
values(dept_deptid_seq.nextval, '�����');
select * from departments;

select max(employee_id) + 10 from employees;

create table seqTest(
    num2 number,
    name varchar2(30)
);
insert into seqTest(num2, name)
values(dept_deptid_seq.nextval, '�̼���');
select * from seqTest;

-- ������ ���� Ȯ��
select * from user_sequences
where sequence_name = 'EMPSEQ';

-- �ε��� : ������ ��ü���� 2% ~ 4% �̸��� ���� ������ �� ���(���� ��)
-- where���̳� join���ǿ��� �Բ� ���� ���
select * 
from employees --1
where last_name = 'OConnell'; --2

-- index ����
create index emplastidx
on employees (last_name); -- last_name �˻��� �� ��������.

select department_id, avg(salary)
from employees
group by department_id
having avg(salary) > 3000;

select employee_id, first_name
from employees
where substr(first_name, 1, 2) = 'Oc';

create index empsub -- �Լ������ index
on employees substr(first_name, 1, 2);

create index hanjeun -- �Լ������ index
on employees substr(start_time, end_time);

select * from employees
order by department_id, job_id;

create index empidx
on employees(department_id, job_id); -- department_id ���� job_id ������

-- index ����� select �� �� �ӵ��� ��û ��������.
-- �ʹ� ���� ����� ������ �ý��� ���� ����������. �� �ʿ��� �÷�, ���ǿ��� �����ϴ� ���� ����.

-- unused : �÷��� �������� �� ��

-- USER_INDEXES ������ ��ųʸ� �並 query�Ͽ� �ε����� ���� ������ Ȯ���� �� �ֽ��ϴ�.
select index_name, table_name
from user_indexes
where table_name = 'EMPLOYEES';

-- ���� ��ųʸ� �並 ���� ��ü�� ���� ������ ã�� ��� (����ϱ�)
-- DICTIONARY
-- USER_OBJECTS
-- USER_TABLES
-- USER_TAB_COLUMNS
-- USER_CONSTRAINTS
-- USER_CONS_COLUMNS
-- USER_VIEWS
-- USER_SEQUENCES
-- USER_INDEXES
-- USER_SYNONYMS

-- ���̺�, �������� Ȯ�� 
select * from user_constraints
where table_name = 'CHECKEXAM';
select * from user_tables;
select * from checkexam;