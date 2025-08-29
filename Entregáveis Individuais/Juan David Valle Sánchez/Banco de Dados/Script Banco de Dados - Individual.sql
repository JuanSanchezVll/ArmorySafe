-- Exibir todos os banco de dados :
SHOW DATABASES;

-- Criação do Principal banco de dados 
CREATE DATABASE ArmorySafe;

-- Usando o banco de dados 
USE armorysafe;

-- Criação da tabela cadastro 
CREATE TABLE cadastro_militares (
    id INT PRIMARY KEY AUTO_INCREMENT,
    senha_hash VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    patente VARCHAR(30) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO cadastro_militares (senha_hash, email, patente, departamento, sigla) VALUES
('e3afed0047b08059d0fada10f400c1e5', 'joao.silva@colog.mil.br', 'Praça', 'COLOG', 'CO'),
('6dcd4ce23d88e2ee9568ba546c007c63', 'maria.souza@colog.mil.br', 'Subtenente', 'COLOG', 'CO'),
('c81e728d9d4c2f636f067f89cc14862c', 'carlos.lima@colog.mil.br', 'Tenente-Coronel', 'COLOG', 'CO'),
('eccbc87e4b5ce2fe28308fd9f2a7baf3', 'ana.pereira@colog.mil.br', 'Capitão', 'COLOG', 'CO'),
('a87ff679a2f3e71d9181a67b7542122c', 'rafael.almeida@colog.mil.br', '2º Tenente', 'COLOG', 'CO'),
('e4da3b7fbbce2345d7772b0674a318d5', 'bruna.rodrigues@colog.mil.br', 'Subtenente', 'COLOG', 'CO'),
('1679091c5a880faf6fb5e6087eb1b2dc', 'lucas.martins@colog.mil.br', 'Major', 'COLOG', 'CO'),
('8f14e45fceea167a5a36dedd4bea2543', 'camila.santos@colog.mil.br', '1º Sargento', 'COLOG', 'CO'),
('c9f0f895fb98ab9159f51fd0297e236d', 'eduardo.carvalho@colog.mil.br', 'Tenente-Coronel', 'COLOG', 'CO'),
('45c48cce2e2d7fbdea1afc51c7c6ad26', 'juliana.ferreira@colog.mil.br', 'Cabo', 'COLOG', 'CO');

CREATE TABLE paiol (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_paiol VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL DEFAULT 1000,
    observacoes VARCHAR(100)
);

-- 10 Inserts de exemplo
INSERT INTO paiol (nome_paiol, capacidade, observacoes) VALUES
('Paiol Alfa', 500, 'Armazenamento principal'),
('Paiol Bravo', 300, 'Secundário, munições leves'),
('Paiol Charlie', 700, 'Munições pesadas e artilharia'),
('Paiol Delta', 400, 'Controle de munições especiais'),
('Paiol Echo', 600, 'Backup de emergência'),
('Paiol Foxtrot', 350, 'Área restrita'),
('Paiol Golf', 450, 'Somente para munição 105 mm'),
('Paiol Hotel', 500, 'Monitoramento de umidade intensivo'),
('Paiol India', 300, 'Acesso restrito'),
('Paiol Juliett', 550, 'Estoque rotativo');


CREATE TABLE municao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lote VARCHAR(10) NOT NULL,
    paiol_localizacao VARCHAR(50) NOT NULL,
    tipo_municao VARCHAR(20) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    data_recebimento DATETIME,
    data_fabricacao DATETIME,
    data_ultimo_exame DATETIME,
    condicao CHAR(2) DEFAULT 'A1'
);

-- 10 Inserts de exemplo
INSERT INTO municao (lote, paiol_localizacao, tipo_municao, quantidade, data_recebimento, data_fabricacao, data_ultimo_exame, condicao) VALUES
('L1001', 'Paiol Alfa', '5,56mm', 200, '2025-01-10', '2024-06-15', '2025-07-01', 'A1'),
('L1002', 'Paiol Bravo', '7,62mm', 150, '2025-02-12', '2024-05-20', '2025-07-05', 'A1'),
('L1003', 'Paiol Charlie', '105mm', 50, '2025-03-15', '2024-03-10', '2025-07-10', 'A2'),
('L1004', 'Paiol Delta', '5,56mm', 180, '2025-01-20', '2024-07-01', '2025-07-02', 'A1'),
('L1005', 'Paiol Echo', '7,62mm', 120, '2025-02-25', '2024-08-12', '2025-07-06', 'B1'),
('L1006', 'Paiol Foxtrot', '105mm', 40, '2025-03-30', '2024-09-05', '2025-07-12', 'A2'),
('L1007', 'Paiol Golf', '5,56mm', 220, '2025-01-18', '2024-06-20', '2025-07-03', 'A1'),
('L1008', 'Paiol Hotel', '7,62mm', 160, '2025-02-28', '2024-07-15', '2025-07-07', 'B2'),
('L1009', 'Paiol India', '105mm', 60, '2025-03-05', '2024-03-22', '2025-07-11', 'A1'),
('L1010', 'Paiol Juliett', '5,56mm', 200, '2025-01-30', '2024-08-01', '2025-07-04', 'A1');


CREATE TABLE sensor_umidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_captura DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_umidade DECIMAL(4,2) NOT NULL,
    paiol_localizacao VARCHAR(50) NOT NULL
);

-- 10 Inserts de exemplo
INSERT INTO sensor_umidade (data_captura, valor_umidade, paiol_localizacao) VALUES
('2025-08-01 08:00:00', 45.5, 'Paiol Alfa'),
('2025-08-01 08:15:00', 46.0, 'Paiol Bravo'),
('2025-08-01 08:30:00', 47.2, 'Paiol Charlie'),
('2025-08-01 08:45:00', 44.8, 'Paiol Delta'),
('2025-08-01 09:00:00', 46.5, 'Paiol Echo'),
('2025-08-01 09:15:00', 45.0, 'Paiol Foxtrot'),
('2025-08-01 09:30:00', 48.1, 'Paiol Golf'),
('2025-08-01 09:45:00', 44.9, 'Paiol Hotel'),
('2025-08-01 10:00:00', 47.0, 'Paiol India'),
('2025-08-01 10:15:00', 45.8, 'Paiol Juliett');

