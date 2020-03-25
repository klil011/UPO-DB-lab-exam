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
	super_host boolean,
    constraint Utente_PK primary key(CF)
);

create table Servizio(
	ID_servizio serial not null, 
	nome varchar(20) not null, 
	descrizione varchar(20), 
	icona varchar(200),
	constraint Servizio_PK primary key(ID_servizio)
);

create table Struttura_corrente (
	ID_struttura serial not null,
	stato varchar(20) not null, 
	regione varchar(20) not null, 
	città varchar(20) not null, 
	CapS integer not null, 
	indirizzoS varchar(20) not null, 
	numero_civicoS smallint not null, 
	numero_camere_da_letto integer check(numero_camere_da_letto > 0), 
	limite_ingresso time, 
	limite_uscita time,
	constraint Struttura_corrente_PK primary key(ID_struttura)
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

create table AppartamC(
	ID_appartamC serial not null,
	struttura integer not null,
	internoA smallint not null,
	piano smallint not null,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete cascade,
	constraint AppartamC_PK primary key(ID_appartamC)
);

create table StanzaC(
	appartamC integer not null,
	n_stanza smallint not null,
	prezzo numeric check(prezzo > 0) not null, 
	disponibilitàSt boolean not null, 
	descrizioneSt varchar(500), 
	numero_posti_letto smallint check(numero_posti_letto > 0) not null, 
	numero_letti smallint check(numero_letti > 0) not null, 
	numero_bagni smallint check(numero_bagni >= 0) not null,
	tipo_letto varchar(20),
	constraint StanzaC_PK primary key(n_stanza, appartamC),
	constraint StanzaC_FK_AppartamC foreign key(appartamC) references AppartamC(ID_appartamC) on delete cascade
);

create table Struttura_storica (
	ID_struttura serial not null,
	stato varchar(20) not null,
	regione varchar(20) not null,
	città varchar(20) not null,
	CapS integer not null,
	indirizzoS varchar(20) not null,
	numero_civicoS smallint not null,
	data_vendita timestamp not null,
	numero_camere_da_letto smallint not null check (numero_camere_da_letto > 0),
	limite_ingresso time not null check (limite_ingresso < limite_uscita),
	limite_uscita time not null,
	constraint Struttura_storica_PK primary key(ID_struttura)
);

create table CasaS (
	struttura integer not null,
	data_fine timestamp not null,
	prezzo numeric check (prezzo > 0),
	disponibilità boolean not null,
	descrizione varchar(500) not null,
	numero_posti_letto smallint not null check(numero_posti_letto > 0),
	numero_letti smallint not null check(numero_letti > 0),
	numero_bagni smallint not null check(numero_bagni >= 0),
	tipo_letto varchar(20),
	constraint CasaS_PK primary key(struttura, data_fine),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_storica(ID_struttura)
);

create table AppartamS(
	ID_appartamS serial not null,
	struttura integer not null,
	internoA smallint not null,
	piano smallint not null,
	constraint AppartamS_PK primary key(ID_appartamS),
	constraint AppartamS_FK_Struttura foreign key(struttura) references Struttura_storica(ID_struttura) on delete cascade
);

create table StanzaS(
	appartamS integer not null,
    n_stanza smallint not null,
    prezzo numeric not null check(prezzo > 0),
    disponibilitaSt boolean not null,
    descrizioneSt varchar(500),
    numero_posti_letto smallint not null check(numero_posti_letto > 0),
    numero_letti smallint not null check(numero_letti > 0), 
    numero_bagni smallint not null check(numero_bagni >= 0), 
    tipo_letto varchar(20),
    constraint StanzaSt_PK primary key(appartamS),
    constraint StanzaS_FK_AppartamS foreign key(appartamS) references AppartamS(ID_appartamS)
);

create table Lingua(
    ID_lingua serial not null,
    nome varchar(20) not null,
    constraint Lingua_PK primary key(ID_lingua)
);

create table Prenotazione(
	n_pren serial not null, 
	struttura integer, 
	cliente varchar(16), 
	data_inizio date not null, 
	data_fine date not null, 
	check_in timestamp not null, 
	check_out timestamp not null,
	constraint Prenotazione_PK primary key(n_pren),
	constraint Struttura_FK_Prenotazione foreign key(struttura) references Struttura_corrente(ID_struttura) on delete set null,
	constraint Cliente_FK_Prenotazione foreign key(cliente) references Utente(CF)
);

create table Pagamento(
    Prenotazione integer,
    Utente varchar(16),
    card_type varchar(20) not null,
    data_pagamento timestamp not null,
    ammontare numeric not null,
    valuta varchar(5) not null,
    constraint Pagamento_PK primary key(Prenotazione),
    constraint Prenotazione_FK_Prenotazione foreign key(Prenotazione) references Prenotazione(n_pren)
        on delete cascade,
    constraint Utente_FK_Utente foreign key(Utente) references Utente(CF)
        on delete set null
);

create table Foto(
    ID_foto serial not null, 
    url_pic varchar(200) not null,
    struttura integer not null,
    constraint struttura_FK_Struttura foreign key(struttura) references Struttura_corrente(ID_struttura)
    	on delete cascade,
	constraint Foto_PK primary key(ID_foto)
);

create table Modifica_struttura(
    struttura integer not null,
    proprietario varchar(16),
    constraint Modifica_struttura_PK primary key(struttura, proprietario),
    constraint struttura_FK_Struttura_corrente foreign key(struttura) references Struttura_corrente(ID_struttura)
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

create table Recensione (
	ID_recensione serial not null,
	editore varchar(16),
	data_pubblicazione timestamp not null,
	testo varchar(500) not null,
	tipo boolean not null,
	struttura integer not null,
	constraint ID_recensione_PK primary key(ID_recensione),
	constraint editore_FK_Utente foreign key (editore) references Utente(CF) on delete set null,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete set null
);

create table FotoS(
	ID_foto serial not null,
	url_pic varchar(200),
	struttura integer not null,
	constraint FotoS_PK primary key(ID_foto),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_storica(ID_struttura)
);

create table Fornisce(
	struttura integer not null,
	servizio smallint not null,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete cascade,
	constraint servizio_FK_Servizio foreign key (servizio) references Servizio(ID_servizio),
	constraint Fornisce_PK primary key(struttura, servizio)
);

create table FornisceS(
	struttura integer not null,
	servizio smallint,
	constraint FornisceS_PK primary key(struttura, servizio),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_storica(ID_struttura) on delete cascade,
	constraint servizio_FK_Servizio foreign key (servizio) references Servizio(ID_servizio)
);

create table Possiede(
	proprietario varchar(16),
	struttura integer not null,
	constraint Possiede_PK primary key(proprietario, struttura),
	constraint proprietario_FK_Utente foreign key (proprietario) references Utente(CF) on delete cascade,
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura) on delete cascade
);

create table Risposte (
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

create table Ha_posseduto(
	proprietario varchar(16) not null, 
	struttura integer not null,
	constraint Ha_posseduto_PK primary key(proprietario, struttura),
	constraint Proprietario_FK_Ha_posseduto foreign key(proprietario) references Utente(CF),
	constraint Struttura_FK_Ha_posseduto foreign key(struttura) references Struttura_storica(ID_struttura)
);

create table Review_user(
	ID_rec_user serial not null, 
	scrittore varchar(16), 
	recensito varchar(16), 
	data_recensione timestamp, 
	testo varchar(500),
	constraint Review_user_PK primary key(ID_rec_user),
	constraint Scrittore_FK_Review_user foreign key(scrittore) references Utente(CF) on delete set null,
	constraint Recensito_FK_Review_user foreign key(recensito) references Utente(CF) on delete set null
);
