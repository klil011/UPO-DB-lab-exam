/*
1)
Contare il numero di lingue in cui le release contenute nel database sono scritte (il risultato deve
contenere soltanto il numero delle lingue, rinominato “Numero_Lingue”).

Per eseguire la query è stato necessario utilizzare la tabella release con il campo language.
L'attributo language non presenta valori nulli ciò e verificabile con la query "select * from release where language = null"

*/
SELECT COUNT(*) as Numero_Righe FROM release GROUP BY language;

/*
4)
Elencare le release che nel nome hanno la parola “love”, in qualsiasi posizione (quindi anche in prima
posizione; il risultato deve contenere soltanto il nome della release).

Per eseguire la query è stato necessario utilizzare la tabella release con il campo name.
L'attributo name non presenta valori nulli

*/
SELECT name FROM release WHERE name LIKE '%love%';

/*
7)
Trovare le release in cui il nome dell’artista è diverso dal nome accreditato nella release (il risultato deve
contenere il nome della release, il nome dell’artista accreditato (cioè artist_credit.name) e il nome
dell’artista (cioè artist.name))

*/


/*
10)
Elencare le lingue cui non corrisponde nessuna release (il risultato deve contenere il nome della lingua,
il numero di release in quella lingua, cioè 0, e essere ordinato per lingua) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste).

*/


/*
13)
Ricavare gli artisti britannici che hanno pubblicato almeno 10 release (il risultato deve contenere il nome
dell’artista, il nome dello stato (cioè United Kingdom) e il numero di release) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste).
*/