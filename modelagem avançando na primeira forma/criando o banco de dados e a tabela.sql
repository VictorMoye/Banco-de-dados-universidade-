create database universidade_u;
use universidade_u;
CREATE TABLE Aluno 
( 
 nome VARCHAR(50),  
 sexo CHAR(1),  
 endereço VARCHAR(100),  
 telefone INT,  
 data_inscrição_no_curso DATE,  
 valor_pago_pelo_curso FLOAT,  
 Ativo_SN INT,  
 Idade INT,  
 cpf VARCHAR(11),  
 email VARCHAR(50),  
 idAluno INT PRIMARY KEY AUTO_INCREMENT,  
 logradouro VARCHAR(50),  
 numero VARCHAR(50),  
 complemento VARCHAR(20),  
 bairro INT,  
 campo_4 VARCHAR(100),  
 estado CHAR(2) 
); 

CREATE TABLE TbTelefone 
( 
 idTelefone INT PRIMARY KEY AUTO_INCREMENT,  
 numero VARCHAR(20),  
 tipo CHAR(3)  
); 

