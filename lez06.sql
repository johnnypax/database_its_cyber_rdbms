DROP DATABASE IF EXISTS cy_lez06_Sanremo;
CREATE DATABASE cy_lez06_Sanremo;
USE cy_lez06_Sanremo;

CREATE TABLE Vincitore(
	vincitoreID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (250) NOT NULL,
	cognome VARCHAR (250) NOT NULL,
	titolo VARCHAR (250) NOT NULL,
	categoria VARCHAR (250) DEFAULT "N.D",
	voto DECIMAL (65,2) NOT NULL
);

INSERT INTO Vincitore (nome, cognome, titolo, categoria, voto) VALUES
("Angelina", "Mango", "la noia", "cantanti" , "0.5");

INSERT INTO Vincitore (nome, cognome, titolo, categoria, voto) VALUES
("Morgan", "Bugo", "la maleducazione", "cantanti" , "10.8");
 
INSERT INTO Vincitore (nome, cognome, titolo, categoria, voto) VALUES
("Marylin", "Manson", "sweet dreams", "cantanti" , "7.9");

SELECT *
	FROM Vincitore
	WHERE voto > 8;