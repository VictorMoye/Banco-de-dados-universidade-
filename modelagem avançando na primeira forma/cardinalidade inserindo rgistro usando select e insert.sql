select * 
from telefone; 
desc telefone
desc aluno
desc endereco
CREATE TABLE endereco (
    idendereco int PRIMARY KEY,
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    fk_idaluno int,
    unique ( fk_idaluno,idendereco)
);
 
 
ALTER TABLE ENDERECO ADD CONSTRAINT fk_aluno_endereco
    FOREIGN KEY (fk_idaluno)
    REFERENCES ALUNO (idaluno);
    
# inserindo direto da tabela aluno os valores das colunas que pertecem ao endereço 
# a chave primaria ira ajudar a colocar seus endereços em seus devidos registros de pessoas 
# cada ligação é unica e por isso funcina melhor jogando como parametro

select 
	*
from 
	aluno; 
select 
	*
from 
endereco; 

# tive que colocar o indereco como auto incremente para funcionar se nao iria ficar dando erro. 
alter table endereco modify column idendereco int auto_increment ;

insert into endereco(
	logradouro,numero, complemento, bairro,cidade,estado, fk_idaluno
    ) # inserindo os dados de acordo com o select na ordem espelahda como se fosse o values 
select 
	logradouro, numero, complemento , bairro,cidade,estado, idaluno
from 
	aluno ; # estou tirando a referencia aonde estao os dados tabela aluno 
    
select 
	*
from 
endereco; 

# apagando as colunas na tabela aluno para nao ficar duplicadad
select 
	*
from 
	aluno; 
alter table aluno drop column logradouro;
select 
	*
from 
	aluno; 
alter table aluno drop column numero;
select 
	*
from 
	aluno; 
alter table aluno drop column complemento;
select 
	*
from 
	aluno; 
alter table aluno drop column bairro;
select 
	*
from 
	aluno; 
alter table aluno drop column cidade;
select 
	*
from 
	aluno; 
alter table aluno drop column estado;
select 
	*
from 
	aluno; 
    
# apenas uma visao das colunas seno apagadas

