/*
	          (Grupo 06)

Daniel Rezende Garcia Foschini RA 01252102
*/


CREATE DATABASE armorysafe; -- CRIA O BANCO DE DADOS 

USE armorysafe; -- SELECIONA O BANCO DA DADOS

CREATE TABLE cadastro( -- CRIA A TABELA DO CADASTRO DE MILITARES
idlog INT PRIMARY KEY AUTO_INCREMENT, -- PKEY
idmili CHAR(10) UNIQUE NOT NULL, -- Nº INTENTIDADE MILITAR (CIM)
senha VARCHAR(30) NOT NULL, -- SENHA DE LOGIN
dtcria DATETIME DEFAULT CURRENT_TIMESTAMP, -- DATA QUE FOI REALIZADO O CADASTRO
tipusr VARCHAR(30) NOT NULL -- TIPO DE USUARIO
CONSTRAINT chk_hirar CHECK(tipusr IN('Praça','Subalterno','Superior')),
orgmil VARCHAR(40) NOT NULL, -- ORGANIZAÇÃO MILITAR QUE É O MILITAR
regmili VARCHAR(30) NOT NULL, -- REGIÃO MILITAR DO USUARIO
sexo CHAR(1), -- SEXO DO USUARIO
CONSTRAINT chk_sex CHECK(sexo IN('F','M'))
);

CREATE TABLE municao( -- CRIA A TABELA DO PAIOL
idmun INT PRIMARY KEY AUTO_INCREMENT, -- PKEY IND
lote VARCHAR(10) NOT NULL UNIQUE, -- QUAL O LOTE DA MUNIÇÃO
loc VARCHAR(40) NOT NULL DEFAULT'Não Designado', -- EM QUAL QUARTEL A MUNIÇAO ESTÁ LOCALIZADA
reg varchar(30) NOT NULL, -- EM QUAL REGIÃO MILITAR É LOCALIZADO O QUARTEL!
pai VARCHAR(40) NOT NULL, -- EM QUAL PAIOL DA OM A MUNIÇÃO ESTÁ LOCALIZADA!
tipmun VARCHAR(10) NOT NULL, -- TIPO/CLASSIFICAÇÃO DA MUNIÇÃO
dtrec DATETIME, -- DATA DE RECEBIMENTO
dtfab DATETIME, -- DATA DE FABRICAÇÃO
dtexm DATETIME, -- DATA DO ULTIMO EXAME REALIZADO
marca VARCHAR(11) DEFAULT 'TESTED' -- QUAIS TRABALHOS FORAM FEITOS NA MUNIÇÃO
CONSTRAINT chk_mark CHECK( marca IN('A','R','REP','INSP','PKD','DES','COND','US/T','TESTED','FAILED TEST')),
cond CHAR(2) DEFAULT'A1' -- CONDIÇÃO ATUAL DA MUNIÇÃO
CONSTRAINT chk_cond CHECK( cond IN('A1','A2','A3','B1','B2','B3','B4','C1','C2','C3','C4','C5','D1','D2','D3'))
);

CREATE TABLE umidade(
idum INT PRIMARY KEY AUTO_INCREMENT, -- INDENTIFICAÇÃO DO SENSOR
dtcap DATETIME, -- A DATA & HORARIO DA CAPTURA
qtum DECIMAL(4,2),  -- 12.34 HUMIDADE CAPTURADA
locsen VARCHAR(40), -- EM QUAL OM O SENSOR ESTÁ LOCALIZADO
paisen VARCHAR(40), -- EM QUAL PAIOL DA OM O SENSOR ESTÁ LOCALIZADO
regsen VARCHAR(30) -- EM QUAL REGIÃO MILITAR ESTÁ LOCALIZADO O QUARTE.
);

DESC umidade;
DESC cadastro;
DESC munition;

INSERT INTO cadastro (idmili, senha, tipusr, orgmil, regmili, sexo)
VALUES
(10234567, 'senha123', 'Praça', '1º Batalhão de Infantaria', '1ª Região Militar', 'M'),
(20895432, 'forca321', 'Subalterno', '2º Regimento de Cavalaria', '2ª Região Militar', 'F'),
(30567891, 'brasil2025', 'Superior', 'Comando Militar do Leste', '1ª Região Militar', 'M'),
(41928374, 'segura!45', 'Praça', 'Depósito de Munição', '1ª Região Militar', 'M'),
(50938475, 'patria@22', 'Subalterno', '3º Grupo de Artilharia de Campanha', '3ª Região Militar', 'F'),
(61293847, 'defesa#77', 'Superior', 'Depósito de Munição', '11ª Região Militar', 'M'),
(72583910, 'soldado@1', 'Praça', 'Escola de Sargentos das Armas', '4ª Região Militar', 'M'),
(83492018, 'br@vo2025', 'Subalterno', 'Depósito de Munição', '12ª Região Militar', 'M'),
(94573820, 'super!comd', 'Superior', 'Comando Militar do Sul', '3ª Região Militar', 'M'),
(10573829, 'fiel@def', 'Praça', 'Depósito de Munição', '6ª Região Militar', 'F');

SELECT * FROM cadastro;

INSERT INTO municao (lote, loc, reg, pai, tipmun, dtrec, dtfab, dtexm, marca, cond)
VALUES
('LT1023', '1º Batalhão de Infantaria', '1ª Região Militar', 'Paiol Alfa', '7.62mm', '2023-05-10 08:30:00', '2021-11-12 00:00:00', '2024-01-15 10:00:00', 'INSP', 'A1'),
('LT2045', '2º Regimento de Cavalaria', '2ª Região Militar', 'Paiol Bravo', '5.56mm', '2024-01-20 14:15:00', '2022-07-22 00:00:00', '2024-07-01 09:00:00', 'PKD', 'A2'),
('LT3099', 'Comando Militar do Leste', '1ª Região Militar', 'Paiol Central', '105mm', '2022-09-05 09:00:00', '2020-05-18 00:00:00', '2023-10-11 11:00:00', 'REP', 'B1'),
('LT4512', 'Depósito de Munição', '1ª Região Militar', 'Paiol Delta', '7.62mm', '2023-03-28 16:00:00', '2021-08-09 00:00:00', '2024-02-20 08:00:00', 'A', 'A1'),
('LT5890', '3º Grupo de Artilharia de Campanha', '3ª Região Militar', 'Paiol Eco', '7.62mm', '2024-06-12 10:45:00', '2022-03-02 00:00:00', '2025-01-05 13:30:00', 'COND', 'B2'),
('LT6721', 'Depósito de Munição', '11ª Região Militar', 'Paiol Fox', '105mm', '2023-11-03 07:20:00', '2020-12-15 00:00:00', '2024-08-10 15:00:00', 'DES', 'C1'),
('LT7320', 'Escola de Sargentos das Armas', '4ª Região Militar', 'Paiol Golf', '5.56mm', '2022-08-15 13:00:00', '2020-01-11 00:00:00', '2023-09-14 09:30:00', 'INSP', 'A3'),
('LT8244', 'Depósito de Munição', '12ª Região Militar', 'Paiol Hotel', '5.56mm', '2023-07-19 08:10:00', '2021-04-25 00:00:00', '2024-05-02 12:00:00', 'US/T', 'C2'),
('LT9311', 'Comando Militar do Sul', '3ª Região Militar', 'Paiol Índia', '5.56mm', '2024-04-30 17:40:00', '2022-09-18 00:00:00', '2025-02-12 10:20:00', 'R', 'B3'),
('LT9999', 'Depósito de Munição', '6ª Região Militar', 'Paiol Juliet', '7.62mm', '2023-02-01 09:30:00', '2021-06-07 00:00:00', '2024-09-09 07:50:00', 'FAILED TEST', 'D2');

SELECT * FROM municao;

INSERT INTO umidade (dtcap, qtum, locsen, paisen, regsen)
VALUES
('2025-08-25 09:00:00', 78.45, '1º Batalhão de Infantaria', 'Paiol Alfa', '1ª Região Militar'),
('2025-08-25 09:00:00', 81.20, '2º Regimento de Cavalaria', 'Paiol Bravo', '2ª Região Militar'),
('2025-08-25 09:00:00', 76.90, 'Comando Militar do Leste', 'Paiol Central', '1ª Região Militar'),
('2025-08-25 09:00:00', 84.10, 'Depósito de Munição', 'Paiol Delta', '1ª Região Militar'),
('2025-08-25 09:00:00', 80.50, '3º Grupo de Artilharia de Campanha', 'Paiol Eco', '3ª Região Militar'),
('2025-08-25 09:00:00', 79.15, 'Depósito de Munição', 'Paiol Fox', '11ª Região Militar'),
('2025-08-25 09:00:00', 77.85, 'Escola de Sargentos das Armas', 'Paiol Golf', '4ª Região Militar'),
('2025-08-25 09:00:00', 85.25, 'Depósito de Munição', 'Paiol Hotel', '12ª Região Militar'),
('2025-08-25 09:00:00', 83.70, 'Comando Militar do Sul', 'Paiol Índia', '3ª Região Militar'),
('2025-08-25 09:00:00', 82.30, 'Depósito de Munição', 'Paiol Juliet', '6ª Região Militar');

SELECT * FROM umidade;

