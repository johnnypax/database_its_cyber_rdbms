-- Alterazione tabelle
-- DDL
DROP DATABASE IF EXISTS cy_lez04_universita;
CREATE DATABASE cy_lez04_universita;
USE cy_lez04_universita;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis VARCHAR(16) NOT NULL UNIQUE,
    matricola VARCHAR(10) NOT NULL UNIQUE,
    telefono VARCHAR(25)
);

ALTER TABLE Studente ADD COLUMN email VARCHAR(200);
ALTER TABLE Studente ADD COLUMN appellativo VARCHAR(3) AFTER nome;
ALTER TABLE Studente DROP COLUMN appellativo;
ALTER TABLE Studente MODIFY COLUMN email VARCHAR(50);
