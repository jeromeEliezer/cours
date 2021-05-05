select *
	from vehicule
    inner join stock on stock.id = vehicule.id_stock
    left join couleur on couleur.id = vehicule.id_couleur
    where couleur.nom like "%u%"
