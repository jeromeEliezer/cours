set @nom = "Leclerc";
set @id_vendeur = (select id from vendeur where nom like @nom);
select @id_vendeur;