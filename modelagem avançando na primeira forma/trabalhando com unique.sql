select * from aluno ;
desc aluno;

# tranforlando o campo cpf e  email da tabela em valor unique 
alter table aluno add constraint uc_aluno_cpf unique (cpf);
alter table aluno add constraint uc_aluno_email unique (email)	;

# para garantir a entegridade do banco de dados e dos relacionamentos 1-1 
# preciso transformas as chaves estrangeiras em unique tbm. 
alter table endereco add constraint uc_endereco_fkidaluno unique(fk_idaluno);