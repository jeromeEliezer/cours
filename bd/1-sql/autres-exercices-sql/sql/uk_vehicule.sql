select *
	from vehicule
    left join modele on modele.id = vehicule.id_modele
    left join couleur on couleur.id = vehicule.id_couleur
    left join motorisation on motorisation.id = vehicule.id_motorisation
    left join carburant on carburant.id = motorisation.id_carburant
	where modele.nom = 'Kangoo'
    and   modele.marque = 'RENAULT'
    and   modele.annee = 2017
    and   couleur.nom = 'blanc'
    and   motorisation.cylindree = 1200
	and   motorisation.chevaux = 6
	and   carburant.nom = 'essence'
    and   vehicule.occasion = true
    and   vehicule.date_entree = '2018-03-18 12:52:28'

    