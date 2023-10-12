use Primeiro_Banco
create table imagens(
id Integer,
name varchar(100),
data varbinary(max))

declare @imagem varbinary(max)
set @imagem = (select * from openrowset(bulk 'C:\Users\joao\Pictures\Screenshots\Screenshot 2023-07-22 202822.png', single_blob) as img)

insert into imagens (id, name, data) values (1, 'Screenshot 2023-07-22 202822.png', @imagem)

select * from imagens