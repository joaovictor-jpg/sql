alter table aluno
add data_nasc date;

describe alu;

alter table aluno
modify nome varchar2(150);

alter table aluno
modify nome not null;

alter table aluno
rename column data_nasc to data_nascimento_aluno;

alter table aluno
drop column data_nascimento_aluno;

alter table aluno
add constraint pk_alu primary key(ra);

rename aluno to alu;

describe PROFESSOR;

drop table PROFESSOR;