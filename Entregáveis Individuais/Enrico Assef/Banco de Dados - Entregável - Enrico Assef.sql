CREATE DATABASE ArmorySafe;
USE ArmorySafe;

-- Primeira tabela: Cadastro e login 
CREATE TABLE Login (
id INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR (30),
sobrenome VARCHAR (50),
email VARCHAR (30),
usúario VARCHAR (10)
);

DESCRIBE Login;

INSERT INTO Login (nome, sobrenome, email, usúario) VALUES
('Rubens','Oliveira','rubinhoEB@gmail.com','RubensEB'),
('Mateus','Rodrigues','mrodrigues@gmail.com','Mrcaveira'),
('Enrico','Assef','enricoassef@gmail.com','Enricolas'),
('Gabriel','Andrade','gabandr@hotmail.com','Gabiluxo'),
('Vincius','Ferreira','vferreira@hotmail.com','VF25');

SELECT * FROM login;

SELECT nome FROM login;

SELECT sobrenome FROM login;

SELECT Usúario, id FROM login;

CREATE TABLE Registro(
id INT PRIMARY KEY AUTO_INCREMENT,
CIM CHAR (7),
nome VARCHAR (30),
Patente VARCHAR (30),
Função VARCHAR (25),
Região_Militar VARCHAR (25), 
Organização_Militar VARCHAR (40)
);

DESCRIBE Registro;

INSERT INTO Registro (CIM, nome, Patente, Função, Região_Militar, Organização_Militar) VALUES
(1234567, 'Carlos Henrique Silva', 'Capitão', 'Comandante de Companhia', '1 RM', '12º Batalhão de Infantaria'),
(2345678, 'Rodrigo Alves Santos', 'Sargento', 'Instrutor de Tiro', '2 RM', 'Escola de Sargentos das Armas'),
(3456789, 'Marcos Vinícius Oliveira', 'Tenente', 'Oficial de Logística', '3 RM', '4º Regimento de Cavalaria'),
(4567891, 'Felipe Andrade Costa', 'Soldado', 'Atirador de Infantaria', '5ª RM', '17º Batalhão de Caçadores'),
(5678344, 'André Luiz Ferreira', 'Coronel', 'Chefe do Estado-Maior', '9ª RM', 'Comando Militar do Sul');

SELECT * FROM Registro;

CREATE TABLE lote(
id INT PRIMARY KEY AUTO_INCREMENT,
CIM INT (7),
nome VARCHAR (30),
DataCarregamento datetime default current_timestamp,
qtd_Munição VARCHAR (10), 
qtd_Munição_caixa VARCHAR (10),
qtd_caixa VARCHAR (10),
tipoMunição VARCHAR (15),
CONSTRAINT chkMunição
CHECK (tipoMunição IN ('556mm','762mm','105mm'))
);

DESCRIBE lote;

INSERT INTO lote(CIM, nome, DataCarregamento, qtd_Munição, qtd_Munição_caixa, qtd_caixa, tipoMunição) VALUES
('1234567', '1º Sgt Paulo Silva', '2025-08-20', 1200, 30, 40, '556mm'),
('9876210', 'Capitão Marcos Andrade', '2025-08-21', 2400, 20, 120, '762mm'),
('1124455', 'Cb Henrique Souza', '2025-08-22', 600, 50, 12, '762mm'),
('5778899', 'Ten Cel Ricardo Lima', '2025-08-23', 480, 40, 12, '556mm'),
('1084756', 'Sd João Oliveira', '2025-08-24', 3000, 25, 120, '105mm');

SELECT * FROM lote;

CREATE TABLE descarregamento(
id INT PRIMARY KEY AUTO_INCREMENT,
CIM INT (7),
nome VARCHAR (30),
DataDescarregamento datetime default current_timestamp,
conferir_qtd_Munição VARCHAR (10), 
conferir_qtd_Munição_caixa VARCHAR (10),
conferir_qld_Munição VARCHAR (20),
CONSTRAINT chkConferir_qld_Munição 
CHECK (conferir_qld_Munição IN ('Ótimo estado', 'Necessita de Reparo', 'Péssima Qualidade')),
tipo_Munição VARCHAR (15),
CONSTRAINT chk_Munição
CHECK (tipo_Munição IN ('556mm','762mm','105mm'))
);

DESCRIBE descarregamento;

INSERT INTO descarregamento (CIM, nome, DataDescarregamento, conferir_qtd_Munição, conferir_qtd_Munição_caixa, conferir_qld_Munição, tipo_Munição) VALUES 
(1234567, '1º Sgt Paulo Silva', DEFAULT, '1200', '40', 'Ótimo estado', '556mm'),
(2345678, 'Capitão Marcos Andrade', DEFAULT, '2400', '120', 'Necessita de Reparo', '762mm'),
(3456789, 'Cb Henrique Souza', DEFAULT, '600', '12', 'Ótimo estado', '556mm'),
(4567890, 'Ten Cel Ricardo Lima', DEFAULT, '480', '12', 'Péssima Qualidade', '762mm'),
(5678901, 'Sd João Oliveira', DEFAULT, '3000', '120', 'Ótimo estado', '105mm');

ALTER TABLE descarregamento MODIFY COLUMN conferir_qtd_Munição VARCHAR (30);

INSERT INTO descarregamento (CIM, nome, DataDescarregamento, conferir_qtd_Munição, conferir_qtd_Munição_caixa, conferir_qld_Munição, tipo_Munição) VALUES 
(1234567, '1º Sgt Paulo Silva', DEFAULT, '1200', '40', 'Ótimo estado', '556mm'),
(2345678, 'Capitão Marcos Andrade', DEFAULT, '2400', '120', 'Necessita de Reparo', '762mm'),
(3456789, 'Cb Henrique Souza', DEFAULT, '600', '12', 'Ótimo estado', '556mm'),
(4567890, 'Ten Cel Ricardo Lima', DEFAULT, '480', '12', 'Péssima Qualidade', '762mm'),
(5678901, 'Sd João Oliveira', DEFAULT, '3000', '120', 'Ótimo estado', '105mm');

ALTER TABLE descarregamento MODIFY COLUMN conferir_qLd_Munição VARCHAR (30);

SELECT * FROM descarregamento;

CREATE TABLE Sustentabilidade(
id INT PRIMARY KEY AUTO_INCREMENT,
CIM INT (7),
nome VARCHAR (30),
DataArmazenamento datetime default current_timestamp,
qtd_Munição VARCHAR (10), 
qtd_caixa VARCHAR (10),
Umidade VARCHAR (5),
CONSTRAINT chkUmidade
CHECK (Umidade IN ('Abaixo do Mínimo', 'Ideal', 'Acima do máximo')),
typeMunição VARCHAR (15),
CONSTRAINT chk_typeMunição
CHECK (typeMunição IN ('556mm','762mm','105mm'))
);

ALTER TABLE Sustentabilidade ADD COLUMN porcentagem_Umidade CHAR (3);

ALTER TABLE Sustentabilidade MODIFY COLUMN Umidade VARCHAR (40);

DESCRIBE Sustentabilidade;

INSERT INTO Sustentabilidade (CIM, nome, DataArmazenamento, qtd_Munição, qtd_caixa, porcentagem_Umidade, Umidade, typeMunição) VALUES
(1234567, '1º Sgt Paulo Silva', DEFAULT, '1200', '40', '55%', 'Ideal', '556mm'),
(2345678, 'Capitão Marcos Andrade', DEFAULT, '2400', '80','45%','Ideal', '762mm'),
(3456789, 'Cb Henrique Souza', DEFAULT, '600', '20', '23%', 'Abaixo do Mínimo', '556mm'),
(4567890, 'Ten Cel Ricardo Lima', DEFAULT, '900', '30', '15%', 'Abaixo do Mínimo', '762mm'),
(5678901, 'Sd João Oliveira', DEFAULT, '1500', '90', '90%', 'Acima do máximo', '105mm');

SELECT * FROM Sustentabilidade;



