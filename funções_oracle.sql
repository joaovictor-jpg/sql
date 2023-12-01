SELECT ename, job, LOWER(ename),  UPPER(ename)
from SCOTT.EMP;

SELECT ename, job, CONCAT(ename,job), SUBSTR(ename, 1, 3), INSTR(ename, 'A'), LENGTH(ename)
from SCOTT.EMP;

SELECT ROUND(42.929), TRUNC(42.929)
from SCOTT.EMP;

SELECT ROUND(42.929,2), TRUNC(42.929,2)
from SCOTT.EMP;

SELECT ename, sal, MOD(SAL, 2)
from SCOTT.EMP;