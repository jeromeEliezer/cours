select *
	from vehicule
	left join couleur on couleur.id = vehicule.id_couleur
    where (couleur.nom = "rouge" or couleur.nom = "vert")
    