select deptno, trunc(avg(sal))
from scott.emp
group by deptno
having avg(sal)>2000
order by deptno;

select ename, sal, job
from scott.emp
where sal > (select sal
    from scott.emp
    where empno = 7566);

select ename, sal, job
from scott.emp
where sal > (select sal
    from scott.emp
    where empno = 7566)
end job = (select job
    from emp
    where ename = 'FORD');

select ename, sal, job
from scott.emp
where sal = (select min(sal)
    from scott.emp)

select ename, sal, job
from scott.emp
where sal > any (select sal
    from scott.emp
    where job='CLERCK');

select ename, sal, job
from scott.emp
where sal > all (select avg(sal)
    from scott.emp
    group by deptno);