-- dans cette solution, il n'y a pas de clause where, la selection se fait grace au inner
select vehicule.*, stock.entrepot
	from vehicule
    inner join stock on stock.id = vehicule.id_stock
    