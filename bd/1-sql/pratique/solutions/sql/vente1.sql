-- caractéristiques du vehicule
set @nomModele = 'A8', @marqueModele = 'AUDI', @anneeModele = '2007';
set @carburant = 'essence', @cylindree = '1600', @chevaux = '7';
set @couleur = 'rouge';
set @occasion = true;
set @date_entree = '2018-04-17 20:46:44';

-- vendeur
set @nom = 'Lepine';
set @prenom = 'Julie';

-- vente
set @prix = '9500';
set @date = now();

-- recherche du vehicule
set @idVehicule = (select vehicule.id from vehicule
										inner join modele on modele.id = vehicule.id_modele
                                        inner join motorisation on motorisation.id = vehicule.id_motorisation
                                        inner join carburant on carburant.id = motorisation.id_carburant
                                        inner join couleur on couleur.id = vehicule.id_couleur
										where vehicule.date_entree = @date_entree
										and   vehicule.occasion = @occasion
                                        and   modele.nom = @nomModele
										and   modele.marque = @marqueModele
                                        and   modele.annee = @anneeModele
                                        and   motorisation.cylindree = @cylindree
                                        and   motorisation.Chevaux = @chevaux
                                        and   carburant.nom = @carburant
                                        and   couleur.nom = @couleur);

-- recherche du vendeur
set @idVendeur = (select id from vendeur where nom = @nom and prenom = @prenom);

-- vente
-- creation d'une procedure stockee pour gerer le rollback en cas d'erreur
DELIMITER $$
CREATE PROCEDURE `sp_vente`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any changes made in the transaction
        RESIGNAL;  -- raise again the sql exception to the caller
    END;

    START TRANSACTION;
    insert into vente (date_heure, id_vendeur) values (@date, @idVendeur);
    set @idVente = (select id from vente where date_heure = @date and id_vendeur = @idVendeur);
    Insert into  vehicule_vendu (prix, id_vehicule, id_vente) values (@prix, @idVehicule, @idVente);
    COMMIT;
END$$
DELIMITER ;

-- appel de la procedure stockee
call sp_vente();
                  
-- suppression de la procedure                  
drop procedure sp_vente;                  