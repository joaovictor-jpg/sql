SELECT e.ename, e.sal, d.dname, d.deptno, d.loc
FROM SCOTT.EMP e JOIN SCOTT.DEPT d
on (e.deptno=d.deptno);

SELECT e.last_name, d.department_name, l.city
FROM hr.employees e JOIN hr.departments d
on (e.department_id=d.department_id)
JOIN hr.locations l
on (d.location_id = l.location_id);