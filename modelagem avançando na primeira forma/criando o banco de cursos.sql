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
from curso