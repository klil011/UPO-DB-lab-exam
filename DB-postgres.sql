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
    constraint CF_PK primary key(CF)
);

create table Struttura(
    ID_struttura serial not null,
    capS integer,
    --proprietario integer, 
    data_fine date, 
    indirizzoS varchar(20), 
    numero_civicoS smallint,
    constraint ID_struttura_PK primary key(ID_struttura),
    --constraint proprietario_FK foreign key(Proprietario) references Utente(CF)
);

create table Fornisce(
    ID_struttura integer not null,
    titolo varchar(50),
    constraint ID_struttura_FK_Struttura foreign key(ID_struttura) references Struttura(ID_struttura)
);

create table Servizio(
    titolo varchar(50) not null,
    descrizione varchar(500), 
    icona varchar(200),
    constraint titolo_PK primary key(titolo) 
);

create table FotoS(
    ID_foto serial not null, 
    immagine varchar(200), 
    ID_struttura integer not null,
    constraint ID_struttura_FK_Struttura foreign key(ID_struttura) references Struttura(ID_struttura),
    constraint ID_foto_PK primary key(ID_foto)
);

create table Possessi(
    ID_struttura integer not null, 
    CF varchar(16) not null,
    constraint ID_struttura_FK_Struttura foreign key(ID_struttura) references Struttura(ID_struttura),
    constraint CF_FK_Utente foreign key(CF) references Utente(CF) on delete cascade,
    constraint possessi_PK primary key(ID_struttura, CF)
);

create table Prenotazione(
    n_pren serial not null, 
    ID_struttura integer, 
    utente integer, 
    data_inizio date,
    data_fin date,
    check_in date,
    check_out date,
    constraint  n_pren_PK primary key(n_pren)
);

create table Recensione(
    ID_recensione serial not null, 
    editore integer, 
    data_pubblicazione timestamp,  
    testo varchar(500), 
    tipo_recensione boolean not null, 
    ID_struttura integer,
    constraint ID_struttura_FK_Struttura foreign key(ID_struttura) references Struttura(ID_struttura),
    --constraint editore_FK_Utente foreign key(editore) references Utente(CF),
    constraint ID_recensione_PK primary key(ID_recensione)
);
