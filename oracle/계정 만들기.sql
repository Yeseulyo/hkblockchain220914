alter session set "_ORACLE_SCRIPT"=true;

create user ����ڰ��� identified by ��й�ȣ;

grant resource,create session, connect, dba  to ����ڰ���;


alter user ����ڰ��� default tablespace users quota unlimited on users;



-- �� ����� �����

alter session set "_ORACLE_SCRIPT"=true;

create user smrit identified by oracle;     --- 11g ����� ��

grant resource,create session, connect, dba  to smrit;     --- 11g ����� ��

alter user smrit default tablespace users quota unlimited on users;    --- 11g ����� ��

--- ���� smrit ���� �˻��ϱ�
select * from dba_users where username = 'SMRIT';


--- hr ���� �����
select * from dba_users where username = 'HR';     

alter session set "_ORACLE_SCRIPT"=true;   --- 11g������ ���� ����

create user hr identified by hr;   --- 11g������ ���� ����

grant resource,create session, connect  to hr;   --- 11g������ ���� ����

alter user hr default tablespace users quota unlimited on users;   --- 11g������ ���� ����

select * from dba_users where username = 'HR';

--- ����� ���� �� Ǯ��
alter user smrit account unlock;
--- ����� ��й�ȣ ����
alter user smrit identified by oracle;

-- ���� ����
alter session set "_ORACLE_SCRIPT"=true;
drop user ����ڰ���;


���� ������ : 
https://github.com/oracle-samples/db-sample-schemas/releases

�ƿ� ����Ŭ ��ġ : 
https://goldencrab.tistory.com/entry/oracle-%EC%84%A4%EC%B9%98

11gR2�ٿ�ε�
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html



����ڸ� �Է�: sys as sysdba �Ǵ� SQL> conn /as sysdba
SQL> alter session set "_ORACLE_SCRIPT"=true;
SQL> @?/demo/schema/human_resources/hr_main.sql;

specify password for HR as parameter 1:
1�� ���� �Է��Ͻʽÿ�: hr

specify default tablespeace for HR as parameter 2:
2�� ���� �Է��Ͻʽÿ�: users

specify temporary tablespace for HR as parameter 3:
3�� ���� �Է��Ͻʽÿ�: temp

specify password for SYS as parameter 4:
4�� ���� �Է��Ͻʽÿ�: 1234

specify log path as parameter 5:
5�� ���� �Է��Ͻʽÿ�: C:\app\user\product\21c

specify connect string as parameter 6:
6�� ���� �Է��Ͻʽÿ�: localhost:1521/xe


human_resources/hr_cre.sql
human_resources/hr_popul.sql
human_resources/hr_idx.sql
human_resources/hr_code.sql
human_resources/hr_comnt.sql
human_resources/hr_analz.sql