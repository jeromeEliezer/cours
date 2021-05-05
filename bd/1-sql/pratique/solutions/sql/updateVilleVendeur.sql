update vendeur 
	inner join ville on ville.id = vendeur.id_ville 
	set id_ville = (select ville.id from ville where ville.nom = "Saint-Nazaire") 
    where ville.nom = "nantes";
    