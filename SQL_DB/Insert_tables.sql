/*        Utente            */

insert into Utente (CF, nome, cognome, capU, indirizzoU, numero_civicoU, data_nascita, email, user_type, foto_profilo, super_host) values ('XOQEGS12X37R724H', 'Anaël', 'Sanders', '54911', 'Karstens', 45, '1957-06-17', 'ssanders0@toplist.cz', 1, null, true);
insert into Utente (CF, nome, cognome, capU, indirizzoU, numero_civicoU, data_nascita, email, user_type, foto_profilo, super_host) values ('LDFQIE23I47K620L', 'Erwéi', 'Jiricka', '06185', 'Sullivan', 69, '1980-02-05', 'tjiricka1@whitehouse.gov', 1, 'http://dummyimage.com/123x114.bmp/5fa2dd/ffffff', false);
insert into Utente (CF, nome, cognome, capU, indirizzoU, numero_civicoU, data_nascita, email, user_type, foto_profilo, super_host) values ('ZZWONK86T38V499N', 'Océane', 'Drennan', '44282', 'Dwight', 12, '1957-01-07', 'kdrennan2@nyu.edu', 0, 'http://dummyimage.com/222x136.jpg/ff4444/ffffff', null);
insert into Utente (CF, nome, cognome, capU, indirizzoU, numero_civicoU, data_nascita, email, user_type, foto_profilo, super_host) values ('YTJDFJ54T83Y153D', 'Mélodie', 'Clow', '50910', 'Maywood', 44, '2012-02-27', 'nclow3@wix.com', 1, null, false);
insert into Utente (CF, nome, cognome, capU, indirizzoU, numero_civicoU, data_nascita, email, user_type, foto_profilo, super_host) values ('LBLQPH50L97V655S', 'Hélène', 'Cobelli', '04375', 'Dunning', 37, '2001-05-05', 'pcobelli4@typepad.com', 0, null, null);

/*        --    Fine Utente        --    */

/*                      inizio-Struttura_storica            */

insert into Struttura_storica (stato, regione, città, caps, indirizzos, numero_civicos, data_vendita, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Italy', 'Lombardia', 'Bergamo', '24129', 'Prairieview', '497', '2014-04-14', 7, '5:40:24', '21:23:44');
insert into Struttura_storica (stato, regione, città, caps, indirizzos, numero_civicos, data_vendita, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Italy', 'Aosta', 'Verona', '37129', 'East', '3', '2011-09-01', 7, '22:45:54', '23:55:09');
insert into Struttura_storica (stato, regione, città, caps, indirizzos, numero_civicos, data_vendita, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Italy', 'liguria', 'Ancona', '60129', 'Bunker Hill', '82', '2014-10-30', 4, '15:09:26', '23:10:40');
insert into Struttura_storica (stato, regione, città, caps, indirizzos, numero_civicos, data_vendita, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Italy', 'Puglia', 'Palermo', '90129', 'Paget', '3', '2012-08-04', 7, '14:21:41', '23:15:25');
insert into Struttura_storica (stato, regione, città, caps, indirizzos, numero_civicos, data_vendita, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Italy', 'Lazio', 'Perugia', '06124', 'Pleasure', '10921', '2016-12-14', 1, '2:25:02', '9:43:15');

/*                            fine-Struttura_storica                    */

/*         Lingua          */

insert into Lingua (nome) values ('Ndebele');
insert into Lingua (nome) values ('Guaraní');
insert into Lingua (nome) values ('Kazakh');
insert into Lingua (nome) values ('Filipino');
insert into Lingua (nome) values ('Belarusian');

/*         Lingua         */

/*        Servizio        */

insert into Servizio (nome, descrizione, icona) values ('gov', 'embrace', 'data:image/pnkSuQmCC');
insert into Servizio (nome, descrizione, icona) values ('edu', 'engineer', 'data:image5Erkgg==');
insert into Servizio (nome, descrizione, icona) values ('net', 'aggregate', 'data:image/png;basejSuQmfC');
insert into Servizio (nome, descrizione, icona) values ('org', 'proactive', 'data:image/png6f0kl');
insert into Servizio (nome, descrizione, icona) values ('info', 'morph', 'data:image/png;');

/*        Servizio        */

/*        struttura_corrente         */

insert into Struttura_corrente (stato, regione, città, CapS, indirizzoS, numero_civicoS, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Ohio', 'M', 'Dayton', '261842', 'Fordem Place', '28', '721128', '04:05', '04:05');
insert into Struttura_corrente (stato, regione, città, CapS, indirizzoS, numero_civicoS, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Texas', 'M', 'San Antonio', '940619', 'Lotheville Trail', '19', '508394', '04:05', '04:05');
insert into Struttura_corrente (stato, regione, città, CapS, indirizzoS, numero_civicoS, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Texas', 'F', 'El Paso', '339188', 'Nova Place', '4', '50270', '04:05', '04:05');
insert into Struttura_corrente (stato, regione, città, CapS, indirizzoS, numero_civicoS, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Illinois', 'F', 'Springfield', '247877', 'Kipling Avenue', '79', '54689', '04:05', '04:05');
insert into Struttura_corrente (stato, regione, città, CapS, indirizzoS, numero_civicoS, numero_camere_da_letto, limite_ingresso, limite_uscita) values ('Florida', 'M', 'Orlando', '885490', 'Michigan Lane', '1', '362357', '04:05', '04:05');

/*        fine-struttura_corrente         */

/*        CasaC         */

insert into CasaC (struttura, prezzo, disponibilita, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (1, 46.35, true, 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 3, 2, 1, 'elit');
insert into CasaC (struttura, prezzo, disponibilita, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (2, 63.0, true, 'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 1, 1, 2, 'morbi');
insert into CasaC (struttura, prezzo, disponibilita, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (3, 92.48, false, 'massa volutpat convallis morbi odio odio elementum', 1, 1, 2, 'viverra');

/*      fine-CasaC      */

/*      Foto            */

insert into Foto (url_pic, struttura) values ('http://dummyimage.com/102x201.png/dddddd/000000', 2);
insert into Foto (url_pic, struttura) values ('http://dummyimage.com/103x138.png/cc0000/ffffff', 3);
insert into Foto (url_pic, struttura) values ('http://dummyimage.com/210x164.bmp/ff4444/ffffff', 5);
insert into Foto (url_pic, struttura) values ('http://dummyimage.com/238x148.jpg/5fa2dd/ffffff', 1);
insert into Foto (url_pic, struttura) values ('http://dummyimage.com/139x154.png/dddddd/000000', 4);

/*      fine-Foto       */

/*        Parla        */

insert into Parla (Utente, lingua) values ('XOQEGS12X37R724H', 1);
insert into Parla (Utente, lingua) values ('LDFQIE23I47K620L', 2);
insert into Parla (Utente, lingua) values ('ZZWONK86T38V499N', 3);
insert into Parla (Utente, lingua) values ('YTJDFJ54T83Y153D', 4);
insert into Parla (Utente, lingua) values ('LBLQPH50L97V655S', 5);

/*        fine-Parla        */

/*        Recensione        */

insert into Recensione (editore, data_pubblicazione, testo, tipo, struttura) values ('XOQEGS12X37R724H', '10/10/2019', 'Echinacea e rad. 50', false, 1);
insert into Recensione (editore, data_pubblicazione, testo, tipo, struttura) values ('LDFQIE23I47K620L', '9/6/2019', 'CARBIDOPA AND LEVODOPA', true, 2);
insert into Recensione (editore, data_pubblicazione, testo, tipo, struttura) values ('ZZWONK86T38V499N', '2/2/2020', 'Tetracoccosporium paxianum', true, 2);
insert into Recensione (editore, data_pubblicazione, testo, tipo, struttura) values ('YTJDFJ54T83Y153D', '5/1/2019', 'CLONIDINE HYDROCHLORIDE', false, 3);
insert into Recensione (editore, data_pubblicazione, testo, tipo, struttura) values ('LBLQPH50L97V655S', '4/3/2019', 'Warfarin Sodium', true, 5);

/*        fine-Recensione        */

/*                               fornisce                             */

insert into Fornisce (struttura, servizio) values (1, 1);
insert into Fornisce (struttura, servizio) values (2, 3);
insert into Fornisce (struttura, servizio) values (2, 1);
insert into Fornisce (struttura, servizio) values (3, 3);
insert into Fornisce (struttura, servizio) values (3, 2);
insert into Fornisce (struttura, servizio) values (4, 4);
insert into Fornisce (struttura, servizio) values (4, 2);
insert into Fornisce (struttura, servizio) values (5, 1);
insert into Fornisce (struttura, servizio) values (3, 4);
insert into Fornisce (struttura, servizio) values (4, 3);
insert into Fornisce (struttura, servizio) values (5, 2);


/*                            fine-fornisce                             */

/*         fornisces            */

insert into FornisceS (struttura, servizio) values (1, 1);
insert into FornisceS (struttura, servizio) values (2, 2);
insert into FornisceS (struttura, servizio) values (3, 3);
insert into FornisceS (struttura, servizio) values (4, 4);
insert into FornisceS (struttura, servizio) values (5, 5);

/*          fine-fornisces      */


/*        ha_posseduto                */
insert into Ha_posseduto (proprietario, struttura) values ('XOQEGS12X37R724H', 5);
insert into Ha_posseduto (proprietario, struttura) values ('LDFQIE23I47K620L', 4);
insert into Ha_posseduto (proprietario, struttura) values ('YTJDFJ54T83Y153D', 2);
insert into Ha_posseduto (proprietario, struttura) values ('YTJDFJ54T83Y153D', 3);
insert into Ha_posseduto (proprietario, struttura) values ('LDFQIE23I47K620L', 3);

/*        fine-ha_posseduto             */

/*        Prenotazione        */

insert into Prenotazione (n_pren, struttura, cliente, data_inizio, data_fine, check_in, check_out) values (82, 2, 'LBLQPH50L97V655S', '2018-08-29', '2018-10-02', '2018-08-29 18:40:40', '2018-10-01 08:02:17');
insert into Prenotazione (n_pren, struttura, cliente, data_inizio, data_fine, check_in, check_out) values (95, 3, 'LBLQPH50L97V655S', '2018-12-26', '2019-02-01', '2018-12-26 18:53:13', '2019-02-01 17:06:36');
insert into Prenotazione (n_pren, struttura, cliente, data_inizio, data_fine, check_in, check_out) values (14, 4, 'LBLQPH50L97V655S', '2018-11-10', '2018-12-12', '2018-11-10 07:44:19', '2018-12-10 04:39:20');
insert into Prenotazione (n_pren, struttura, cliente, data_inizio, data_fine, check_in, check_out) values (51, 4, 'ZZWONK86T38V499N', '2018-09-03', '2018-10-13', '2018-09-04 14:18:26', '2018-10-13 20:46:07');
insert into Prenotazione (n_pren, struttura, cliente, data_inizio, data_fine, check_in, check_out) values (29, 4, 'ZZWONK86T38V499N', '2018-08-08', '2018-11-14', '2018-08-08 21:24:47', '2018-11-13 16:09:26');

/*        fine-Prenotazione        */

/*        Pagamento            */

insert into Pagamento (prenotazione, utente, card_type, data_pagamento, ammontare, valuta) values (82, 'LBLQPH50L97V655S', 'jcb', '2018-05-28 14:22:57', 112.05, 'Euro');
insert into Pagamento (prenotazione, utente, card_type, data_pagamento, ammontare, valuta) values (95, 'LBLQPH50L97V655S', 'mastercard', '2018-12-11 21:06:07', 193.0, 'Euro');
insert into Pagamento (prenotazione, utente, card_type, data_pagamento, ammontare, valuta) values (14, 'LBLQPH50L97V655S', 'visa', '2018-05-20 18:22:22', 86.94, 'Yuan');
insert into Pagamento (prenotazione, utente, card_type, data_pagamento, ammontare, valuta) values (51, 'ZZWONK86T38V499N', 'jcb', '2018-04-02 23:50:08', 193.16, 'Yuan');
insert into Pagamento (prenotazione, utente, card_type, data_pagamento, ammontare, valuta) values (29, 'ZZWONK86T38V499N', 'visa', '2018-09-28 20:29:42', 160.84, 'Peso');

/*        fine-Pagamento        */

/*        CasaS        */

insert into CasaS (struttura, data_fine, prezzo, disponibilità, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (3, '5-4-2990', '6', 'true', '08-856-9703', '44', '66', '49', '73-262-9519');
insert into CasaS (struttura, data_fine, prezzo, disponibilità, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (4, '5-4-5898', '18', 'true', '62-973-6410', '93', '62', '67', '01-641-4799');
insert into CasaS (struttura, data_fine, prezzo, disponibilità, descrizione, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (5, '9-10-2532', '4', 'true', '53-256-2567', '33', '93', '27', '78-078-7156');

/*        CasaS        */

/*            stanzaS            */

insert into StanzaS (appartamS, n_stanza, prezzo, disponibilitaSt, descrizioneSt, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (2, 1, 47.7, true, 'velit vivamus vel nulla eget eros elementum', 3.4, 2.6, 1.14, 'nulla');
insert into StanzaS (appartamS, n_stanza, prezzo, disponibilitaSt, descrizioneSt, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (2, 2, 12.13, false, 'curae mauris viverra diam vitae quam', 1.85, 2.44, 1.06, 'non');
insert into StanzaS (appartamS, n_stanza, prezzo, disponibilitaSt, descrizioneSt, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (1, 1, 20.32, false, 'blandit', 4.83, 1.56, 1.17, 'dolor');
insert into StanzaS (appartamS, n_stanza, prezzo, disponibilitaSt, descrizioneSt, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (1, 2, 44.15, false, 'bibendum morbi non quam nec dui', 3.45, 1.46, 0.01, 'accumsan');
insert into StanzaS (appartamS, n_stanza, prezzo, disponibilitaSt, descrizioneSt, numero_posti_letto, numero_letti, numero_bagni, tipo_letto) values (1, 3, 11.25, true, 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 3.41, 2.65, 1.56, 'lorem');

/*            fine-stanzaS                */

/*                                possiede                           */

insert into Possiede (proprietario, struttura) values ('LDFQIE23I47K620L', 1);
insert into Possiede (proprietario, struttura) values ('YTJDFJ54T83Y153D', 2);
insert into Possiede (proprietario, struttura) values ('YTJDFJ54T83Y153D', 3);
insert into Possiede (proprietario, struttura) values ('LDFQIE23I47K620L', 4);
insert into Possiede (proprietario, struttura) values ('XOQEGS12X37R724H', 5);


/*                                possiede                           */

/*            Risposte            */

insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione) values ('LDFQIE23I47K620L', '2019-11-22 04:28:26', 'sapien ut nunc vestibulum', false, 1);
insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione) values ('YTJDFJ54T83Y153D', '2020-01-01 15:39:17', 'est quam pharetra magna ac consequat', true, 2);
insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione) values ('YTJDFJ54T83Y153D', '2020-02-24 19:56:17', 'eget eros elementum pellentesque quisque', false, 3);
insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione) values ('YTJDFJ54T83Y153D', '2019-06-08 15:17:29', 'tortor quis turpis sed ante vivamus tortor', true, 4);
insert into Risposte (editore, data_pubblicazione, testo, tipo_risposta, recensione) values ('XOQEGS12X37R724H', '2019-03-27 03:29:26', 'lobortis sapien sapien non', true, 5);

/*            fine-Risposte            */