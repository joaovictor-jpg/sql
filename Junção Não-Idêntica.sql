create table salgrade (
    grade number(1) primary key,
    losal number(4),
    hisal number(4)
);

insert into salgrade values (1, 700, 1200);
insert into salgrade values (2, 1201, 1400);
insert into salgrade values (3, 1401, 2000);
insert into salgrade values (4, 2001, 3000);
insert into salgrade values (5, 3001, 9999);

select * from salgrade;

select e.ename, e.sal, s.grade, s.losal, s.hisal
from SCOTT.emp e join salgrade s
on (e.sal between s.losal and s.hisal);