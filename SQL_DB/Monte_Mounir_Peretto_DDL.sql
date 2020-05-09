/* Perez */

create table Utente(
    CF varchar(16) not null,
    nome varchar(20) not null,
    cognome varchar(20) not null,
    capU integer not null not null,
    indirizzoU varchar(50) not null,
    numero_civicoU integer not null,
    data_nascita date,
    email varchar(50) not null,
    user_type smallint not null,
    foto_profilo varchar(200),
    constraint Utente_PK primary key(CF)
);

create table Lingua(
    ID_lingua serial integer not null,
    nome varchar(20) not null,
    constraint Lingua_PK primary key(ID_lingua)
);

create table Pagamento(
    Prenotazione integer,
    Utente varchar(16),
    card_type varchar(20) not null,
    data_pagamento timestamp not null,
    ammontare numeric not null,
    valuta varchar(5) not null,
    constraint Pagamento_PK primary key(Prenotazione),
    constraint Prenotazione_FK_Prenotazione foreign key(Prenotazione) references Prenotazione(n_pren),
        on delete cascade
    constraint Utente_FK_Utente foreign key(Utente) references Utente(CF)
        on delete set null
);

create table Foto(
    ID_foto serial not null, 
    url_pic varchar(200) not null,
    struttura integer not null,
    constraint struttura_FK_Struttura foreign key(struttura) references Struttura_corrente(ID_struttura),
    constraint Foto_PK primary key(ID_foto)
        on delete cascade
);

create table CasaC(
    struttura integer not null,
    prezzo numeric not null check(prezzo > 0),
    disponibilita boolean not null,
    descrizione varchar(500),
    numero_posti_letto smallint not null check(numero_posti_letto > 0),
    numero_letti smallint not null check(numero_letti > 0),
    numero_bagni smallint not null check(numero_bagni >= 0),
    tipo_letto varchar(20) not null,
    constraint CasaC_PK primary key(struttura),
    constraint struttura_FK_Struttura foreign key(struttura) references Struttura_corrente(ID_struttura)
        on delete cascade
);

create table StanzaS(
    struttura integer not null,
    InternoS smallint not null,
    n_stanza smallint not null,
    internoA smallint not null,
    piano smallint not null,
    prezzo numeric not null check(prezzo > 0),
    disponibilitaSt boolean not null,
    descrizioneSt varchar(500),
    numero_posti_ letto smallint not null check(numero_posti_letto > 0),
    numero_letti smallint not null check(numero_letti > 0), 
    numero_bagni smallint not null check(numero_bagni >= 0), 
    tipo_letto varchar(20),
    constraint StanzaSt_PK primary key(InternoS, n_stanza, internoA, struttura, piano),
    constraint struttura_FK_AppartamS foreign key(struttura) references AppartamS(struttura),
    constraint InternoS_FK_AppartamS foreign key(InternoS) references AppartamS(internoA),
    constraint piano_FK_Appartam foreign key(piano) references AppartamS(piano)
);

create table Modifica_struttura(
    struttura integer not null,
    proprietario varchar(16),
    constraint Modifica_struttura_PK primary key(struttura, proprietario),
    constraint struttura _FK_Struttura_corrente foreign key(struttura) references Struttura_corrente(ID_struttura)
        on delete cascade,
    constraint proprietario_FK_Utente foreign key(proprietario) references Utente(CF)
        on delete cascade
);

create table Parla(
    Utente varchar(20) not null,
    lingua integer not null,
    constraint Parla_PK primary key(Utente, lingua),
    constraint Utente_FK_Utente foreign key(Utente) references Utente(CF)
        on delete cascade,
    constraint lingua_FK_Lingua foreign key(lingua) references Lingua(ID_lingua)
);


/* Gio */

create table Struttura_storica (
	ID_struttura serial not null,
	stato varchar(20) not null,
	regione varchar(20) not null,
	città varchar(20) not null,
	CapS integer not null,
	indirizzoS varchar(20) not null,
	numero_civicoS smallint not null,
	data_vendita timestamp not null,
	numero camere_da_letto smallint not null check (numero_posti_letto > 0),
	limite_ingresso timestamp not null check (limite_ingresso < limite_uscita),
	limite_uscita timestamp not null,
	constraint Struttura_storica_PK primary key(ID_struttura)
);

create table Recensione (
	ID_recensione serial not null,
	editore varchar(16),
	data_pubblicazione timestamp not null,
	testo varchar(500) not null,
	tipo boolean not null,
	struttura integer,
	constraint ID_recensione_PK primary key(ID_recensione),
	constraint editore_FK_Utente foreign key (editore) references Utente(CF) on delete set null,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura) on delete set null
);

create table FotoS(
	ID_foto serial not null,
	url_pic varchar(200),
	struttura integer not null,
	constraint FotoS_PK primary key(ID_foto),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura)
);

create table CasaS (
	struttura integer not null,
	data_fine timestamp not null,
	prezzo numeric check (prezzo > 0),
	disponibilità boolean not null,
	descrizione varchar(500) not null,
	numero_posti_letto smallint not null check (numero_posti_letto > 0),
	numero_letti smallint check not null (numero_letti > 0),
	numero_bagni smallint check not null (numero_bagni >= 0),,
	tipo_letto varchar(20),
	constraint CasaS_PK primary key(struttura, data_fine),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_storica(ID_struttura)
);

create table AppartamC(
	struttura integer not null,
	internoA smallint not null,
	piano smallint not null,
	constraint AppartamC_PK primary key(struttura, internoA),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete cascade
);

create table fornisce(
	struttura integer not null, 
	servizio smallint,
	constraint Fornisce_PK primary key(struttura, servizio),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura) on delete cascade,
	constraint servizio_FK_Servizio foreign key (servizio) references Servizio(ID_servizio)
);

create table Possiede(
	proprietario varchar(16),
	struttura integer not null,
	constraint Possiede_PK primary key(proprietario, struttura),
	constraint proprietario_FK_Utente foreign key (proprietario) references Utente(CF) on delete cascade,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete cascade
);



/* khalil */

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
