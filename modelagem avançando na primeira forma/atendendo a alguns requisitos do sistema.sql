
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






