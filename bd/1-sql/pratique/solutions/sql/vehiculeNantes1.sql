select *
	from vehicule
    inner join stock on stock.id = vehicule.id_stock
    inner join ville on ville.id = stock.id_ville
    where ville.nom = "nantes"
    