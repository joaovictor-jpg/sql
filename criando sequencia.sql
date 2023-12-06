create table copia_dept as (select * from scott.dept);

select * from copia_dept;

create sequence dept_deptno
start with 42
increment by 2
maxvalue 90;

insert into copia_dept values (dept_deptno.nextval, 'comercial', 'sp');

drop sequence dept_deptno;