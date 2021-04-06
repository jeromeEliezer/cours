select vendeur.nom as 'nom', vendeur.prenom as 'prénom', ville.nom as 'ville' 
	from vendeur 
    join ville on ville.id = vendeur.id_ville