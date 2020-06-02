/*
1)
Contare il numero di lingue in cui le release contenute nel database sono scritte (il risultato deve
contenere soltanto il numero delle lingue, rinominato “Numero_Lingue”).

Per eseguire la query è stato necessario utilizzare la tabella release con il campo language.
L'attributo language non presenta valori nulli ciò e verificabile con la query "SELECT * FROM release WHERE language = null"

*/
SELECT COUNT(*) AS Numero_Lingue FROM release GROUP BY language;

/*

2)
Select artist.name, area.name
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
			join area on artist.area = area.id

where language = (
	Select id
	from area
	where name = 'Italy')

4)
Elencare le release che nel nome hanno la parola “love”, in qualsiasi posizione (quindi anche in prima
posizione; il risultato deve contenere soltanto il nome della release).

Per eseguire la query è stato necessario utilizzare la tabella release con il campo name.
L'attributo name non presenta valori nulli

*/
SELECT name FROM release WHERE name ILIKE '%love%';

/*

5)
Select artist.name, artist_alias.name, artist_alias.type
from artist_alias full join artist on artist = artist.id
where artist.name = 'Prince';


7)
Trovare le release in cui il nome dell’artista è diverso dal nome accreditato nella release (il risultato deve
contenere il nome della release, il nome dell’artista accreditato (cioè artist_credit.name) e il nome
dell’artista (cioè artist.name))

tabelle utili: release, artist, artist_credit, artist_credit_name
*/
SELECT release.name AS release, art_crdt_name_diff.artist_crdt_name AS "Artista accreditato", art_crdt_name_diff.artist_name AS "Nome artista"
FROM release
JOIN (
	SELECT artist_credit.id AS art_crdt_id, artist.name AS artist_name, artist_credit.name AS artist_crdt_name
	FROM artist
		JOIN artist_credit_name ON artist_credit_name.artist = artist.id
		JOIN artist_credit ON artist_credit.id = artist_credit_name.artist_credit
	WHERE artist_credit.name != artist.name
) AS art_crdt_name_diff ON art_crdt_name_diff.art_crdt_id = release.artist_credit;

/*

8)
Select artist.name, count(*)n_release
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
group by artist.name
having count (release.artist_credit) < 3


10)
Elencare le lingue cui non corrisponde nessuna release (il risultato deve contenere il nome della lingua,
il numero di release in quella lingua, cioè 0, e essere ordinato per lingua) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste).

*/
SELECT num_rel.name AS lingua, num_rel.numero_release
FROM (
	SELECT language.name, count(release.language) AS numero_release
	FROM release
	RIGHT JOIN language ON release.language = language.id
	GROUP BY language.id
) AS num_rel
WHERE num_rel.numero_release = 0
ORDER BY num_rel.name;

--  10 V2
CREATE view Numero_Lingue_Per_Release AS
    SELECT language.name, count(release.language) AS numero_release
	FROM release
	RIGHT JOIN language ON release.language = language.id
	GROUP BY language.id;

SELECT name AS nome, numero_release
FROM Numero_Lingue_Per_Release
WHERE numero_release = 0
ORDER BY name;

/*
11)

a)

Select recording.length, recording.artist_credit, recording.name
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join recording on artist.id = recording.artist_credit
			
where gender = 1 and recording.length < ( select max(length)
						   from recording ) 
group by recording.length, recording.artist_credit, recording.name


b)

create TEMP view  recLength as
	select length, artist_credit, name
	from recording
	where recording.length < ( select max(length)
						   from recording ) 
group by recording.length, recording.artist_credit, recording.name

select recLength.length, recLength.artist_credit, recLength.name
from artist join recLength on artist.id = recLength.artist_credit
where gender = 1


13)
Ricavare gli artisti britannici che hanno pubblicato almeno 10 release (il risultato deve contenere il nome
dell’artista, il nome dello stato (cioè United Kingdom) e il numero di release) (scrivere due versioni della
query; almeno una delle due versioni non deve utilizzare le viste).
*/

-- Trovo tutti gli artisti Britannici
SELECT artist.name AS nome_artista, area.name AS nome_area
FROM artist
INNER JOIN area ON artist.area = area.id
WHERE area.name ilike 'united kingdom';

-- numero di release per artista
SELECT count(*) AS num_rel, artist_credit
FROM release
GROUP BY artist_credit;

-- artisti con 10 o più release prodotte
SELECT artist_credit_name.artist, num_rel_tab.num_rel
FROM artist_credit_name, (
	SELECT count(*) AS num_rel, artist_credit
	FROM release
	GROUP BY artist_credit
) AS num_rel_tab
WHERE num_rel_tab.artist_credit = artist_credit_name.artist_credit and
num_rel_tab.num_rel >= 10;

-- Query Definitiva senza viste
SELECT artist.name AS nome_artista, area.name AS nome_stato, artist_with_10_or_more_rel.num_rel AS numero_di_release
FROM artist, area, (

						SELECT artist_credit_name.artist, num_rel_tab.num_rel
							FROM artist_credit_name, (
														SELECT count(*) AS num_rel, artist_credit
														FROM release
														GROUP BY artist_credit
						) AS num_rel_tab
						WHERE num_rel_tab.artist_credit = artist_credit_name.artist_credit and
						num_rel_tab.num_rel >= 10

) AS artist_with_10_or_more_rel
WHERE artist.area = area.id and
artist.id = artist_with_10_or_more_rel.artist and
area.name ilike 'united kingdom' and
artist.id IN (

	SELECT artist_credit_name.artist
		FROM artist_credit_name, (

									SELECT count(*) AS num_rel, artist_credit
									FROM release
									GROUP BY artist_credit

		) AS num_rel_tab
	WHERE num_rel_tab.artist_credit = artist_credit_name.artist_credit and
	num_rel_tab.num_rel >= 10

);

-- Query definitiva con viste

-- la vista restituisce il numero di release prodotto da ogni artista
CREATE VIEW num_rel_per_artist AS
	SELECT artist_credit_name.artist AS artist, num_rel_tab.num_rel AS numero_di_release
	FROM artist_credit_name, (
								SELECT count(*) AS num_rel, artist_credit
								FROM release
								GROUP BY artist_credit
	) AS num_rel_tab
	WHERE artist_credit_name.artist_credit = num_rel_tab.artist_credit;

-- la vista restituisce per ogni artista lo stato di appartenenza
CREATE VIEW artist_state AS
	SELECT artist.id AS artist_id, artist.name AS artist, area.name AS nome_stato
	FROM artist
	INNER JOIN area ON artist.area = area.id;

SELECT artist_state.artist AS nome_artista, artist_state.nome_stato AS nome_stato, num_rel_per_artist.numero_di_release
FROM num_rel_per_artist, artist_state
WHERE	num_rel_per_artist.artist = artist_state.artist_id AND
		artist_state.nome_stato ILIKE 'united kingdom' AND
		num_rel_per_artist.numero_di_release >= 10;


14)

a)

Select artist.name, count(release.artist_credit) as release_number
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
			
group by artist.name
having count (release.artist_credit) > (
	select avg(count)
from (
	select count(*) as count
	from release
	where packaging = 1
	group by artist_credit
) as count)
order by release_number desc


b)

	create TEMP view  artistRelease as
Select artist.name, count(release.artist_credit) as release_number
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
			
group by artist.name


create TEMP view  avgRelease as
	select avg(count)
	from (
	select count(*) as count
	from release
	where packaging = 1
	group by artist_credit
	) as count


select name, release_number
from artistRelease
where release_number > (select * from avgRelease)
order by release_number desc
