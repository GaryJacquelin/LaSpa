INSERT INTO ESPECE (codeES, libelleES)
 VALUES
 ('CHI', 'CHIEN'),
 ('CHA', 'CHAt'),
 ('OIS', 'OISEAU'),
 ('RON', 'RONGEUR');
INSERT INTO RACE (codeRACE, codeES,libelleRACE)
VALUES
('BA','CHI','Berger Allemand'),
('HA','RON','Hamster'),
('SI','CHA','Siamois'),
('PE','OIS','Perroquet');
INSERT INTO STATUT (codeSTA, libelleSTA)
VALUES
('CH','Chenil'),
('FU','Fourrière'),
('AD','Adopté'),
('AA','A l''adoption');
INSERT INTO ANIMAL (IDANIMAL,CODEIDEN,IDPRO,IDPRO_ANCIEN,CODESTA,CODERACE,NOMANIMAL,DATEARRIVEANIMAL,
DATEDEPARTANIMAL,DESCRIPTION,SEXE,CASTRE,AGE,VACCINER,IMAGE,PRIXADOPTION)
VALUES
('1','894B',null,'2','CH','BA','Rex','2019/11/12',null,'gentil'
,'M','O','1','N','rex.png','350'),

('2','A65461',null,'2','AA','SI','Felix','2018-01-15',null,'agressif'
,'M','N','4','O','felix.png','250'),

('3','F4584Z','1','3','FU','PE','Foxy','2019-05-08',null,'mord'
,'F','N','15','N','foxy.png','200');

INSERT INTO PROPRIETAIRE (idPRO, nomPRO,prenomPRO,mailPRO,adressePRO)
VALUES
('1','Lebon','Jacky','jacky.lebon@lapost.fr','24 rue des jolies fleures'),
('2','LaMitral','Maxime','maxime.lamitrail@orange.fr','154bis montée des roches'),
('3','Plaza','Stephan','Stephan.Plaza@free.fr','impasse des beaux pres');
INSERT INTO `users` (`id`, `name`, `email`, `password`, `last_update`, `user_update`, `role`,`id_visiteur` ) VALUES
(1, 'franck', 'franck@orange.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2019-11-27', '2019-11-27', 'admin',1),
(2, 'gary', 'gary@gmail.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2019-11-27', '2019-11-27', 'admin',2),
(3, 'dennyl', 'dennyl@h.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2019-11-27', '2019-11-27', 'admin',3),
(4, 'thibaud', 'thibaud@laposte.fr', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '2019-11-27', '2019-11-27', 'esclave',4),