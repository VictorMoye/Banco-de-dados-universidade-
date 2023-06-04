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

create database universidade_u;
use universidade_u;
/* universidade_u_logico: */

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
    idaluno int auto_increment PRIMARY KEY
);
insert into aluno(
	data_inscricao_curso, valor_pago_curso,
    ativo_sn,  nome, 
    sexo, idade
)values(
	'2018-11-01', 589.12, 
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
),
(
	'M', 55, '2018-12-01', '11 5555-2222', 645.22, 
    1, 'Avenida Paulista 1500  ap315 - São Paulo - SP', 'João'
);
# alterando dados do joao 
update aluno set ativo_sn = 0 where nome = 'João';
update aluno set ativo_sn = 1, valor_pago_curso = 750 where nome = 'José';

# dando um update nos regsitros dos alunos 
update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where idade = 30; 
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';



CREATE TABLE telefone (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(30),
    tipo enum('res','com','cel'),  # para evitar erros do usuario e não gera fragilidade de dados 
    fk_idaluno int
);

# update aluno set telefone =  '11 8888-4444' where telefone = '11 7777-7777'; 
update telefone set tipo = 'res' where idtelefone = 1;
update telefone set tipo = 'cel' where idtelefone = 1;
update telefone set tipo = 'res' where idtelefone = 4;
update telefone set tipo = 'res' where idtelefone = 3;
update telefone set tipo = 'cel' where idtelefone = 3;
update telefone set tipo = 'com' where idtelefone = 5;
update telefone set tipo = 'cel' where idtelefone = 6;

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



CREATE TABLE curso (
    idcurso int PRIMARY KEY UNIQUE,
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

 
ALTER TABLE telefone ADD CONSTRAINT FK_aluno_telefone
FOREIGN KEY (fk_idaluno) REFERENCES ALUNO (idaluno);
 
ALTER TABLE endereco ADD CONSTRAINT fk_aluno_enderco
FOREIGN KEY (fk_idaluno) REFERENCES ALUNO (idaluno);
 
ALTER TABLE alunocurso ADD CONSTRAINT fk_aluno_curso
FOREIGN KEY (fk_idaluno) REFERENCES ALUNO (idaluno);
 
ALTER TABLE AlunoCurso ADD CONSTRAINT fk_curso_alunocurso
FOREIGN KEY (fk_idcurso) REFERENCES Curso (idcurso);


