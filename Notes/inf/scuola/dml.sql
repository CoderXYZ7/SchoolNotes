

SELECT * FROM studente;
SELECT * FROM materia;
SELECT * FROM voto;

INSERT INTO studente(Cognome,Nome,DataNascita) VALUES('Rossi','Mario','2000-01-01');
INSERT INTO materia(Nome) VALUES('Matematica');
INSERT INTO voto(Matricola,CodM,DataVoto,Voto) VALUES(1,1,'2022-01-01',10);

INSERT INTO studente(Cognome,Nome,DataNascita) VALUES('Bianchi','Giuseppe','2000-01-02'),('Verdi','Luigi','2000-01-03');

LOAD DATA LOCAL INFILE '/home/user1/Dev/DB/scuola/exampleStudents.csv'
INTO TABLE studente 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

UPDATE studente SET DataNascita = '2002-01-01' WHERE Matricola = 1;

UPDATE studente SET DataNascita = '1999-12-01' WHERE Matricola >= 99;

UPDATE studente SET DataNascita = '2001-09-01' WHERE Nome LIKE 'c%';

UPDATE studente SET DataNascita = '0033-09-01' WHERE Nome LIKE '%a' AND Matricola < 100;

DELETE FROM studente WHERE Matricola = 1;

INSERT INTO materia(Nome) VALUES('Italiano');