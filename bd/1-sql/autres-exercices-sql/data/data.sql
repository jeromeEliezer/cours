USE concession;
-- ville
insert into `ville`(`id`,`nom`) values (1,'Nantes');
insert into `ville`(`id`,`nom`) values (4,'Rennes');
insert into `ville`(`id`,`nom`) values (2,'Saint-Nazaire');
insert into `ville`(`id`,`nom`) values (3,'Vannes');

-- vendeur
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (2,'Leclerc','Jules',null,4);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (5,'Ksarin','Yann',null,null);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (1,'DuJardin','Charles',2,2);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (3,'Cadoret','Marie',5,2);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (4,'Lepine','Julie',5,3);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (6,'Dubigeon','Laure',2,4);
insert into `vendeur`(`id`,`nom`,`prenom`,`id_responsable`,`id_ville`) values (7,'Castel','Yann',5,4);

-- stock
insert into `stock`(`id`,`entrepot`,`id_ville`) values (1,'NA1',1);
insert into `stock`(`id`,`entrepot`,`id_ville`) values (2,'SA1',2);
insert into `stock`(`id`,`entrepot`,`id_ville`) values (3,'VA1',3);
insert into `stock`(`id`,`entrepot`,`id_ville`) values (4,'RE1',4);
insert into `stock`(`id`,`entrepot`,`id_ville`) values (5,'RE2',4);

-- couleur 
insert into `couleur`(`id`,`nom`) values (4,'blanc');
insert into `couleur`(`id`,`nom`) values (3,'bleu');
insert into `couleur`(`id`,`nom`) values (7,'gris');
insert into `couleur`(`id`,`nom`) values (5,'jaune');
insert into `couleur`(`id`,`nom`) values (6,'noir');
insert into `couleur`(`id`,`nom`) values (1,'rouge');
insert into `couleur`(`id`,`nom`) values (2,'vert');

-- carburant
insert into `carburant`(`id`,`nom`) values (8,'diesel');
insert into `carburant`(`id`,`nom`) values (10,'electrique');
insert into `carburant`(`id`,`nom`) values (7,'essence');
insert into `carburant`(`id`,`nom`) values (9,'gaz');
insert into `carburant`(`id`,`nom`) values (11,'hybride');

-- motorisation
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (5,170,2,10);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (7,1200,4,7);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (6,1200,4,11);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (3,1200,6,7);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (4,1400,5,8);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (1,1600,6,8);
insert into `motorisation`(`id`,`cylindree`,`Chevaux`,`id_carburant`) values (2,1600,7,7);

-- modele
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (4,'440','VOLVO',1996);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (12,'4L','RENAULT',1970);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (2,'A8','AUDI',2007);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (1,'A8','AUDI',2013);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (7,'C3','CITROEN',2017);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (8,'C3 CROSS','CITROEN',2017);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (11,'Captur','RENAULT',2017);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (9,'CORSA','OPEN',2017);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (5,'CTS','CADILLAC',2015);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (3,'Grand Cherokee','JEEP',2011);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (6,'ix20','HYUNDAI',2017);
insert into `modele`(`id`,`nom`,`marque`,`annee`) values (10,'Kangoo','RENAULT',2017);

-- vehicule
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (12,25000.00,0,'2018-04-13 13:52:28',1,7,2,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (13,41000.00,0,'2018-04-13 13:52:28',2,7,4,1);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (14,12630.00,1,'2018-04-13 13:52:28',1,8,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (15,15000.00,0,'2018-04-13 13:52:28',4,5,5,3);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (25,52630.00,1,'2018-03-18 12:52:28',1,11,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (26,52630.00,1,'2018-03-18 12:52:28',1,10,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (27,52630.00,1,'2018-03-18 12:52:28',1,10,4,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (28,52630.00,1,'2018-03-18 12:52:28',1,10,4,1);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (29,52630.00,1,'2018-03-18 12:52:28',1,10,4,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (30,52630.00,1,'2018-03-18 12:52:28',1,10,4,3);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (31,52630.00,1,'2018-03-18 12:52:28',1,3,4,3);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (32,52630.00,1,'2018-03-18 12:52:28',1,3,4,1);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (33,52630.00,1,'2018-03-18 12:52:28',1,3,4,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (34,52630.00,1,'2018-03-18 12:52:28',2,4,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (35,52630.00,1,'2018-03-18 12:52:28',2,5,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (36,52630.00,1,'2018-03-18 12:52:28',2,6,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (38,52630.00,1,'2018-03-18 12:52:28',2,11,1,5);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (39,52630.00,1,'2018-03-18 12:52:28',2,8,1,5);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (40,52630.00,1,'2018-03-18 12:52:28',2,8,1,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (41,52630.00,1,'2018-03-18 12:52:28',2,8,2,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (42,52630.00,1,'2018-03-18 12:52:28',2,8,3,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (43,52630.00,1,'2018-03-18 12:52:28',2,8,4,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (44,52630.00,1,'2018-04-13 16:42:42',null,8,4,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (45,52630.00,0,'2018-04-13 16:43:03',null,11,4,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (46,52630.00,0,'2018-04-13 16:43:09',null,5,4,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (47,52630.00,0,'2018-04-13 16:43:18',null,5,1,4);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (48,10000.00,1,'2018-04-17 19:00:33',3,1,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (49,5000.00,1,'2018-04-17 20:39:18',3,2,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (50,5000.00,1,'2018-04-17 20:46:44',3,2,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (51,2000.00,1,'2018-04-17 21:11:40',1,12,4,7);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (52,2000.00,1,'2018-04-17 21:30:44',1,12,4,7);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (57,50000.00,1,'2018-04-23 11:16:57',null,11,1,2);
insert into `vehicule`(`id`,`prix`,`occasion`,`date_entree`,`id_stock`,`id_modele`,`id_couleur`,`id_motorisation`) values (58,15000.00,1,'2018-04-23 11:16:57',null,10,4,3);

-- vente
insert into `vente`(`id`,`date_heure`,`id_vendeur`) values (38,'2018-04-20 18:26:01',4);
insert into `vente`(`id`,`date_heure`,`id_vendeur`) values (51,'2018-04-23 11:16:57',4);

-- vehicule vendu
insert into `vehicule_vendu`(`id`,`prix`,`id_vehicule`,`id_vente`) values (8,50000.00,25,38);
insert into `vehicule_vendu`(`id`,`prix`,`id_vehicule`,`id_vente`) values (9,15000.00,30,38);
insert into `vehicule_vendu`(`id`,`prix`,`id_vehicule`,`id_vente`) values (16,50000.00,57,51);
insert into `vehicule_vendu`(`id`,`prix`,`id_vehicule`,`id_vente`) values (17,15000.00,58,51);
