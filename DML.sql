select * from dbo.Tabela_Teste;

insert into dbo.Tabela_Teste (ID, Descricao, Nome) values (1, 'Teste1', 'Testando insert');

update dbo.Tabela_Teste set ID=2 where ID=1;

delete from dbo.Tabela_Teste where id=2;