select * from employees;
select * from departments;

insert into employees
select * from hr.employees; -- ���̱׷��̼� hr.employees�����͸� employees���̺� �ֱ�

select * from employees;

insert into departments
select * from hr.departments; -- ���̺� ������ ������ * ���൵ �ȴ�. ���� ������ ����� �Ѵ�.(���� ���� ���̺��� �÷���)

select * from departments;

-- ���̺� �ִ� ���� ����
delete from departments;

select * from departments;

insert into departments
select * from hr.departments;


select * from departments;
-- 20�� �μ��� 40�� �μ��� ����ϼ���.
select * from departments
where department_id in (20, 40);
-- ���ϴ� �� �����ϱ�
delete from departments
where department_id in (20, 40);

-- 70�� �μ� �����ϱ�
select * from departments
where department_id = 70;

delete from departments
where department_id = 70;

select * from departments;

select * from employees;

delete from employees;
insert into employees
select * from hr.employees;

-- 70�� �μ��� ��� ����Ͻÿ�.
select * from employees
where department_id = 70;

delete from employees
where department_id = 70;

-- Donald�� ���� �ִ� �μ��� ������ �����Ͻÿ�.
select department_id from employees
where first_name = 'Donald';  -- 50

delete from employees
where department_id = 50;

delete from employees
where department_id = (select department_id from employees
                        where first_name = 'Donald');
                        
-- ������ MK_REP�̰� �޿��� 6000 �̻��� ����� �����Ͻÿ�.
select * from employees
where job_id = 'MK_REP' 
and salary >= 6000;

delete from employees
where job_id = 'MK_REP' 
and salary >= 6000;

-- public�� �����ϰ� �ִ� ������ ����ϴ� ����� ����ϼ���.
select * from employees
where job_id like '%Public%';
-- public�� �����ϰ� �ִ� ������ ����ϴ� ����� �����ϼ���.
delete from employees
where job_id like '%Public%';
-- Susan�� �޿��� Susan�� ������ ���� ������� ����ϼ���.
select salary from employees
where first_name = 'Susan';

select job_id from employees
where first_name = 'Susan';

select * from employees
where salary = 6500
and job_id = 'HR_REP';

select * from employees
where salary = (select salary from employees
                where first_name = 'Susan')
and job_id = (select job_id from employees
                where first_name = 'Susan');

-- Susan�� �޿��� Susan�� ������ ���� ������� �����ϼ���.
delete from employees
where salary = (select salary from employees
                where first_name = 'Susan')
and job_id = (select job_id from employees
                where first_name = 'Susan');
                
                

-- delete �ϸ� read���̺� ����ȴ�. -- ���������� insert�ϸ� undo���̺� ����ȴ�.
-- ������ �ϸ� read���̺����� �����ȴ�. commit;�� �ؾ� ���̺����� �����ȴ�.
delete from employees;
select * from employees;
rollback; -- ����
select * from employees;

-- read���̺� ������ �ʰ� �ٷ� �����ϱ�(���� �ȵ�)
-- �ý��� �ӵ� ���
TRUNCATE table employees;
select * from employees;
rollback;
select * from employees;



insert into employees
select * from hr.employees;

select * from employees;
commit;
-- DML
-- select, insert, delete, truncate, update

-- C : create : insert
-- R : read   : select
-- U : update : update
-- D : delete : delete, truncate
-----------------------------------------------------

-- update : �ϳ��� ���� ���� �� �����ϴ� ���� �ƴ϶� �Ϻ� �ϳ��� ���� ���� �ϴ� ��
select * from employees
where employee_id = 178;

-- �����ȣ 178���� �μ���ȣ�� 80������ �����ϼ���.
update employees
set department_id = 80  -- ���⼭ �����ϸ� ��� department_id�� 80���� ����ǹǷ� ����(������)�� ������Ѵ�.
where employee_id = 178;-- ����(������)

select * from employees
where employee_id = 178;

-- 113���� ������ AC_MGR�� �����ϰ� �޿��� 12000�� �����ϼ���.
select job_id, salary
from employees
where employee_id = 113;

update employees
set job_id = 'AC_MGR',
    salary = 12000
where employee_id = 113;

-- 113���� ������ 114���� ������ �����ϰ� �޿��� 200�� �޿��� �����ϼ���.
select job_id
from employees
where employee_id = 114; -- PU_MAN
select salary 
from employees
where employee_id = 200; -- 4400

update employees
set job_id = 'PU_MAN',
    salary = 4400
where employee_id = 113;

update employees
set job_id = (select job_id
              from employees
              where employee_id = 114),
    salary = (select salary 
              from employees
              where employee_id = 200)
where employee_id = 113;

select * from employees
where employee_id = 113;

-- 113���� ������ �޿��� 200�� ������ �޿��� �����ϼ���.
select job_id , salary from employees
where employee_id = 113; -- PU_MAN, 4400

select job_id, salary from employees
where employee_id = 200; -- AD_ASST, 4400

update employees
set (job_id, salary) = (select job_id, salary
                        from employees
where employee_id = 200);

-- 200���� ������ ���� ����� ���� �μ��� 100�� ����� �μ��� �����ϼ���.
select job_id from employees
where employee_id = 200;

select department_id from employees
where employee_id = 100;

update employees
set department_id = (select department_id from employees
                     where employee_id = 100)
where job_id = (select job_id from employees
                where employee_id = 200);

select * from employees
where employee_id = 200;

-- ���̺� ����
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date default sysdate
);
--  java (class�� �ٲ㺸��)
public class Dept{
    int deptno;
    String dname;
    String loc;
    Date createDate;
}
-----------------------------------
insert into dept(deptno, dname, loc)
values(1, '�̼���', '1234');
select * from dept;

insert into dept(deptno, dname, loc, create_date)
values(2, '�̼���', null, sysdate);

insert into dept(deptno, dname, create_date)
values(2, '�̼���', default);

insert into dept(deptno, dname, loc, create_date)
values(4, '�̼���', '23232', to_date('03-12-1999', 'dd-mm-yyyy')); -- RR-MM-DD

insert into dept(deptno, dname, loc, create_date)
values(5, '�̼���', '23232', '1999-10-30');

-- ���̺� Ȯ��
describe dept;
------------------------------------------------------
select sysdate - to_date('1970-01/01','yyyy-mm-dd')
from dual;
-- date
-- ���� �� �� �� �� �� ��
-- timestamp
-- ���糯¥���� 1970�� 01�� 01�Ϻ��� ���糯¥������ ms�� ����� �� 
-- 96296296296296296 ���������� �Ǿ� �ִ�.
-- ��, ��, �� ��������� date�� ����.

create table test1(
    dnu int not null,
    dname Integer
);
-- insert into test1(dname)values(2); --not null�� ���� �� �־���� �Ѵ�.
insert into test1(dnu, dname)values(1, 2);
select * from test1;
insert into test1(dnu)values(1);

-- constraint : ��������*****
-- not null
-- unique
-- primary key
-- foreign key
-- check

select * from dept;

drop table dept;

create table dept(
    deptno number(2) primary key, -- �ߺ����� ���� ���� �ְڴ�.
    dname varchar2(14),
    loc varchar2(13),
    create_date date default sysdate
);

insert into dept(deptno, dname, loc, create_date)
values(1, '�̼���', '1234', default);

select * from dept;

--insert into dept(deptno, dname, loc, create_date)
--values(1, '�����', '2334', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(2, '�̼���', '1234', sysdate);

drop table dept;

create table dept(
    deptno number(2) primary key, 
    dname varchar2(14),
    loc varchar2(13) primary key,  -- ���̺��� �ϳ��� �⺻ Ű�� ���� �� �ֽ��ϴ�.
    create_date date default sysdate
);

create table dept(
    deptno number(2) primary key, -- NULL�� ("SMRIT"."DEPT"."DEPTNO") �ȿ� ������ �� �����ϴ�. �����̸Ӹ� Ű�� �ָ� �⺻�� not null�̴�. primary key�� �ָ� null�� ��� x ���� �־���� �Ѵ�.
    dname varchar2(14),
    loc varchar2(13) unique,
    email varchar2(50) unique,
    create_date date default sysdate
);

insert into dept(dname, loc, email, create_date)
values('�̼���', '122', 'high', sysdate);

insert into dept(deptno, dname, loc, email, create_date)
values(1, '�̼���', '122', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, email, create_date)
values(2, '�̼���', '123', 'land', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(3, '�̼���', '124', sysdate);

drop table dept;
create table dept(
    deptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) not null unique,
    email varchar2(50) unique,  -- unique�� null�� ���.
    create_date date default sysdate
);
insert into dept(deptno, dname, loc, email, create_date)
values(1, '�̼���', '123', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, create_date)
values(2, '�̼���', '124', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(3, '�̼���', '125', sysdate);

select * from dept;

select * from dba_constraints -- �������� Ȯ���ϰڴ�. Ÿ�� C : null, P : �����̸Ӹ�Ű, U : ����ũ
where table_name = 'DEPT';

drop table dept;

-- constraint�� �ֱ�
create table dept( -- �� ����
    deptno number(2) constraint dept_deptno_PK primary key,
    dname varchar2(14),
    loc varchar2(13) not null constraint dept_loc_UU unique,
    email varchar2(50) constraint dept_email_UU unique, 
    create_date date default sysdate
);

select * from dba_constraints
where table_name = 'DEPT';

insert into dept(deptno, dname, email, create_date)
values(1, '�̼���', 'high', sysdate); -- NULL�� ("SMRIT"."DEPT"."LOC") �ȿ� ������ �� �����ϴ�

insert into dept(deptno, dname, loc, email, create_date)
values(1, '�̼���', '123', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, email, create_date)
values(1, '�̼���', '124', 'land', sysdate); -- ���Ἲ ���� ����(SMRIT.DEPT_DEPTNO_PK)�� ����˴ϴ�

insert into dept(deptno, dname, loc, email, create_date)
values(2, '�̼���', '123', 'land', sysdate); -- ���Ἲ ���� ����(SMRIT.DEPT_LOC_UU)�� ����˴ϴ�

drop table dept;

create table dept( -- ���̺� ����
    deptno number(2), 
    dname varchar2(14),
    loc varchar2(13) not null, -- not null�� ������ ������
    email varchar2(50),
    create_date date default sysdate,
    constraint dept_deptno_PK primary key(deptno),
    constraint dept_loc_UU unique(loc),
    constraint dept_email_UU unique(email)
);

select * from dba_constraints
where table_name = 'DEPT'; -- ���̺�� �빮�ڷ� ����� �Ѵ�.

drop table dept;
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date 
);
desc dept;

-- �� ���� ( add : �÷� �߰�, modify : �÷� ����)
alter table dept
add (email varchar2(50) not null 
                        constraint dept_email_UU unique,
     addr varchar2(100)
);
desc dept;

alter table dept
modify (
    create_date date default sysdate,   -- �÷� ������ �� �׻� ������Ÿ�� ������Ѵ�.
    loc varchar2(13) constraint dept_loc_UU unique
);
select * from dba_constraints
where table_name = 'DEPT';

alter table dept
modify deptno number(2)
       constraint dept_deptno_PK primary key;  -- �÷� �ϳ� ������ ���� ��ȣ ���ص� �ȴ�.
       
select * from dba_constraints
where table_name = 'DEPT';

desc dept;

-- email�÷��� �����ϰڴ�.
alter table dept
drop column email; -- ������ ���ÿ� ���� �÷��� ���� �� �� ����.

desc dept;

drop table dept;
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date 
);
alter table dept -- ���̺� ����
add( addr varchar2(100) not null,
     constraint dept_deptno_PK primary key(deptno),
     constraint dept_loc_UU unique(loc)
);
-- �̹� ������� ���¿����� not null�� �߰��� �� modify �ؾ��Ѵ�.
alter table dept
modify (loc varchar2(13) not null,
        create_date date default sysdate
);
select * from dba_constraints
where table_name = 'DEPT';
desc dept;

drop table employees;
drop table departments;

---- table �����ϱ�
create table employees
as
select * from hr.employees
where 1 = 2; -- �����̹Ƿ� ������ ������� �ʴ´�. ������ ������� ���ƶ� -> ������ ���� ���̺� ����, �÷��� ����´�.
select * from employees;

drop table employees;
create table employees
as
select * from hr.employees;
select * from employees;

create table departments
(deptno, dname, manid, loc) -- ������ �� ������ �� ������ �� �̸����� ����´�.
as
select * from hr.departments;
select * from departments;

drop table departments;
create table departments
as
select * from hr.departments
where 1 = 2;
select * from departments;

insert into departments
select * from hr.departments;
select * from departments;

-- constraint ����
desc dept;
select * from dba_constraints
where table_name = 'DEPT';
alter table dept
drop column ADDR;

alter table dept
drop constraint DEPT_LOC_UU;

-- count update
drop table num_test;
create table num_test(
    seq int,
    num int
);
insert into num_test(seq, num)values(1, 1);
insert into num_test(seq, num)values(2, 1);
select * from num_test;

update num_test
set num = num + 1 -- �����ų ������ 1�� ����
where seq = 2;

select * from num_test;