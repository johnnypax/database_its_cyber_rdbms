-- DDL
CREATE DATABASE cy_lez05_negozio;
USE cy_lez05_negozio;

CREATE TABLE Prodotto(
	prodottoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    codice VARCHAR(30) NOT NULL,
    descrizione TEXT,
    categoria VARCHAR(50) DEFAULT "N.D.",	-- valore di default in caso di null
    data_inserimento DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Aggiungo UNIQUE al campo Codice
ALTER TABLE Prodotto MODIFY COLUMN codice VARCHAR(30) UNIQUE;

-- DML
-- INSERIMENTO
INSERT INTO Prodotto(descrizione, nome, codice) VALUES 
("Sono molto buoni", "Nutella", "NUT1234");
INSERT INTO Prodotto(descrizione, nome, codice) VALUES 
("Sono molto buoni", "Biscotti", "BIT1234");

-- Statement univoco che non va a buon fine a causa di BIT1234 già esistente
INSERT INTO Prodotto(nome, descrizione, codice) VALUES
("Cereali", "Cereali kellogs", "KEL111"),
("Sono molto buoni", "Biscotti", "BIT1234"),
("Marmellata ciliegia", "blablabla", "MAR999");

-- Tre diversi statement, viene inserito il primo, al secondo crash ed il terzo viene interrotto
INSERT INTO Prodotto(nome, descrizione, codice) VALUES
("Cereali", "Cereali kellogs", "KEL111");
INSERT INTO Prodotto(nome, descrizione, codice) VALUES
("Sono molto buoni", "Biscotti", "BIT1234");
INSERT INTO Prodotto(nome, descrizione, codice) VALUES
("Marmellata ciliegia", "blablabla", "MAR999");

INSERT INTO Prodotto(nome, descrizione, codice) VALUES
("Sono molto buoni", "Biscottone", "BIS777");

-- eliminazione
DELETE FROM Prodotto WHERE codice = "BIT1234";

-- modifica
UPDATE Prodotto SET 
	nome = "Nutellotto", 
    categoria = "Alimenti" 
    WHERE prodottoID = 1; 

-- QL
SELECT * FROM Prodotto;

-- Proiezione puntuale
SELECT nome, codice, descrizione, categoria FROM prodotto;

-- alias
SELECT nome AS "Nome prodotto", codice, descrizione, categoria FROM prodotto;

SELECT nome, codice, descrizione, categoria 
	FROM Prodotto 
    WHERE nome = "Cereali";

-- TUtto ciò che inizia per Bis    
SELECT * 
	FROM Prodotto
    WHERE descrizione LIKE "Bis%";
    
-- TUtto ciò che è compatibile con Biscott___
SELECT * 
	FROM Prodotto
    WHERE descrizione LIKE "Biscott___";
    
-- Tutto ciò che inizia con quasiasi cosa e finisce altrettanto che contenga bl
SELECT * 
	FROM Prodotto
	WHERE descrizione LIKE "%bl%";
    
SELECT * 
	FROM Prodotto 
    WHERE descrizione LIKE "Bis%" AND codice = "BIS777"; 
    
SELECT * 
	FROM Prodotto 
    WHERE codice = "BIS777" OR codice = "KEL111" OR nome = "Nutellotto";
    
SELECT * 
	FROM Prodotto
    WHERE codice IN ("BIS777", "KEL111");