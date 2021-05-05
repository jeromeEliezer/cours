select vendeur.nom, vendeur.prenom, ville.nom
	from vendeur 
    left join ville on ville.id = vendeur.id_ville