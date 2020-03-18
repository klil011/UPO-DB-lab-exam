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
	struttura integer not null,
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






/*VECCHIO SCHEMA
create table Modifica_struttura(
	ID_struttura serial, 
	CF varchar(16),
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint CF_PK primary key(CF),
	constraint CF_FK_Utente foreign key (CF) references Utente(CF),
	constraint ID_struttura_FK_Struttura foreign key (ID_struttura) references Struttura(ID_struttura)
);

create table Struttura_storica(
	ID_struttura integer, 
	capS small integer, 
	proprietario varchar(16), 
	data_fine timestamp, 
	indirizzoS varchar(20), 
	numero_civicoS smallint,
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint ID_struttura_FK_Struttura foreign key (ID_struttura) references Struttura(ID_struttura),
	constraint proprietario_PK foreign key (proprietario) references Utente(CF)
);

create table CasaS (
	ID_struttura integer, 
	data_fine timestamp,
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint data_fine_PK primary key (data_fine),
	constraint ID_struttura_FK_Struttura_storica foreign key (ID_struttura) references Struttura_storica(ID_struttura)
);

create table AppartamS(
	ID_struttura integer, 
	internoA smallint, 
	piano smallint,
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint internoA_PK primary key (internoA),
	constraint piano_PK primary key (piano),
	constraint ID_struttura_FK_Struttura_storica foreign key (ID_struttura) references Struttura_storica(ID_struttura)
);
*/