/*
   creation d'une vente avec plusieurs vehicules
*/

drop procedure if exists main;    
drop procedure if exists vente;
drop procedure if exists ajout_vehicule;
drop function if exists get_id_vehicule;
drop table if exists tmp_vehicule;     

-- table temporaire (equivalent d'une arrayList)
create temporary table tmp_vehicule (
	id INT(11),
	prix DECIMAL(8,2));

/*
  procedure principale
  C'est dans cette procedure qu'on renseigne le vendeur, et les vehicules qu'il a vendus.
*/

DELIMITER $$
create procedure main ()
begin                               
	declare v_nom_vendeur varchar(45);
	declare v_prenom_vendeur varchar(45);
	
    -- Vendeur 
    -- >>>>>>>>>>>>>>>>
    set v_nom_vendeur = 'Lepine';
	set v_prenom_vendeur = 'Julie';
    -- <<<<<<<<<<<<<<<<<
    
    -- Vehicules
    -- nomModele, marqueModele, anneeModele, carburant, cylindree, chevaux, couleur, occasion, date_entree, prix
    -- >>>>>>>>>>>>>>>>
    call ajout_vehicule('Captur', 'RENAULT', 2017, 'essence', 1600, 7, 'rouge', true, '2018-03-18 12:52:28', 50000 );
    call ajout_vehicule('Kangoo', 'RENAULT', 2017, 'essence', 1200, 6, 'blanc', true, '2018-03-18 12:52:28', 15000 );
    -- <<<<<<<<<<<<<<<<<
    
    -- maj dans la base de la vente
    call vente(v_nom_vendeur, v_prenom_vendeur);

end$$
DELIMITER ;

/*
   ajout d'un vehicule dans la table temporaire
*/
DELIMITER $$
create procedure ajout_vehicule (p_nomModele varchar(45), p_marqueModele varchar(45), p_anneeModele int, 
							       p_carburant varchar(45), p_cylindree int, p_chevaux int, 
                                   p_couleur varchar(45), p_occasion int, p_date_entree timestamp, p_prix decimal)
begin                               
	declare v_id int;
    set v_id = get_id_vehicule(p_nomModele, p_marqueModele, p_anneeModele, p_carburant, p_cylindree, p_chevaux, 
								p_couleur, p_occasion, p_date_entree);
    insert into tmp_vehicule (id, prix) values (v_id, p_prix);
    
end$$
DELIMITER ;

/* recherche de l'id d'un vehicule
*/
DELIMITER $$
create function get_id_vehicule (p_nomModele varchar(45), p_marqueModele varchar(45), p_anneeModele int, 
							   p_carburant varchar(45), p_cylindree int, p_chevaux int, 
                               p_couleur varchar(45), p_occasion int, p_date_entree timestamp
                               ) returns int
begin
	return (select vehicule.id from vehicule
								inner join modele on modele.id = vehicule.id_modele
								inner join motorisation on motorisation.id = vehicule.id_motorisation
								inner join carburant on carburant.id = motorisation.id_carburant
								inner join couleur on couleur.id = vehicule.id_couleur
								where vehicule.date_entree = p_date_entree
								and   vehicule.occasion = p_occasion
								and   modele.nom = p_nomModele
								and   modele.marque = p_marqueModele
								and   modele.annee = p_anneeModele
								and   motorisation.cylindree = p_cylindree
								and   motorisation.Chevaux = p_chevaux
								and   carburant.nom = p_carburant
								and   couleur.nom = p_couleur);

end$$
DELIMITER ;

/*
  creation dans la BD
*/
DELIMITER $$
CREATE PROCEDURE vente(p_nom_vendeur varchar(45), p_prenom_vendeur varchar(45))
BEGIN
	declare v_id_vendeur int;
	declare v_id_vente int;
    declare v_date_vente timestamp;

    -- SQL exception => roolback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any changes made in the transaction
        RESIGNAL;  -- raise again the sql exception to the caller
    END;

    
    START TRANSACTION;

	set v_date_vente = now();
    
    -- id vendeur
    select id into v_id_vendeur from vendeur where nom = p_nom_vendeur and prenom = p_prenom_vendeur;

    -- entete vente
    insert into vente (date_heure, id_vendeur) values (v_date_vente, v_id_vendeur);
    select id into v_id_vente from vente where vente.date_heure = v_date_vente and vente.id_vendeur = v_id_vendeur;

    -- creation des vehicules vendus
    Insert into  vehicule_vendu (prix, id_vehicule, id_vente) 
            select tmp_vehicule.prix, tmp_vehicule.id, v_id_vente from tmp_vehicule;
        
    -- fin transaction
    COMMIT;
    
END$$
DELIMITER ;

-- appel de la procedure stockee
call main();
                  
-- suppression des procedures
drop procedure main;    
drop procedure vente;
drop procedure ajout_vehicule;
drop function get_id_vehicule;
