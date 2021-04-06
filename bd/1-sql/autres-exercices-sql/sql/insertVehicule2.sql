-- script de creation d(un vehicule et de ses enregistrements le composant 
set @nomModele = '4L', @marqueModele = 'RENAULT', @anneeModele = '1970';
set @carburant = 'essence', @cylindree = '1200', @chevaux = '4';
set @couleur = 'blanc';
set @prix = '2000';
set @occas = true;
set @stock = 'NA1';

-- modele
insert ignore into modele (nom, marque, annee) values (@nomModele, @marqueModele, @anneeModele);
set @idModele = (select modele.id from modele
										where modele.nom = @nomModele
										and   modele.marque = @marqueModele
                                        and   modele.annee = @anneeModele);

-- carburant
insert ignore into carburant (nom) values(@carburant);
set @idCarburant = (select id from carburant where carburant.nom = @carburant);

-- motorisation
insert ignore into motorisation (cylindree, chevaux, id_carburant) 	values (@cylindree, @chevaux, @idCarburant);
set @idmotorisation = (select motorisation.id from motorisation
												inner join carburant on carburant.id = motorisation.id_carburant
												where motorisation.cylindree = @cylindree
												and   motorisation.chevaux = @chevaux
												and   carburant.nom = @carburant);

-- couleur
insert ignore into couleur (nom) values(@couleur);
set @idCouleur = (select couleur.id from couleur where couleur.nom = @couleur); 


-- stock
set @idStock = (select stock.id from stock where stock.entrepot = @stock); 


-- insert
insert into vehicule (prix, occasion, id_stock, id_modele, id_couleur, id_motorisation) 
	values (@prix, @occas, @idStock, @idModele, @idCouleur, @idMotorisation);
                                        