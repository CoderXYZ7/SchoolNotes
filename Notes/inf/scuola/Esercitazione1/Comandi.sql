/* COMPITO IN CLASSE DI LABORATORIO DI INFORMATICA SU MySQL DDL e DML */

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 1 ----------*/

CREATE DATABASE Universita;
USE Universita;

CREATE TABLE Dipartimenti(
    CodDipartimento INT PRIMARY KEY, 
    Nome VARCHAR(255), 
    Indirizzo VARCHAR(255)
);

CREATE TABLE Studenti(
    Matricola INT PRIMARY KEY, 
    Cognome VARCHAR(255), 
    Nome VARCHAR(255), 
    Indirizzo VARCHAR(255), 
    Telefono VARCHAR(255), 
    CodDipartimento INT, 
    FOREIGN KEY (CodDipartimento) REFERENCES Dipartimenti(CodDipartimento)
);

CREATE TABLE Corsi(
    CodCorso INT PRIMARY KEY, 
    Nome VARCHAR(255), 
    Crediti INT, 
    CodDipartimento INT, 
    FOREIGN KEY (CodDipartimento) REFERENCES Dipartimenti(CodDipartimento)
);

CREATE TABLE Esami(
    Matricola INT, 
    CodCorso INT, 
    Data DATE, 
    Voto INT, 
    PRIMARY KEY (Matricola, CodCorso, Data), 
    FOREIGN KEY (Matricola) REFERENCES Studenti(Matricola), 
    FOREIGN KEY (CodCorso) REFERENCES Corsi(CodCorso));

/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 2 ----------*/

INSERT INTO Dipartimenti (CodDipartimento, Nome, Indirizzo) VALUES 
(1, 'Informatica', 'Via Pinco Pallo, 5'),
(2, 'Telecomunicazioni', 'Viale Europa Unita, 10');


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 3 ----------*/


LOAD DATA LOCAL INFILE '/home/user1/Dev/DB/Universita/exampleStudents.csv'
INTO TABLE Studenti 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/user1/Dev/DB/Universita/exampleCourses.csv'
INTO TABLE Corsi 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 4 ----------*/

INSERT INTO Esami (Matricola, CodCorso, Data, Voto) VALUES 
    ((SELECT Matricola FROM Studenti WHERE Nome = 'Rinaldi'), 
     (SELECT CodCorso FROM Corsi WHERE Nome = 'Intelligenza Artificiale'), 
     CURDATE(), 29);



/* -------------------------------------------------------------------
---------- SCRIVERE QUI SOTTO I COMANDI PER L'ESERCIZIO 5 ----------*/


UPDATE Dipartimenti SET Nome = 'Telematica' WHERE CodDipartimento = 1;
DELETE FROM Dipartimenti WHERE CodDipartimento = 2;


/* -------------------------------------------------------------------
---------------- FINE DELLO SVOLGIMENTO DEL COMPITO ----------------*/