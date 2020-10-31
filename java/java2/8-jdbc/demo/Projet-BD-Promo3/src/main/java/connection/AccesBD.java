package connection;
 import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 * @author Philippe
 * 	Projet 		: D�mo connexion � MySQL
 * 	BD			: promo3
 *	Date		: 26/09/2018
 *	Version		: 1.0
 *	SDK			: 1.8
 *	Package 	: connection
 *	Classe		: AccesBD.java
 *				  Permet de cr�er et de renvoyer un objet
 *				  de type connexion � une base de donn�es.
 *				  Permet d'ex�cuter des requ�tes de base.
 *
 */
public class AccesBD {


	private static String utilisateur="root";
	private static String motDePasse="";
	private static String pilote = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/promo3";

	/* 	on d�clare un objet de la classe Connection de java.sql
	 * 	Il permet de g�rer la connexion entre notre programme java
	 * 	et la base de donn�es.
	 */
	private static Connection connexion=null;

	static
	{
		try
		{
			Class.forName(pilote).newInstance();
		}catch (Exception e)
		{

			System.out.println(e);
			JOptionPane.showMessageDialog(null,"Pilote non valide ou introuvable !","AccessBD",JOptionPane.WARNING_MESSAGE);

		}
	}

	/**
	 *
	 * @return Connection connexion
	 */
	public synchronized static Connection getConnection()
	{
		try
		{
			if (connexion==null) connexion = DriverManager.getConnection(url, utilisateur, motDePasse);


		}catch (Exception e)
		{
			System.out.println(e);
			JOptionPane.showMessageDialog(null,e.getMessage(),"Connexion � MySQL",JOptionPane.WARNING_MESSAGE);
		}

		return connexion;
	}

	/**
	 * m�thode de fermeture d'un objet de type connection
	 */

	public static void fermerConnection(Connection connexion)
	{
		if (connexion!=null)
		{
			try
			{
				connexion.close();
			}

			catch(Exception e)
			{
				System.out.println("Fermeture de la Connection Impossible !");
				e.printStackTrace();
			}
		}
	}

	/**
	 * m�thode de fermeture d'un objet de type connection
	 */
	public static void fermerConnection()
	{
		if (connexion!=null)
		{
			try
			{
				connexion.close();
			}

			catch(Exception e)
			{
				System.out.println("Fermeture de la Connection Impossible !");
				e.printStackTrace();
			}
		}
	}
	/**
	 * m�thode de fermeture d'un objet de type Statement
	 */

	public static void fermerStatement(Statement statement)
	{
		if (statement!=null)
		{
			try
			{
				statement.close();
			}

			catch(Exception e)
			{
				System.out.println("Fermeture du Statement Impossible !");
				e.printStackTrace();
			}
		}
	}

	/**
	 * m�thode de fermeture d'un objet de type Statement
	 */

	public static void fermerResultSet(ResultSet resultSet)
	{
		if (resultSet!=null)
		{
			try
			{
				resultSet.close();
			}

			catch(Exception e)
			{
				System.out.println("Fermeture du ResultSet Impossible !");
				e.printStackTrace();
			}
		}
	}

	/**
	 *
	 * @param unUtilisateur String
	 */
	public static void setUtilisateur(String unUtilisateur)
	{
		utilisateur=unUtilisateur;
	}
	/**
	 *
	 * @param unMotDePasse String
	 */
	public static void setMotDePasse(String unMotDePasse)
	{
		motDePasse=unMotDePasse;
	}

	/**
	 *
	 * @return
	 */
	public static String getMotDePasse() {
		return motDePasse;
	}
	/**
	 *
	 * @return
	 */
	public static String getPilote() {
		return pilote;
	}
	/**
	 *
	 * @return
	 */
	public static String getUrl() {
		return url;
	}

	/**
	 *
	 * @return
	 */
	public static String getUtilisateur() {
		return utilisateur;
	}

	/**
	 *	M�thode d'ex�cution d'une requ�te pour renvoyer un objet de type ResultSet
	 *	@param requete String
	 *	@return resultat ResultSet
	 */
	public static ResultSet executerQuery(String requete) throws ClassNotFoundException, SQLException

	{
		/*
		 * 	On d�clare un objet de type Statement que l'on nomme instruction.
		 *  Cet	objet soumet la requ�te � la base de donn�es MySQL.
		 * 	On d�clare un objet de type ResultSet que l'on nomme resultat.
		 *  cet objet est retourn� pour encapsuler les r�sultats de la requ�te.
		 *  Il va nous permettre de manipuler les r�sultats de la requ�te.
		 */
		Statement statement = null;
		ResultSet resultat = null;

		try {


			
			/*
			 * Gestion des curseurs pour la navigation
			 * 
			 * TYPE_SROLL_SENSITIVE :
			 * TYPE_SCROLL_INSENSITIVE :
			 * Cette valeur indique que le curseur peut �tre d�plac� dans les deux sens,
			 * mais aussi arbitrairement (de mani�re absolue ou relative).
			 * Le terme insensitive indique que le ResultSet est insensible aux modifications
			 * des valeurs dans la base de donn�es. Cela d�finit en fait une vue statique des donn�es
			 * contenues dans le ResultSet.
			 *
			 * CONCUR_UPDATABLE :
			 * Cette valeur indique que l'on peut modifier les donn�es de la base via le ResultSet.
			 */

			int type = ResultSet.TYPE_SCROLL_SENSITIVE;
			int mode = ResultSet.CONCUR_UPDATABLE;

			/* 	On peut traduire Statement par ordre ou instruction.
			 * 	La m�thode createStatement() nous retourne un objet de type Statement.
			 * 	Nous l'avons appel� avec la m�thode getConnection() qui nous renvoie un objet de type Connexion.
			 * 	D�s lors, nous pouvons utiliser l'objet instruction pour interroger la base de donn�es MySQL.
			 *
			 */
			
			statement = getConnection().createStatement(type,mode);
			
			/*	Pour cela, il nous suffit d'appeler la m�thode executeQuery() en lui passant
			 * 	comme param�tre, la requete que nous voulons ex�cuter.
			 * 	L'objet resultat contient le r�sultat de l'ex�cution de la requ�te.
			 */

			resultat = statement.executeQuery(requete);

		}

		catch(SQLException e)
		{

			e.printStackTrace();
			System.exit(-1);
		}
		return resultat;


	}

	/**
	 *	M�thode d'ex�cution d'une requete de mise � jour qui ne renvoie rien
	 *	@param requete String
	 */
	public static void executerUpdate(String requete) throws ClassNotFoundException, SQLException

	{
		Statement statement = null;

		try {
			statement = getConnection().createStatement();
			int i = statement.executeUpdate(requete);

			if (i==1) // on affiche un message d'information sur l'op�ration pour le plaisir !

			{
				JOptionPane.showMessageDialog(null, "L'op�ration a r�ussi !");
			}
			else
			{
				JOptionPane.showMessageDialog(null, "L'op�ration a �chou� !");
			}
		}

		catch(SQLException e)
		{

			e.printStackTrace();
			System.exit(-1);
		}
	}

	/**
	 * Pour tester la connection
	 * @param args
	 */
	public static void main(String[] args)
	{
		Connection connnect = AccesBD.getConnection();
		if (connnect!=null)
		{
			JOptionPane.showMessageDialog(null, "Youpi, �a marche");
		}
		else
		{
			JOptionPane.showMessageDialog(null, "�a ne marche PAS !");
		}

	}




}
