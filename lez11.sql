DROP DATABASE IF EXISTS lez11_museo;
CREATE DATABASE lez11_museo;
USE lez11_museo;

CREATE TABLE Museo(
	museoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    citta VARCHAR(250) NOT NULL,
    indirizzo VARCHAR(250) NOT NULL,
    direttore VARCHAR(250) NOT NULL
);

CREATE TABLE Artista(
	artistaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nominativo VARCHAR(250) NOT NULL,
    data_nas DATE NOT NULL,
    nazionalita VARCHAR(250) NOT NULL,
    data_mor DATE
);

CREATE TABLE Dipinto(
	dipintoID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(250) NOT NULL UNIQUE,
    anno_crea DATE NOT NULL,
    titolo VARCHAR(250) NOT NULL,
    tipo_pitt VARCHAR(250) NOT NULL,
    dimensione VARCHAR(250) NOT NULL,
    museoRIF INTEGER NOT NULL,
    FOREIGN KEY (museoRIF) REFERENCES Museo(museoID) ON DELETE CASCADE
);

CREATE TABLE Dipinto_Artista(
	artistaRIF INTEGER NOT NULL,
    dipintoRIF INTEGER NOT NULL,
    FOREIGN KEY (artistaRIF) REFERENCES Artista(artistaID) ON DELETE CASCADE,
    FOREIGN KEY (dipintoRIF) REFERENCES Dipinto(dipintoID) ON DELETE CASCADE,
    PRIMARY KEY(artistaRIF, dipintoRIF)
);

CREATE TABLE Scultura(
	sculturaID INTEGER PRIMARY KEY AUTO_INCREMENT,
    codice VARCHAR(250) NOT NULL UNIQUE,
    anno_crea DATE NOT NULL,
    titolo VARCHAR(250) NOT NULL,
    materiale VARCHAR(250) NOT NULL,
    peso FLOAT DEFAULT 0,
    altezza FLOAT DEFAULT 0,
    museoRIF INTEGER NOT NULL,
    FOREIGN KEY (museoRIF) REFERENCES Museo(museoID) ON DELETE CASCADE
);

CREATE TABLE Scultura_Artista(
	artistaRIF INTEGER NOT NULL,
    sculturaRIF INTEGER NOT NULL,
    FOREIGN KEY (artistaRIF) REFERENCES Artista(artistaID) ON DELETE CASCADE,
    FOREIGN KEY (sculturaRIF) REFERENCES Scultura(sculturaID) ON DELETE CASCADE,
    PRIMARY KEY(artistaRIF, sculturaRIF)
);

CREATE TABLE Personaggio(
	personaggioID INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL
);

CREATE TABLE Scultura_Personaggio(
	personaggioRIF INTEGER NOT NULL,
    sculturaRIF INTEGER NOT NULL,
    FOREIGN KEY (personaggioRIF) REFERENCES Personaggio(personaggioID) ON DELETE CASCADE,
    FOREIGN KEY (sculturaRIF) REFERENCES Scultura(sculturaID) ON DELETE CASCADE,
    PRIMARY KEY(personaggioRIF, sculturaRIF)
);

CREATE TABLE Dipinto_Personaggio(
	personaggioRIF INTEGER NOT NULL,
    dipintoRIF INTEGER NOT NULL,
    FOREIGN KEY (personaggioRIF) REFERENCES Personaggio(personaggioID) ON DELETE CASCADE,
    FOREIGN KEY (dipintoRIF) REFERENCES Dipinto(dipintoID) ON DELETE CASCADE,
    PRIMARY KEY(personaggioRIF, dipintoRIF)
);