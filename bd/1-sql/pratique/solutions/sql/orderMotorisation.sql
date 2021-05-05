select * from motorisation
		inner join carburant on carburant.id = motorisation.id_carburant
        order by carburant.nom, motorisation.Chevaux, motorisation.cylindree