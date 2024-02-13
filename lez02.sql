-- chiavi primarie e univoche
DROP DATABASE IF EXISTS cy_lez02_universita;
CREATE DATABASE cy_lez02_universita;
USE cy_lez02_universita;

CREATE TABLE Studente(
	nome VARCHAR(250) NOT NULL,
    cognome VARCHAR(250) NOT NULL,
    cod_fis VARCHAR(16) NOT NULL UNIQUE,
    matricola VARCHAR(10) NOT NULL PRIMARY KEY,
    telefono VARCHAR(25)
    -- PRIMARY KEY (matricola)
);