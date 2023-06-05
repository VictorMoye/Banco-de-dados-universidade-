create database universidade_a;
use universidade_a;

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

alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column tipo enum('res', 'com', 'cel') not null;
alter table telefone modify column fk_idaluno int not null;


# tranforlando o campo cpf e  email da tabela em valor unique 
alter table aluno add constraint uc_aluno_cpf unique (cpf);
alter table aluno add constraint uc_aluno_email unique (email)	;

# tranforlando o campo cpf da tabela em valor unique 
alter table aluno add constraint uc_aluno_cpf unique (cpf);

insert into aluno(sexo, idade, email, data_inscricao_curso,
valor_pago_curso, ativo_sn, nome, cpf)
values('F', 25, 'rosa@teste.com.br', '2019-01-05',
625, 1, 'Rosa', '856.111.111-11');
select * from aluno where cpf = '856.111.111-11';


# para garantir a entegridade do banco de dados e dos relacionamentos 1-1 
# preciso transformas as chaves estrangeiras em unique tbm. 
alter table endereco add constraint uc_endereco_fkidaluno unique(fk_idaluno);

use universidade_u;

/* count */
select * from aluno;
select count(*) from aluno;
select count(*) from aluno where sexo = 'F'; # contou todos os alunos feminino 
select count(distinct nome) from aluno; # destingue o nome e não conta os repetidos. 

/* max */
select max(valor_pago_curso) from aluno;
select max(valor_pago_curso) from aluno where idade > 40; # o maxximo de idade dos maiores de 40
select max(valor_pago_curso) from aluno where idade < 40; # o mais velho ate 40 anos 

/* min */
select min(valor_pago_curso) from aluno;
select min(valor_pago_curso) from aluno where ativo_sn != 0;

/* avg */
select avg(valor_pago_curso) from aluno;
select avg(valor_pago_curso) from aluno where nome = 'José';

/* sum */
select sum(valor_pago_curso) from aluno;
select sum(valor_pago_curso) from aluno where nome = 'José';


select 
	max(valor_pago_curso), 
    min(valor_pago_curso), 
    avg(valor_pago_curso), 
    sum(valor_pago_curso)  
from 
	aluno
where
	ativo_sn = 1;

# APLICANDO APELIDOS NA TABELA e arrendondando as casas decimais

select 
	round(max(valor_pago_curso),2) as valor_pago, 
    round(min(valor_pago_curso),2) as minimo_pago, 
    round(avg(valor_pago_curso),2) as media_pago, 
    round(sum(valor_pago_curso),2) as soma_pago    
from 
	aluno
where
	ativo_sn = 1;

/* ceil - arredonda o valor para cima */
select ceil(17.4) as valor;
select ceil(17.0) as valor;

/* floor - arredonda o valor para baixo */
select floor(19.555) as valor;

/* truncate - trunca a fração 
# mostra na tella as casas decimais sem arrendondar elas*/
select truncate(22.757333, 1) as valor;
select truncate(22.757333, 2) as valor;
select truncate(22.757333, 3) as valor;


select truncate(22.757333, 2) as valor , round(22.757333, 2) as valorr;
/* round - arredondamento 
mostra na tela as casas decimais arrendondando elas*/
select round(55.752, 2) as valor;
select round(55.755, 2) as valor;
select round(55.759, 2) as valor;
select round(55.754, 2) as valor;
select round(55.744, 2) as valor;

/* < 5 = para baixo */
/* >= 5 = para cima */

select 
	nome, 
    ceil(valor_pago_curso) as valor 
from 
	aluno 
where 
	idaluno in(1, 4, 5);
    
    
select 
    round(avg(valor_pago_curso), 2) as valor_pago_curso 
from 
	aluno 
where 
	idaluno in(1, 4, 5);


select 
	nome, count(*) as repeticao_nome_agrupamento 
from 
	aluno 
group by 
	nome;
    
select 
	* 
from 
	aluno
group by
	ativo_sn;
	
    
select 
	ativo_sn, count(*) as repeticao_ativo_sn_agrupamento
from 
	aluno
group by
	ativo_sn;	
    
    
select 
	ativo_sn, nome, count(*) as repeticao_agrupamento
from 
	aluno
group by
	ativo_sn, nome;
    
update aluno set nome = 'Rosa' where nome = 'Maria';    

/* --------- */  
select 
	ativo_sn, 
    round(avg(valor_pago_curso), 2) as media_por_agrupamento
from 
	aluno
group by
	ativo_sn;
/* --------- */    

select 
	sexo, floor(avg(idade)) as media_idade_por_sexo
from 
	aluno
group by
	sexo;
    
/* --------- */    

select 
	sexo, 
    min(idade) as menor_idade_do_agrupamento, 
    max(idade) as maior_idade_do_agrupamento
from 
	aluno
group by
	sexo;
    
select idade from aluno where sexo = 'f'; 
select idade from aluno where sexo = 'm'; 

select 
	estado, count(*) as total_por_estado
from 
	endereco
group by 
	estado;
    
select 
	tipo, count(*) as total_por_tipo
from 
	telefone
group by 
	tipo;
    
    


/* estados com mais alunos -  alunos por estado */
select 
	estado, count(*) as total 
from 
	endereco
group by 
	estado
order by total desc
limit 3;   
    

/* cursos mais vendidos - alunos por curso*/
select 
	fk_idcurso, count(*) as total
from 
	aluno_curso
group by
	fk_idcurso;	
    
select distinct(fk_idcurso) from aluno_curso;

/*
1 - 2
2 - 2
3 - 2
4 - 2
*/

select * from aluno_curso;      

use universidade_u;

create table gasto(
	idgasto int primary key auto_increment,
    ano int not null,
    tipo enum('previsto','realizado') not null,
    jan float(10,2),
    fev float(10,2),
    mar float(10,2),
    abr float(10,2),
    mai float(10,2),
    jun float(10,2),
    jul float(10,2),
    ago float(10,2),
    `set` float(10,2),
    `out` float(10,2),
    nov float(10,2),
    dez float(10,2)
);



insert into gasto(ano, tipo, jan, fev, mar, abr, mai, jun, jul, ago, `set`, `out`, nov, dez)values('2019', 'previsto', 18000, 17000, 19000, 20000, 17000, 18000, 18500, 18500, 1800, 17500, 18000, 17000);
insert into gasto(ano, tipo, jan)values('2019', 'realizado', 18353.20);
update gasto set fev = 17555.55 where idgasto = 2;
update gasto set mar = 19435.73 where idgasto = 2;
update gasto set abr = 22753.12 where idgasto = 2;
update gasto set mai = 16198.12 where idgasto = 2;
update gasto set jun = 17451.88 where idgasto = 2;
update gasto set jul = 18975.40 where idgasto = 2;
update gasto set ago = 19163.84 where idgasto = 2;
update gasto set `set` = 18132.56 where idgasto = 2;
update gasto set `out` = 17667.91 where idgasto = 2;
update gasto set nov = 17936.33 where idgasto = 2;
update gasto set dez = 17125.88 where idgasto = 2;

# modificando o nome da coluna referente a setembro e outubro 
# alter table gasto rename column `set` to setbro; // rename colunm não esta funcionando não sei o porque...
ALTER TABLE gasto CHANGE `set` setbr float(10,2) ;
ALTER TABLE gasto CHANGE `out` outbr float(10,2) ;

select * from gasto;

