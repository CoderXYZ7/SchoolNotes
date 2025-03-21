SELECT F1.Titolo FROM Film F1
WHERE F1.Regista =
    (SELECT F2.Regista FROM Film F2 WHERE F2.Titolo = "Casablanca")
    AND F1.Titolo <> "Casablanca";


SELECT * FROM Attori WHERE Nazionalita = "Stati Uniti";

SELECT F.Titolo, F.Genere
FROM Film F, Proiezioni P
WHERE P.DataProiezione = '2004-04-18' AND F.CodFilm = P.CodFilm;



ERROR 1366 (22007): Incorrect integer value: 'Inc.' for column `Cinematografia`.`Film`.`AnnoProduzione` at row 43 -> Monster,Inc. non è valido come Titolo
ERROR 1262 (01000): Row 49 was truncated; it contained more data than there were input columns -> Shrek, I nomi dei registi sono divisi da virgola
ERROR 1262 (01000): Row 84 was truncated; it contained more data than there were input columns -> Shrek 2, I nomi dei registi sono divisi da virgola