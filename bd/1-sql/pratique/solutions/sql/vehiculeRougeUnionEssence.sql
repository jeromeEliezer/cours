select distinct modele.marque as 'marque',
       modele.nom as 'modele',
       modele.annee as 'annee',
       vehicule.prix 
	from vehicule
    left join modele on modele.id = vehicule.id_modele
	left join couleur on couleur.id = vehicule.id_couleur
    where couleur.nom = "rouge"
union    
select distinct modele.marque as 'marque',
       modele.nom as 'modele',
       modele.annee as 'annee',
       vehicule.prix
	from vehicule
    left join modele on modele.id = vehicule.id_modele
    left join motorisation on motorisation.id = vehicule.id_motorisation
    left join carburant on carburant.id = motorisation.id_carburant
    where carburant.nom = "essence"
    