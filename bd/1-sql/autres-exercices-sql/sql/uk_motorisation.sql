select * from motorisation
		inner join carburant on carburant.id = motorisation.id_carburant
		where motorisation.cylindree = 1600
		and   motorisation.chevaux = 7
		and   carburant.nom = 'essence'