문제 1) 회원 테이블을 만드시오. 각 컬럼에 제약 조건을 부여 하시오. 제약 조건은 alter문을 이용할것 , 열레벨과 테이블 레벨 둘다 실습해 보세요.
Table MEMBER
================================
USER_ID     	NOT NULL 	VARCHAR2(20)  
USER_PW     	NOT NULL 	VARCHAR2(200) 
USER_NAME   	NOT NULL 	VARCHAR2(40)  
USER_BIRTH  	NOT NULL 	TIMESTAMP 
USER_GENDER 	NOT NULL 	VARCHAR2(1)   
USER_ADDR   	NOT NULL 	VARCHAR2(200) 
USER_PH1    	NOT NULL 	VARCHAR2(13)  
USER_PH2             			VARCHAR2(13)  
USER_REGIST          		TIMESTAMP  
USER_EMAIL           		VARCHAR2(200) 
JOIN_OK              			VARCHAR2(500)

USER_ID     : primary key (MEMBER_USER_ID_PK)
USER_EMAIL : unique (member_USER_EMAIL_UU)
USER_REGIST  : 디펄트 값은 sysdate  ;

create table member (
    user_id varchar2(20) not null,
    user_pw varchar2(200) not null,
    uwer_name varchar2(40) not null,
    user_birth timestamp,
    user_gender varchar2(1) not null,
    user_addr varchar2(200) not null,
    user_ph1 varchar2(13) not null,
    user_ph2 varchar2(13),
    user_regist timestamp,
    user_email varchar2(200),
    join_ok varchar2(500)
);
select * from member;
select * from dba_constraints
where table_name = 'MEMBER';

alter table member
modify( -- 열레벨
    user_id varchar2(20)
    constraint member_user_id_PK primary key,
    user_email varchar2(200)
    constraint member_user_email_UU unique,
    user_regist timestamp default sysdate
);

alter table member
add ( -- 테이블 레벨
    constraint member_user_id_PK primary key(user_id),
    constraint member_user_email_UU unique(user_email),
    user_regist timestamp default sysdate
); -- 추가하려는 열이 이미 테이블에 존재합니다

select * from member;
select * from dba_constraints
where table_name = 'MEMBER'; 

