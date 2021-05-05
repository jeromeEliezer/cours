select vendeur.nom, vendeur.prenom, responsable.nom as 'responsable'
	from vendeur 
    left join vendeur as responsable on responsable.id = vendeur.id_responsable