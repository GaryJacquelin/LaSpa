/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  13/11/2019 16:55:20                      */
/*==============================================================*/


drop table if exists ANCIEN;

drop table if exists ANIMAL;

drop table if exists APARTIENIR;

drop table if exists CORESPONDRE;

drop table if exists ESPECE;

drop table if exists IDENDIFICATION;

drop table if exists NOUVEAU;

drop table if exists PROPRIETAIRE;

drop table if exists RACE;

drop table if exists STATUT;

drop table if exists UTILISATEUR;

/*==============================================================*/
/* Table : ANCIEN                                               */
/*==============================================================*/
create table ANCIEN
(
   IDANIMAL             int not null,
   IDPRO                int not null,
   primary key (IDANIMAL, IDPRO)
);

/*==============================================================*/
/* Table : ANIMAL                                               */
/*==============================================================*/
create table ANIMAL
(
   IDANIMAL             int not null,
   CODEIDEN             varchar(2),
   CODESTA              varchar(2) not null,
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
/* Table : APARTIENIR                                           */
/*==============================================================*/
create table APARTIENIR
(
   IDANIMAL             int not null,
   CODERACE             varchar(4) not null,
   primary key (IDANIMAL, CODERACE)
);

/*==============================================================*/
/* Table : CORESPONDRE                                          */
/*==============================================================*/
create table CORESPONDRE
(
   CODERACE             varchar(4) not null,
   CODEES               varchar(3) not null,
   primary key (CODERACE, CODEES)
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
/* Table : IDENDIFICATION                                       */
/*==============================================================*/
create table IDENDIFICATION
(
   CODEIDEN             varchar(2) not null,
   LIBELLEIDEN          varchar(30),
   primary key (CODEIDEN)
);

/*==============================================================*/
/* Table : NOUVEAU                                              */
/*==============================================================*/
create table NOUVEAU
(
   IDANIMAL             int not null,
   IDPRO                int not null,
   primary key (IDANIMAL, IDPRO)
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
   ADRESSEPRO           char(10),
   primary key (IDPRO)
);

/*==============================================================*/
/* Table : RACE                                                 */
/*==============================================================*/
create table RACE
(
   CODERACE             varchar(4) not null,
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

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   IDUSER               int not null,
   NOMUSER              varchar(30),
   PRENOMUSER           varchar(30),
   ADMINUSER            bool,
   IDENTIFIANTUSER      varchar(30),
   MDPUSER              varchar(30),
   primary key (IDUSER)
);

alter table ANCIEN add constraint FK_ANCIEN foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL) on delete restrict on update restrict;

alter table ANCIEN add constraint FK_ANCIEN2 foreign key (IDPRO)
      references PROPRIETAIRE (IDPRO) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_ETRE foreign key (CODESTA)
      references STATUT (CODESTA) on delete restrict on update restrict;

alter table ANIMAL add constraint FK_IDENTIFIER foreign key (CODEIDEN)
      references IDENDIFICATION (CODEIDEN) on delete restrict on update restrict;

alter table APARTIENIR add constraint FK_APARTIENIR foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL) on delete restrict on update restrict;

alter table APARTIENIR add constraint FK_APARTIENIR2 foreign key (CODERACE)
      references RACE (CODERACE) on delete restrict on update restrict;

alter table CORESPONDRE add constraint FK_CORESPONDRE foreign key (CODERACE)
      references RACE (CODERACE) on delete restrict on update restrict;

alter table CORESPONDRE add constraint FK_CORESPONDRE2 foreign key (CODEES)
      references ESPECE (CODEES) on delete restrict on update restrict;

alter table NOUVEAU add constraint FK_NOUVEAU foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL) on delete restrict on update restrict;

alter table NOUVEAU add constraint FK_NOUVEAU2 foreign key (IDPRO)
      references PROPRIETAIRE (IDPRO) on delete restrict on update restrict;

