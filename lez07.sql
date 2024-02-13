DROP DATABASE cy_lez07_otm;
CREATE DATABASE cy_lez07_otm;
USE cy_lez07_otm;

CREATE TABLE Persona(
	personaID INTEGER PRIMARY KEY AUTO_INCREMENT,
	nominativo VARCHAR(250) NOT NULL,
    email VARCHAR(250) UNIQUE,
    telefono VARCHAR(250)
);

CREATE TABLE Carta(
	cartaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    negozio VARCHAR(250) NOT NULL,
    codice VARCHAR(250) NOT NULL UNIQUE,
    personaRIF INTEGER NOT NULL,
    FOREIGN KEY (personaRIF) REFERENCES Persona(personaID) ON DELETE CASCADE  
);

INSERT INTO Persona (personaID, nominativo, email, telefono) VALUES
(1,	"Pace Giovanni", "pace@giovanni.com", "123456"),
(2,	"Mario Rossi", "mario@rossi.com", "123457"),
(3,	"Valeria Verdi", "val@ver.com", "N.D.");
INSERT INTO Persona (nominativo, email, telefono) VALUES
("Marika Mariko", "marika@lol.com", "N.D.");

INSERT INTO Carta(negozio, codice, personaRIF) VALUES
("Conad", "CON123", 1),
("Conad", "CON124", 2),
("Coop", "CP888", 1),
("Coop", "CP889", 2),
("Coop", "CP890", 3);

SELECT * FROM Persona;
SELECT * FROM Carta;

-- Voglio sapere tutte le carte che appartengono a Giovanni Pace
SELECT * 
	FROM Persona 
    JOIN Carta ON Persona.personaID = Carta.personaRIF;
	-- WHERE nominativo = "Pace Giovanni";
    
SELECT *
	FROM Carta
    JOIN Persona ON Carta.personaRIF = Persona.personaID
    WHERE codice = "CP890";
    
-- Voglio vedere tutte le persone che hanno le carte e che non le hanno
SELECT * 
	FROM Persona 
    LEFT JOIN Carta ON Persona.personaID = Carta.personaRIF;
    
SELECT * FROM Carta;
DELETE FROM Persona WHERE personaID = 1;