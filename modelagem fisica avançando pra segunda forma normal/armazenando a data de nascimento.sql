select * 
from aluno ;

alter table aluno add data_nascimento date;

select * from aluno;

update aluno set data_nascimento = '1960-05-01' where idaluno = 1;
update aluno set data_nascimento = '1980-06-12' where idaluno = 2;
update aluno set data_nascimento = '1982-01-07' where idaluno = 3;
update aluno set data_nascimento = '1970-03-04' where idaluno = 4;
update aluno set data_nascimento = '1985-12-05' where idaluno = 5;

select * from aluno;