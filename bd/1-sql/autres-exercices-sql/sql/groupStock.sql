select stock.entrepot, modele.marque, modele.nom, COUNT(vehicule.id) as 'nb vehicules'
        from stock
        inner join vehicule on vehicule.id_stock = stock.id
        inner join modele on modele.id = vehicule.id_modele
        group by stock.entrepot, modele.marque, modele.nom