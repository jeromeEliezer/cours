# Exceptions en java

Les exceptions permettent d'interrompre un programme si les données sont dans un état qui ne permet pas de poursuivre.


#### La classe Exception

Les exceptions sont des classes qui héritent toutes de la classe Exception, par exemple `FileNotFoundException` :

[https://docs.oracle.com/javase/7/docs/api/java/io/FileNotFoundException.html](https://docs.oracle.com/javase/7/docs/api/java/io/FileNotFoundException.html).

Elles héritent à travers `Throwable` de méthodes pratiques comme :
- [getStackTrace()](https://docs.oracle.com/javase/7/docs/api/java/lang/Throwable.html#getStackTrace()
)
- [getMessage()](https://docs.oracle.com/javase/7/docs/api/java/lang/Throwable.html#getMessage()
)
- [getCause()](https://docs.oracle.com/javase/7/docs/api/java/lang/Throwable.html#getCause()
)

[Plus de détails sur la documentation officielle](https://docs.oracle.com/javase/tutorial/essential/exceptions/definition.html).


#### Utiliser une méthode qui lance des exception

Une méthode qui peut lancer des exception l'indique dans sa signature. Voici par exemple un constructeur de la classe `FileReader` :

```java
public FileReader(String fileName) throws FileNotFoundException {
  ...
}
```

Celui-ci peut déclencher une `FileNotFoundException` si le fichier n'est pas trouvé.

Dans ce cas, on a deux solutions :
- soit gérer l'exception
- soit la transmettre (pour que le problème soit géré ailleurs, ou jamais ... ce qui fera planter le programme)

#### Transmettre une exception

On utilise le constructeur de `FileReader` dans une méthode main.

Si on décide de transmettre l'exception qui peut se produire, la méthode dans laquelle on le fait doit elle-même avoir `throws FileNotFoundException` dans sa signature :

```java
public static void main(String[] args) throws FileNotFoundException {
		BufferedReader br = new BufferedReader(new FileReader("toto.txt"));
	}
```

A l'exécution de ce programme, si le fichier toto.txt n'existe pas une exception va être lancée. Comme elle n'est gérée nulle part, le programme va planter, et on aura la stackTrace :

```
Exception in thread "main" java.io.FileNotFoundException: toto.txt (Aucun fichier ou dossier de ce type)
	at java.base/java.io.FileInputStream.open0(Native Method)
	at java.base/java.io.FileInputStream.open(FileInputStream.java:219)
	at java.base/java.io.FileInputStream.<init>(FileInputStream.java:157)
	at java.base/java.io.FileInputStream.<init>(FileInputStream.java:112)
	at java.base/java.io.FileReader.<init>(FileReader.java:60)
	at exception.Test.main(Test.java:11)
```

#### Gérer une exception

On utilise le constructeur de `FileReader` dans une méthode main.

Cette fois on choisi de gérer l'exception, on utilise un bloc `try/catch`

```java
public static void main(String[] args) throws FileNotFoundException {
  try {
			BufferedReader br = new BufferedReader(new FileReader("toto.txt"));
		} catch (FileNotFoundException e) {
      System.out.println("ce fichier n'existe pas .. le programme va s'arreter");
		}
    System.out.println("toujours en vie");
	}
```

Le try permet d'essayer une ligne. On ajoute autant de catch qu'il peut y avoir de types d'exceptions, ce qui nous permet de faire un traitement spécifique pour chaque type.

Après un catch, le programme continue normalement et va s'interrompre sans erreur lorsqu'il arrive au bout.

Dans l'exemple suivant, on affiche ensuite le résultat d'un `readLine` sur la console, ce qui peut provoquer une exception si le fichier n'est pas accessible en lecture. On ajoute un autre bloc catch pour l'`IOException`:

```java
public static void main(String[] args) {
  try {
    BufferedReader br = new BufferedReader(new FileReader("toto.txt"));
    System.out.println(br.readLine());

  } catch (FileNotFoundException e) {
    System.out.println("ce fichier n'existe pas .. le programme va s'arreter");
  } catch (IOException e) {
    System.out.println("impossible de lire le fichier ... le programme va s'arreter");
  }
  System.out.println("toujours en vie");

}
```


#### Fermer proprement après une exception

Pour fermer les ressources après une exception (ou même dans tous les cas), il est recommandé d'utiliser un bloc `finally`.

Ce bloc est **toujours** exécuté avant de sortir de la méthode, ce qui permet d'éviter un `return` mal placé qui court-circuiterait la fermeture des ressources.

[Plus de détails sur la documentation officielle](https://docs.oracle.com/javase/tutorial/essential/exceptions/finally.html).


#### Créer une exception

Il suffit de créer une classe qui hérite de `Exception` :

```java
public class IllegalCoupException extends Exception {

	public IllegalCoupException(String string) {
		super(string);
	}

}
```

On peut ajouter les constructeurs de Exception avec des paramètres si l'on veut qu'ils soient visibles.

#### Lancer une exception

On utilise le mot-clé `throws` suivi d'une exception (en fait d'un Throwable) À initialiser :

```java
public static void maMethode() throws IllegalCoupException  {
  if (2 < 3) {
    throw new IllegalCoupException("2 est donc inférieur à 3 ??!");
  }
}
```
