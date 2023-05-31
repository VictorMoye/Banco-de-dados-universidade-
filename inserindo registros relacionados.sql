select idaluno, nome from aluno;
select fk_idaluno, numero from telefone;
desc telefone;
alter table telefone modify column fk_idaluno int(11) ;
alter table telefone add constraint fk_aluno_telefone
foreign key (fk_idaluno) references aluno (idaluno);

update telefone set fk_idaluno = 1 
where numero in ('11 5555-2222','11 3333-4444');

select * from aluno;
select * from telefone;

insert into telefone(numero,tipo,fk_idaluno) 
values ('11 5555-2222', 'res', 4 );

insert into telefone(numero,tipo,fk_idaluno) 
values ('11 5555-8888 ', 'res', 3 ); #11 5555-8888 11 5555-7777 11 5555-9999

