select * from aluno 
desc aluno

# tranforlando o campo cpf e  email da tabela em valor unique 
alter table aluno add constraint uc_aluno_cpf unique (cpf)
alter table aluno add constraint uc_aluno_email unique (email)	