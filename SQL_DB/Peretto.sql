create table Utente(
    CF varchar(16),
    nome varchar(20),
    cognome varchar(20),
    capU integer not null,
    indirizzoU varchar(50),
    numero_civicoU integer,
    data_nascita date,
    email varchar(50),
    user_type smallint,
    foto_profilo varchar(200),
    constraint Utente_PK primary key(CF)
);

create table Lingua(
    ID_lingua serial integer not null,
    nome varchar(20),
    constraint Lingua_PK primary key(ID_lingua)
);

create table Pagamento(
    Prenotazione integer,
    Utente varchar(16),
    card_type varchar(20),
    data_pagamento timestamp not null,
    ammontare numeric not null,
    valuta varchar(5),
    constraint Pagamento_PK primary key(Prenotazione),
    constraint Prenotazione_FK_Prenotazione foreign key(Prenotazione) references Prenotazione(n_pren),
    constraint Utente_FK_Utente foreign key(Utente) references Utente(CF)
);

create table Foto(
    ID_foto serial not null, 
    url_pic varchar(200),
    struttura integer not null,
    constraint struttura_FK_Struttura foreign key(struttura) references Struttura_corrente(ID_struttura),
    constraint Foto_PK primary key(ID_foto)
);

create table CasaC(
    struttura integer not null,
    prezzo numeric not null,
    disponibilita boolean not null,
    descrizione varchar(500),
    numero_posti_letto smallint not null,
    numero_letti smallint not null,
    numero_bagni smallint not null,
    tipo_letto varchar(20),
    constraint CasaC_PK primary key(struttura),
    constraint struttura_FK_Struttura foreign key(struttura) references Struttura_corrente(ID_struttura)
);

create table StanzaS(
    struttura integer not null,
    InternoS smallint not null,
    n_stanza smallint not null,
    internoA smallint not null,
    piano smallint not null,
    prezzo numeric not null,
    disponibilitaSt boolean not null,
    descrizioneSt varchar(500),
    numero_posti_ letto smallint not null,
    numero_letti smallint not null, 
    numero_bagni smallint not null, 
    tipo_letto varchar(20),
    constraint StanzaSt_PK primary key(InternoS, n_stanza, internoA, struttura, piano),
    constraint struttura_FK_AppartamS foreign key(struttura) references AppartamS(struttura),
    constraint InternoS_FK_AppartamS foreign key(InternoS) references AppartamS(internoA),
    constraint piano foreign key(piano) references AppartamS(piano)
);

create table Modifica_struttura(
    struttura integer not null,
    proprietario varchar(16),
    constraint Modifica_struttura_PK primary key(struttura, proprietario),
    constraint struttura _FK_Struttura_corrente foreign key(struttura) references Struttura_corrente(ID_struttura),
    constraint proprietario_FK_Utente foreign key(proprietario) references Utente(CF)
);

create table Parla(
    Utente varchar(20),
    lingua integer,
    constraint Parla_PK primary key(Utente, lingua),
    constraint Utente_FK_Utente foreign key(Utente) references Utente(CF),
    constraint lingua_FK_Lingua foreign key(lingua) references Lingua(ID_lingua)
);
