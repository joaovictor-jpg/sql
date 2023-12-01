SELECT ename, sal, comm, sal*12+NVL(comm, 0)
from SCOTT.EMP;

SELECT ename, sal, job, DECODE(job, 'CLERK', sal*1.1, 'MANAGER', sal*1.15, 'SELESMAN', sal*1.2, sal ) "Salario Revisado"
from SCOTT.EMP;