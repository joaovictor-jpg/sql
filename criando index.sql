create table copy_emp as (select * from scott.emp);

select * from copy_emp;

select index_name from user_indexes where table_name='COPY_EMP';

create index ename_idx on copy_emp(ename);

select empno, ename, sal
from copy_emp
where ename='JAMES';