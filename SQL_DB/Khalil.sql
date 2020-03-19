SQL - KHALIL MOUNIR
	
create table Struttura_corrente (
	ID_struttura serial not null,
	stato varchar(20) not null, 
	regione varchar(20) not null, 
	città varchar(20) not null, 
	CapS integer not null, 
	indirizzoS varchar(20) not null, 
	numero_civicoS smallint not null, 
	numero_camere_da_letto integer check(numero_camere_da_letto > 0), 
	limite_ingresso timestamp, 
	limite_uscita timestamp
);

create Risposte (
	ID_risposta serial not null,
	editore varchar(20),
	data_pubblicazione timestamp not null,
	testo varchar(500) not null,
	tipo_risposta boolean not null,
	recensione integer not null,
	constraint Risposte_PK primary key(ID_risposta),
	constraint Recensione_FK_Risposte foreign key(recensione) references Recensione(ID_recensione),
	constraint Utente_FK_Risposte foreign key(editore) references Utente(CF) on delete set null
	);


create Prenotazione(
	n_pren serial not null, 
	struttura integer, 
	cliente varchar(16), 
	data_inizio data not null, 
	data_fine data not null, 
	check_in timestamp not null, 
	check_out timestamp not null,
	constraint Prenotazione_PK primary key(n_pren),
	constraint Struttura_FK_Prenotazione foreign key(struttura) references Struttura_corrente(ID_struttura) on delete set null,
	constraint Cliente_FK_Prenotazione foreign key(cliente) references Utente(CF)
);

create Servizio(
	ID_servizio serial not null, 
	nome varchar(20) not null, 
	descrizione varchar(20), 
	icona varchar(200)
);

create AppartamS(
	struttura integer not null, 
	internoA smallint not null, 
	piano smallint not null,
	constraint AppartamS_PK primary key(struttura, internoA, piano),
	constraint Struttura_FK_AppartamS foreign key(struttura) references Struttura_storica(ID_struttura)
);


create StanzaC( 
	n_stanza smallint not null, 
	struttura integer not null, 
	internoA smallint not null, 
	piano smallint not null, 
	prezzo numeric check(prezzo > 0) not null, 
	disponibilitàSt boolean not null, 
	descrizioneSt varchar(500), 
	numero_posti_ letto smallint check(numero_posti_ letto > 0) not null, 
	numero_letti smallint check(numero_letti > 0) not null, 
	numero_bagni smallint check(bagni >= 0) not null, 
	tipo_letto varchar(20),
	constraint StanzaC_PK primary key(InternoS, n_stanza, struttura, internoA, piano),
	constraint Struttura_FK_StanzaC foreign key(struttura) references AppartamC(struttura) on delete cascade,
	constraint Struttura_FK_StanzaC foreign key(internoA) references AppartamC(internoA) on delete cascade,
	constraint Struttura_FK_StanzaC foreign key(piano) references AppartamC(piano) on delete cascade
);

create Ha_posseduto(
	proprietario varchar(16) not null, 
	struttura integer not null,
	constraint Ha_posseduto_PK primary key(proprietario, struttura),
	constraint Proprietario_FK_Ha_posseduto foreign key(proprietario) references Utente(CF),
	constraint Struttura_FK_Ha_posseduto foreign key(struttura) references Utente(ID_struttura)
);


create Review_user(
	ID_rec_user serial not null, 
	scrittore varchar(16), 
	recensito varchar(16), 
	data_recensione timestamp, 
	testo varchar(500),
	constraint Review_user_PK primary key(proprietario, struttura),
	constraint Scrittore_FK_Review_user foreign key(scrittore) references Utente(CF) on delete set null,
	constraint Recensito_FK_Review_user foreign key(recensito) references Utente(CF) on delete set null
);



	

