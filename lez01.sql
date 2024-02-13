-- DDL
/*
Commento multi linea
*/
CREATE DATABASE lez01_rubrica;
-- DROP DATABASE lez01_rubrica;
USE lez01_rubrica;

CREATE TABLE Persona(
	nome VARCHAR(250) NOT NULL,
	cognome VARCHAR(250) NOT NULL,
    telefono VARCHAR(15),
    codice_fiscale VARCHAR(16) NOT NULL UNIQUE,
    via VARCHAR(250),
    citta VARCHAR(250),
    cap INTEGER
);

-- DML
INSERT INTO Persona(nome, cognome, telefono, codice_fiscale) VALUES
("Giovanni", "Pace", "123456", "PCAGNN");

INSERT INTO Persona(nome, cognome, telefono, codice_fiscale) VALUES
("Mario", "Rossi", "123457", "MRRRSS"),
("Valeria", "Verdi", "123458", "VLRVRD");

-- QL
SELECT * FROM Persona;
SELECT cognome, telefono FROM Persona;