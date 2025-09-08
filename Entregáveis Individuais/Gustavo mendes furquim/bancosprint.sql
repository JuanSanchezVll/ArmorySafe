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

