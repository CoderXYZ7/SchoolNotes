/* COMPITO IN CLASSE DI LABORATORIO DI INFORMATICA SU MySQL DDL e DML */

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 1 ----------*/

-- Creazione del database Cinematografia
CREATE DATABASE IF NOT EXISTS Cinematografia;
USE Cinematografia;

-- Creazione della tabella ATTORI
CREATE TABLE ATTORI (
    CodAttore INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    AnnoNascita INT,
    Nazionalita VARCHAR(50)
);

-- Creazione della tabella FILM
CREATE TABLE FILM (
    CodFilm INT PRIMARY KEY,
    Titolo VARCHAR(100) NOT NULL,
    AnnoProduzione INT,
    Nazionalita VARCHAR(50),
    Regista VARCHAR(100),
    Genere VARCHAR(50)
);

-- Creazione della tabella SALE
CREATE TABLE SALE (
    CodSala INT PRIMARY KEY,
    Posti INT,
    Nome VARCHAR(100) NOT NULL,
    Citta VARCHAR(50)
);

-- Creazione della tabella RECITA con vincoli di integrità referenziale
CREATE TABLE RECITA (
    CodAttore INT,
    CodFilm INT,
    PRIMARY KEY (CodAttore, CodFilm),
    FOREIGN KEY (CodAttore) REFERENCES ATTORI(CodAttore)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (CodFilm) REFERENCES FILM(CodFilm)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Creazione della tabella PROIEZIONI con vincoli di integrità referenziale
CREATE TABLE PROIEZIONI (
    CodProiezione INT PRIMARY KEY,
    CodFilm INT,
    CodSala INT,
    Incasso DECIMAL(10,2),
    DataProiezione DATE,
    FOREIGN KEY (CodFilm) REFERENCES FILM(CodFilm)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (CodSala) REFERENCES SALE(CodSala)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 2 ----------*/

-- Importazione dati nella tabella ATTORI
LOAD DATA INFILE 'ATTORI.csv'
INTO TABLE ATTORI
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Importazione dati nella tabella FILM
LOAD DATA INFILE 'FILM.csv'
INTO TABLE FILM
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Importazione dati nella tabella SALE
LOAD DATA INFILE 'SALE.csv'
INTO TABLE SALE
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Importazione dati nella tabella RECITA
LOAD DATA INFILE 'RECITA.csv'
INTO TABLE RECITA
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Importazione dati nella tabella PROIEZIONI
LOAD DATA INFILE 'PROIEZIONI.csv'
INTO TABLE PROIEZIONI
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 3 ----------*/

-- Inserimento di una nuova proiezione per il film "Cast away" al "Capitolium Cinema" di Rimini
INSERT INTO PROIEZIONI (CodProiezione, CodFilm, CodSala, Incasso, DataProiezione)
SELECT 
    (SELECT MAX(CodProiezione) FROM PROIEZIONI) + 1,
    (SELECT CodFilm FROM FILM WHERE Titolo = 'Cast away'),
    (SELECT CodSala FROM SALE WHERE Nome = 'Capitolium Cinema' AND Citta = 'Rimini'),
    5000.00,
    '2025-01-15';

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 4 ----------*/

-- Eliminazione di tutte le sale delle città di Arezzo e Milano
DELETE FROM SALE
WHERE Citta IN ('Arezzo', 'Milano');

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 5 ----------*/

-- Creazione di una sala fittizia
INSERT INTO SALE (CodSala, Posti, Nome, Citta)
VALUES ((SELECT MAX(CodSala) FROM SALE) + 1, 0, 'Sala eliminata', 'Inesistente');

-- Associazione delle proiezioni delle città eliminate alla sala fittizia
UPDATE PROIEZIONI
SET CodSala = (SELECT CodSala FROM SALE WHERE Nome = 'Sala eliminata')
WHERE CodSala IS NULL;

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 6 ----------*/

-- Modifica del vincolo di integrità referenziale per la tabella RECITA
ALTER TABLE RECITA
DROP FOREIGN KEY recita_ibfk_1;

ALTER TABLE RECITA
ADD CONSTRAINT recita_ibfk_1
FOREIGN KEY (CodAttore) REFERENCES ATTORI(CodAttore)
ON UPDATE CASCADE
ON DELETE CASCADE;

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 7 ----------*/

-- Eliminazione degli attori il cui nome inizia con "Tom" nati dopo il 1960
DELETE FROM ATTORI
WHERE Nome LIKE 'Tom%' AND AnnoNascita > 1960;

/* -------------------------------------------------------------------
---------------- FINE DELLO SVOLGIMENTO DEL COMPITO ----------------*/