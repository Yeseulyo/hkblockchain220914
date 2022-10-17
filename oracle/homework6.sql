create table employee(
    emp_no number,
    dept_no number,
    emp_name varchar2(10) not null,
    emp_tel varchar2(11) not null,
    emp_email varchar2(20) not null,
    emp_addr varchar2(255) not null,
    emp_date timestamp,
    emp_carr varchar2(1000),
    emp_certi varchar2(1000)
);
create table employment(
    employment_no number,
    emp_no number,
    employment_sign varchar2(1000) not null,
    employment_sal number not null,
    employment_posi varchar2(10) not null,
    employment_date timestamp not null
);
create table jobintv(
    jobintv_no number,
    emp_no number,
    jobintv_lang number not null,
    jobintv_serv number not null,
    jobintv_task number not null,
    jobimtv_social number not null,
    jobintv_solve number not null
);
create table department(
    dept_no number,
    dept_name varchar2(100) not null,
    dept_tel varchar2(11) not null,
    dept_addr varchar2(255) not null
);
create table attend(
    attend_no number,
    emp_no number,
    lec_no number,
    attend_date timestamp not null,
    attend_time number not null,
    compl_date timestamp not null
);
create table leceval(
    leceval_no number,
    emp_no number,
    lec_no number,
    leceval_substfy number not null,
    leceval_relate number not null,
    leceval_lecstfy number not null,
    leceval_etc varchar2(1000)
);
create table leccontract(
    lec_no number,
    teach_no number,
    sebj_no number,
    lec_date timestamp not null,
    lec_pay number not null,
    lec_sign varchar2(1000) not null,
    lec_unit number
);
create table subject(
    subj_no number,
    subj_name varchar2(100) not null,
    subj_cnt varchar2(1000),
    subj_group number not null,
    subj_day number not null,
    subj_time number not null
);
create table teacher(
    teach_no number,
    teach_name varchar2(10) not null,
    teach_tel varchar2(11) not null,
    teach_email varchar2(30) not null,
    teach_addr varchar2(255) not null,
    teach_carr varchar2(1000),
    teach_viol varchar2(1000),
    teach_certi varchar2(1000)
);
select * from user_tables;

------------------------------------------------------
alter table employee
add(constraint emp_empno_pk primary key(emp_no));

alter table jobintv
add(constraint jobtv_jobtvno_empno_pk primary key(jobintv_no, emp_no));

alter table employment
add(constraint empm_empmno_empno_pk primary key(employment_no, emp_no));

alter table leceval
add(constraint lec_lecvno_empno_lecno_pk primary key(leceval_no, emp_no, lec_no));

alter table leccontract
add(constraint lect_lecno_pk primary key(lec_no));

alter table attend
add(constraint att_atteno_empno_lecno_pk primary key(attend_no, emp_no, lec_no));

alter table department
add(constraint dept_deptno_pk primary key(dept_no));

alter table subject
add(constraint sub_subjno_pk primary key(subj_no));

alter table teacher
add(constraint tea_teachno_pk primary key(teach_no));

---------------------------------------------------------------
alter table employee
add(constraint emp_deptno_fk foreign key(dept_no)
    references department(dept_no)on delete set null);

alter table leccontract
add(constraint lect_teano_fk foreign key(teach_no)
    references teacher(teach_no)on delete set null,
    constraint lect_subno_fk foreign key(subj_no)
    references subject(subj_no)on delete set null);
    
alter table jobintv
add(constraint jobtv_empno_fk foreign key(emp_no)
    references employee(emp_no)on delete cascade);
    
alter table employeement
add(constraint emp_empno_fk foreign key(emp_no)
    references employee(emp_no)on delete cascade);
    
alter table leceval
add(constraint lecv_empno_fk foreign key(emp_no)
    references employee(emp_no),
    constraint lecv_lecno_fk foreign key(lec_no)
    references leccontract(lec_no)on delete cascade);