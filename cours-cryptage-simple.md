# Découverte de l'API Spring pour crypter les mots de passe

## Comment ajouter l'API BCrypt de Spring dans votre projet java ?

Avec Gradle, il suffit d'ajouter la ligne ci-dessous :

```java
// https://mvnrepository.com/artifact/org.springframework.security/spring-security-crypto
compile group: 'org.springframework.security', name: 'spring-security-crypto', version: '5.2.0.RELEASE'
```

Sinon, récupérer le fichier JAR et ajoutez-le à votre bibliothèque.

Documentation associée :

[https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/crypto/bcrypt/BCrypt.html](https://docs.spring.io/spring-security/site/docs/current/api/org/springframework/security/crypto/bcrypt/BCrypt.html)


Bcrypt utilise un grain de sel interne ? Comment cela marche ?

Basiquement, l'algorithme fonctionne ainsi : Générer un grain de sel aléatoire. Un facteur coût a été préconfiguré (10 par défault en PHP). Générer le hash.

Le hash est la concétanation du cout, du grain de sel et du mot de passe "encodé". Quand quelqu'un essaye de se connecter, on récupére son mot de passe hashé pour savoir le grain de sel et le cout utilisé, et on génère un hash de la même manière. Si le hash est identique, le mot de passe est bon.

Un hash bcrypt ressemble à cela :
```java

$2a$10$zlUbNqxdwQIL6dCcQEfLzeSZdstkbCyFCdQo/KmA31PXxkG8U66SS

```

- 3 zones sont séparées par le symbole dollar **$** :

    - **2a** : identifie la version de l'algorithme BCrypt.
    - **10**   : facteur de hashage utilisé par défaut.
    - **zlUbNqxdwQIL6dCcQEfLze** *ZdstkbCyFCdQo/KmA31PXxkG8U66SS* : *Grain de sel* et texte encodé (concaténé et encodé avec une fonction Base64 personnalisée).
    - Les 22 premiers caractères décodent une valeur sur 16 bits pour le grain de sel.
    - Les caractères restants sont le mot de passe encodé et vérifier pour l'authentification.

### Conseils pour la gestion du mot de passe

Il faut :

- Hasher avec BCrypt
- Utiliser un grain de sel pour rendre le décryptage plus complexe.
- Réinitialiser périodiquement les mots de passe si vous soupsconnez une faille de sécurité.
- Demander une longueur de mot de passe allant de 8 à 10 caractères minimum.

Il ne faut pas :

- Stocker un mot de passe tel quel (en clair).
- Limiter le nombre de caractère maximum.
- Limiter les caractères possibles.
- Mettre le mot de passe dans un fichier de log.
- Utiliser MD5, SHA1 ou SHA256 pour hasher un mot de passe.

### Objectif : Hasher le mot de passe

>Eviter les accès frauduleux aux comptes des utilisateurs en cas de faille de sécurité. L'objectif étant que cela soit le plus difficile possible pour une un hacker de décoder les mots de passe.

Exemple :

- Un mot de passe de 6 caractères minuscules, c'est **26^6** = **308 millions de possibilités**.
- Un mot de passe de 10 caractères avec majuscules, chiffres et caractères spéciaux, c'est **96^10** = **66 milliards de milliars de possibilités**. Soit 216 milliards de plus à décoder !

## Utilisation avec Java de BCrypt de Spring

Définir une variable de Hashage par défaut :

```java
private static final String HASH = BCrypt.gensalt(10);
```

Méthode pour encoder :

```java
import org.springframework.security.crypto.bcrypt.BCrypt;
public static void encoder(String mdp)
	{
		// hashage du mot de passe
		String mdpHash =BCrypt.hashpw( mdp, ControleurConnexion.HASH );
		System.out.println("Mot de passe avec Hashage = "+ mdpHash);
		 
	}

```

Méthode pour comparer et décoder :

```java
import org.springframework.security.crypto.bcrypt.BCrypt;
public static void decoder(String mdp, String mdpHash) {
		
        // comparer le mot de passe en clair avec le mot de passe encodé
		if( BCrypt.checkpw(mdp, mdpHash) ) {
		    System.out.println("OK");
		}else {
		    System.out.println("KO");
		}
	}
```

## Utilisation avec BCrypt de Spring

Avec l'API de Spring on peut aussi écrire ce genre de code plus simple :

```java

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public static void test() {
			String password = "TotoEstMonMotDePasse!";
			
			// encoder
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);

			System.out.println("password encoder = "+ hashedPassword);
			
			// comparer 
			
			BCryptPasswordEncoder passdecoder = new BCryptPasswordEncoder();
			if (passdecoder.matches(password, hashedPassword))
				{
				 System.out.println("mot de passe OKOKOK");
				}
			else {
				System.out.println("mot de passe KOKOKO");
			}
		}

```

Pour l'intégration dans votre code, à vous de jouer !