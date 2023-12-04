select max(sal), min(sal), trunc(avg(sal)), sum(sal)
from scott.emp;

select min(hiredate), max(hiredate), max(ename), min(ename)
from scott.emp;

select count(*), count(comm)
from scott.emp;

select avg(comm), trunc(avg(nvl(comm, 0)))
from scott.emp;

selec deptno, sum(sal)
from scott.emp
group by deptno
order by deptno;