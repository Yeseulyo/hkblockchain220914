drop table d;
drop table c;
drop table b;
drop table a;

create table a( -- 열레벨
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
    constraint c_a1_b1_c1_pk primary key(a1, b1, c1), -- 2개의 속성이 한꺼번에 넘어왔을 때는 열레벨 사용 불가 (b테이블에서 하나의 열에 프라이머리키가 2개 들어있는 것이 넘어옴 a1, b1)
    constraint c_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1)on delete cascade
);
create table d(
    d1 number constraint d_d1_pk primary key,
    d2 varchar2(20),
    a1 number,
    b1 number,
    constraint d_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1) on delete set null -- 다 삭제할 때 null값을 갖게 하겠다. (회원 탈퇴에 쓰임)
);
-- pk 널 허용 안함, 하나만 있어야 한다.
-- uu 널 허용 함 (중복데이터는 있으면 안됨), 여러개 있을 수 있다.

create table e(
    e number 
);

create table CHECKEXAM(
    city varchar2(20)    -- ,찍으면 테이블레벨됨 check는 열레벨 테이블레벨 같다.
    constraint chj_city_CK check(city in('서울', '부산', '대구', '대전'))
);
insert into CHECKEXAM
values ('인천'); -- 체크 제약조건(SMRIT.CHJ_CITY_CK)이 위배되었습니다

insert into CHECKEXAM
values ('서울');
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
values (1, 1000, 2000, 'a', 'b'); -- 체크 제약조건(SMRIT.CH_VALUE1_CK)이 위배되었습니다

insert into CHECKEXAM1
values (1, 99, 80, 'a', 'b'); -- 체크 제약조건(SMRIT.CH_VALUE2_CK)이 위배되었습니다

insert into CHECKEXAM1
values (1, 99, 100, 'a', 'b');

-- 읽기 / 쓰기 전용
-- alter table employees read only -- select만 가능 
-- alter table employees read write -- select, insert 가능 (update, delete 못함)

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
-- view 생성
create view year_sal
as
select employee_id, first_name, salary * (1 + nvl(commission_pct, 0)) year_sal
from employees;

select * from year_sal; -- from절 뒤에는 view명 또는 table명이 와야한다.

create view emp80
as
select * from employees
where department_id = 80;

select * from emp80;

-- 50인 부서의 이름, 직무, 사원번호, 연봉을 출력하는 뷰를 만드세요.
-- 뷰명은 salvu50
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

-- 수정 OR REPLACE view
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

-- 각 부서별 급여의 최소값, 급여의 최대값, 급여의 평균, 합계를 출력할 수 있는 뷰를 만드시오.
-- 뷰명은 dept_sum_vu
-- 컬럼명의 별칭은 부서명은 name, 최소값은 minsal, 최대값은 maxsal, 평균은 avgsal, 합계는 sumsal
create or replace view dept_sum_vu (name, minsal, maxsal, avgsal, sumsal)
as
select department_id, min(salary), max(salary), avg(salary), sum(salary)
from employees
group by department_id;

select * from dept_sum_vu;

-- 부서번호, 부서명, 급여 출력
select e.department_id, department_name, salary
from employees e, departments d
where e.department_id = d.department_id;

-- 부서명, 급여 출력
select department_name, salary
from employees e, departments d
where e.department_id = d.department_id;

-- 부서명, 급여의 합계, 평균, 최대값, 최소값을 구하시오.
select department_name, sum(salary), avg(salary), min(salary), max(salary)
from employees e, departments d
where e.department_id = d.department_id
group by department_name;

-- 각 부서명별 급여의 최소값, 급여의 최대값, 급여의 평균, 합계를 출력할 수 있는 뷰를 만드시오.
-- 뷰명은 dept_sum_vu
-- 컬럼명의 별칭은 부서명은 name, 최소값은 minsal, 최대값은 maxsal, 평균은 avgsal, 합계는 sumsal
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

-- 뷰에 대한 DML작업 : 함수가 들어가면 DML할 수 없다.(insert, delete) select만 가능

-- 70인 부서의 사원번호, 이름, 직무, 급여, 입사일을 출력하는 뷰를 만드시오.
-- 뷰명은 empvu70
create or replace view empvu70
as
select employee_id, first_name, job_id, salary, hire_date
from employees
where department_id = 70;

select * from empvu70;

-- DML 작업
select * from employees;

select * from empvu70;

desc employees;

create or replace view empvu70
as
select employee_id, last_name, email, job_id,  hire_date, salary, department_id
from employees
where department_id = 70; -- 70인 부서만 갖고와라

select * from employees;
select * from empvu70;

insert into empvu70(employee_id, last_name, email, job_id, hire_date, salary, department_id)
values(300, '이', 'high', '강사', sysdate, 10000, 50); -- "DEPARTMENT_ID": 부적합한 식별자 (테이블에 존재하는 애가 아니다.)

insert into empvu70(employee_id, last_name, email, job_id, hire_date, salary)
values(300, '이', 'high', '강사', sysdate, 10000);

select * from empvu70; -- 뷰를 통해서는 내가 insert한게 보이지 않지만 뷰를 통해서 실제 테이블에 insert를 할 수 있다. 뷰를 통해서 볼라면 department_id도 view에 추가해야한다.
select * from employees; -- 여기에선 보인다.

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '상', 'highland', '학생', sysdate, 100, 70);

delete from empvu70
where employee_id = 301; -- 0개 행 이(가) 삭제되었습니다. 뷰에서 보이지 않는 건 삭제할 수 없다.

delete from empvu70
where employee_id = 302; -- 1 행 이(가) 삭제되었습니다. 뷰를 통해서도 삭제 가능하다. (view 에서 보이는 것만 삭제 가능) -- employee에서도 삭제됨.
select * from empvu70;
select * from employees;

update empvu70
set salary = 100; -- 1 행 이(가) 업데이트되었습니다. view에서 보이는 것만 update가 가능하다. -- employee에서는 삭제 안됨.

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '상', 'highland', '학생', sysdate, 100, 30);
select * from empvu70;
---- 뷰에서 보이느 것만 insert가 되거나 update가 되도록 하자.
update empvu70
set department_id = 50; -- 제약을 주지 않는 이상 다 바뀜.
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

select * from empvu70; -- 실제 테이블 아니다.
select * from employees; -- 실제 테이블

update empvu70
set department_id = 50; -- 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(302, '상', 'highland', '학생', sysdate, 100, 30); -- 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다

insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(303, '장', 'high11', '학생', sysdate, 100, 70);

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
set c2 = 10  -- viewupd1을 수정
where c1 = 1;
select * from v_viewupd; -- 복합 뷰동 업데이트 가능

select * from v_viewupd;
update v_viewupd
set c3 = 10  -- viewupd2를 수정  -- join을하지만 테이블 따로따로 update를 하니까 update가 된 걸 볼 수 있다.
where c1 = 1;
select * from v_viewupd;
-- join을 한 경우 테이블별로 update를 하면 수정이 된다.

update v_viewupd
set c2 = 20, c3 = 20
--  첫번째 테이블   두번째 테이블
where c1 = 1; -- 조인 뷰에 의하여 하나 이상의 기본 테이블을 수정할 수 없습니다. -- 복합뷰일경우 하나 하나는 update가 가능하지만 동시에는 update 안된다. delete, inset도 마찬가지

select * from empvu70;

create or replace view empvu70
as
select employee_id, last_name, email, job_id,  hire_date, salary, department_id
from employees
where department_id = 70
with read only; -- DML문 작업 거부, 읽기 전용
 -- 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
insert into empvu70(employee_id, last_name, email, job_id,  hire_date, salary, department_id)
values(305, '장', 'high11', '학생', sysdate, 100, 70); -- 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
-- 뷰는 복잡한 쿼리문을 단순화할 때 쓴다. 일부컬럼에 있는 내용만 보여줄 때 쓴다.
drop view empvu70;

-- 시퀀스 : 숫자의 의미는 중요하지 않지만 유니크 할 때 사용(게시판)
create sequence empseq; -- 1부터 999999까지
select empseq.nextval from dual;
select empseq.currval from dual;

CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 400
MAXVALUE 9999
NOCACHE
NOCYCLE;

-- 수정   -- 시작값은 변경 x
alter SEQUENCE dept_deptid_seq
INCREMENT BY 20
MAXVALUE 999999
NOCACHE
NOCYCLE;

-- 삭제
drop sequence dept_deptid_seq;

select dept_deptid_seq.nextval from dual; -- 계속 증가 다음값을 가져올 때 사용 : 다음값
select dept_deptid_seq.currval from dual; -- 현재 값을 알려준다. : 현재값

insert into employees(employee_id, last_name, email, job_id, hire_date, salary)
values( (select max(employee_id) + 10 from employees) , '이숭무', 'high', '선생님', sysdate, 10000);
select * from employees;

insert into employees(employee_id, last_name, email, job_id, hire_date, salary)
values( dept_deptid_seq.nextval , '이숭무', 'high', '선생님', sysdate, 10000);
select * from employees;

insert into departments(department_id, department_name)
values(dept_deptid_seq.nextval, '강사부');
select * from departments;

select max(employee_id) + 10 from employees;

create table seqTest(
    num2 number,
    name varchar2(30)
);
insert into seqTest(num2, name)
values(dept_deptid_seq.nextval, '이숭무');
select * from seqTest;

-- 시퀀스 정보 확인
select * from user_sequences
where sequence_name = 'EMPSEQ';

-- 인덱스 : 데이터 전체에서 2% ~ 4% 미만의 값을 가져올 때 사용(작은 양)
-- where절이나 join조건에서 함께 자주 사용
select * 
from employees --1
where last_name = 'OConnell'; --2

-- index 생성
create index emplastidx
on employees (last_name); -- last_name 검색할 때 빨라진다.

select department_id, avg(salary)
from employees
group by department_id
having avg(salary) > 3000;

select employee_id, first_name
from employees
where substr(first_name, 1, 2) = 'Oc';

create index empsub -- 함수기반의 index
on employees substr(first_name, 1, 2);

create index hanjeun -- 함수기반의 index
on employees substr(start_time, end_time);

select * from employees
order by department_id, job_id;

create index empidx
on employees(department_id, job_id); -- department_id 정렬 job_id 가져옴

-- index 만들면 select 할 때 속도가 엄청 빨라진다.
-- 너무 많이 만들면 오히려 시스템 성능 안좋아진다. 꼭 필요한 컬럼, 조건에만 생성하는 것이 좋다.

-- unused : 컬럼을 제약조건 할 때

-- USER_INDEXES 데이터 딕셔너리 뷰를 query하여 인덱스에 대한 정보를 확인할 수 있습니다.
select index_name, table_name
from user_indexes
where table_name = 'EMPLOYEES';

-- 다음 딕셔너리 뷰를 통해 객체에 대한 정보를 찾는 방법 (기억하기)
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
