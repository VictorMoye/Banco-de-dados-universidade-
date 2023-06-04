
use universidade_u;
CREATE TABLE aluno 
( 
 nome VARCHAR(50),  
 sexo CHAR(1),  
 endereço VARCHAR(100),  
 telefone INT,  
 data_inscrição_no_curso DATE,  
 valor_pago_pelo_curso FLOAT,  
 Ativo_SN INT,  
 Idade INT,  
 cpf VARCHAR(11),  
 email VARCHAR(50),  
 idAluno INT PRIMARY KEY AUTO_INCREMENT,  
 logradouro VARCHAR(50),  
 numero VARCHAR(50),  
 complemento VARCHAR(20),  
 bairro INT,  
 campo_4 VARCHAR(100),  
 estado CHAR(2) 
); 

CREATE TABLE TbTelefone 
( 
 idTelefone INT PRIMARY KEY AUTO_INCREMENT,  
 numero VARCHAR(20),  
 tipo CHAR(3)  
); 
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

select * 
from aluno;
alter table aluno MODIFY COLUMN telefone varchar(15); # alterando o tamanho da coluna telefone para caber os numeros de telefone sem truncar
insert into aluno(sexo, Idade, data_inscrição_no_curso, telefone, valor_pago_pelo_curso,
    ativo_SN, endereço, nome
)values(
	'M', 55, '2018-12-01', '11 5555-2222', 645.22, 
    1, 'Avenida Paulista 1500  ap315 - São Paulo - SP', 'João'
);


insert into aluno(
	data_inscrição_no_curso, telefone, valor_pago_pelo_curso,
    ativo_SN, endereço, nome, 
    sexo, Idade
)values(
	'2018-11-01', '11 3333-2222', 589.12, 
    1, 'Rua Francisco Sá, 10 - Belo Horizonte - MG', 'Fernanda', 
    'F', 30
),
 (
	'2018-12-02', '11 3333-7777', 600.55, 
    0, 'Avenida Dom Manuel, 300 - Fortaleza - CE', 'José', 
    'M', 29
),
(
	'2018-12-02', '11 7777-7777', 655.45, 
    1, 'Rua Miramar, 1200, ap112 - Natal - RN', 'Maria', 
    'F', 42
),
(
	'2018-11-15', '11 1111-7777', 612.99, 
    1, 'Rua João de Abreu, 650 - Goiânia - GO', 'Marcelo', 
    'M', 37
);
select * from aluno
where nome = 'João'; 

# alterando dados do joao 
update aluno set ativo_SN = 0 where nome = 'João';

update aluno set ativo_SN = 1, valor_pago_pelo_curso = 750 where nome = 'José';

update aluno set telefone =  '11 8888-4444' where telefone = '11 7777-7777';
