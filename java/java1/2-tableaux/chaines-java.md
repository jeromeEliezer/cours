# Manipulations de chaînes

## Syntaxe spécifique pour les Strings

L’utilisation des Strings est fondamentale en informatique. Le langage Java a créé quelques fonctionnalités spécifiques pour la classe **String** :

>L’instanciation est automatique (pas forcément besoin d’utiliser le mot clé **new()**)

### Constructeur explicite du String

```java
String maChaine = new String("maChaine est un objet");
```

### Constructeur implicite du String

```java
String maChaine = "MaChaine est considérée comme un objet avec cette écriture";
String s = " Hello ";
```

### Concaténation

String chaîneUn = " Bernard ";  
String chaîneDeux = " Martin ";  
String s3 = chaîneUn + "  "  + chaîneDeux;

### Comparaison de Strings

La classe String donne des méthodes pour comparer 2 chaînes :

- int **compareTo**(String autreString)
- int **compareToIgnoreCase**(String autreString)
- boolean **equalsIgnoreCase**(String autreString)

Ces 3 méthodes permettent de comparer le contenu d’un String avec le contenu d’un autre String.

>Les Objets String ne sont pas modifiables !

Voici une illustration :

Etape 1 : on écrit s1 = new String("Bonjour");  
Etape 2 : on écrit s1 = new String("Au revoir");  
Etape 3 : on écrit s2 = new String("Au revoir");  
Etape 4 : on utilise la fonction de comparaison de Chaînes : s1.**equals**(s2)  

>Que se passe t-il ?

Lors de l’étape 2, s1 pointe vers l’objet String **Au revoir**, tandis que l’objet String **Bonjour** auparavant référencé est candidat à la poubelle (garbage Collector).

Donc, maintenant, S1 pointe vers **Au revoir**. Lors de l’étape 4, la fonction de comparaison retournera **VRAI** car **s1 et s2** pointent vers des chaînes identiques.

>Attention au piège de la comparaison directe !

```java
boolean chainesIdentiques = false;
String s1 = " Texte "; 
String s2 = " Texte ";
if (s1 == s2)
{
 chainesIdentiques = true;
}
System.out.println("résultat = "+chainesIdentiques);
```

>Selon vous, que donne ce code comme résultat ?   

Elle renvoie **true** car les valeurs de s1 et s2 sont identiques. Lors des versions antérieures de Java, la comparaison renvoyait **false**. Le double égal **==** fonctionne et permet d'obtenir une comparaison comme avec la méthode **equals** qui est conseillée. Souvent, un éditeur comme Eclipse vous affiche le message ci-dessous :

>Use the "equals" method if value comparison was intended. 

## Méthode split (diviser) de String

>La méthode **split** prend en entrée une expression régulière. Elle divise la chaîne selon l'expression régulière donnée et elle retourne un tableau qui contient des sous-chaînes. Si l'expression ne correspond pas à la chaîne recherchée le tableau résultant n'a qu'un seul élément.

Exemple sur la chaîne suivante : "Je;suis;un;apprenant;laposte"

On voit que chaque mot est séparé par un point virgule **;**

Avec la méthode split, voici comment explorer la chaîne.

On doit écrire split("\\\;"). On a dit que la méthode **split** prend les **expressions régulières** en entrée. Ici, elle récupère les mots séparés par un point virgule.

```java
package analyse;

public class SplitChaine {

public static void main(String[] args) 
{String maChaine = "Je;suis;un;apprenant;laposte";
String[] tableau = maChaine.split("\\;");
int nombreDeMots= tableau.length;
System.out.println("nombre de mots : "+nombreDeMots);
for (String string : tableau) {
    System.out.println(string);
   }
}
}
```

Voici le résultat que vous devez obtenir dans votre console :

```java
nombre de mots : 5  
Je
suis
un
apprenant
laposte
```

## Autres exemples à découvrir

### Recherche de caractère en début et fin de chaîne

```java
String[] strings = {"started", "starting", "ended", "ending"};

// on teste
for (String string : strings)
{
    if (string.startsWith("st"))
    System.out.printf("\"%s\" starts with \"st\"%n", string);
}

System.out.println();

// teste methode startsWith starting à la position 2 dans la chaine
for (String string : strings)
{
    if (string.startsWith("art", 2) )
    System.out.printf("\"%s\" starts with \"art\" at position 2%n", string);
}

System.out.println();

// test method endsWith
for (String string : strings)
{
    if ( string.endsWith("ed"))
    System.out.printf("\"%s\" ends with \"ed\"%n", string);
}
```

### Recherche de chaines dans des chaines avec indexOf()

```java

String letters = "abcdefghijklmabcdefghijklm";

// test indexOf to locate a character in a string
System.out.printf("'c' is located at index %d%n",letters.indexOf('c') );
System.out.printf("'a' is located at index %d%n",letters.indexOf('a', 1) );
System.out.printf("'$' is located at index %d%n%n", letters.indexOf('$'));

// test lastIndexOf to find a character in a string
System.out.printf("Last 'c' is located at index %d%n", letters.indexOf("def") );
System.out.printf("Last 'a' is located at index %d%n", letters.indexOf("def", 7));
System.out.printf("Last '$' is located at index %d%n%n",letters.indexOf("hello") );

// test indexOf to locate a substring in a string
System.out.printf("\"def\" is located at index %d%n",letters.lastIndexOf("def") );
System.out.printf("\"def\" is located at index %d%n",letters.lastIndexOf("def", 25) );
System.out.printf("\"hello\" is located at index %d%n%n", letters.lastIndexOf("hello"));

```

### Extraire des chaines dans des chaines avec substring()

```java
String letters2 = "abcdefghijklmabcdefghijklm";

// teste substring methodes
System.out.printf("Substring from index 20 to end is \"%s\"%n",letters2.substring(20));
System.out.printf("%s \"%s\"%n", "Substring from index 3 up to, but not including 6 is",letters2.substring(3, 6));
```

### Concaténation de String avec la méthode concat()

```java
String ss1 = "Happy ";
String ss2 = "Birthday";

System.out.printf("s1 = %s%ns2 = %s%n%n",ss1, ss2);
System.out.printf("Resultat de  s1.concat(ss2) = %s%n",ss1.concat(ss2) );
System.out.printf("s1 après concaténation = %s%n", ss1);

```

## Classe StringBuilder (classe modifiable)

```java
StringBuilder buffer1 = new StringBuilder();
StringBuilder buffer2 = new StringBuilder(10);
StringBuilder buffer3 = new StringBuilder("hello");

System.out.printf("buffer1 = \"%s\"%n", buffer1);
System.out.printf("buffer2 = \"%s\"%n", buffer2);
System.out.printf("buffer3 = \"%s\"%n", buffer3);

// il existe aussi la méthode reverse() pour cette classe.
```

## Documentation Java sur la classe String

[doc officiel java](https://docs.oracle.com/javase/9/docs/api/java/lang/String.html)

[bases de java avec JMDoudoux](https://www.jmdoudoux.fr/java/dej/indexavecframes.htm)


## la méthode **printf()** en anglais pour le fun !

```java
System.out.printf( “format-string” [, arg1, arg2, ... ] ); 
```

Composed of literals and format specifiers. **Arguments are required only if there are format specifiers in the format string**.

Format specifiers include: flags, width, precision, and conversion characters in the following sequence :

>% [flags] [width] [.precision] conversion-character ( square brackets denote optional parameters )

### Flags:
- : left-justify ( default is to right-justify )  
+ : output a plus ( + ) or minus ( - ) sign for a numerical value  
0 : forces numerical values to be zero-padded ( default is blank padding )  
, : comma grouping separator (for numbers > 1000)  
  : space will display a minus sign if the number is negative or a space if it is positive  

### Width:

Specifies the field width foroutputting the argument and represents the minimum number of characters to be written to the output. Include space for expected commas and a decimal point in the determination of the width for numerical value

### Precision:

Used to restrict the output depending on the conversion. It specifies the number of digits of precision when outputting floating-point values or the length of a substring to extract from a String. Numbers are rounded to the specified precision.

### Conversion-Characters:

 d :decimal integer   [byte, short, int, long]   
 f : floating-point number    [float, double]   
 c :character Capital C will uppercase the letter   
 s : String Capital S will uppercase all the letters in the string  
 h : hashcodeA hashcode is like an address. This is useful for printing a reference   
 n : newlinePlatform specific newline character- use %n instead of \n for greater compatibility

### Exemples :

```java
System.out.printf("Total is: $%,.2f%n", dblTotal);
System.out.printf("Total: %-10.2f:  ", dblTotal);
System.out.printf("% 4d", intValue);
System.out.printf("%20.10s\n", stringVal);
String s = "Hello World";
System.out.printf("The String object %s is at hash code %h%n", s, s)

```

### méthode format() de la classe String

You can build a formatted String and assign it to a variable using the static format method in the String class. The use of a format string and argument list is identical to its use in the printf method. The format method returns a reference to a String.

Exemple :

```java
String grandTotal = String.format("Grand Total: %,.2f  ", dblTotal

```