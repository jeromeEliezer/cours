/*
   creation d'une vente avec plusieurs vehicules
   creation des vehicules, motorisation, carburant, si inexistant
*/

drop procedure if exists main;    
drop procedure if exists vente;
drop procedure if exists ajout_vehicule;
drop function if exists get_id_vehicule;
drop table if exists tmp_vehicule;     

-- table temporaire (equivalent d'une arrayList)
create temporary table tmp_vehicule (
    modele VARCHAR(45) NOT NULL,
    marque VARCHAR(45) NOT NULL,
    annee INT NOT NULL,
    carburant VARCHAR(45) NOT NULL,
    cylindree INT NOT NULL,
    chevaux INT NOT NULL,
    couleur VARCHAR(45) NOT NULL,
    occasion TINYINT(1) NOT NULL,
	prix DECIMAL(8,2));

p_nomModele varchar(45), p_marqueModele varchar(45), p_anneeModele int, 
							       p_carburant varchar(45), p_cylindree int, p_chevaux int, 
                                   p_couleur varchar(45), p_occasion int, p_date_entree timestamp, p_prix decimal

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
    -- nomModele, marqueModele, anneeModele, carburant, cylindree, chevaux, couleur, occasion, prix
    -- >>>>>>>>>>>>>>>>>
    call ajout_vehicule('Captur', 'RENAULT', 2017, 'essence', 1600, 7, 'rouge', true, 50000 );
    call ajout_vehicule('Kangoo', 'RENAULT', 2017, 'essence', 1200, 6, 'blanc', true, 15000 );
    -- <<<<<<<<<<<<<<<<<
    
    -- maj dans la base de la vente
    call vente(v_nom_vendeur, v_prenom_vendeur);

end$$
DELIMITER ;

/*******************************************************************************************************************/
/* PROCEDURES
/*******************************************************************************************************************/

/*
   ajout d'un vehicule dans la table temporaire
*/
DELIMITER $$
create procedure ajout_vehicule (p_nomModele varchar(45), p_marqueModele varchar(45), p_anneeModele int, 
							       p_carburant varchar(45), p_cylindree int, p_chevaux int, 
                                   p_couleur varchar(45), p_occasion int, p_prix decimal)
begin                               
    insert into tmp_vehicule (modele, marque, annee, carburant, cylindree, chevaux, couleur, occasion, prix)
        values (p_nomModele, p_marqueModele, p_anneeModele, p_carburant, p_cylindree, p_chevaux, p_couleur, p_occasion, p_prix);
    
end$$
DELIMITER ;

/*
  creation dans la BD
*/
DELIMITER $$
CREATE PROCEDURE vente(p_nom_vendeur varchar(45), p_prenom_vendeur varchar(45))
BEGIN
	-- detection fin de curseur
    declare done INT DEFAULT FALSE;

    -- id
    declare v_id_vendeur int;
	declare v_id_vente int;
	declare v_id_modele int;
	declare v_id_carburant int;
	declare v_id_motorisation int;
	declare v_id_couleur int;
	declare v_id_vehicule int;

	-- variables contenant les valeurs de la base
    declare v_date_vente timestamp;
    declare v_modele varchar(45);
    declare v_marque varchar(45);
    declare v_annee int;
    declare v_carburant varchar(45);
    declare v_cylindree int;
    declare v_chevaux int;
    declare v_couleur varchar(45);
    declare v_occasion int;
    declare v_prix decimal;

    -- curseur pour parcourir une à une les lignes de la table temporaire 
    DECLARE tmp_cursor CURSOR FOR SELECT modele, marque, annee, carburant, cylindree, chevaux, couleur, occasion, prix FROM tmp_vehicule; 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- gestion d'une SQL exception => rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  -- rollback any changes made in the transaction
        RESIGNAL;  -- raise again the sql exception to the caller
    END;

    -- debut transaction
    START TRANSACTION;

	-- date de vente = aujourd'hui
    set v_date_vente = now();
    
    -- creation entete de la vente
    select id into v_id_vendeur from vendeur where nom = p_nom_vendeur and prenom = p_prenom_vendeur;

    insert into vente (date_heure, id_vendeur) values (v_date_vente, v_id_vendeur);
    select id into v_id_vente from vente where vente.date_heure = v_date_vente and vente.id_vendeur = v_id_vendeur;

    -- pour chaque vehicule, creation des differents enregistrements dans les tables
    OPEN tmp_cursor;
    cursor_loop: LOOP
        -- lecture
        FETCH tmp_cursor INTO v_modele, v_marque, v_annee, v_carburant, v_cylindree, v_chevaux, v_couleur, v_occasion, v_prix;
        select v_modele;

        -- fin
        IF done THEN
            LEAVE cursor_loop;
		END IF;

        -- creation du modele
        insert ignore into modele (nom, marque, annee) values (v_modele, v_marque, v_annee);
        set v_id_modele = (select modele.id from modele
										where modele.nom = v_modele
										and   modele.marque = v_marque
                                        and   modele.annee = v_annee);

        -- carburant
        insert ignore into carburant (nom) values(v_carburant);
        set v_id_carburant = (select id from carburant where carburant.nom = v_carburant);

        -- motorisation
        insert ignore into motorisation (cylindree, chevaux, id_carburant) 	values (v_cylindree, v_chevaux, v_id_carburant);
        set v_id_motorisation = (select motorisation.id from motorisation
                                                        inner join carburant on carburant.id = motorisation.id_carburant
                                                        where motorisation.cylindree = v_cylindree
                                                        and   motorisation.chevaux = v_chevaux
                                                        and   carburant.nom = v_carburant);

        -- couleur
        insert ignore into couleur (nom) values(v_couleur);
        set v_id_couleur = (select couleur.id from couleur where couleur.nom = v_couleur); 

        -- vehicule
        insert ignore into vehicule (date_entree, prix, occasion, id_modele, id_couleur, id_motorisation) 
	            values (v_date_vente, v_prix, v_occasion, v_id_modele, v_id_couleur, v_id_motorisation);
        set v_id_vehicule = (select id from vehicule 
                                        where vehicule.date_entree = v_date_vente
                                        and vehicule.occasion = v_occasion
                                        and   vehicule.id_modele = v_id_modele
                                        and   vehicule.id_couleur = v_id_couleur
                                        and   vehicule.id_motorisation = v_id_motorisation);

        -- vehicule vendu 
        insert into vehicule_vendu (prix, id_vehicule, id_vente)
                values (v_prix, v_id_vehicule, v_id_vente);

    END LOOP;
    close tmp_cursor;


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
