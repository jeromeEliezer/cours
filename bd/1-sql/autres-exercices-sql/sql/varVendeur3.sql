set @nom = "Le";
set @like = concat (@nom, '%');
select * from vendeur where nom like @like;
