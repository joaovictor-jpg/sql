CREATE TABLE aluno (
    ra int(5),
    nome VARCHAR(100),
    data_nascimento DATE
);
describe aluno;

CREATE TABLE disciplina (
    cod_disc NUMBER(3) primary key,
    nome_disc varchar2(50) not null,
    carga_horario number(3)
);

Create table professor(
    cod_prof number(5) primary key,
    nome_prof varchar2(100) not null,
    dt_nasc date,
    sexo char(1) check (sexo = 'M' or sexo = 'F' or sexo = 'O'),
    cpf varchar(11) unique,
    cod_disc number(3) references disciplina (cod_disc)
);