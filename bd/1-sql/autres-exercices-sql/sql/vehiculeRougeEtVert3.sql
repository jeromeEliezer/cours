select *
	from vehicule
	left join couleur on couleur.id = vehicule.id_couleur
    where couleur.nom in ("rouge", "vert")
    