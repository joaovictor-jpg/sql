select sysdate from dual;

select to_char(sysdate, 'DD/MONTH/YYYY') from dual;

select to_char(sysdate, 'DAY/YEAR') from dual;

select to_char(sysdate, 'DD/MONTH/YYYY') from dual;

SELECT ename, (sysdate-hiredate) days, (sysdate-hiredate)/7 weks, (sysdate-hiredate)/365 Years, (sysdate-hiredate)*24 houres from SCOTT.EMP;

SELECT ename, TRUNC((sysdate-hiredate)) days, TRUNC((sysdate-hiredate)/7) weks, TRUNC((sysdate-hiredate)/365) Years, TRUNC((sysdate-hiredate)*24) houres from SCOTT.EMP;

SELECT ename, TRUNC((sysdate-hiredate)) days, TRUNC((sysdate-hiredate)/7) weks, TRUNC((sysdate-hiredate)/365) Years, TRUNC((sysdate-hiredate)*24) houres 
    from SCOTT.EMP;

SELECT ename, sal, to_char(sal, 'L999,999,999.99') FROM SCOTT.EMP;