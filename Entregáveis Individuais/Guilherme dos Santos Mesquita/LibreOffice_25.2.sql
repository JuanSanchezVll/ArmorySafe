CREATE DATABASE bdSafe;
	USE bdSafe;
    
CREATE TABLE cadastro(
    idCad INT PRIMARY KEY AUTO_INCREMENT,
    cadNome VARCHAR (40)NOT NULL,
    cadSobrenome VARCHAR (40)NOT NULL,
    cadTipoUser VARCHAR(40) CONSTRAINT 
		chkUser CHECK (cadTipoUser IN('Praça', 'Subalterno', 'Superior')),
    cadEmail VARCHAR (40) NOT NULL,
    cadPassword VARCHAR (40)NOT NULL,
    cadConfirmPassword VARCHAR (40) ,
    cpfCad CHAR (15),
    rgCad CHAR (13),
    ctNascimentoCad DATE,
    imgCad VARCHAR (255),
    telefoneCad VARCHAR (18)
);

	CREATE TABLE quartel(
    idQuartel INT PRIMARY KEY AUTO_INCREMENT,
    cepQuartel CHAR (9),
    ruaQuartel VARCHAR (50),
    cidadeQuartel VARCHAR(50),
    estadoQuartel VARCHAR(50),
    bairroQuartel VARCHAR(50),
    ufQuartel CHAR (2),
    -- comandante receberia o id do admin
    comandanteQuartel VARCHAR(50), 
    nomeComandoQuartel VARCHAR (50)
    );
    
    ALTER TABLE cadastro ADD CONSTRAINT chkCadPassword CHECK (cadPassword = cadConfirmPassword);
    
	CREATE TABLE paiol(
		idPaiol INT PRIMARY KEY AUTO_INCREMENT,
        -- toda municao pertence a um lote
        tipoPaiol VARCHAR (20) CONSTRAINT chkLote CHECK (tipoPaiol IN ('Bunker', 'paiol')), -- As munições pode ser armazenadas em bunkers, com isso a temperatura muda
        localQuartel VARCHAR(40) NOT NULL DEFAULT'Não Designado'
    );
    
    CREATE TABLE lote (
		idMunicao INT PRIMARY KEY AUTO_INCREMENT,
        categoriaMunicao VARCHAR (50) CONSTRAINT chkCategoriaMunicao CHECK (categoriaMunicao IN ('105mm', '7.62mm' ,'5.62mm')),
        valorMunicao FLOAT,
        statusMunicao VARCHAR (40), CONSTRAINT chkStatusMunicao CHECK (statusMunicao IN ('Verde', 'Amarelo', 'Vermelho')),
        qtdMunicao INT,
        dtMunicao DATE,
        marca VARCHAR(11) DEFAULT 'TESTED' -- QUAIS TRABALHOS FORAM FEITOS NA MUNIÇÃO
				CONSTRAINT chk_mark CHECK( marca IN('A','R','REP','INSP','PKD','DES','COND','US/T','TESTED','FAILED TEST')),
		porcUmidade VARCHAR (30) -- aqui teria uma forign key de umidade, pois toda municao terá uma % de umidade
        
    );
    
    CREATE TABLE umidade(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
		-- forign key municao
		porcUmidade DECIMAL (4,2),
        dtHrUmidade DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    
    
    
    
    
    

 
 

    
    
    
    
    

    