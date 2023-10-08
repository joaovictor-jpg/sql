select * from dbo.Testando_Create;

create table dbo.Testando_Create(
	ID Integer NOT NULL,
	Nome varchar(100) NOT NULL,
	Idade Integer NOT NULL,
	Cidade varchar(50) NOT NULL
);

alter table dbo.Testando_Create add CEP varchar(50) NOT NULL;

alter table dbo.Testando_Create drop column CEP;

alter table dbo.Testando_Create alter column Nome varchar(150) Not NULL;

drop database Primeiro_Banco;

drop table dbo.Testando_Create;

truncate table dbo.Tabela_Teste;