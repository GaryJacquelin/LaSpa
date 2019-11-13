/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  13/11/2019 15:54:45                      */
/*==============================================================*/


alter table ANCIEN
   drop constraint FK_ANCIEN_ANCIEN_ANIMAL;

alter table ANCIEN
   drop constraint FK_ANCIEN_ANCIEN2_PROPRIET;

alter table ANIMAL
   drop constraint FK_ANIMAL_ETRE_STATUT;

alter table ANIMAL
   drop constraint FK_ANIMAL_IDENTIFIE_IDENDIFI;

alter table APARTIENIR
   drop constraint FK_APARTIEN_APARTIENI_ANIMAL;

alter table APARTIENIR
   drop constraint FK_APARTIEN_APARTIENI_RACE;

alter table CORESPONDRE
   drop constraint FK_CORESPON_CORESPOND_RACE;

alter table CORESPONDRE
   drop constraint FK_CORESPON_CORESPOND_ESPECE;

alter table NOUVEAU
   drop constraint FK_NOUVEAU_NOUVEAU_ANIMAL;

alter table NOUVEAU
   drop constraint FK_NOUVEAU_NOUVEAU2_PROPRIET;

drop index ANCIEN2_FK;

drop index ANCIEN_FK;

drop table ANCIEN cascade constraints;

drop index IDENTIFIER_FK;

drop index ETRE_FK;

drop table ANIMAL cascade constraints;

drop index APARTIENIR2_FK;

drop index APARTIENIR_FK;

drop table APARTIENIR cascade constraints;

drop index CORESPONDRE2_FK;

drop index CORESPONDRE_FK;

drop table CORESPONDRE cascade constraints;

drop table ESPECE cascade constraints;

drop table IDENDIFICATION cascade constraints;

drop index NOUVEAU2_FK;

drop index NOUVEAU_FK;

drop table NOUVEAU cascade constraints;

drop table PROPRIETAIRE cascade constraints;

drop table RACE cascade constraints;

drop table STATUT cascade constraints;

drop table UTILISATEUR cascade constraints;

/*==============================================================*/
/* Table : ANCIEN                                               */
/*==============================================================*/
create table ANCIEN 
(
   IDANIMAL             INTEGER              not null,
   IDPRO                INTEGER              not null,
   constraint PK_ANCIEN primary key (IDANIMAL, IDPRO)
);

/*==============================================================*/
/* Index : ANCIEN_FK                                            */
/*==============================================================*/
create index ANCIEN_FK on ANCIEN (
   IDANIMAL ASC
);

/*==============================================================*/
/* Index : ANCIEN2_FK                                           */
/*==============================================================*/
create index ANCIEN2_FK on ANCIEN (
   IDPRO ASC
);

/*==============================================================*/
/* Table : ANIMAL                                               */
/*==============================================================*/
create table ANIMAL 
(
   IDANIMAL             INTEGER              not null,
   CODEIDEN             VARCHAR2(2),
   CODESTA              VARCHAR2(2)          not null,
   NOMANIMAL            VARCHAR2(30),
   DATEARRIVEANIMAL     DATE,
   DATEDEPARTANIMAL     DATE,
   DESCRIPTION          VARCHAR2(200),
   SEXE                 SMALLINT,
   CASTRE               SMALLINT,
   AGE                  INTEGER,
   VACCINER             SMALLINT,
   IMAGE                VARCHAR2(40),
   constraint PK_ANIMAL primary key (IDANIMAL)
);

/*==============================================================*/
/* Index : ETRE_FK                                              */
/*==============================================================*/
create index ETRE_FK on ANIMAL (
   CODESTA ASC
);

/*==============================================================*/
/* Index : IDENTIFIER_FK                                        */
/*==============================================================*/
create index IDENTIFIER_FK on ANIMAL (
   CODEIDEN ASC
);

/*==============================================================*/
/* Table : APARTIENIR                                           */
/*==============================================================*/
create table APARTIENIR 
(
   IDANIMAL             INTEGER              not null,
   CODERACE             VARCHAR2(4)          not null,
   constraint PK_APARTIENIR primary key (IDANIMAL, CODERACE)
);

/*==============================================================*/
/* Index : APARTIENIR_FK                                        */
/*==============================================================*/
create index APARTIENIR_FK on APARTIENIR (
   IDANIMAL ASC
);

/*==============================================================*/
/* Index : APARTIENIR2_FK                                       */
/*==============================================================*/
create index APARTIENIR2_FK on APARTIENIR (
   CODERACE ASC
);

/*==============================================================*/
/* Table : CORESPONDRE                                          */
/*==============================================================*/
create table CORESPONDRE 
(
   CODERACE             VARCHAR2(4)          not null,
   CODEES               VARCHAR2(3)          not null,
   constraint PK_CORESPONDRE primary key (CODERACE, CODEES)
);

/*==============================================================*/
/* Index : CORESPONDRE_FK                                       */
/*==============================================================*/
create index CORESPONDRE_FK on CORESPONDRE (
   CODERACE ASC
);

/*==============================================================*/
/* Index : CORESPONDRE2_FK                                      */
/*==============================================================*/
create index CORESPONDRE2_FK on CORESPONDRE (
   CODEES ASC
);

/*==============================================================*/
/* Table : ESPECE                                               */
/*==============================================================*/
create table ESPECE 
(
   CODEES               VARCHAR2(3)          not null,
   LIBELLEES            VARCHAR2(30),
   constraint PK_ESPECE primary key (CODEES)
);

/*==============================================================*/
/* Table : IDENDIFICATION                                       */
/*==============================================================*/
create table IDENDIFICATION 
(
   CODEIDEN             VARCHAR2(2)          not null,
   LIBELLEIDEN          VARCHAR2(30),
   constraint PK_IDENDIFICATION primary key (CODEIDEN)
);

/*==============================================================*/
/* Table : NOUVEAU                                              */
/*==============================================================*/
create table NOUVEAU 
(
   IDANIMAL             INTEGER              not null,
   IDPRO                INTEGER              not null,
   constraint PK_NOUVEAU primary key (IDANIMAL, IDPRO)
);

/*==============================================================*/
/* Index : NOUVEAU_FK                                           */
/*==============================================================*/
create index NOUVEAU_FK on NOUVEAU (
   IDANIMAL ASC
);

/*==============================================================*/
/* Index : NOUVEAU2_FK                                          */
/*==============================================================*/
create index NOUVEAU2_FK on NOUVEAU (
   IDPRO ASC
);

/*==============================================================*/
/* Table : PROPRIETAIRE                                         */
/*==============================================================*/
create table PROPRIETAIRE 
(
   IDPRO                INTEGER              not null,
   NOMPRO               CLOB,
   PRENOMPRO            VARCHAR2(40),
   MAILPRO              VARCHAR2(40),
   ADRESSEPRO           CHAR(10),
   constraint PK_PROPRIETAIRE primary key (IDPRO)
);

/*==============================================================*/
/* Table : RACE                                                 */
/*==============================================================*/
create table RACE 
(
   CODERACE             VARCHAR2(4)          not null,
   LIBELLERACE          VARCHAR2(40),
   constraint PK_RACE primary key (CODERACE)
);

/*==============================================================*/
/* Table : STATUT                                               */
/*==============================================================*/
create table STATUT 
(
   CODESTA              VARCHAR2(2)          not null,
   LIBELLESTA           VARCHAR2(30),
   constraint PK_STATUT primary key (CODESTA)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR 
(
   IDUSER               INTEGER              not null,
   NOMUSER              VARCHAR2(30),
   PRENOMUSER           VARCHAR2(30),
   ADMINUSER            SMALLINT,
   IDENTIFIANTUSER      VARCHAR2(30),
   MDPUSER              VARCHAR2(30),
   constraint PK_UTILISATEUR primary key (IDUSER)
);

alter table ANCIEN
   add constraint FK_ANCIEN_ANCIEN_ANIMAL foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL);

alter table ANCIEN
   add constraint FK_ANCIEN_ANCIEN2_PROPRIET foreign key (IDPRO)
      references PROPRIETAIRE (IDPRO);

alter table ANIMAL
   add constraint FK_ANIMAL_ETRE_STATUT foreign key (CODESTA)
      references STATUT (CODESTA);

alter table ANIMAL
   add constraint FK_ANIMAL_IDENTIFIE_IDENDIFI foreign key (CODEIDEN)
      references IDENDIFICATION (CODEIDEN);

alter table APARTIENIR
   add constraint FK_APARTIEN_APARTIENI_ANIMAL foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL);

alter table APARTIENIR
   add constraint FK_APARTIEN_APARTIENI_RACE foreign key (CODERACE)
      references RACE (CODERACE);

alter table CORESPONDRE
   add constraint FK_CORESPON_CORESPOND_RACE foreign key (CODERACE)
      references RACE (CODERACE);

alter table CORESPONDRE
   add constraint FK_CORESPON_CORESPOND_ESPECE foreign key (CODEES)
      references ESPECE (CODEES);

alter table NOUVEAU
   add constraint FK_NOUVEAU_NOUVEAU_ANIMAL foreign key (IDANIMAL)
      references ANIMAL (IDANIMAL);

alter table NOUVEAU
   add constraint FK_NOUVEAU_NOUVEAU2_PROPRIET foreign key (IDPRO)
      references PROPRIETAIRE (IDPRO);

