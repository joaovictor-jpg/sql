select ename, sal
from scott.emp
where sal >= 2500;

select ename, sal, job
from scott.emp
where ename = 'JAMES';

select ename, sal
from scott.emp
where sal between 1000 and 1500;

select ename, sal, job
from scott.emp
where job in ('MANAGER', 'PRESIDENT');

select ename, sal, JOB, COMM
from scott.emp
where COMM IS NULL;

select ename
from scott.emp
where ename Like 'A%';

select ename
from scott.emp
where ename Like '_A%';

select ename, sal, job
from scott.emp
where sal > 1500
and job = 'CLERK';

select ename, sal, job
from scott.emp
where sal > 1500
or job = 'CLERK';

select ename, sal, job
from scott.emp
order by ename desc;