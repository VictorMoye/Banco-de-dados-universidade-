# fazendo uma atualização nas colunas da tabela 
alter table aluno rename column Idade to idade ;
alter table aluno rename column data_inscrição_no_curso to data_inscricao_curso;
alter table aluno rename column valor_pago_pelo_curso to valor_pago_curso;
alter table aluno rename column ativo_SN to ativo_sn ;
alter table aluno rename column endereço to endereco ;
alter table aluno rename column idAluno to idaluno; 
alter table aluno modify column cpf varchar(15);
# Modelagem conceitural logica e fisica Primeira forma da tabela 
select * 
from aluno; 

# dando um update nos regsitros dos alunos 
update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where idade = 30; 
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';

alter table aluno modify column idaluno int primary key auto_increment; # transformando a coluna idaluno em chave primaria 

alter table aluno drop column campo_4 ; # apagando a coluna campo_4 

# adicionando essas colunas a tabela 
alter table aluno add logradouro varchar(100);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(20);
alter table aluno add bairro varchar(100);
alter table aluno add cidade varchar(50);
alter table aluno add estado varchar(2);

select * from aluno ;
update 
	aluno
set
	logradouro = 'Avenida Paulista',	
    numero = '1500',
    complemento = 'casa 01',
    bairro = 'Bela Vista',
    cidade = 'São Paulo',
    estado = 'SP'
where idaluno = 1;   

alter table aluno drop endereco;

select * from aluno ;
select * from tbtelefone