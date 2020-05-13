--  Eliminazione Utente
delete from Utente
where cf = 'XOQEGS12X37R724H';

--  Modifica Utente
update Utente
set nome = 'Jane', cognome = 'Doe', capU = 13450, indirizzoU = 'Siattle', numero_civicoU = 33, data_nascita = '1957-06-17', email = 'jane@mail.com', user_type = 1, foto_profilo = 'http://dummyimage.com/123x114.bmp/aaffvv/ffffaa', super_host = true
where cf = 'XOQEGS12X37R724H';

-- Aggiunta Utente
insert into utente (cf, nome, cognome, capu, indirizzou, numero_civicou, data_nascita, email, user_type, foto_profilo, super_host)
values ('YTJDFM99T83Y153D', 'Dominic', 'Toretto', 74523, 'GoodMorningAmerica', 777, '1973-06-02', 'dom.fast@turbo.com', 1, 'http://dummyimage.com/123x114.bmp/5la2dd/ggffff', false);

--  Eliminazione Prenotazione
delete from Prenotazione
where n_pren = 511;

-- Modifica Prenotazione
update prenotazione set data_inizio = '2018-09-29', check_in = '2018-09-29 18:40:00'
where n_pren = 82;

--  Aggiunta Recensione
insert into recensione (id_recensione, editore, data_pubblicazione, testo, tipo, struttura)
values (6, 'YTJDFM99T83Y153D', '2019-06-10', 'Ottima sistemazione', false, 1);

--  Aggiunta Risposta
insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione)
values ('LDFQIE23I47K620L', '2019-11-22 04:28:26', 'sapien ut nunc vestibulum', false, 1);

--  Modifica Struttura_storica
update Struttura_storica
set stato = 'Italy', regione = 'Lombardia', città = 'Bergamo', capS = 24129, indirizzoS = 'Piazza Lora', numero_civicoS = 56, data_vendita = '2014-04-14 00:00:00', numero_camere_da_letto = 5, limite_ingresso = '09:30:00', limite_uscita = '10:30:00'
where ID_struttura = 1;

--  Eliminazione Struttura_corrente
delete 
from struttura_corrente
where id_struttura = 5

