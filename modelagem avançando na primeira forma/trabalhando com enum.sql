select * from telefone ;
# trabalhando com enum 
desc telefone;
# apagando a coluna tipo para trocar ela para o tipo enum 

alter table telefone drop column tipo ;
desc telefone;

alter table telefone add tipo enum ('res','com','cel'); # para evitar erros do usuario e não gera fragilidade de dados 
update telefone set tipo = 'res' where idtelefone = 1;
update telefone set tipo = 'cel' where idtelefone = 1;
update telefone set tipo = 'res' where idtelefone = 4;
update telefone set tipo = 'res' where idtelefone = 3;
update telefone set tipo = 'cel' where idtelefone = 3;
update telefone set tipo = 'com' where idtelefone = 5;
update telefone set tipo = 'cel' where idtelefone = 6;
desc telefone;
