# not null
use universidade_u;
select * from telefone;

select * from telefone where numero is null;

desc telefone;

insert into telefone (numero, fk_idaluno, tipo)values(null, null, null);

CREATE TABLE TELEFONE (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(20) not null,
    tipo enum('res', 'com', 'cel') not null,
    fk_idaluno int not null
);

delete from telefone where idtelefone = 10;

alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column tipo enum('res', 'com', 'cel') not null;
alter table telefone modify column fk_idaluno int not null;






 