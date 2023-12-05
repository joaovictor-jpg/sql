create table copia_emp as (select * from scott.emp);

create or replace view salvu30 as
select empno, ename, sal, deptno
from copia_emp
where deptno=30
with read only;

select * from salvu30;

delete from salvu30;