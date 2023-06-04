create database universidade_u;
use universidade_u;

CREATE TABLE aluno (
    sexo char(1),
    idade int,
    data_inscricao_curso date,
    telefone varchar(20),
    valor_pago_curso float(10,2),
    ativo_sn int,
    nome varchar(25),
    cpf varchar(14),
    email varchar(150),
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    idaluno int auto_increment PRIMARY KEY
);
# adicionando os alunos 
insert into aluno(
	data_inscricao_curso, telefone, valor_pago_curso,
    ativo_sn, logradouro,numero,complemento,bairro,cidade,estado ,nome, 
    sexo, idade
)values(
	'2018-11-01', '11 8888-4444',589.12, 
    1, 'Rua Francisco Sá', 10 ,'casa','cataguase','Belo Horizonte ',' MG', 'Fernanda', 
    'F', 30
),
 (
	'2018-12-02', '11 3333-7777', 600.55, 
    0, 'Avenida Dom Manuel', 300,'apartamento','sao sebastião',' Fortaleza ',' CE', 'José', 
    'M', 29
),
(
	'2018-12-02', '11 7777-7777', 655.45, 
    1, 'Rua Miramar', 1200,' ap112','capital' ,' Natal ',' RN', 'Maria', 
    'F', 42
),
(
	'2018-11-15', '11 1111-7777', 612.99, 
    1, 'Rua João de Abreu', 650,'casa','goiania',' Goiânia ',' GO', 'Marcelo', 
    'M', 37
),
(
	'2018-12-01', '11 5555-2222', 645.22, 
    1, 'Avenida Paulista', 1500 ,' ap315 ','São paulo',' São Paulo ',' SP', 'João','M', 55
);
CREATE TABLE endereco (

    idendereco int auto_increment PRIMARY KEY,
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    fk_idaluno int,
    unique ( fk_idaluno,idendereco)
); 
# criando a chave estrangeira entre a tabela aluno e endereco pra facilitar a trocas de informação 
ALTER TABLE endereco ADD CONSTRAINT fk_aluno_endereco
FOREIGN KEY (fk_idaluno) REFERENCES aluno (idaluno);

# usando o insert into pra poder tranferir os dados atraves da ligação com a chave primaria. 
insert into endereco(logradouro,numero,complemento,bairro,cidade,estado,fk_idaluno)
select               
					logradouro,numero,complemento,bairro,cidade,estado ,idaluno
from aluno; 

CREATE TABLE telefone (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(30),
    tipo enum('res','com','cel'),  # para evitar erros do usuario e não gera fragilidade de dados 
    fk_idaluno int
);

# criando a ligação atraves da chave estrangeiras 
alter table telefone add constraint fk_aluno_telefone
foreign key (fk_idaluno) references aluno (idaluno);

insert into telefone ( numero, fk_idaluno)
select telefone , idaluno from aluno;

select * from telefone; 
update telefone set fk_idaluno = 2 
where numero in ('11 9999-2722','11 3553-4784');
insert into telefone(numero,tipo,fk_idaluno) 
values ('11 5684-2672', 'res', 2);
insert into telefone(numero,tipo,fk_idaluno) 
values ('11 5555-8888 ', 'res', 3 );
update telefone set tipo = 'res' 
where idtelefone = 1; 
update telefone set tipo = 'cel' 
where idtelefone = 2; 
update telefone set tipo = 'res' 
where idtelefone = 3; 
update telefone set tipo = 'com' 
where idtelefone = 4; 
update telefone set tipo = 'com' 
where idtelefone = 5; 
select * from telefone;
update telefone set tipo = 'res' where idtelefone = 1;
update telefone set tipo = 'cel' where idtelefone = 1;
update telefone set tipo = 'com' where idtelefone = 4;
update telefone set tipo = 'res' where idtelefone = 3;
update telefone set tipo = 'cel' where idtelefone = 3;
update telefone set tipo = 'com' where idtelefone = 5;
update telefone set tipo = 'cel' where idtelefone = 6;
update telefone set tipo = 'res' 
where idtelefone = 1; 
update telefone set tipo = 'cel' 
where idtelefone = 2; 
update telefone set tipo = 'res' 
where idtelefone = 3; 
update telefone set tipo = 'com' 
where idtelefone = 4; 
update telefone set tipo = 'com' 
where idtelefone = 5; 

select * from telefone;
select * from aluno;
select * from endereco;
alter table aluno drop column logradouro ;
alter table aluno drop column numero;
alter table aluno drop column complemento; 
alter table aluno drop column bairro ;
alter table aluno drop column cidade ;
alter table aluno drop column estado ;
alter table aluno drop column telefone ;
# alterando dados do joao 
update aluno set ativo_sn = 0 where nome = 'João';
update aluno set ativo_sn = 1, valor_pago_curso = 750 where nome = 'José';

# dando um update nos regsitros dos alunos 
update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where idade = 30; 
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';

select * from aluno ;
select * 
from telefone ;
CREATE TABLE curso (
    idcurso int PRIMARY KEY UNIQUE auto_increment,
    descricao varchar(50)
);
insert into curso(descricao)
values('Curso Completo do Desenvolvedor NodeJS e MongoDB'),
('Desenvolvedor Multiplataforma Android e IOS'),
('Desenvolvimento Web com Angular'),
('Desenvolvimento Web Completo 2023');
 


CREATE TABLE alunocurso (
    id_alunocurso int auto_increment PRIMARY KEY,
    fk_idaluno int,
    fk_idcurso int,
    UNIQUE (id_alunocurso, fk_idcurso, fk_idaluno)
);
ALTER TABLE alunocurso ADD CONSTRAINT fk_aluno_curso
FOREIGN KEY (fk_idaluno) REFERENCES ALUNO (idaluno);
 
ALTER TABLE alunocurso ADD CONSTRAINT fk_curso_alunocurso
FOREIGN KEY (fk_idcurso) REFERENCES Curso (idcurso);
update aluno set telefone =  '11 8888-4444' where telefone = '11 9259-5478';

select * from aluno ;
select * from endereco ;
select * from telefone ;
select * from curso ;