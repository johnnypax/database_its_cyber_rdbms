DROP DATABASE IF EXISTS cy_lez12_negozio;
CREATE DATABASE cy_lez12_negozio;
USE cy_lez12_negozio;

CREATE TABLE Prodotto(
	prodottoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    descrizione TEXT,
    prezzo FLOAT CHECK (prezzo >= 0),
    scadenza DATE CHECK (scadenza BETWEEN "1990-01-01" AND "2100-01-01"), -- scadenza >= "1990-01-01" AND scadenza <= "2100-01-01"
	categoria VARCHAR(20) CHECK (categoria IN ("alimenti", "illuminazione", "mobilio"))
);

INSERT INTO Prodotto(nome, descrizione, prezzo, scadenza, categoria) VALUES
("Biscotti", "Molto buoni", 12.0, "1991-01-01", "Alimenti");

INSERT INTO Prodotto(nome, descrizione, prezzo, scadenza, categoria) VALUES
("Patatine", "Molto buone", 1.0, "1991-01-01", "Alimenti");

INSERT INTO Prodotto(nome, descrizione, prezzo, scadenza, categoria) VALUES
("Lampadina", "Luminosa", 1.0, "1991-01-01", "Illuminazione");

SELECT * FROM Prodotto;

SELECT COUNT(prodottoID) AS "Numero" FROM Prodotto WHERE categoria = "Alimenti";

SELECT AVG(prezzo) AS "Prezzo Medio" FROM Prodotto WHERE categoria = "Alimenti";