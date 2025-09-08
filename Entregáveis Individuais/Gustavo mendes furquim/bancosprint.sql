create database ArmourySafe;

use ArmourySafe;

-- Tabale para os usuarios da armourySafe;

create table Cadastro (
IdUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
senha VARCHAR(20) NOT NULL,
cim CHAR(10),
base VARCHAR(50),
posto VARCHAR(50),
CONSTRAINT ChkPosto
CHECK (posto IN('oficial','cabo','tenente'))
);

-- Tabela para inserção de munições, tipo, calibre etc..

create table municoes (
IdMunicoes INT PRIMARY KEY AUTO_INCREMENT,
calibre VARCHAR(7),
descricao VARCHAR(20),
quant_muni INT,
valor DECIMAL (9,2)
);

-- Tabela para os sensores, amarzenamento de umidade e data da mediçāo.

create table sensores (
IdSensores INT PRIMARY KEY AUTO_INCREMENT,
Datamedicao DATETIME DEFAULT current_timestamp,
NivelUmidade DECIMAL (4,2)

);

-- Tabela para os paiois, armazernar o umidade media do paiol, e quantidade de munições amarzenadas nele.

create table paiois (
IdPaiois INT PRIMARY KEY AUTO_INCREMENT,
LocalPaiol VARCHAR(50),
QuantMuni INT,
UmidadeMedia DECIMAL (4,2)
);

-- Inseri alguns dados de teste...
INSERT INTO Cadastro VALUES 
(
'1','Gustavo Mendes','Gustavomendes@gmail.com','senhaA',9876543,'Base Militar de Pirapora','oficial'
),
(
'2','Enrico Assef','Enricoasef@gmail.com','senhaB',90467328,'Base Militar de Berilo', 'tenente'
),
(
'3','Gabriel Alves', 'Gabrielalves@gmail.com','senhaC','76598428','Base militar de Leliveldia', 'cabo'
),
(
'4','Guilherme mesquita', 'Guimesquita@gmail.com', 'senhaD','85738779','Base militar de guarulhos', 'tenente'
),
(
'5','Juan Zito', 'Juan@gmail.com','senhaE','75694754','Base militar de Noronha', 'cabo'
);

select * from cadastro;

-- Inserindo dados na tabela Municoes
INSERT INTO municoes (calibre, descricao, quant_muni, valor) VALUES
(
  '5.56','Fuzil',500,4.50
),
(
  '9mm','Pistola',300,3.20
),
(
  '7.62','Metralhadora',200,6.70
);

-- Inserindo dados na tabela Sensores
INSERT INTO sensores (NivelUmidade) VALUES
(
  55.30
),
(
  62.10
),
(
  75.00
);

-- Inserindo dados na tabela Paiois
INSERT INTO paiois (LocalPaiol, QuantMuni, UmidadeMedia) VALUES
(
  'Paiol Central',1000,58.40
),
(
  'Paiol Secundário',600,65.20
),
(
  'Paiol Avançado',400,72.50
);

-- Testando
select * from Cadastro;
select * from municoes;
select * from sensores;
select * from paiois;
