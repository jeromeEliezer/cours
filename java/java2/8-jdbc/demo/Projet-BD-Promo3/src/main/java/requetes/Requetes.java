package requetes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.AccesBD;
import entites.Apprenant;
import entites.Region;

public class Requetes {
	
	/**
	 * Méthode qui retourne une ArrayList contenant des apprenants
	 * @return ArrayList<Apprenant>
	 */
	public static ArrayList<Apprenant> listeApprenants()

	{
		ArrayList<Apprenant>  apprenants = new ArrayList<Apprenant>();
		String maRequete= "SELECT * FROM apprenant ORDER BY id_apprenant";
		ResultSet resultat=null;
		try
		{
			resultat = AccesBD.executerQuery(maRequete);
			while(resultat.next())
			{
				Apprenant apprenant = new Apprenant();
				apprenant.setIdApprenant(resultat.getInt("id_apprenant"));
				apprenant.setPrenom(resultat.getString("prenom"));
				apprenant.setNom(resultat.getString("nom"));
				apprenant.setDatenaissance(resultat.getDate("datenaissance"));
				apprenant.setEmail(resultat.getString("email"));
				apprenant.setEmailPro(resultat.getString("emailpro"));
				apprenant.setPhoto(resultat.getString("photo"));
				apprenant.setRegion(new Region(resultat.getInt("region_fk")));
				apprenants.add(apprenant);
			}
	
		} catch (ClassNotFoundException e) {
			System.out.println("Oups, problème ! "+e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Oups, problème ! "+e.getMessage());
			e.printStackTrace();
		}
		return apprenants;
	}


	/**
	 * Méthode qui affiche dans la console les apprenants par code région
	 * @param region entier 
	 */
	public static void apprenantsParRegion(int region)

	{
		ResultSet resultat=null;
		PreparedStatement aPreparedStatement=null;
		
		try
		{
		aPreparedStatement = AccesBD.getConnection().prepareStatement("SELECT nom, prenom, email FROM apprenant WHERE region_fk=? ");
		aPreparedStatement.clearParameters();
		aPreparedStatement.setInt(1, region);
				
		resultat = aPreparedStatement.executeQuery();
		
		// boucle pour afficher les résultats :
		while(resultat.next())
		{
			System.out.println(	resultat.getString("nom")+" "+ 
								resultat.getString("prenom")+" "+
								resultat.getString("email"));
		}
		
		
		}
		catch (SQLException e)
		{
			System.out.println("Oups, problème ! "+e.getMessage());
			e.printStackTrace();
		}

	}
	
	/**
	 * Retourne une chaine de caractère correspondant ua libellé de la région
	 * @param id id_region
	 * @return String libellé région 
	 */
	public static String libelleRegion(int id)
	{
		String libelle=null;
		ResultSet resultat = null;
				
		try
		{
			PreparedStatement prepareStatement = AccesBD.getConnection().prepareStatement("SELECT libelle FROM region WHERE id_region=? ");
			prepareStatement.clearParameters();
			prepareStatement.setInt(1, id);
			resultat = prepareStatement.executeQuery();
			resultat.next(); // on se positionne sur l'enregistrement (pointeur BD)
			libelle = resultat.getString("libelle");
			
		} catch (SQLException e) {
			System.out.println("Oups, problème ! "+e.getMessage());
			e.printStackTrace();
		}
		return libelle;

	}

}
