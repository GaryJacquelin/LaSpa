/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/11/2019 14:12:46                      */
/*==============================================================*/


drop table if exists ANIMAL;

drop table if exists ESPECE;

drop table if exists IDENTIFICATION;

drop table if exists PROPRIETAIRE;

drop table if exists RACE;

drop table if exists STATUT;

/*==============================================================*/
/* Table : ANIMAL                                               */
/*==============================================================*/
create table ANIMAL
(
   IDANIMAL             int not null,
   CODEIDEN             varchar(2),
   IDPRO                int,
   PRO_IDPRO            int,
   CODESTA              varchar(2) not null,
   CODERACE             varchar(4) not null,
   NOMANIMAL            varchar(30),
   DATEARRIVEANIMAL     date,
   DATEDEPARTANIMAL     date,
   DESCRIPTION          varchar(200),
   SEXE                 bool,
   CASTRE               bool,
   AGE                  int,
   VACCINER             bool,
   IMAGE                varchar(40),
   PRIXADOPTION         numeric(6,2),
   primary key (IDANIMAL)
);

/*==============================================================*/
/* Table : ESPECE                                               */
/*==============================================================*/
create table ESPECE
(
   CODEES               varchar(3) not null,
   LIBELLEES            varchar(30),
   primary key (CODEES)
);

/*==============================================================*/
/* Table : IDENTIFICATION                                       */
/*==============================================================*/
create table IDENTIFICATION
(
   CODEIDEN             varchar(2) not null,
   LIBELLEIDEN          varchar(30),
   primary key (CODEIDEN)
);

/*==============================================================*/
/* Table : PROPRIETAIRE                                         */
/*==============================================================*/
create table PROPRIETAIRE
(
   IDPRO                int not null,
   NOMPRO               longtext,
   PRENOMPRO            varchar(40),
   MAILPRO              varchar(40),
   ADRESSEPRO           varchar(40),
   primary key (IDPRO)
);

/*==============================================================*/
/* Table : RACE                                                 */
/*==============================================================*/
create table RACE
(
   CODERACE             varchar(4) not null,
   CODEES               varchar(3) not null,
   LIBELLERACE          varchar(40),
   primary key (CODERACE)
);

/*==============================================================*/
/* Table : STATUT                                               */
/*==============================================================*/
create table STATUT
(
   CODESTA              varchar(2) not null,
   LIBELLESTA           varchar(30),
   primary key (CODESTA)
);

alter table ANIMAL add constraint FK_ANCIEN foreign key (PRO_IDPRO)
      references PROPRIETAIRE (IDPRO) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_APPARTENIR foreign key (CODERACE)
      references RACE (CODERACE) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_ETRE foreign key (CODESTA)
      references STATUT (CODESTA) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_IDENTIFIER foreign key (CODEIDEN)
      references IDENTIFICATION (CODEIDEN) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_NOUVEAU foreign key (IDPRO)
      references PROPRIETAIRE (IDPRO) on delete restrict on update restrict;

alter table RACE add constraint FK_CORRESPONDRE foreign key (CODEES)
      references ESPECE (CODEES) on delete restrict on update restrict;

