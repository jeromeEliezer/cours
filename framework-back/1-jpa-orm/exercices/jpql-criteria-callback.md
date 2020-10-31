# non terminé

//////////////////// Call back ///////////////



5.5 TP10 – CALLBACK SUR EJB ENTITES

TRAVAIL A REALISER:

On souhaite mettre en œuvre des méthodes callback au sein des EJB. Les callBack permettent d’effectuer des opérations avant ou après une action. Grâce aux annotations les méthodes seront appelées automatiquement.

1.1- Création du projet EJB3 :  TpEJB3_10 

Intégrer dans le nouveau projet  TpEJB3_10 les classes/interface suivantes fournies :
gestion.GestionClientsBean
gestion.GestionClientsRemote
metier.Adresse
metier.Client
metier.Telephone
Contenu du GestionClientRemote :
package gestion;

import java.util.Collection;
import javax.ejb.Remote;
import metier.Adresse;
import metier.Client;
import metier.Telephone;

@Remote
public interface GestionClientsRemote {
    public Client ajoutClient(Client client);
    public Client updateClient(Client client);
    public boolean deleteClient(Client client);
    public void setAdresse(Client client, Adresse adresse);
    public Client findClient(int id);
    public Collection findAllClients();
    public Collection findAllAdresses();
    public boolean ajoutTelephone(int idClient,Telephone numero);
    public boolean enleveTelephone(int idClient,Telephone numero);
    public Collection findAllTelephones();
}


Contenu du GestionClientBean qui implémente l’interface Remote :
A compléter avec les annotations sur les méthodes concernées.
public @Stateless class GestionClientsBean implements GestionClientsRemote {    
    
    @PersistenceContext(unitName="croisiere")
    private EntityManager manager;
    

    
    public void construct(){
    	System.out.println("GestionClientsBean: @PostConstruct");
    }
    
    
    public void destroy(){
    	System.out.println("GestionClientsBean: @PreDestroy");
    }
           
    public Client ajoutClient(Client client){
        manager.persist(client);
        return client;
    }
    
    public Client updateClient(Client client){
        return manager.merge(client);
    }
    
    public boolean deleteClient(Client client){
        Client cl=findClient(client.getId());
        if(cl!=null){
            manager.remove(cl);
            return true;
        }
        return false;
    }
    
    public void setAdresse(Client client, Adresse adresse){
        Client cl=manager.find(Client.class,client.getId());
        Adresse ad=cl.getAdresse();
        if(ad!=null)
        {
        	manager.remove(ad);
        	cl.setAdresse(adresse);
        	adresse.setClient(cl);
        }
    }
    
    public Client findClient(int id){
        return manager.find(Client.class,id);
    }
    
    public Collection findAllClients(){
        Query query=manager.createQuery("SELECT cl FROM Client AS cl");
        return query.getResultList();
    }
    
    public Collection findAllAdresses(){
        Query query=manager.createQuery("SELECT ad FROM Adresse AS ad");
        return query.getResultList();
    }
    
    public boolean ajoutTelephone(int idClient,Telephone numero){
        Client cl=manager.find(Client.class, idClient);
    
        if(cl!=null){
            cl.getTelephones().add(numero);
            return true;
        }else{
            return false;
        }
    }
    
    public boolean enleveTelephone(int idClient,Telephone numero){
        Client cl=manager.find(Client.class,idClient);
        if(cl!=null){
            for(Telephone num:cl.getTelephones()){
                if(num.equals(numero)){
                    cl.getTelephones().remove(num);
                    manager.remove(num);
                    return true;
                }
            }
        }
        return false;
    }
    
    public Collection findAllTelephones(){
        Query query=manager.createQuery("SELECT tel FROM Telephone AS tel");
        return query.getResultList();
        
    }
}

Contenu de la classe Client à compléter avec les annotations de callback :
@Entity
public class Client implements Serializable {
    public static final long serialVersionUID=987654378L;
    
    private int id;
    private String nom;
    private String prenom;
    private Adresse adresse;
    private Collection<Telephone> telephones;
    
    public void prePersist(){
    	System.out.println("Client: @PrePersist");
    }
    
    public void postPersist(){
    	System.out.println("Client: @PostPersist");
    }
    
    public void postLoad(){
    	System.out.println("Client: @PostLoad");
    }
    
    public void preUpdate(){
    	System.out.println("Client: @PreUpdate");
    }
    
    public void postUpdate(){
    	System.out.println("Client: @PostUpdate");
    }
    
    public void preRemove(){
    	System.out.println("Client: @PreRemove");
    }
    
    public void postRemove(){
    	System.out.println("Client: @PostRemove");
    }  
    
    public Client(){
        nom="";
        prenom="";
        telephones=new ArrayList<Telephone>();
    }
    
    public Client(String nom, String prenom){
        this.nom=nom;
        this.prenom=prenom;
        telephones=new ArrayList<Telephone>();
    }
    
    public Client(String nom, String prenom, Adresse adresse){
        this(nom,prenom);
        this.adresse=adresse;
        telephones=new ArrayList<Telephone>();
    }
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getPrenom() {
        return prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    @OneToOne(cascade={CascadeType.ALL})
    @JoinColumn(name="ADDRESS_ID") // ici je dis que je relie à la table adresse avec l'id adresse dans client
    //@PrimaryKeyJoinColumn
    public Adresse getAdresse() {
        return adresse;
    }
    
    public void setAdresse(Adresse adresse) {
        this.adresse = adresse;
    }
    
    @OneToMany(cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
    //@OneToMany(cascade={CascadeType.ALL})  // fetch=FetchType.LAZY par defaut
    //@PrimaryKeyJoinColumn
    public Collection<Telephone> getTelephones() {
        return telephones;
    }
    
    public void setTelephones(Collection<Telephone> telephones) {
        this.telephones = telephones;
    }
    
    public void affiche(){
        System.out.println(nom+" "+prenom);
    }  
    
    @Override
    public String toString(){
        String s=nom+" "+prenom;;
        if(adresse!=null){
            s+=" "+adresse.toString();
        }
        if(telephones!=null && !telephones.isEmpty()){
            s+=telephones.toString();
        }
        return s;
    }
}

Contenu de la classe Adresse :
@Entity
public class Adresse implements Serializable {
    public static final long serialVersionUID=987654378L;
    
    private int id;
    private String voie;
    private String complement;
    private String codePostal;
    private String ville;
    private String pays;
    private Client client;
    
        public void prePersist(){
    	System.out.println("Adresse: @PrePersist");
    }
    
        public void postPersist(){
    	System.out.println("Adresse: @PostPersist");
    }
    
    public void postLoad(){
    	System.out.println("Adresse: @PostLoad");
    }
    
    public void preUpdate(){
    	System.out.println("Adresse: @PreUpdate");
    }
    
    public void postUpdate(){
    	System.out.println("Adresse: @PostUpdate");
    }
    
    public void preRemove(){
    	System.out.println("Adresse: @PreRemove");
    }
    
    
    public void postRemove(){
    	System.out.println("Adresse: @PostRemove");
    }
    
    public Adresse(){
        id=0;
        voie="";
        complement="";
        codePostal="";
        ville="";
        pays="";
    }
    
    public Adresse(String voie, String complement, String codePostal, String ville, String pays){
        this.id=0;
        this.voie=voie;
        this.complement=complement;
        this.codePostal=codePostal;
        this.ville=ville;
        this.pays=pays;
    }
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getVoie() {
        return voie;
    }
    
    public void setVoie(String voie) {
        this.voie = voie;
    }
    
    public String getComplement() {
        return complement;
    }
    
    public void setComplement(String complement) {
        this.complement = complement;
    }
    
    public String getCodePostal() {
        return codePostal;
    }
    
    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }
    
    public String getVille() {
        return ville;
    }
    
    public void setVille(String ville) {
        this.ville = ville;
    }
    
    public String getPays() {
        return pays;
    }
    
    public void setPays(String pays) {
        this.pays = pays;
    }
    
    @OneToOne(mappedBy="adresse")
    public Client getClient() {
        return client;
    }
    
    public void setClient(Client client) {
        this.client = client;
    }
    
    @Override
    public String toString(){
        return "Adresse : "+id+" "+voie+" "+complement+" "+codePostal+" "+ville+" "+pays;
    }
}


Contenu de la classe Telephone :
@Entity
public class Telephone implements Serializable  {
    public static final long serialVersionUID=987654378L;
    
    private int id;
    private String numero;
    private int type;
 //   private Client client;
    
    
    public void prePersist(){
    	System.out.println("Telephone: @PrePersist");
    }
    
    
    public void postPersist(){
    	System.out.println("Telephone: @PostPersist");
    }
    
    
    public void postLoad(){
    	System.out.println("Telephone: @PostLoad");
    }
    
    
    public void preUpdate(){
    	System.out.println("Telephone: @PreUpdate");
    }
    
    
    public void postUpdate(){
    	System.out.println("Telephone: @PostUpdate");
    }
    
    
    public void preRemove(){
    	System.out.println("Telephone: @PreRemove");
    }
    
    @PostRemove
    public void postRemove(){
    	System.out.println("Telephone: @PostRemove");
    }
    
    public Telephone(){
        id=0;
        numero="";
        type=0;
    }
    
    public Telephone(String numero){
        id=0;
        this.numero=numero;
        type=0;
    }
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNumero() {
        return numero;
    }
    
    public void setNumero(String numero) {
        this.numero = numero;
    }
    
    public int getType() {
        return type;
    }
    
    public void setType(int type) {
        this.type = type;
    }
    
    @Override
    public boolean equals(Object obj){
        if(! (obj instanceof Telephone)){
            return false;
        }else{
            Telephone t=(Telephone)obj;
            return numero.equals(t.numero) && type==t.type ;
        }
    }
    
    @Override
    public String toString(){
        return "Telephone : "+id+" tel: "+numero+" ("+type+")";
    }
/*
	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
*/
    
    
    
}


1.2- Ajout de méthodes callback sur les EJB entités

Dans chaque EJB entité, ajouter des méthodes callback affichant un message
Les méthodes seront annotées comme suit :

Pour les beans entité :
    @PrePersist
    @PostPersist
    @PostLoad
    @PreUpdate
    @PostUpdate
    @PreRemove
    @PostRemove

Pour les EJB session stateless:
    @PostConstruct   
    @PreDestroy

Tables générées dans la base de données MySQL :
CREATE TABLE `adresse` (
  `ID` int(11) NOT NULL,
  `CODEPOSTAL` varchar(255) DEFAULT NULL,
  `COMPLEMENT` varchar(255) DEFAULT NULL,
  `PAYS` varchar(255) DEFAULT NULL,
  `VILLE` varchar(255) DEFAULT NULL,
  `VOIE` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `client` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `client_telephone` (
  `Client_ID` int(11) NOT NULL,
  `telephones_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

CREATE TABLE `telephone` (
  `ID` int(11) NOT NULL,
  `NUMERO` varchar(255) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `adresse`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CLIENT_ADDRESS_ID` (`ADDRESS_ID`);

ALTER TABLE `client_telephone`
  ADD PRIMARY KEY (`Client_ID`,`telephones_ID`),
  ADD KEY `FK_CLIENT_TELEPHONE_telephones_ID` (`telephones_ID`);

ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

ALTER TABLE `telephone`
  ADD PRIMARY KEY (`ID`);

1.3- Création d’un client de test pour les EJB 

Créer un projet TpEJB3_10Client contenant la classe suivante :
public class CroisiereClient {
 private static final String JNDI_CLIENT="gestion.GestionClientsRemote";  
    
    public static void main(String[] args) {
    	InitialContext ic;
		try
		{
		//Properties properties = new Properties();
		//properties.setProperty("org.omg.CORBA.ORBInitialHost", "localhost"); 
		//properties.setProperty("org.omg.CORBA.ORBInitialPort", "3700"); 
		ic = new InitialContext();
			
            GestionClientsRemote gestion=(GestionClientsRemote)ic.lookup(JNDI_CLIENT);
            
            Adresse adresse1=new Adresse("5, rue du Renard","","75015","PARIS","FRANCE");
            Client client1=new Client("MARTIN","Jean");
            client1=gestion.ajoutClient(client1);
            
            Adresse adresse2=new Adresse("5, rue du Renard","","75015","PARIS","FRANCE");
            Client client2=new Client("DUPONT","sophie",adresse2);
            adresse2.setClient(client2);
            client2=gestion.ajoutClient(client2);
            
            Adresse adresse3=new Adresse("20, boulevard Gambetta","","78300","POISSY","FRANCE");
            Client client3=new Client("DURAND","Pierre",adresse3);
            adresse3.setClient(client3);
            client3=gestion.ajoutClient(client3);
            
            Adresse adresse4=new Adresse("29, boulevard Devaux","","78300","POISSY","FRANCE");
            Client client4=new Client("MADEC","Denis",adresse4);
            adresse4.setClient(client4);
            client4=gestion.ajoutClient(client4);
            
            System.out.println();
            System.out.println("liste de tous les clients:");
            Collection liste=gestion.findAllClients();
            affiche(liste);
            
            System.out.println();
            System.out.println("MARTIN Jean habite désormais avec DUPONT Sophie");
            client1.setAdresse(adresse1);
            adresse1.setClient(client1);
            gestion.updateClient(client1);
            
            System.out.println();
            System.out.println("DURAND Pierre change d'adresse");
            //client3.setAdresse(new Adresse("6 place de l'eglise","","35740","PACE","FRANCE"));
            //gestion.updateClient(client3); // l'ancienne adresse existe toujours en base de données !
            
            // meilleure solution: l'ancienne adresse est détruite
            Adresse adresse5=new Adresse("6 place de l'église","","35740","PACE","FRANCE");
            gestion.setAdresse(client3,adresse5);
            
            System.out.println();
            System.out.println("MADEC Denis se desinscrit");
            gestion.deleteClient(client4);
            
            System.out.println();
            System.out.println("liste de toutes les adresses, et les clients associés:");
            liste=gestion.findAllAdresses();
            Iterator it=liste.iterator();
            while(it.hasNext()){
                Adresse ad=(Adresse)it.next();
                System.out.print(ad+"  client: ");
                Client cl=ad.getClient();
                if(cl!=null)
                    cl.affiche();
                else
                    System.out.println();
            }
            
            System.out.println();
            Telephone tel1=new Telephone("01 43 65 87 34");
            System.out.println("le numero "+tel1+" est ajouté au client "+client1);
            gestion.ajoutTelephone(client1.getId(),tel1);
            
            Telephone tel2=new Telephone("01 65 34 01 23");
            System.out.println("le numero "+tel2+" est ajouté au client "+client2);
            gestion.ajoutTelephone(client2.getId(),tel2);
            
            Telephone tel3=new Telephone("02 78 99 41 73");
            System.out.println("le numero "+tel3+" est ajouté au client "+client3);
            gestion.ajoutTelephone(client3.getId(),tel3);
            
            Telephone tel4=new Telephone("02 65 98 23 08");
            System.out.println("le numero "+tel4+" est ajouté au client "+client3);
            gestion.ajoutTelephone(client3.getId(),tel4);
            
            System.out.println("liste de tous les clients :");
            liste=gestion.findAllClients();
            affiche(liste);
            
            System.out.println();
            System.out.println("le numero "+tel2+" est supprimé du client "+client2);
            gestion.enleveTelephone(client2.getId(),tel2);
            
            System.out.println("liste de tous les clients:");
            liste=gestion.findAllClients();
            affiche(liste);
            
        }catch(NamingException e){
            e.printStackTrace();
            System.err.println("Problème d'accès a JNDI");
        }
    }
    
    private static void affiche(Collection liste){
        Iterator it=liste.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
}
1.4- Exécution de l'application cliente
Lancer l’application cliente et vérifier les messages affichés dans la console du serveur
Voici la structure des tables que vous obtenez ainsi que les contenus

INSERT INTO `adresse` (`ID`, `CODEPOSTAL`, `COMPLEMENT`, `PAYS`, `VILLE`, `VOIE`) VALUES
(3, '75015', '', 'FRANCE', 'PARIS', '5, rue du Renard'),
(8, '75015', '', 'FRANCE', 'PARIS', '5, rue du Renard'),
(9, '35740', '', 'FRANCE', 'PACE', '6 place de l''église');

INSERT INTO `client` (`ID`, `NOM`, `PRENOM`, `ADDRESS_ID`) VALUES
(1, 'MARTIN', 'Jean', 8),
(2, 'DUPONT', 'sophie', 3),
(4, 'DURAND', 'Pierre', 9);

INSERT INTO `client_telephone` (`Client_ID`, `telephones_ID`) VALUES
(1, 10),
(4, 12),
(4, 13);

INSERT INTO `telephone` (`ID`, `NUMERO`, `TYPE`) VALUES
(10, '01 43 65 87 34', 0),
(12, '02 78 99 41 73', 0),
(13, '02 65 98 23 08', 0);

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '50');

Résultats en console client :


liste de tous les clients:
MARTIN Jean
DUPONT sophie Adresse : 3 5, rue du Renard  75015 PARIS FRANCE
DURAND Pierre Adresse : 5 20, boulevard Gambetta  78300 POISSY FRANCE
MADEC Denis Adresse : 7 29, boulevard Devaux  78300 POISSY FRANCE

MARTIN Jean habite désormais avec DUPONT Sophie

DURAND Pierre change d'adresse

MADEC Denis se desinscrit

liste de toutes les adresses, et les clients associés:
Adresse : 3 5, rue du Renard  75015 PARIS FRANCE  client : DUPONT sophie
Adresse : 8 5, rue du Renard  75015 PARIS FRANCE  client : MARTIN Jean
Adresse : 9 6 place de l'église  35740 PACE FRANCE  client : DURAND Pierre

le numero Telephone : 0 tel: 01 43 65 87 34 (0) est ajouté au client MARTIN Jean Adresse : 0 5, rue du Renard  75015 PARIS FRANCE
le numero Telephone : 0 tel: 01 65 34 01 23 (0) est ajouté au client DUPONT sophie Adresse : 3 5, rue du Renard  75015 PARIS FRANCE
le numero Telephone : 0 tel: 02 78 99 41 73 (0) est ajouté au client DURAND Pierre Adresse : 5 20, boulevard Gambetta  78300 POISSY FRANCE
le numero Telephone : 0 tel: 02 65 98 23 08 (0) est ajouté au client DURAND Pierre Adresse : 5 20, boulevard Gambetta  78300 POISSY FRANCE
liste de tous les clients :
MARTIN Jean Adresse : 8 5, rue du Renard  75015 PARIS FRANCE[Telephone : 10 tel: 01 43 65 87 34 (0)]
DUPONT sophie Adresse : 3 5, rue du Renard  75015 PARIS FRANCE[Telephone : 11 tel: 01 65 34 01 23 (0)]
DURAND Pierre Adresse : 9 6 place de l'église  35740 PACE FRANCE[Telephone : 12 tel: 02 78 99 41 73 (0), Telephone : 13 tel: 02 65 98 23 08 (0)]

le numero Telephone : 0 tel: 01 65 34 01 23 (0) est supprimé du client DUPONT sophie Adresse : 3 5, rue du Renard  75015 PARIS FRANCE
liste de tous les clients:
MARTIN Jean Adresse : 8 5, rue du Renard  75015 PARIS FRANCE[Telephone : 10 tel: 01 43 65 87 34 (0)]
DUPONT sophie Adresse : 3 5, rue du Renard  75015 PARIS FRANCE
DURAND Pierre Adresse : 9 6 place de l'église  35740 PACE FRANCE[Telephone : 12 tel: 02 78 99 41 73 (0), Telephone : 13 tel: 02 65 98 23 08 (0)]



/////// transaction /////

## Transactions 

11 TP14 – EJB ET TRANSACTIONS

TRAVAIL A REALISER:

On souhaite vérifier l’effet des transactions. Le principe d’une transaction consiste à exécuter plusieurs requêtes au sein d’un processus de sorte que soit tout se passe bien et l’opération est validée soit cela se passe mal et toutes les requêtes sont annulées. Ainsi, on revient à l’état précédent comme s’il n’y avait pas eu de transaction.
Comme vous l’avez certainement découvert l’an dernier, les propriétés d’une transaction doivent être ACID (Atomicité, Cohérence, Isolation et Durabilité). Heureusement, tout ceci est géré par les conteneurs ou les frameworks pour que nous puissions nous concentrer sur les tâches métiers.

1.1- Création du projet EJB3 :  TpEJB3_14 

Créer le nouveau projet  TpEJB3_14 et y recopier le contenu du projet  TpEJB3_13_2

1.2- Modification de l’EJB session stateless GestionClients

Modifier l’EJB session stateless GestionClients afin qu’une de ses méthodes lance une exception lorsqu’un EJB Entité particulier est reçu par la méthode, par exemple : 

    public boolean deleteClient(Client client){
        Client cl=findClient(client.getId());
        if(cl!=null){
            manager.remove(cl);
            if(client.getPrenom().equals("Denis"))
                throw new EJBException();
            return true;
        }
        return false;
    }

Par défaut, l’attribut transactionnel sur les méthodes de GestionClients est @TransactionAttribute(TransactionAttributeType.REQUIRED).

Les autres constantes possibles de TransactionAttributeType sont :

- MANDATORY (nécéssite une transaction, si l’appelant n’a pas de transaction, ça lève une exception)
- NEVER (refuse toute transaction. Si l’appelant est dans une transaction, ça lève une exception)
- NOT_SUPPORTED (aucune transaction ne sera créée)
- REQUIRES_NEW (suspend celle en cours et en lance une nouvelle)
- SUPPORTS (ne démarre pas de nouvelle transaction mais en lance une nouvelle)

1.3- Création d’un client de test pour l’EJB session GestionClients et les beans entités 

Créer un projet  TpEJB3_14Client et y rajouter la classe client.CroisiereClient comme par exemple ci-dessous :

public class CroisiereClient {
  private static final String JNDI_CLIENT="gestion.GestionClientsRemote";    
    public static void main(String[] args) {
        try {
            InitialContext ic=new InitialContext();
           
            GestionClientsRemote gestion=(GestionClientsRemote)ic.lookup(JNDI_CLIENT);
            
            Adresse adresse1=new Adresse("5, rue du Renard","","75015","PARIS","FRANCE");
            Client client1=new Client("MARTIN","Jean");
            client1=gestion.ajoutClient(client1);
            
            Adresse adresse2=new Adresse("5, rue du Renard","","75015","PARIS","FRANCE");
            Client client2=new Client("DUPONT","sophie",adresse2);
            adresse2.setClient(client2);
            client2=gestion.ajoutClient(client2);
            
            Adresse adresse3=new Adresse("20, boulevard Gambetta","","78300","POISSY","FRANCE");
            Client client3=new Client("DURAND","Pierre",adresse3);
            adresse3.setClient(client3);
            client3=gestion.ajoutClient(client3);
            
            Adresse adresse4=new Adresse("29, boulevard Devaux","","78300","POISSY","FRANCE");
            Client client4=new Client("MADEC","Denis",adresse4);
            adresse4.setClient(client4);
            client4=gestion.ajoutClient(client4);
            
            System.out.println();
            System.out.println("liste de tous les clients:");
            Collection liste=gestion.findAllClients();
            affiche(liste);
            
            System.out.println();
            System.out.println("MARTIN Jean habite desormais avec DUPONT Sophie");
            client1.setAdresse(adresse1);
            adresse1.setClient(client1);
            gestion.updateClient(client1);
            
            System.out.println();
            System.out.println("DURAND Pierre change d'adresse");
            //client3.setAdresse(new Adresse("6 place de l'eglise","","35740","PACE","FRANCE"));
            //gestion.updateClient(client3); // l'ancienne adresse existe toujours en base de données !
            
            // meilleure solution: l'ancienne adresse est détruite
            Adresse adresse5=new Adresse("6 place de l'eglise","","35740","PACE","FRANCE");
            gestion.setAdresse(client3,adresse5);
                
            try {
                System.out.println();
                System.out.println("MADEC Denis se desinscrit");
                gestion.deleteClient(client4);
            }catch(Exception e){
                e.printStackTrace();
                System.err.println("EJB Exception");
            }
            
            System.out.println();
            System.out.println("liste de toutes les adresses, et les clients associés:");
            liste=gestion.findAllAdresses();
            Iterator it=liste.iterator();
            while(it.hasNext()){
                Adresse ad=(Adresse)it.next();
                System.out.print(ad+"  client: ");
                Client cl=ad.getClient();
                if(cl!=null)
                    cl.affiche();
                else
                    System.out.println();
            }
            System.out.println();
            System.out.println("liste de tous les clients:");
            liste=gestion.findAllClients();
            affiche(liste);
            
        }catch(NamingException e){
            e.printStackTrace();
            System.err.println("Probleme d'acces a JNDI");
        }catch(Exception e){
            e.printStackTrace();
            System.err.println("Probleme avec les transactions");
        }
    }
    
    private static void affiche(Collection liste){
        Iterator it=liste.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
}

1.4- Exécution de l'application cliente CroisiereClient

Lancer l’application cliente et vérifier le résultat.



## API criteria

13 TP sur l’utilisation de l’API Criteria

L'API Criteria propose l’utilisation d’objets pour définir les critères d'une requête. Cette API permet de combiner de nombreux critères optionnels pour créer une requête et s’adapte parfaitement pour créer dynamiquement des requêtes à la volée comme c'est le cas par exemple pour des requêtes effectuant des recherches multicritères à partir d'informations fournies par l'utilisateur.

Exemple d’une requête qui utilise 2 critères : le prénom et le nom d’un objet Client :

// on appelle l'objet Builder

CriteriaBuilder builder = manager.getCriteriaBuilder();
// on précise sur quelle Entité (table) on souhaite travailler
CriteriaQuery<Client> requete = builder.createQuery(Client.class);
// ici,la table client
Root<Client> clientRoot = requete.from(Client.class);
		
// on précise les éléments de la requête (ici le prénom et le nom) :
requete.where(builder.and(builder.equal(clientRoot.get("prenom"), client.getPrenom()),builder.equal(clientRoot.get("nom"), client.getNom())));
return manager.createQuery(requete).getSingleResult();


1.1- Création du projet EJB3 : TpEJB3_16 

Copier le contenu du projet  TpEJB3_10 dans le nouveau projet  TpEJB3_16
Ou bien récupérer le projet EJB et Client sur le réseau.