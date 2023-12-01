select * from scott.emp;

select ename, job, sal from scott.emp;

select ename nome, sal "Salario do funcionário" from scott.emp;

select ename nome, sal, sal*10/100 "Almento de 10%", sal+(sal*10/100) "Salario do fúncionario" from scott.emp;

select ename nome, ename || 'O cargo do funcionário é: ' || job "Nome & Cargo" from scott.emp;

select job from scott.emp;

select distinct job from scott.emp;