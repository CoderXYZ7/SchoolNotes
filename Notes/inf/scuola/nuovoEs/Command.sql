/* COMPITO IN CLASSE DI LABORATORIO DI INFORMATICA SU MySQL DDL e DML */

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 1 ----------*/
DROP DATABASE IF EXISTS Cinematografia;
CREATE DATABASE Cinematografia;
USE Cinematografia;

CREATE TABLE Attori(
CodAttore INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(50) NOT NULL,
AnnoNascita INT NOT NULL,
Nazionalita VARCHAR(50) NOT NULL,
PRIMARY KEY (CodAttore));

CREATE TABLE Film(
CodFilm INT NOT NULL AUTO_INCREMENT,
Titolo VARCHAR(100) NOT NULL,
AnnoProduzione INT NOT NULL,
Nazionalita VARCHAR(50) NOT NULL,
Regista VARCHAR(50) NOT NULL,
Genere VARCHAR(50) NOT NULL,
PRIMARY KEY(CodFilm));

CREATE TABLE Recita(
CodRecita INT NOT NULL AUTO_INCREMENT,
CodAttore INT NULL,
CodFilm INT NULL,
PRIMARY KEY(CodRecita),
FOREIGN KEY(CodAttore) REFERENCES Attori(CodAttore) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm) ON DELETE SET NULL ON UPDATE CASCADE);
/* IPOTESI AGGIUNTIVA: il modello proposto  è contraddittorio in quanto il modello logico
richiesto prevede che la coppia CodAttore,CodFilm sia chiave primaria... e questa non può essere
complessivamente NULL. Pertanto, per rispettare le politiche di gestione dell'integrità referenziale
devo surrogare la chiave primaria a un nuovo campo apposito. */

CREATE TABLE Sale(
CodSala INT NOT NULL AUTO_INCREMENT,
Posti INT NOT NULL,
Nome VARCHAR(100) NOT NULL,
Citta VARCHAR(50) NOT NULL,
PRIMARY KEY(CodSala));

CREATE TABLE Proiezioni(
CodProiezione INT NOT NULL AUTO_INCREMENT,
CodFilm INT NULL,
CodSala INT NULL,
Incasso INT NOT NULL,
DataProiezione DATE NOT NULL,
PRIMARY KEY(CodProiezione),
FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY(CodSala) REFERENCES Sale(CodSala) ON DELETE SET NULL ON UPDATE CASCADE);

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 2 ----------*/

LOAD DATA
INFILE '/var/lib/mysql-files/DatiCSV/Attori.csv'
INTO TABLE Attori
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '/var/lib/mysql-files/DatiCSV/Film.csv'
INTO TABLE Film
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/* Questo è da modificare perché ora la tabella Recita ha un altro schema! */
LOAD DATA
INFILE '/var/lib/mysql-files/DatiCSV/Recita.csv'
INTO TABLE Recita
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(CodAttore,CodFilm);

LOAD DATA
INFILE '/var/lib/mysql-files/DatiCSV/Sale.csv'
INTO TABLE Sale
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '/var/lib/mysql-files/DatiCSV/Proiezioni.csv'
INTO TABLE Proiezioni
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 3 ----------*/

INSERT INTO Proiezioni(CodFilm,CodSala,Incasso,DataProiezione)
VALUES(36,30,2000,'2025-01-15');


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 4 ----------*/

DELETE FROM Sale
WHERE Citta IN ('Arezzo', 'Milano');


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 5 ----------*/

INSERT INTO Sale(Posti, Nome, Citta)
VALUES (0, 'Sala eliminata', 'Inesistente');

UPDATE Proiezioni SET CodSala = 101
WHERE CodSala IS NULL;


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 6 ----------*/

/* Il nome del vincolo recita_ibfk_1 l'ho recuperato con SHOW CREATE TABLE Recita; */
ALTER TABLE Recita
DROP CONSTRAINT recita_ibfk_1;

ALTER TABLE Recita
ADD FOREIGN KEY(CodFilm) REFERENCES Film(CodFilm) ON DELETE CASCADE ON UPDATE CASCADE;


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 7 ----------*/

DELETE FROM Attori
WHERE Nome LIKE 'Tom%' AND AnnoNascita > 1960;


/* -------------------------------------------------------------------
---------------- FINE DELLO SVOLGIMENTO DEL COMPITO ----------------*/