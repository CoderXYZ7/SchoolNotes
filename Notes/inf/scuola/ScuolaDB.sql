CREATE TABLE studente(
    Matricola INT NOT NULL AUTO_INCREMENT,
    Cognome VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    DataNascita DATE NOT NULL,
    PRIMARY KEY(Matricola)
);

CREATE TABLE materia(
    CodM INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(CodM)
);

CREATE TABLE voto(
    Matricola INT NOT NULL,
    CodM INT NOT NULL,
    DataVoto DATE NOT NULL,
    Voto INT NOT NULL,
    Descrizione TEXT,
    PRIMARY KEY(Matricola,CodM,DataVoto),
    FOREIGN KEY(Matricola) REFERENCES studente(Matricola),
    FOREIGN KEY(CodM) REFERENCES materia(CodM)
);


