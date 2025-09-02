/*
			(Grupo 06)

Ana Luisa Santos Jardim RA 01252054
Daniel Rezende Garcia Foschini RA 01252102
Enrico Assef Antonucci Ferreira RA 01252095
Gabriel Alves Miguel RA 01252053
Guilherme dos Santos Mesquita RA 01252017
Gustavo Mendes Furquim RA 01252053
Juan David Valle Sánchez RA 01252026
*/

-- CRIANDO A TABLE E O DATABASE --

CREATE DATABASE armorysafe; -- CRIA O BANCO DE DADOS 

USE armorysafe; -- SELECIONA O BANCO DA DADOS

CREATE TABLE cadastro( -- CRIA A TABELA DO CADASTRO DE MILITARES
idLog INT PRIMARY KEY AUTO_INCREMENT, -- PKEY
cim CHAR(10) UNIQUE NOT NULL, -- Nº INTENTIDADE MILITAR (CIM)
senha VARCHAR(30) NOT NULL, -- SENHA DE LOGIN
dtCria DATETIME DEFAULT CURRENT_TIMESTAMP, -- DATA QUE FOI REALIZADO O CADASTRO
tipUsr VARCHAR(30) NOT NULL -- TIPO DE USUARIO
CONSTRAINT chk_hirar CHECK(tipUsr IN('Praça','Subalterno','Superior')),
orgMil VARCHAR(40) NOT NULL, -- ORGANIZAÇÃO MILITAR QUE É O MILITAR
cmdMili VARCHAR(30) NOT NULL, -- COMANDOS MILITARES DO USUARIO (FAZER CONSTRAINT)	
sexo CHAR(1), -- SEXO DO USUARIO
CONSTRAINT chk_sex CHECK(sexo IN('F','M'))
);

CREATE TABLE lote( -- CRIA A TABELA DO PAIOL
idMun INT PRIMARY KEY AUTO_INCREMENT, -- PKEY IND
idLote VARCHAR(10) NOT NULL UNIQUE, -- QUAL O LOTE DA MUNIÇÃO
qtdCaixa INT, -- QUANTIA DE CAIXAS PRESENTES NO LOTE
localiza VARCHAR(40) NOT NULL DEFAULT'Não Designado', -- EM QUAL QUARTEL A MUNIÇAO ESTÁ LOCALIZADA
comando varchar(30) NOT NULL, -- EM QUAL COMANDO MILITAR É LOCALIZADO O QUARTEL!
paiol VARCHAR(40) NOT NULL, -- EM QUAL PAIOL DA OM A MUNIÇÃO ESTÁ LOCALIZADA!
calibre VARCHAR(10) NOT NULL, -- TIPO/CLASSIFICAÇÃO DA MUNIÇÃO
dtRec DATETIME, -- DATA DE RECEBIMENTO
dtFab DATE, -- DATA DE FABRICAÇÃO
dtExm DATETIME, -- DATA DO ULTIMO EXAME REALIZADO
marcacao VARCHAR(11) DEFAULT 'TESTED' -- QUAIS TRABALHOS FORAM FEITOS NA MUNIÇÃO
CONSTRAINT chk_mark CHECK( marcacao IN('A','R','REP','INSP','PKD','DES','COND','US/T','TESTED','FAILED TEST')),
condicao CHAR(2) DEFAULT'A1' -- CONDIÇÃO ATUAL DA MUNIÇÃO
CONSTRAINT chk_cond CHECK( condicao IN('A1','A2','A3','B1','B2','B3','B4','C1','C2','C3','C4','C5','D1','D2','D3'))
);

CREATE TABLE umidade(
idUm INT PRIMARY KEY AUTO_INCREMENT, -- INDENTIFICAÇÃO DO SENSOR
dtCap DATETIME, -- A DATA & HORARIO DA CAPTURA
qtUm DECIMAL(4,2),  -- 12.34% UMIDADE CAPTURADA
locSen VARCHAR(40), -- EM QUAL OM O SENSOR ESTÁ LOCALIZADO
paiSen VARCHAR(40), -- EM QUAL PAIOL DA OM O SENSOR ESTÁ LOCALIZADO
comSen VARCHAR(30) -- EM QUAL COMANDO MILITAR ESTÁ LOCALIZADO A OM DO SENSOR.
);

DESC umidade;
DESC cadastro;
DESC municao;

-- INSERINDO DADOS --

INSERT INTO cadastro (cim, senha, tipUsr, orgMil, cmdMili, sexo)
VALUES
('9283746150', 'senha123', 'Praça', '12º Batalhão de Infantaria', 'CMSE', 'M'),
('4819273650', 'forca2025', 'Praça', '4ª Companhia de Comunicações', 'CMSE', 'F'),
('7391825460', 'senhaSegura', 'Subalterno', '1º Regimento de Cavalaria Mecanizado', 'CMS', 'M'),
('5602938174', 'brasil2025', 'Superior', '3º Grupo de Artilharia de Campanha', 'CMS', 'M'),
('8493027165', 'militar!@#', 'Praça', '9º Batalhão de Engenharia de Construção', 'CMN', 'F'),
('1938274650', 'senhaTeste', 'Subalterno', '5º Regimento de Infantaria Leve', 'CMP', 'M'),
('6574928130', 'senhaAlpha', 'Superior', '6º Batalhão de Polícia do Exército', 'CMSE', 'M'),
('3029485716', 'seguraXYZ', 'Praça', '7º Batalhão de Infantaria Blindado', 'CMS', 'F'),
('5748392016', 'senhaDelta', 'Subalterno', '8º Regimento de Cavalaria Blindado', 'CMP', 'M'),
('9182736450', 'forcaBR2025', 'Superior', '2º Batalhão de Comunicações', 'CMN', 'F');

SELECT * FROM cadastro;


INSERT INTO lote (idLote, qtdCaixa, localiza, comando, paiol, calibre, dtRec, dtFab, dtExm, marcacao, condicao)
VALUES
('L2025A001', 5, '12º Batalhão de Infantaria', 'CMSE', 'Paiol Central', '7.62mm', '2025-01-10 09:30:00', '2023-05-12', '2025-01-20 14:00:00', 'TESTED', 'A1'),
('L2025A002', 12, '4ª Companhia de Comunicações', 'CMSE', 'Paiol 1', '5.56mm', '2025-02-05 11:00:00', '2022-11-20', '2025-02-15 08:00:00', 'US/T', 'A2'),
('L2025A003', 7, '1º Regimento de Cavalaria Mecanizado', 'CMS', 'Paiol Bravo', '7.62mm', '2025-03-01 15:45:00', '2023-02-01', '2025-03-05 10:00:00', 'TESTED', 'B1'),
('L2025A004', 22, '3º Grupo de Artilharia de Campanha', 'CMS', 'Paiol Artilharia', '105mm', '2025-01-22 08:30:00', '2021-09-10', '2025-01-28 16:00:00', 'TESTED', 'A3'),
('L2025A005', 10, '9º Batalhão de Engenharia de Construção', 'CMN', 'Paiol 2', '7.62mm', '2025-02-12 13:20:00', '2022-06-15', '2025-02-20 09:00:00', 'COND', 'C1'),
('L2025A006', 4, '5º Regimento de Infantaria Leve', 'CMP', 'Paiol Alfa', '5.56mm', '2025-03-10 17:00:00', '2023-07-01', '2025-03-12 11:30:00', 'TESTED', 'A1'),
('L2025A007', 6, '6º Batalhão de Polícia do Exército', 'CMSE', 'Paiol Central', '5.56mm', '2025-01-18 10:15:00', '2022-03-25', '2025-01-25 14:45:00', 'TESTED', 'B2'),
('L2025A008', 18, '7º Batalhão de Infantaria Blindado', 'CMS', 'Paiol 3', '7.62mm', '2025-02-28 08:50:00', '2021-12-30', '2025-03-03 13:10:00', 'FAILED TEST', 'C3'),
('L2025A009', 8, '8º Regimento de Cavalaria Blindado', 'CMP', 'Paiol Delta', '105mm', '2025-03-14 19:30:00', '2020-10-11', '2025-03-20 15:25:00', 'INSP', 'B3'),
('L2025A010', 17, '2º Batalhão de Comunicações', 'CMN', 'Paiol Beta', '7.62mm', '2025-01-05 07:40:00', '2023-08-19', '2025-01-15 10:30:00', 'PKD', 'A2');

SELECT * FROM lote;

INSERT INTO umidade (dtCap, qtUm, locSen, paiSen, comSen)
VALUES
('2025-04-02 09:15:00', 45.32, '12º Batalhão de Infantaria', 'Paiol Central', 'CMSE'),
('2025-04-02 09:30:00', 50.87, '4ª Companhia de Comunicações', 'Paiol Alfa', 'CMSE'),
('2025-04-02 10:05:00', 61.42, '1º Regimento de Cavalaria Mecanizado', 'Paiol Bravo', 'CMS'),
('2025-04-02 11:20:00', 72.15, '3º Grupo de Artilharia de Campanha', 'Paiol Artilharia', 'CMS'),
('2025-04-02 12:10:00', 38.97, '9º Batalhão de Engenharia de Construção', 'Paiol 1', 'CMN'),
('2025-04-02 13:25:00', 65.44, '5º Regimento de Infantaria Leve', 'Paiol Delta', 'CMP'),
('2025-04-02 14:40:00', 58.30, '6º Batalhão de Polícia do Exército', 'Paiol Central', 'CMSE'),
('2025-04-02 15:10:00', 83.72, '7º Batalhão de Infantaria Blindado', 'Paiol 2', 'CMS'),
('2025-04-02 15:55:00', 47.25, '8º Regimento de Cavalaria Blindado', 'Paiol Gamma', 'CMP'),
('2025-04-02 16:20:00', 69.88, '2º Batalhão de Comunicações', 'Paiol Beta', 'CMN');

SELECT * FROM umidade;

-- REALIZANDO SELECT --

SELECT * FROM cadastro WHERE tipUsr ='Praça';

SELECT * FROM cadastro WHERE sexo ='M';

SELECT * FROM cadastro WHERE tipUsr !='Superior';

SELECT dtCria,cim FROM cadastro WHERE tipUsr ='Subalterno';

SELECT 
	cim AS 'Nº INDENTIDADE',
	dtCria AS 'DATA DE CRIAÇÃO',
	tipUsr AS 'PATENTE',
	orgMil AS 'ORGANIZAÇÃO MILITAR',
	cmdMili AS 'COMANDO MILITAR'
FROM cadastro;

SELECT cim AS 'INTENTIDADE',
    CASE
	WHEN tipUsr = 'Praça' THEN 'Baixa patente'
	WHEN tipUsr = 'Subalterno' THEN 'Média patente'
	WHEN tipUsr = 'Superior' THEN 'Alta patente'
	ELSE 'Desconhecido'
    END AS CLASSIFICAÇAO
FROM cadastro;

SELECT * FROM lote WHERE qtdCaixa >10;

SELECT * FROM lote WHERE calibre ='105mm';

UPDATE lote SET marcacao ='INSP' WHERE idMun =9;

SELECT * FROM lote WHERE comando ='CMSE';

SELECT
	idLote AS 'Nº DO LOTE',
	qtdCaixa AS 'QUANTIA DE CAIXAS',
	localiza AS 'ORGANIZAÇÃO MILITAR',
	comando AS 'COMANDO MILITAR',
	calibre AS 'MILIMETRAGEM',
	dtRec AS 'DATA DE RECEBIMENTO'
FROM lote WHERE
marcacao = 'TESTED';

SELECT idLote AS 'LOTE',
	CASE
	WHEN marcacao !='TESTED' THEN 'NÃO PRONTA'
    ELSE 'EM PRONTIDÃO'
    END AS SITUAÇÃO
FROM lote WHERE comando = 'CMSE';
    
    
SELECT * FROM umidade WHERE qtum >80;

SELECT * FROM umidade WHERE locSEN LIKE '%6%';

SELECT * FROM umidade WHERE dtCap LIKE'%9:15%';

SELECT
	dtCap AS 'DATA DE CAPTURA',
	qtUm AS '% DE UMIDADE',
	locSen AS 'ORGANIZAÇÃO MILITAR',
	paiSen AS 'PAIOL'
FROM umidade WHERE qtUm >49;

SELECT locSen AS 'ORGANIZAÇÃO MILITAR', paiSen AS 'PAIOL',
	CASE
    WHEN qtUm <40 THEN 'Umidade Baixa'
    WHEN qtUm >60 THEN 'Umidade Alta'
    ELSE 'Umidade Ideal'
	END AS SITUAÇÃO
FROM umidade;

-- ANOTAÇÃO

/* 

CRIAR TABELA DE AUDITORIA
PADRONIZAR NOME DAS TABLES