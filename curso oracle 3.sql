create table dept (
    deptno number(2) primary key,
    dname varchar2(100),
    loc varchar2(100)
);

describe dept;

select * from dept;

insert into dept (deptno, dname, loc) values (10, 'Design', 'São Paulo');

insert into dept values (20, 'Financeiro', 'Rio de Janeiro');

insert into dept values (30, 'Direção', null);