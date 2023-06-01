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

