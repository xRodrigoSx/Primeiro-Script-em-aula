CREATE DATABASE ListaTelefonica;

USE ListaTelefonica;

CREATE TABLE assinante (
id_assinante			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_assinante			VARCHAR(50) NOT NULL,
ass_ramal					VARCHAR(30) NOT NULL,
ass_tip						VARCHAR(20) NOT NULL,
ass_ender	 				VARCHAR(50) NOT NULL);

INSERT INTO assinante (id_assinante, nome_assinante) VALUES
('1', 'Roberto Carlos'),
('2', 'Cristian Roraima'),
('3', 'Miguel Santoro'),
('4', 'Gustav Jablonski'),
('5', 'Lucas Sorocaba'),
('6', 'Juan Scadrilho'),
('7', 'Hex Boombox'),
('8', 'Joseph Strim'),
('9', 'Matheus Guster');


CREATE TABLE ramo (
id_ramo			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ramal			VARCHAR(30) NOT NULL);

INSERT INTO ramo (id_ramo, ramo) VALUES
('1', 'Assistencia técnica'),
('2', 'Telemarketing'),
('3', 'Industria'),
('4', 'Escritório'),;

CREATE TABLE tipo (
id_tipo			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tip			VARCHAR(20) NOT NULL);

CREATE TABLE endereço (
id_endereço		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ender			VARCHAR(50) NOT NULL,
bairro			VARCHAR(30) NOT NULL,
end_munic		VARCHAR(50) NOT NULL,
complemento		VARCHAR(20) NOT NULL,
CEP				INT NOT NULL,
end_fone		INT NOT NULL);

CREATE TABLE telefone (
id_telefone		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ddd				INT NOT NULL,
fone			INT NOT NULL);

CREATE TABLE municipio (
id_municipio	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
munic		VARCHAR(50) NOT NULL);

SELECT * FROM assinante;
SELECT * FROM ramo;
SELECT * FROM tipo;
SELECT * FROM endereço;
SELECT * FROM telefone;
SELECT * FROM município;

select nome_assinante, ender, fone
from assinante
inner join endereço on endereço.ender = assinante.nome_assinante
inner join telefone on endereço.end_fone = telefone.fone;

select nome_assinante, ramal
from assinante
inner join ramo on ramo.ramal = assinante.nome_assinante;

select end_munic, ass_tip
from assinante
inner join endereço on endereço.end_munic = assinante.ass_tip
where endereço.end_munic = "Pelotas"
union all
select end_munic, ass_tip
from assinante
inner join endereço on endereço.end_munic = assinante.ass_tip
where assinante.ass_tip = "residencial";

SELECT COUNT(nome_assinante), end_fone
FROM assinante
INNER JOIN endereço ON endereço.end_fone = assinante.nome_assinante
group by nome_assinante
having nome_assinante >1;


/*selecionar as colunas que tu precisa , count
Inner join das tabelas
group by por quem tu contou 
having >1 */

select nome_assinante, end_fone, ass_tip, ender
from assinante
inner join endereço on endereço.end_fone = assinante.ass_tip
having assinante.ass_tip = "residencial"
union all
select nome_assinante, end_fone, ass_tip, ender
from assinante
inner join endereço on endereço.ender = assinante.nome_assinante
having endereço.ender = "Pelotas"
union all
select nome_assinante, end_fone, ass_tip, ender
from assinante
inner join endereço on endereço.ender = assinante.nome_assinante
having endereço.ender = "Canguçu";