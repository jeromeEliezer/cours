select *
	from stock
    inner join ville on ville.id = stock.id_ville
    inner join vehicule on stock.id = vehicule.id_stock
    where ville.nom = "nantes"
    