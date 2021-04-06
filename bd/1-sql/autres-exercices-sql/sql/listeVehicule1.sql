select *
	from vehicule
	left join couleur on couleur.id = vehicule.id_couleur
    left join stock on stock.id = vehicule.id_stock
    left join ville on ville.id = stock.id_ville
    left join modele on modele.id = vehicule.id_modele
    left join motorisation on motorisation.id = vehicule.id_motorisation
    left join carburant on carburant.id = motorisation.id_carburant;
    