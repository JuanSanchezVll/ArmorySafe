CREATE DATABASE ArmorySafe;
USE ArmorySafe;

-- Tabela para cadastro dos usuários de acesso da plataforma
CREATE TABLE cadastro (
idUser INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100) NOT NULL UNIQUE,
senha VARCHAR (50) NOT NULL,
perfil VARCHAR (15),
CONSTRAINT chkPerfil CHECK(perfil in ('Admin', 'Cabo', 'Soldado')),
dataCriacao DATETIME DEFAULT current_timestamp
);

-- Tabela para cadastro de munições e respectivas quantidades
CREATE TABLE municoes (
idTipo INT PRIMARY KEY AUTO_INCREMENT,
calibre VARCHAR (20),
descricao VARCHAR (200),
qtdMuni INT,
valorUnitario DECIMAL (10,2)
);

CREATE TABLE umidade (
idUmidade INT PRIMARY KEY AUTO_INCREMENT,
dataMedicao DATETIME DEFAULT current_timestamp,
nivelUmidade DECIMAL (5,2)
);

DESC cadastro;
DESC municoes;
DESC umidade;

-- Criação de regra para checar se a umidade está nos valores adequados para o armazenamento de munições
ALTER TABLE umidade ADD CONSTRAINT chkUmidade CHECK(nivelUmidade >= 35 AND nivelUmidade <= 50);

-- Cadastro de usuários de acesso
INSERT INTO cadastro (nome, email, senha, perfil) VALUES
	('Gabriel Alves', 'gabrielmiguel@email.com', 'senhagenerica', 'Admin'),
	('Enrico Assef', 'enficoassef@email.com', 'senhagenerica2', 'Soldado'),
	('Daniel Foschini', 'daniel.foschini@email.com', 'senhagenerica3', 'Admin'),
	('Ana Luisa', 'ana.jardim@email.com', 'senhagenerica4', 'Cabo'),
	('Gustavo Mendes', 'gustavo.mendes@email.com', 'senhagenerica5', 'Soldado');
    
SELECT * FROM cadastro;

-- Cadastro dos tipos de munições monitoradas
INSERT INTO municoes (calibre, descricao, qtdMuni, valorUnitario) VALUES
	('5,56x45mm', 'Projétil leve, baixo recuo e boa precisão em distâncias moderadas', '12350', '14.89'),
	('7,62x51mm', 'Cartucho de fuzis/metralhadoras, alcance médio, uso militar comum.', '20890', '17.50'),
	('105mm', 'Projétil de artilharia, alta potência, longo alcance.', '350', '4344');
    
SELECT * FROM municoes;

-- Leituras fictícias de níveis de umidade
INSERT INTO umidade (nivelUmidade) VALUES
	(49),
    (41),
    (38);
    
SELECT * FROM umidade;

    