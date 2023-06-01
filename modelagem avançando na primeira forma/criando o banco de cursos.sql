create table curso(
idcurso int primary key auto_increment,
descricao varchar(50), 
unique (idcurso)
);

insert into curso(descricao)
values('Curso Completo do Desenvolvedor NodeJS e MongoDB'),
('Desenvolvedor Multiplataforma Android e IOS'),
('Desenvolvimento Web com Angular'),
('Desenvolvimento Web Completo 2023');

select *
from curso;

# criando a tabela de relacionamento fraco aluno cursos 
create table aluno_curso(
	id_alunocurso int auto_increment primary key,
    fk_idaluno int,
    fk_idcurso int,
    unique(fk_idaluno,fk_idcurso)
);

# criando os relacionamentos a traves das chaves estrangeiras 
alter table aluno_curso add constraint fk_idaluno_alunocurso
foreign key (fk_idaluno) references aluno(idaluno);

# criando a outra referencia com a tabela curso 
alter table aluno_curso add constraint fk_idcurso_alunocurso
foreign key (fk_idcurso) references curso(idcurso);

# Inserindo registros relacionados 
select * from aluno;
select * from curso;

insert into aluno_curso(fk_idaluno, fk_idcurso)values(1, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(1, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(2, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(3, 1);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(3, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(3, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(3, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso)values(4, 1);

select * from aluno_curso;
desc aluno_curso