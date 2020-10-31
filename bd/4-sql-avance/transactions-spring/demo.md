# Démo de mise en place d'une Transaction avec Spring Boot et JPA/Hibernate - MySQL

## Objectifs

1. Préparer une base de données
2. Créer un projet Spring Boot
3. Configurer votre pom.xml si besoin (pour maven) ou build.gradle (si Gradle)
4. Configurer la Datasource dans application.properties
5. Ajouter l'Entity,  le DAO, le formulaire ou les Repository/JPA
6. Ajouter le Contrôleur
7. Copier les pages HTML (Thymeleaf ou autre)
8. Tester l'application

## Préparer la BD

- Créer la bd "Banque3"
- Utiliser le script ci-dessous pour générer la table

```java
create table BANK_ACCOUNT
(
  ID  BIGINT not null,
  NOM VARCHAR(128) not null,
  SOLDE DOUBLE not null,
PRIMARY KEY (ID)
) ;
insert into Bank_Account(ID, NOM, SOLDE) values (1, 'Jonathan', 1000);
insert into Bank_Account(ID, NOM, SOLDE) values (2, 'Josselin', 2000);
insert into Bank_Account(ID, NOM, SOLDE) values (3, 'Philippe', 3000);
commit;
```

## Créer un projet Spring Boot

Au choix, avec Spring Boot Starter Projet depuis le web ou sous Eclipse avec Maven ou Graddle

Liste des dépendances :

- JPA
- MySQL
- Web
- Thymeleaf

## Configurer la Datasource dans application.properties

```sql
# ===============================
# base de données MySQL
# ===============================
spring.datasource.url=jdbc:mysql://localhost:3306/banque?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
#spring.datasource.url=jdbc:mysql://localhost:3306/banque?useSSL=false
spring.datasource.username=test
spring.datasource.password=test
# spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
# ===============================
# JPA / HIBERNATE
# ===============================
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5Dialect
```

Ajouter :

- Entity CompteBanque.java
- Model CompteBanqueInfo.java
- Repository CompteBanqueDAO.java
- Form SendMoneyForm.java lié au model CompteBanqueInfo.java

Classe CompteBanque.java

```java
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Bank_Account" )
public class CompteBanque {
		@Id
	@GeneratedValue
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "NOM", length = 128, nullable = false)
	private String nom;

	@Column(name = "SOLDE", nullable = false)
	private double solde;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}

	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}

	/**
	 * @return the solde
	 */
	public double getSolde() {
		return solde;
	}

	/**
	 * @param solde the solde to set
	 */
	public void setSolde(double solde) {
		this.solde = solde;
	}
	}
```

Classe CompteBanqueInfo.java :

```java
public class CompteBanqueInfo {

	private Long id;
	private String nom;
	private double solde;

	public CompteBanqueInfo() {

	}

	public CompteBanqueInfo(Long id, String nom, double solde) {
		super();
		this.id = id;
		this.nom = nom;
		this.solde = solde;
	}

	public CompteBanqueInfo(String nom, double solde) {
		super();
		this.nom = nom;
		this.solde = solde;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}

	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}

	/**
	 * @return the solde
	 */
	public double getSolde() {
		return solde;
	}

	/**
	 * @param solde the solde to set
	 */
	public void setSolde(double solde) {
		this.solde = solde;
	}
}
```

## Contrôleur

Classe CompteBanqueController.java

```java
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.bouget.banque.exception.BanqueTransactionException;
import fr.bouget.banque.form.SendMoneyForm;
import fr.bouget.banque.model.CompteBanqueInfo;
import fr.bouget.banque.repository.CompteBanqueDAO;

@Controller
public class CompteBanqueController {

   @Autowired
   private CompteBanqueDAO compteBanqueDAO;

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String showBankAccounts(Model model) {
       List<CompteBanqueInfo> list = compteBanqueDAO.listeComptes();

       model.addAttribute("accountInfos", list);

       return "accountsPage";
   }

   @RequestMapping(value = "/sendMoney", method = RequestMethod.GET)
   public String viewSendMoneyPage(Model model) {
	   List<CompteBanqueInfo> list = compteBanqueDAO.listeComptes();
       model.addAttribute("accountInfos", list);
       
       SendMoneyForm form = new SendMoneyForm(1L, 2L, 700d);
     
       model.addAttribute("sendMoneyForm", form);

       return "sendMoneyPage";
   }

 
   @RequestMapping(value = "/sendMoney", method = RequestMethod.POST)
   public String processSendMoney(Model model, SendMoneyForm sendMoneyForm) {

       System.out.println("Envoyer la somme de : " + sendMoneyForm.getAmount());

       try {
           compteBanqueDAO.sendMoney(sendMoneyForm.getFromAccountId(), sendMoneyForm.getToAccountId(), sendMoneyForm.getAmount());
       } catch (BanqueTransactionException e) {
    	   // on recharge la liste s'il y a une erreur
    	   List<CompteBanqueInfo> list = compteBanqueDAO.listeComptes();
           model.addAttribute("accountInfos", list);
           model.addAttribute("errorMessage", "Error: " + e.getMessage());
           return "/sendMoneyPage";
       }
       return "redirect:/";
   }

}
```

## Gestion des Exceptions spécifiques

Classe BanqueTransactionException.java

```java
public class BanqueTransactionException extends Exception{
     
	private static final long serialVersionUID = 1L;

	public BanqueTransactionException(String message)
    {
        super(message);
    }
     
}
```

Gestion du Bean lié au formulaire : SendMoneyForm.java

```java
public class SendMoneyForm {

	private Long fromAccountId;
	private Long toAccountId;
	private Double amount;

	public SendMoneyForm() {

	}

	public SendMoneyForm(Long fromAccountId, Long toAccountId, Double amount) {
		this.fromAccountId = fromAccountId;
		this.toAccountId = toAccountId;
		this.amount = amount;
	}

	public Long getFromAccountId() {
		return fromAccountId;
	}

	public void setFromAccountId(Long fromAccountId) {
		this.fromAccountId = fromAccountId;
	}

	public Long getToAccountId() {
		return toAccountId;
	}

	public void setToAccountId(Long toAccountId) {
		this.toAccountId = toAccountId;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
}
```

## DAO ou Repository : CompteBanqueDAO.java

```java
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import fr.bouget.banque.exception.BanqueTransactionException;
import fr.bouget.banque.model.CompteBanque;
import fr.bouget.banque.model.CompteBanqueInfo;
 
@Repository
public class CompteBanqueDAO {
 
    @Autowired
    private EntityManager entityManager;
      
 
    public CompteBanqueDAO() {
    }
 
    public CompteBanque findById(Long id) { 
        return this.entityManager.find(CompteBanque.class, id);
    }
 
    @SuppressWarnings("unchecked")
	public List<CompteBanqueInfo> listeComptes() {
        String sql = "Select new " + CompteBanqueInfo.class.getName()
                + "(e.id,e.nom,e.solde) " 
				+ " from " + CompteBanque.class.getName() + " e ";
        Query query = entityManager.createQuery(sql, CompteBanqueInfo.class);
        return query.getResultList();
    }
 
 
    @Transactional(propagation = Propagation.MANDATORY )
    public void addAmount(Long id, double amount) throws BanqueTransactionException {
        CompteBanque account = this.findById(id);
        if (account == null) {
            throw new BanqueTransactionException("Compte introuvable " + id);
        }
        double newBalance = account.getSolde() + amount;
        if (account.getSolde() + amount < 0) {
            throw new BanqueTransactionException(
                    "L'argent sur le compte n° '" + id + "' est insuffisant (" + account.getSolde() + ")");
        }
        account.setSolde(newBalance);
    }
 
    @Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = BanqueTransactionException.class)
    public void sendMoney(Long fromAccountId, Long toAccountId, double amount) throws BanqueTransactionException {
 
        addAmount(toAccountId, amount);
        addAmount(fromAccountId, -amount);
    }
 
}
```

## Resources : Les templates (Vues) Thymeleaf

### Fichier _menu.html

```html
<div xmlns:th="http://www.thymeleaf.org"
	style="border: 1px solid #ccc; padding: 5px; margin-bottom: 20px;">

	<a th:href="@{/}">Comptes</a> | &nbsp; <a th:href="@{/sendMoney}">Virement</a>

</div>
```

### Fichier accountsPage.html

```html
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Banque Transaction Démo</title>
 
<style>
th, td {
    padding: 5px;
}
</style>
 
</head>
 
<body>
    <!-- Include _menu.html -->
    <th:block th:include="/_menu"></th:block>
 
    <h2>Accounts</h2>
 
    <table border="1">
        <tr>
            <th>Code</th>
            <th>Prénom</th>
            <th>Solde</th>
        </tr>
        <tr th:each="accountInfo : ${accountInfos}">
            <td th:utext="${accountInfo.id}">..</td>
            <td th:utext="${accountInfo.nom}">..</td>
            <td th:utext="${accountInfo.solde}">..</td>
        </tr>
 
    </table>
</body>
</html>
```

### Fichier sendMoneyPage.html

```html
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Banque Transaction Démo</title>
</head>

<body>
	<!-- include _menu.html -->
	<th:block th:include="/_menu"></th:block>

	<h1>Transférer de l'argent</h1>
	<h2>Comptes</h2>
	<table border="1">
		<tr>
			<th>Code</th>
			<th>Prénom</th>
			<th>Solde</th>
		</tr>
		<tr th:each="accountInfo : ${accountInfos}">
			<td th:utext="${accountInfo.id}">..</td>
			<td th:utext="${accountInfo.nom}">..</td>
			<td th:utext="${accountInfo.solde}">..</td>
		</tr>

	</table>

<h2>Formulaire</h2>

	<div th:if="${errorMessage!=null}"
		style="color: red; font-style: italic" th:utext="${errorMessage}">..</div>

	<form th:action="@{/sendMoney}" th:object="${sendMoneyForm}"
		method="POST">
		<table>

			<tr>
				<td>Du compte</td>
				<td><input type="text" th:field="*{fromAccountId}" /></td>
			</tr>
			<tr>
				<td>Vers le compte</td>
				<td><input type="text" th:field="*{toAccountId}" /></td>
			</tr>
			<tr>
				<td>Montant</td>
				<td><input required="required" type="text" th:field="*{amount}" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Send" /></td>
			</tr>
		</table>
	</form>

</body>
</html>
```

Auteur : **Philippe Bouget**