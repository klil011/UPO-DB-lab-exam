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
Elencare gli artisti che hanno cantato canzoni in italiano (il risultato deve contenere il nome dell’artista
e il nome della lingua).

Per eseguire la query è stato necessario utilizzare la tabella artist e release.
La tabella artist è servita per poter elencare il nome dell'artista.
La tabella release è servita per poter identificare la lingua della canzone associata all'artista.
L'attributo name della tabella artist non presenta valori nulli
L'attributo name della tabella area non presenta valori nulli

*/

Select artist.name, language.name
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
			join language on language.id = release.language

where language.name = 'Italy'

/*
3)
Elencare le release di cui non si conosce la lingua (il risultato deve contenere soltanto il nome della
release).
*/
select name from release where language is null;

/*
4)
Elencare le release che nel nome hanno la parola “love”, in qualsiasi posizione (quindi anche in prima
posizione; il risultato deve contenere soltanto il nome della release).

Per eseguire la query è stato necessario utilizzare la tabella release con il campo name.
L'attributo name non presenta valori nulli

*/
SELECT name FROM release WHERE name ILIKE '%love%';

/*
5)
Elencare tutti gli pseudonimi di Prince con il loro tipo, se disponibile (il risultato deve contenere lo
pseudonimo dell'artista, il nome dell’artista (cioè Prince) e il tipo di pseudonimo (se disponibile)).

Per eseguire la query è stato necessario utilizzare la tabella artist con il campo name e la tabella artist_alias
con il campo name e type.
L'attributo name della tabella artist non presenta valori nulli
L'attributo name della tabella artist_alias non presenta valori nulli
L'attributo type della tabella artist_alias non presenta valori nulli


*/
Select artist.name, artist_alias.name, artist_alias.type
from artist_alias join artist on artist = artist.id
where artist.name = 'Prince';

/*
6)
Elencare le release di gruppi inglesi ancora in attività (il risultato deve contenere il nome del gruppo e il
nome della release e essere ordinato per nome del gruppo e nome della release)
*/
create view A as 
select artist.name, artist_credit.id
from artist
inner join artist_credit on artist_credit.name = artist.name
where artist.ended = false;

select A.name art_name, release.name rel_name
from A
inner join release on A.id = release.artist_credit
order by art_name, rel_name;

/*
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
Trovare gli artisti con meno di tre release (il risultato deve contenere il nome dell’artista ed il numero di
release).

Per eseguire la query è stato necessario utilizzare la tabella artist con il campo name, la tabella artist_credit e release.

*/
Select artist.name, count(*)n_release
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
group by artist.name
having count (release.artist_credit) < 3

/*
9)
Trovare la registrazione più lunga di un’artista donna (il risultato deve contenere il nome della
registrazione, la sua durata in minuti e il nome dell’artista; tenere conto che le durate sono memorizzate
in millesimi di secondo) (scrivere due versioni della query con e senza operatore aggregato MAX).
*/
/*CON AGGREGATORE MAX*/

/*Trovo tutte le artiste donne*/
create view ART_FEM as
select artist.id, artist.name
from artist
where gender = (select id from gender where name = 'Female');

/*tutti gli artisti con relativo nome del recording*/
create view ALL_ART_REC as
select recording.name as name_rec, artist.name name_art, recording.length
from recording
inner join artist on recording.artist_credit = artist.id;

/*nome artista donna con relativo nome recording e lunghezza*/
create view ALL_ART_FEM_REC as
select name_art, ALL_ART_REC.name_rec, ALL_ART_REC.length
from ALL_ART_REC
inner join ART_FEM on name_art = ART_FEM.name;

create view FEM_REC_MAX as
select max(length) l_max
from ALL_ART_FEM_REC;

select ALL_ART_FEM_REC.name_art, ALL_ART_FEM_REC.name_rec, ALL_ART_FEM_REC.length
from ALL_ART_FEM_REC, FEM_REC_MAX
where FEM_REC_MAX.l_max = ALL_ART_FEM_REC.length;

/*SENZA AGGREGATORE MAX*/

/*Trovo tutte le artiste donne*/
create view ART_FEM as
select artist.id, artist.name
from artist
where gender = (select id from gender where name = 'Female');

/*tutti gli artisti con relativo nome del recording*/
create view ALL_ART_REC as
select recording.name as name_rec, artist.name name_art, recording.length
from recording
inner join artist on recording.artist_credit = artist.id;

/*nome artista donna con relativo nome recording e lunghezza*/
create view ALL_ART_FEM_REC as
select name_art, ALL_ART_REC.name_rec, ALL_ART_REC.length
from ALL_ART_REC
inner join ART_FEM on name_art = ART_FEM.name
where ALL_ART_REC.length is not null
ORDER BY ALL_ART_REC.length DESC;

select *
from ALL_ART_FEM_REC
limit 1;
/*
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
Ricavare la seconda registrazione per lunghezza di un artista uomo (il risultato deve comprendere l'artista
accreditato, il nome della registrazione e la sua lunghezza) (scrivere due versioni della query; almeno
una delle due versioni non deve utilizzare le viste).
*/
--a)

Select recording.length, recording.artist_credit, recording.name
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join recording on artist.id = recording.artist_credit
			join gender on gender.id = artist.gender
			
where gender.name = 'Male' and recording.length < ( select max(length)
						   from recording ) 
group by recording.length, recording.artist_credit, recording.name


--b)

create TEMP view  recLength as
	select length, artist_credit, name
	from recording
	where recording.length < ( select max(length)
						   from recording ) 
group by recording.length, recording.artist_credit, recording.name

select recLength.length, recLength.artist_credit, recLength.name
from artist join recLength on artist.id = recLength.artist_credit
	    join gender on gender.id = artist.gender
where gender.name = 'Male'

/*
12)
Per ogni stato esistente riportare la lunghezza totale delle registrazioni di artisti di quello stato (il risultato
deve comprendere il nome dello stato e la lunghezza totale in minuti delle registrazioni (0 se lo stato non
ha registrazioni) (scrivere due versioni della query; almeno una delle due versioni non deve utilizzare le
viste).
*/

--query senza vista
select tot_rec_length, area.name
from
(
	select sum(rec_length) as tot_rec_length, area
	from
	(
		select sum(COALESCE(recording.length, 0)) as rec_length, artist.area as area
		from artist
		join artist_credit_name on artist.id = artist_credit_name.artist
		join artist_credit on artist_credit.id = artist_credit_name.artist_credit
		right join recording on recording.artist_credit = artist_credit.id
		group by artist.area
	) as tot_area_rec
	group by tot_area_rec.area
) as tot_rec_for_area
join area on area.id = tot_rec_for_area.area

--query con vista
CREATE TEMP VIEW rec_length_per_area AS
select sum(COALESCE(recording.length, 0)) as rec_length, artist.area as area
from artist
join artist_credit_name on artist.id = artist_credit_name.artist
join artist_credit on artist_credit.id = artist_credit_name.artist_credit
right join recording on recording.artist_credit = artist_credit.id
group by artist.area;

select tot_rec_length, area.name
from
(
	select sum(rec_length) as tot_rec_length, area
	from rec_length_per_area
	group by rec_length_per_area.area
) as tot_rec_for_area
join area on area.id = tot_rec_for_area.area;


/*
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

/*
14)
*/

--a)

Select artist.name, count(release.artist_credit) as release_number
from artist join artist_credit_name on artist.id = artist_credit_name.artist 
			join artist_credit on artist.id = artist_credit.id
			join release on artist.id = release.artist_credit
			
group by artist.name
having count (release.artist_credit) > (
	select avg(count)
from (
	select count(*) as count
	from release join medium on release.id = medium.release
				 join medium_format on medium_format.id = medium.format 
	where medium_format.name = 'CD'
	group by artist_credit
) as count)
order by release_number desc


--b)

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
	from release join medium on release.id = medium.release
				 join medium_format on medium_format.id = medium.format
	where medium_format.name = 'CD'
	group by artist_credit
	) as count


select name, release_number
from artistRelease
where release_number > (select * from avgRelease)
order by release_number desc

/*
15)
Ricavare il primo artista morto dopo Louis Armstrong (il risultato deve contenere il nome dell’artista, la
sua data di nascita e la sua data di morte) (scrivere due versioni della query; almeno una delle due versioni
non deve utilizzare le viste).
*/
/*CON VISTA*/

create view art_ord_end as
select name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day
from artist
order by end_date_year, end_date_month, end_date_day;

select name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day
from art_ord_end
where end_date_year >= 1971 and end_date_month >= 7 and end_date_day > 6
limit 1;

/*SENZA VISTA*/

select name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day
from (select name, begin_date_year, begin_date_month, begin_date_day, end_date_year, end_date_month, end_date_day
from artist
order by end_date_year, end_date_month, end_date_day) as foo
where end_date_year >= 1971 and end_date_month >= 7 and end_date_day > 6
limit 1;

/*
17)
Trovare il nome e la lunghezza della traccia più lunga appartenente a una release rilasciata in almeno due
paesi (il risultato deve contenere il nome della traccia e la sua lunghezza in secondi) (scrivere due versioni
della query).
*/

--trovo tutte le release rilasciate in almeno due paesi
select release
from (
select count(release_country.country) as country, release_country.release
from release_country
group by release_country.release) as rel_country_count
where country >= 2;

--per tutti medium trovo la lunghezza massima della traccia
select max(length) as max_length, medium, name
from track
group by medium;

--per ogni medium appartenente ad una release rilasciata in più di due paesi trovo la lungh massima della traccia più lunga
select track_max_length.medium, max_length
from(
	select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
	from track
	group by medium
) as track_max_length, medium
where track_max_length.medium = medium.id and
medium.release in (
	select release--trovo tutte le release rilasciate in almeno due paesi
	from (
	select count(release_country.country) as country, release_country.release
	from release_country
	group by release_country.release) as rel_country_count
	where country >= 2
)

--per ogni medium trovo la traccia di lungh max e restituisco la lunghezza e il nome
select track.name, track.length
from track,
(
	select track_max_length.medium, max_length--per ogni medium trovo la lungh massima della traccia più lunga
	from(
		select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
		from track
		group by medium
	) as track_max_length, medium
	where track_max_length.medium = medium.id and
	medium.release in (
		select release--trovo tutte le release rilasciate in almeno due paesi
		from (
		select count(release_country.country) as country, release_country.release
		from release_country
		group by release_country.release) as rel_country_count
		where country >= 2
	)
) as tracks_max_length
where tracks_max_length.medium = track.medium and
tracks_max_length.max_length = track.length

--trovo la lunghezza della traccia di lunghezza massima appartenente ad una release presente in più di due paesi
select max(length)
from
(
	select track.name, track.length, track.id
	from track,
	(
		select track_max_length.medium, max_length--per ogni medium trovo la lungh massima della traccia più lunga che faccia parte di una rel rilasciata in almeno 2 paesi
		from(
			select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
			from track
			group by medium
		) as track_max_length, medium
		where track_max_length.medium = medium.id and
		medium.release in (
			select release--trovo tutte le release rilasciate in almeno due paesi
			from (
			select count(release_country.country) as country, release_country.release
			from release_country
			group by release_country.release) as rel_country_count
			where country >= 2
		)
	) as tracks_max_length
	where tracks_max_length.medium = track.medium and
	tracks_max_length.max_length = track.length
) as tracks_name_length

--query definitiva
select tracks_max_length.name, tracks_max_length.length/1000 as length
from
(
	select max(length) as max_length
	from
	(
		select track.name, track.length, track.id
		from track,
		(
			select track_max_length.medium, max_length--per ogni medium trovo la lungh massima della traccia più lunga che faccia parte di una rel rilasciata in almeno 2 paesi
			from(
				select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
				from track
				group by medium
			) as track_max_length, medium
			where track_max_length.medium = medium.id and
			medium.release in (
				select release--trovo tutte le release rilasciate in almeno due paesi
				from (
				select count(release_country.country) as country, release_country.release
				from release_country
				group by release_country.release) as rel_country_count
				where country >= 2
			)
		) as tracks_max_length
		where tracks_max_length.medium = track.medium and
		tracks_max_length.max_length = track.length
	) as tracks_name_length
) as track_max_length,
(
	select track.name, track.length, track.id
		from track,
		(
			select track_max_length.medium, max_length--per ogni medium trovo la lungh massima della traccia più lunga che faccia parte di una rel rilasciata in almeno 2 paesi
			from(
				select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
				from track
				group by medium
			) as track_max_length, medium
			where track_max_length.medium = medium.id and
			medium.release in (
				select release--trovo tutte le release rilasciate in almeno due paesi
				from (
				select count(release_country.country) as country, release_country.release
				from release_country
				group by release_country.release) as rel_country_count
				where country >= 2
			)
		) as tracks_max_length
		where tracks_max_length.medium = track.medium and
		tracks_max_length.max_length = track.length
) as tracks_max_length
where tracks_max_length.length = track_max_length.max_length;

--query definitiva con viste

--trovo tutte le release rilasciate in almeno due paesi
CREATE TEMP VIEW rel_more_two_country AS
select release
from (
select count(release_country.country) as country, release_country.release as release
from release_country
group by release_country.release) as rel_country_count
where country >= 2;

--per ogni medium trovo la traccia di lungh max e restituisco la lunghezza e il nome
CREATE TEMP VIEW tracks_max_length_per_medium AS
select track.name, track.length
from track,
(
	select track_max_length.medium, max_length--per ogni medium trovo la lungh massima della traccia più lunga
	from(
		select max(length) as max_length, medium--per ogni release trovo la lunghezza massima della traccia
		from track
		group by medium
	) as track_max_length, medium
	where track_max_length.medium = medium.id and
	medium.release in (select * from rel_more_two_country)
) as tracks_max_length
where tracks_max_length.medium = track.medium and
tracks_max_length.max_length = track.length;

--query

select tracks_max_length.name, tracks_max_length.length/1000 as length
from
(
	select max(length) as max_length
	from tracks_max_length_per_medium as tracks_name_length
) as track_max_length, tracks_max_length_per_medium as tracks_max_length
where tracks_max_length.length = track_max_length.max_length;