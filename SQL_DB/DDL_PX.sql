Struttura_storica (
	ID_struttura serial,
	stato varchar(20),
	regione varchar(20),
	città varchar(20),
	CapS integer,
	indirizzoS varchar(20),
	numero_civicoS smallint,
	data_vendita timestamp,
	numero camere_da_letto smallint,
	limite_ingresso timestamp,
	limite_uscita timestamp
	constraint Struttura_storica_PK primary key(ID_struttura)
);

Recensione (
	ID_recensione serial,
	editore varchar(16),
	data_pubblicazione timestamp,
	testo varchar(500),
	tipo boolean,
	struttura integer,
	constraint ID_recensione_PK primary key(ID_recensione),
	constraint editore_FK_Utente foreign key (editore) references Utente(CF),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura)
);

FotoS(
	ID_foto serial,
	url_pic varchar(200),
	struttura integer
	constraint FotoS_PK primary key(ID_foto),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura)
);

CasaS (
	struttura integer,
	data_fine timestamp,
	prezzo numeric,
	disponibilità boolean,
	descrizione varchar(500),
	numero_posti_letto smallint,
	numero_letti smallint,
	numero_bagni smallint,
	tipo_letto varchar(20)
	constraint CasaS_PK primary key(struttura, data_fine),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_storica(ID_struttura)
);

AppartamC(
	struttura integer,
	internoA smallint,
	piano smallint,
	constraint AppartamC_PK primary key(struttura, internoA),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura)
);

Fornisce(
	struttura integer, 
	servizio smallint,
	constraint Fornisce_PK primary key(struttura, servizio),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura(ID_struttura),
	constraint servizio_FK_Servizio foreign key (servizio) references Servizio(ID_servizio)
);

Possiede(
	proprietario varchar(16),
	struttura integer,
	constraint Possiede_PK primary key(proprietario, struttura),
	constraint proprietario_FK_Utente foreign key (proprietario) references Utente(CF),
	constraint struttura_FK_Struttura foreign key (struttura) references Struttura_corrente(ID_struttura)
);






/*VECCHIO SCHEMA
Modifica_struttura(
	ID_struttura serial, 
	CF varchar(16),
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint CF_PK primary key(CF),
	constraint CF_FK_Utente foreign key (CF) references Utente(CF),
	constraint ID_struttura_FK_Struttura foreign key (ID_struttura) references Struttura(ID_struttura)
);

Struttura_storica(
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

CasaS (
	ID_struttura integer, 
	data_fine timestamp,
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint data_fine_PK primary key (data_fine),
	constraint ID_struttura_FK_Struttura_storica foreign key (ID_struttura) references Struttura_storica(ID_struttura)
);

AppartamS(
	ID_struttura integer, 
	internoA smallint, 
	piano smallint,
	constraint ID_struttura_PK primary key (ID_struttura),
	constraint internoA_PK primary key (internoA),
	constraint piano_PK primary key (piano),
	constraint ID_struttura_FK_Struttura_storica foreign key (ID_struttura) references Struttura_storica(ID_struttura)
);
*/