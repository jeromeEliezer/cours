-- modele
set @nomModele = 'A8', @marqueModele = 'AUDI', @anneeModele = '2007';
set @idModele = (select modele.id from modele
										where modele.nom = @nomModele
										and   modele.marque = @marqueModele
                                        and   modele.annee = @anneeModele);

-- motorisation
set @carburant = 'essence', @cylindree = '1600', @chevaux = '7';
set @idmotorisation = (select motorisation.id from motorisation
												inner join carburant on carburant.id = motorisation.id_carburant
												where motorisation.cylindree = @cylindree
												and   motorisation.Chevaux = @chevaux
												and   carburant.nom = @carburant);

-- couleur
set @couleur = 'rouge';
set @idCouleur = (select couleur.id from couleur where couleur.nom = @couleur); 

-- prix
set @prix = '5000';

-- occassion
set @occas = true;

-- stock
set @stock = 'VA1';
set @idStock = (select stock.id from stock where stock.entrepot = @stock); 


-- insert
insert into vehicule (prix, occasion, id_stock, id_modele, id_couleur, id_motorisation) 
	values (@prix, @occas, @idStock, @idModele, @idCouleur, @idMotorisation);
                                        