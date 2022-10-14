select * from employees;
select * from departments;

insert into employees
select * from hr.employees; -- 마이그레이션 hr.employees데이터를 employees테이블에 넣기

select * from employees;

insert into departments
select * from hr.departments; -- 테이블 구조가 같으면 * 써줘도 된다. 같지 않으면 써줘야 한다.(내가 만든 테이블의 컬럼명)

select * from departments;

-- 테이블에 있는 행을 삭제
delete from departments;

select * from departments;

insert into departments
select * from hr.departments;


select * from departments;
-- 20번 부서와 40번 부서를 출력하세요.
select * from departments
where department_id in (20, 40);
-- 원하는 행 삭제하기
delete from departments
where department_id in (20, 40);

-- 70인 부서 삭제하기
select * from departments
where department_id = 70;

delete from departments
where department_id = 70;

select * from departments;

select * from employees;

delete from employees;
insert into employees
select * from hr.employees;

-- 70인 부서의 사원 출력하시오.
select * from employees
where department_id = 70;

delete from employees
where department_id = 70;

-- Donald가 속해 있는 부서의 직원을 삭제하시오.
select department_id from employees
where first_name = 'Donald';  -- 50

delete from employees
where department_id = 50;

delete from employees
where department_id = (select department_id from employees
                        where first_name = 'Donald');
                        
-- 직무가 MK_REP이고 급여가 6000 이상인 사원을 삭제하시오.
select * from employees
where job_id = 'MK_REP' 
and salary >= 6000;

delete from employees
where job_id = 'MK_REP' 
and salary >= 6000;

-- public을 포함하고 있는 직무를 담당하는 사원을 출력하세요.
select * from employees
where job_id like '%Public%';
-- public을 포함하고 있는 직무를 담당하는 사원을 삭제하세요.
delete from employees
where job_id like '%Public%';
-- Susan의 급여와 Susan의 직무가 같은 사원들을 출력하세요.
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

-- Susan의 급여와 Susan의 직무가 같은 사원들을 삭제하세요.
delete from employees
where salary = (select salary from employees
                where first_name = 'Susan')
and job_id = (select job_id from employees
                where first_name = 'Susan');
                
                

-- delete 하면 read테이블에 복사된다. -- 마찬가지로 insert하면 undo테이블에 복사된다.
-- 삭제를 하면 read테이블에서만 삭제된다. commit;을 해야 테이블에서도 삭제된다.
delete from employees;
select * from employees;
rollback; -- 복구
select * from employees;

-- read테이블에 보내지 않고 바로 삭제하기(복구 안됨)
-- 시스템 속도 향상
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

-- update : 하나의 행을 전부 다 수정하는 것이 아니라 일부 하나의 셀을 수정 하는 것
select * from employees
where employee_id = 178;

-- 사원번호 178번의 부서번호를 80번으로 변경하세요.
update employees
set department_id = 80  -- 여기서 실행하면 모든 department_id가 80으로 변경되므로 조건(목적어)를 써줘야한다.
where employee_id = 178;-- 조건(목적어)

select * from employees
where employee_id = 178;

-- 113번의 직무를 AC_MGR로 변경하고 급여를 12000로 변경하세요.
select job_id, salary
from employees
where employee_id = 113;

update employees
set job_id = 'AC_MGR',
    salary = 12000
where employee_id = 113;

-- 113번의 직무를 114번의 직무로 변경하고 급여는 200번 급여로 변경하세요.
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

-- 113번의 직무와 급여를 200번 직무와 급여로 변경하세오.
select job_id , salary from employees
where employee_id = 113; -- PU_MAN, 4400

select job_id, salary from employees
where employee_id = 200; -- AD_ASST, 4400

update employees
set (job_id, salary) = (select job_id, salary
                        from employees
where employee_id = 200);

-- 200번의 직무를 가진 사원에 대해 부서를 100번 사원의 부서로 변경하세요.
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

-- 테이블 생성
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date default sysdate
);
--  java (class로 바꿔보기)
public class Dept{
    int deptno;
    String dname;
    String loc;
    Date createDate;
}
-----------------------------------
insert into dept(deptno, dname, loc)
values(1, '이숭무', '1234');
select * from dept;

insert into dept(deptno, dname, loc, create_date)
values(2, '이숭무', null, sysdate);

insert into dept(deptno, dname, create_date)
values(2, '이숭무', default);

insert into dept(deptno, dname, loc, create_date)
values(4, '이숭무', '23232', to_date('03-12-1999', 'dd-mm-yyyy')); -- RR-MM-DD

insert into dept(deptno, dname, loc, create_date)
values(5, '이숭무', '23232', '1999-10-30');

-- 테이블 확인
describe dept;
------------------------------------------------------
select sysdate - to_date('1970-01/01','yyyy-mm-dd')
from dual;
-- date
-- 세기 년 월 일 시 분 초
-- timestamp
-- 현재날짜에서 1970년 01월 01일부터 현재날짜까지를 ms로 계산한 값 
-- 96296296296296296 정수값으로 되어 있다.
-- 년, 월, 일 쓰고싶으면 date를 쓰자.

create table test1(
    dnu int not null,
    dname Integer
);
-- insert into test1(dname)values(2); --not null은 값을 꼭 넣어줘야 한다.
insert into test1(dnu, dname)values(1, 2);
select * from test1;
insert into test1(dnu)values(1);

-- constraint : 제약조건*****
-- not null
-- unique
-- primary key
-- foreign key
-- check

select * from dept;

drop table dept;

create table dept(
    deptno number(2) primary key, -- 중복하지 않은 값을 주겠다.
    dname varchar2(14),
    loc varchar2(13),
    create_date date default sysdate
);

insert into dept(deptno, dname, loc, create_date)
values(1, '이숭무', '1234', default);

select * from dept;

--insert into dept(deptno, dname, loc, create_date)
--values(1, '이장범', '2334', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(2, '이숭무', '1234', sysdate);

drop table dept;

create table dept(
    deptno number(2) primary key, 
    dname varchar2(14),
    loc varchar2(13) primary key,  -- 테이블에는 하나의 기본 키만 가질 수 있습니다.
    create_date date default sysdate
);

create table dept(
    deptno number(2) primary key, -- NULL을 ("SMRIT"."DEPT"."DEPTNO") 안에 삽입할 수 없습니다. 프라이머리 키를 주면 기본이 not null이다. primary key를 주면 null값 허용 x 값을 넣어줘야 한다.
    dname varchar2(14),
    loc varchar2(13) unique,
    email varchar2(50) unique,
    create_date date default sysdate
);

insert into dept(dname, loc, email, create_date)
values('이숭무', '122', 'high', sysdate);

insert into dept(deptno, dname, loc, email, create_date)
values(1, '이숭무', '122', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, email, create_date)
values(2, '이숭무', '123', 'land', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(3, '이숭무', '124', sysdate);

drop table dept;
create table dept(
    deptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) not null unique,
    email varchar2(50) unique,  -- unique는 null값 허용.
    create_date date default sysdate
);
insert into dept(deptno, dname, loc, email, create_date)
values(1, '이숭무', '123', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, create_date)
values(2, '이숭무', '124', sysdate);

insert into dept(deptno, dname, loc, create_date)
values(3, '이숭무', '125', sysdate);

select * from dept;

select * from dba_constraints -- 제약조건 확인하겠다. 타입 C : null, P : 프라이머리키, U : 유니크
where table_name = 'DEPT';

drop table dept;

-- constraint명 주기
create table dept( -- 열 레벨
    deptno number(2) constraint dept_deptno_PK primary key,
    dname varchar2(14),
    loc varchar2(13) not null constraint dept_loc_UU unique,
    email varchar2(50) constraint dept_email_UU unique, 
    create_date date default sysdate
);

select * from dba_constraints
where table_name = 'DEPT';

insert into dept(deptno, dname, email, create_date)
values(1, '이숭무', 'high', sysdate); -- NULL을 ("SMRIT"."DEPT"."LOC") 안에 삽입할 수 없습니다

insert into dept(deptno, dname, loc, email, create_date)
values(1, '이숭무', '123', 'high', sysdate);

select * from dept;

insert into dept(deptno, dname, loc, email, create_date)
values(1, '이숭무', '124', 'land', sysdate); -- 무결성 제약 조건(SMRIT.DEPT_DEPTNO_PK)에 위배됩니다

insert into dept(deptno, dname, loc, email, create_date)
values(2, '이숭무', '123', 'land', sysdate); -- 무결성 제약 조건(SMRIT.DEPT_LOC_UU)에 위배됩니다

drop table dept;

create table dept( 
    deptno number(2), 
    dname varchar2(14),
    loc varchar2(13) not null, -- not null은 무조건 열레벨
    email varchar2(50),
    create_date date default sysdate,
    constraint dept_deptno_PK primary key(deptno), -- 테이블 레벨
    constraint dept_loc_UU unique(loc),
    constraint dept_email_UU unique(email)
);

select * from dba_constraints
where table_name = 'DEPT'; -- 테이블명 대문자로 써줘야 한다.

drop table dept;
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date 
);
desc dept;

------ 열레벨 : 컬럼 옆에 추가 
------ 테이블 레벨 : 열 옆에 쓰지 않고 따로 써서 추가
------ 테이블 레벨 : 칼럼을 모두 정의하고 나서 테이블 정의를 마무리 짓기 전에 따로 생성된 칼럼들에 대한 제약 조건을 한꺼번에 지정
------ 테이블 레벨의 지정 방식을 사용하는 데에는 2가지 이유
------ 1.복합키로 기본키를 지정할 경우
------ 2.ALTER TABLE로 제약 조건을 추가할 때
------ NOT NULL 조건은 테이블 레벨 정의 방법으로 제약 조건을 지정할 수 없습니다.
------ modify : 열레벨, add : 테이블 레벨

-- 열 수정 ( add : 컬럼 추가, modify : 컬럼 변경)
alter table dept
add (email varchar2(50) not null 
                        constraint dept_email_UU unique,
     addr varchar2(100)
);
desc dept;

alter table dept
modify (
    create_date date default sysdate,   -- 컬럼 수정할 때 항상 데이터타입 적어야한다.
    loc varchar2(13) constraint dept_loc_UU unique
);
select * from dba_constraints
where table_name = 'DEPT';

alter table dept
modify deptno number(2)
       constraint dept_deptno_PK primary key;  -- 컬럼 하나 수정할 때는 괄호 안해도 된다.
       
select * from dba_constraints
where table_name = 'DEPT';

desc dept;

-- email컬럼을 삭제하겠다.
alter table dept
drop column email; -- 삭제는 동시에 여러 컬럼을 삭제 할 수 없다.

desc dept;

drop table dept;
create table dept(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    create_date date 
);
alter table dept -- 테이블 레벨
add( addr varchar2(100) not null,
     constraint dept_deptno_PK primary key(deptno),
     constraint dept_loc_UU unique(loc)
);
-- 이미 만들어진 상태에서는 not null을 추가할 때 modify 해야한다.
alter table dept
modify (loc varchar2(13) not null,
        create_date date default sysdate
);
select * from dba_constraints
where table_name = 'DEPT';
desc dept;

drop table employees;
drop table departments;

---- table 복사하기
create table employees
as
select * from hr.employees
where 1 = 2; -- 거짓이므로 데이터 갖고오지 않는다. 데이터 갖고오지 말아라 -> 데이터 없이 테이블만 생김, 컬럼명만 갖고온다.
select * from employees;

drop table employees;
create table employees
as
select * from hr.employees;
select * from employees;

create table departments
(deptno, dname, manid, loc) -- 데이터 값 가져올 때 리네임 된 이름으로 갖고온다.
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

-- constraint 삭제
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
set num = num + 1 -- 실행시킬 때마다 1씩 증가
where seq = 2;

select * from num_test;