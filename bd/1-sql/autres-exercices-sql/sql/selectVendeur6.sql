select vendeur.nom, vendeur.prenom, ville.nom 
	from vendeur 
    inner join ville on ville.id = vendeur.id_ville