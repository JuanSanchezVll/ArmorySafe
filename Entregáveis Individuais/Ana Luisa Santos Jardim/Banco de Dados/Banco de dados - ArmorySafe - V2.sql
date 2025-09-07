USE ArmorySafe;

CREATE TABLE cadastro_simples (
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificacao CHAR(15) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    tipo_usuario VARCHAR(20),
    organizacao VARCHAR(40),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lote(
    id INT PRIMARY KEY AUTO_INCREMENT,
    num_lote VARCHAR(10) NOT NULL,
    qtd_caixa INT,
    calibre VARCHAR(10),
    organizacao VARCHAR(40),
    paiol VARCHAR(40)
);

CREATE TABLE umidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATETIME,
    umidade DECIMAL(4,2),
    organizacao VARCHAR(40),
    paiol VARCHAR(40)
);




