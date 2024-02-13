-- auto incrementali
DROP DATABASE IF EXISTS cy_lez03_universita;
CREATE DATABASE cy_lez03_universita;
USE cy_lez03_universita;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis VARCHAR(16) NOT NULL UNIQUE,
    matricola VARCHAR(10) NOT NULL UNIQUE,
    telefono VARCHAR(25)
);

--  DML
INSERT INTO Studente (nome, cognome, cod_fis, matricola, telefono) VALUES
("Giovanni", "Pace", "PCAGNN", "AB12345", null),
("Mario", "Rossi", "MRRRSS", "AB12346", "340.12.00");

INSERT INTO Studente (studenteID, nome, cognome, cod_fis, matricola, telefono) VALUES
(8, "Valeria", "Verdi", "VLRVRD", "AB12347", null);

INSERT INTO Studente (nome, cognome, cod_fis, matricola, telefono) VALUES
("Marika", "Mariko", "MRKMRK", "AB12348", null);

INSERT INTO Studente (studenteID, nome, cognome, cod_fis, matricola, telefono) VALUES
(3, "Marco", "Viola", "MRCVIO", "AB12349", null);

INSERT INTO Studente (nome, cognome, cod_fis, matricola, telefono) VALUES
("Marcuccio", "Mariko", "MRCMRC", "AB12350", null);
-- QL
SELECT * FROM Studente;

