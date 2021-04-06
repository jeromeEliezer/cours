select vehicule.prix, vehicule.occasion, vehicule.date_entree,
       couleur.nom,
       stock.entrepot,
       ville.nom,
       modele.marque,
       modele.nom,
       modele.annee,
       motorisation.Chevaux,
       motorisation.cylindree,
       carburant.nom
	from vehicule
	left join couleur on couleur.id = vehicule.id_couleur
    left join stock on stock.id = vehicule.id_stock
    left join ville on ville.id = stock.id_ville
    left join modele on modele.id = vehicule.id_modele
    left join motorisation on motorisation.id = vehicule.id_motorisation
    left join carburant on carburant.id = motorisation.id_carburant
    order by modele.marque,
			 modele.nom,
             modele.annee desc,
             couleur.nom,
             carburant.nom,
             vehicule.prix desc;

    