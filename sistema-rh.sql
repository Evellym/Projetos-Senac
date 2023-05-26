CREATE DATABASE sistema_rh;

CREATE TABLE empregados (
	idEmpregado VARCHAR PRIMARY KEY,
	nome VARCHAR NOT NULL, 
	cpf CHAR(11) NOT NULL,
	estado_civil VARCHAR NOT NULL,
	data_nascimento VARCHAR NOT NULL);
	
CREATE TABLE periodo(
	idPeriodo VARCHAR PRIMARY KEY,
	entrada VARCHAR,
	saida VARCHAR ,
	turno VARCHAR);
	
CREATE TABLE lotar( 
	fkEmpregado VARCHAR REFERENCES empregados(idEmpregado), 
	fkTrabalho VARCHAR REFERENCES periodo(idPeriodo));
	
insert into empregados(idEmpregado,nome,cpf,estado_civil,data_nascimento)
values (01,'Flavinho','67750123409','Viuvo','01/02/1985'),
	(02,'Saul','12345678902','Solteiro','21/02/2006'),
	(03,'Nanda','98765432101','Casado','30/04/2003'),
	(04,'Shaulin','01763240037','Casado','05/12/1999'),
	(05,'Luisa','12345678903','Solteiro','15/08/1998'),
	(06,'Pedro','76080173093','Solteiro','19/11/1975'),
	(07,'João','78901234505','Viuvo','18/05/2000'),
 	(08,'Marcelo','86345612081','Solteiro','02/07/1992'),
	(09,'Guilherme','95241852026','Viuvo','17/06/1991'),
 	(10,'Cauã','01760922005','Casado','06/09/2008');

UPDATE empregados SET nome = 'Lucas' WHERE nome = 'João';
UPDATE empregados SET nome = 'Amanda' WHERE nome = 'Cauã';
UPDATE empregados SET nome = 'MotoG' WHERE nome = 'Saul';
UPDATE empregados SET nome = 'NOME' WHERE nome = 'Marcelo';
UPDATE empregados SET nome = 'Maria' WHERE nome = 'Nanda';

UPDATE empregados SET idEmpregado = '12' WHERE idEmpregado = '08';
UPDATE empregados SET idEmpregado = '14' WHERE idEmpregado = '09';
UPDATE empregados SET idEmpregado = '20' WHERE idEmpregado = '01';
UPDATE empregados SET idEmpregado = '32' WHERE idEmpregado = '02';
UPDATE empregados SET idEmpregado = '08' WHERE idEmpregado = '03';

DELETE FROM empregados WHERE nome = 'Flavinho';
DELETE FROM empregados WHERE nome = 'Pedro';
DELETE FROM empregados WHERE nome = 'Guilherme';
DELETE FROM empregados WHERE nome = 'MotoG';
DELETE FROM empregados WHERE nome = 'Maria';
SELECT * FROM empregados;