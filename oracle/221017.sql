drop table departments;
drop table employees;
create table departments(
    department_id number(4) not null,
    department_name varchar2(30) not null,
    manager_id number(6),
    location_id number(4)
);

desc hr.departments;
create table departments
as
select * from hr.departments
where 1 = 2; -- 테이블만 만들기 (값 없이)

create table employees
as
select * from hr.employees
where 1 = 2;

select * from user_constraints
where table_name = 'DEPARTMENTS';

alter table departments
add(
    constraint dept_deptid_PK primary key(department_id)
);

desc hr.employees;
create table employees( -- 열레벨
EMPLOYEE_ID     NUMBER(6) constraint emp_empid_PK primary key,
FIRST_NAME      VARCHAR2(20),
LAST_NAME       VARCHAR2(25) NOT NULL,
EMAIL           VARCHAR2(25) NOT NULL,
PHONE_NUMBER    VARCHAR2(20), 
HIRE_DATE       DATE         NOT NULL,
JOB_ID          VARCHAR2(10) NOT NULL,
SALARY          NUMBER(8,2), 
COMMISSION_PCT  NUMBER(2,2), 
MANAGER_ID      NUMBER(6),
DEPARTMENT_ID   NUMBER(4) constraint emp_deptid_FK 
                          references departments (department_id)
);
select * from user_constraints
where table_name = 'EMPLOYEES';

select * from hr.departments;

select * from hr.employees;
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(198,	'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '07/06/21', 'SH_CLERK', 2600, null, 124, 50); --무결성 제약조건(SMRIT.EMP_DEPTID_FK)이 위배되었습니다- 부모 키가 없습니다

select * from departments;
select * from hr.departments;
insert into departments(department_id, department_name, manager_id, location_id)
values(50, 'Shipping', 121, 1500);

select * from hr.employees;
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(198,	'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '07/06/21', 'SH_CLERK', 2600, null, 124, 50);

select * from employees;

drop table employees;

create table employees( -- 테이블 레벨
EMPLOYEE_ID     NUMBER(6), 
FIRST_NAME      VARCHAR2(20),
LAST_NAME       VARCHAR2(25) NOT NULL,
EMAIL           VARCHAR2(25) NOT NULL,
PHONE_NUMBER    VARCHAR2(20), 
HIRE_DATE       DATE         NOT NULL,
JOB_ID          VARCHAR2(10) NOT NULL,
SALARY          NUMBER(8,2), 
COMMISSION_PCT  NUMBER(2,2), 
MANAGER_ID      NUMBER(6),
DEPARTMENT_ID   NUMBER(4),
constraint emp_empid_PK primary key(employee_id),
constraint emp_dept_id_FK foreign key(department_id)
references departments (department_id)
);

insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values(198,	'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '07/06/21', 'SH_CLERK', 2600, null, 124, 50);
select * from employees;

drop table employees;

alter table departments
drop constraint dept_deptid_PK;

select * from user_constraints
where table_name = 'DEPARTMENTS';

create table employees(
EMPLOYEE_ID     NUMBER(6),
FIRST_NAME      VARCHAR2(20),
LAST_NAME       VARCHAR2(25) NOT NULL,
EMAIL           VARCHAR2(25) NOT NULL,
PHONE_NUMBER    VARCHAR2(20), 
HIRE_DATE       DATE         NOT NULL,
JOB_ID          VARCHAR2(10) NOT NULL,
SALARY          NUMBER(8,2), 
COMMISSION_PCT  NUMBER(2,2), 
MANAGER_ID      NUMBER(6),
DEPARTMENT_ID   NUMBER(4)
);
alter table employees
modify(employee_id number(6)
       constraint emp_empid_PK primary key, department_id number(4)
       constraint emp_deptid_FK
       references departments(department_id)
); -- 이 열목록에 대해 일치하는 고유 또는 기본 키가 없습니다. fk쓸라면 pk가 있어야 한다.
select * from user_constraints
where table_name = 'DEPARTMENTS';

alter table departments
modify(department_id number(4) constraint dept_deptid_PK  primary key);

select * from user_constraints
where table_name = 'EMPLOYEES';

-- table만들고 --> alter table 이용해서 primary key만들고 --> foreign key 만든다.
-- table --> primary key --> foreign key

drop table employees;
drop table departments; -- 참조하고 있으면 자식테이블부터 삭제해야함.
-- 참조 테이블이 있는 경우 자식 테이블을 삭제 후 부모 테이블 삭제
create table departments(
    department_id number(4) not null,
    department_name varchar2(30) not null,
    manager_id number(6),
    location_id number(4)
);
create table employees(
EMPLOYEE_ID     NUMBER(6),
FIRST_NAME      VARCHAR2(20),
LAST_NAME       VARCHAR2(25) NOT NULL,
EMAIL           VARCHAR2(25) NOT NULL,
PHONE_NUMBER    VARCHAR2(20), 
HIRE_DATE       DATE         NOT NULL,
JOB_ID          VARCHAR2(10) NOT NULL,
SALARY          NUMBER(8,2), 
COMMISSION_PCT  NUMBER(2,2), 
MANAGER_ID      NUMBER(6),
DEPARTMENT_ID   NUMBER(4)
);
-- primary key
alter table employees
add(
    constraint emp_empid_PK primary key(employee_id)
);

alter table departments
add(
    constraint dept_deptid_PK primary key(department_id)
); -- pk와 fk묶지 않는다.

-- foreihn key
alter table employees
add(
    constraint emp_deptid_fk foreign key(department_id)
    references departments(department_id)
);

select * from user_constraints
where table_name = 'DEPARTMENTS';

select * from user_constraints
where table_name = 'EMPLOYEES';

drop table member;

--------------------------------------------------------------
create table member(
    member_no varchar2(15),       -- not null이지만 프라이머리키므로 안넣어줘도 된다.
    member_name varchar2(20) not null,
    member_id varchar2(12) not null,
    member_phone varchar2(30) not null,
    member_email varchar2(40),
    member_mobile varchar2(30),
    pay_method varchar2(16)
);
create table publisher(
    pub_co_num varchar2(15),
    pub_name varchar2(20) not null,
    pub_addr varchar2(50) not null,
    pub_phone varchar2(30) not null,
    bank_no varchar2(7) not null,
    account_num varchar2(16) not null
);
create table book(
    book_no number,
    book_name varchar2(20),
    book_ck number(6,3),
    book_qty integer 
);
create table contract_company(
    cont_number number,
    cont_status integer not null,
    min_pct number(6,3) not null,
    cont_date date not null,
    pub_co_num varchar2(15)
);
create table supply_book(
    book_no number,
    cont_number number,
    book_reg date not null
);
create table chk_book(
    chk_no integer,
    member_no varchar2(15),
    book_no number,
    reg_date date not null
);
create table order1(
    order_no number,
    del_addr varchar2(50) not null,
    del_phone varchar2(30) not null,
    order_date date not null,
    del_code number(6,3) not null,
    payment number(6,3) not null,
    tot_payment integer,
    member_no varchar2(15),
    qyy integer
);
create table order_list(
    order_no number,
    book_no number,
    order_qty number
);

select * from user_tables;

alter table member
add(constraint mem_memno_pk primary key (member_no));

alter table publisher
add (constraint pub_pubconum_pk primary key(pub_co_num));

alter table book
add(constraint book_bkno_pk primary key(book_no));

alter table contract_company
add(constraint coco_contnum_pk primary key(cont_number));

alter table order1
add(constraint order1_orderno_pk primary key(order_no));

alter table supply_book
add(constraint subook_bookno_pk primary key(book_no),
    constraint subook_contnum_pk primary key(cont_number));
-- 테이블에는 하나의 기본 키만 가질 수 있습니다.

alter table supply_book
add(constraint subook_bono_connum_pk primary key(book_no, cont_number)); -- 하나의 primary key 에 여러개의 컬럼이 속하도록 만든다.

select * from user_cons_columns
where table_name = 'SUPPLY_BOOK';

alter table chk_book
add(constraint ckbk_memno_bkno_pk primary key (chk_no, member_no, book_no));

select * from user_cons_columns
where table_name = 'CHK_BOOK';

alter table order_list
add(constraint orlist_orderno_bookno_pk primary key (order_no, book_no));

select * from user_cons_columns
where table_name = 'ORDER_LIST';

---------foreign key---------------
alter table contract_company
add(constraint concom_pubconum_fk foreign key(pub_co_num)
    references publisher(pub_co_num));      -- publisher로부터 받아왔다.

select * from user_cons_columns
where table_name = 'CONTRACT_COMPANY';

alter table supply_book
add(constraint subk_bookno_fk foreign key(book_no)
    references book(book_no),
    constraint subk_contnum_fk foreign key(cont_number)
    references contract_company(cont_number));

select * from user_cons_columns
where table_name = 'SUPPLY_BOOK';

alter table chk_book
add(constraint chbk_memno_fk foreign key(member_no)
    references member(member_no),
    constraint chbk_bookno_fk foreign key(book_no)
    references book(book_no));

select * from user_cons_columns
where table_name = 'CHK_BOOK';

alter table  order1
add(constraint order1_memno_fk foreign key (member_no)
    references member(member_no));
    
alter table  order_list
add(constraint order1_orderno_fk foreign key (order_no)
    references order1(order_no),
    constraint order1_bookno_fk foreign key (book_no)
    references book(book_no));
    
create table a(
    a1 number, -- pk
    a2 varchar2(15)
);
create table b(
    b1 number, -- pk
    b2 varchar2(15),
    a1 number -- pk/fk
);
create table c(
    b1 number, -- pk / fk
    a1 number, -- pk / fk
    c1 number, -- pk
    c2 varchar2(20)
);
create table d(
    b1 number, -- fk
    a1 number, -- fk
    d1 number, -- pk
    d2 varchar2(20)
);

alter table a
add (constraint a_a1_pk primary key (a1));

alter table b
add(constraint b_a1_b1_pk primary key(a1, b1)); -- 복합키 : 하나의 키에 여러가지 키가 있는 것 

alter table c
add(constraint c_a1_b1_c1_pk primary key(a1, b1, c1));

alter table d
add(constraint d_d1_pk primary key(d1));

-----------------------------------------------------------
alter table b
add(constraint b_a1_fk foreign key(a1)
    references a(a1) on delete cascade ); -- a1이 삭제되면 b1도 삭제되게 해라
    
alter table c
add(constraint c_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1) on delete cascade);
    
alter table d
add(constraint d_a1_b1_fk foreign key(a1, b1)
    references b(a1, b1) on delete set null); -- 삭제하지 않고 null값을 줌
    
insert into a(a1, a2)
values(1, 'a');
select * from a;

insert into b(b1, b2, a1)
values(11, 'b11', 1); -- a1은 레퍼런스하고 있어서 부모키인 a테이블의 a1값을 넣어줘야 한다.
select * from b;

insert into c(c1, c2, a1, b1)
values(111, 'C111', 1, 11); -- a1, b1은 레퍼런스하고 있어서 부모키인 b테이블의 a1, b1값을 넣어줘야 한다.
select * from c;

insert into d(d1, d2, a1, b1)
values(1111, 'D1111', 1, 11);
select * from d;

delete from d; -- 테이블 삭제할 때는 자식테이블부터 삭제해야한다.
select * from d;

delete from c;
delete from b;
delete from a;

drop table d;
drop table c;
drop table b;
drop table a;

select * from d;
-- 하나의 키에 여러가지 키가 있는 것 : 복합키