DROP DATABASE IF EXISTS cy_lez_08_mtm;
CREATE DATABASE cy_lez_08_mtm;
USE cy_lez_08_mtm;

CREATE TABLE Studente(
	studenteID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(250) NOT NULL,
    matricola VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE Esame(
	esameID INTEGER PRIMARY KEY AUTO_INCREMENT,
    titolo VARCHAR(250) NOT NULL,
    crediti INTEGER DEFAULT 1,
    data_esame DATE
);

CREATE TABLE Studente_Esame(
	studenteRIF INTEGER NOT NULL,
    esameRIF INTEGER NOT NULL,
    FOREIGN KEY (studenteRIF) REFERENCES Studente(studenteID) ON DELETE CASCADE,
    FOREIGN KEY (esameRIF) REFERENCES Esame(esameID) ON DELETE CASCADE,
    PRIMARY KEY(studenteRIF, esameRIF)
);

INSERT INTO Studente(nominativo, matricola) VALUES 
("Giovanni Pace", "123456"),
("Mario Rossi", "123457"),
("Valeria Verdi", "123458");

INSERT INTO Esame(titolo, crediti, data_esame) VALUES
("Analisi I", 6, "2020-01-01"),
("Analisi I", 6, "2020-01-02"),
("Fisica I", 6, "2020-01-01"),
("Fisica I", 6, "2020-01-02"),
("Programmazione I", 6, "2020-01-01"),
("Programmazione I", 6, "2020-01-02"),
("Basi di dati", 6, "2020-01-01");

INSERT INTO Studente_Esame(studenteRIF, esameRIF) VALUES
(1,	2),
(1,	5),
(2,	2),
(2,	5),
(2,	7),
(3,	2),
(3,	3);

SELECT * FROM Studente;
SELECT * FROM Esame;
SELECT * FROM Studente_Esame;

SELECT * FROM Studente
	JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID
	WHERE nominativo = "Giovanni Pace";
    
SELECT nominativo, matricola, titolo, crediti, data_esame FROM Studente
	INNER JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    INNER JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID
    ORDER BY titolo DESC;
    
INSERT INTO Studente(nominativo, matricola) VALUES 
("Marika Mariko", "123459");

INSERT INTO Esame(titolo, crediti, data_esame) VALUES
("Filosofia", 9, "2020-01-01");

SELECT * FROM Studente
	LEFT JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    LEFT JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID;
    
SELECT * FROM Studente
	RIGHT JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    RIGHT JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID
UNION
SELECT * FROM Studente
	LEFT JOIN Studente_Esame ON Studente.studenteID = Studente_Esame.studenteRIF
    LEFT JOIN Esame ON Studente_Esame.esameRIF = Esame.esameID