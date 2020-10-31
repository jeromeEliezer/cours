# Primitive, String, Arrays

## Reference Types

- Reference Variables vs Primitive Variables
  - memory
  - assignment
  - initialization (null)

- Predefined Reference Types in Java
  - String
  - Wrapper Classes

---

#### == (equals) operator
- Equality for Primitives only compares values
- For reference variables, == compares if they are referring to the same object.

```java
int a = 5;
int b = 5;
System.out.println(a == b);//true
```

```java
Integer aReference = new Integer(5);
Integer bReference = new Integer(5);

System.out.println(aReference == bReference);//false

bReference = aReference;

//Now both are referring to same object
System.out.println(aReference == bReference);//true

```
---

### Creating Primitives from other Data Types

parseXxx methods are similar to valueOf but they return primitive values

```java
int hundredPrimitive =
    Integer.parseInt("100");//100 is stored in variable

int sevenPrimitive =
    Integer.parseInt("111", 2);//binary 111 is converted to 7

```

---

## Méthodes

Pour nommer et réutiliser un bloc de code, on crée des méthodes.
Une méthode est définie par sa signature :

```java
public class Calculus{
  public static void afficheResultat(int a, int b){
    System.out.println(a+b);
   }
}
```

```java
public class Calculus{
  public static int calculeResultat(int a, int b){
    return a+b;
  }
}
```

On peut maintenant exécuter ce bloc d'instructions :
```java
public class UnAutreClasse {
  public static void main(String[] args){
    Calculus.afficheResultat(12,14);

    int res = Calculus.afficheResultat(12,14);
  }
}
```


---

## String Class
- A String class can store a sequence of characters.
- String is not a primitive in Java but a Class in its own right.


```java
//Get Data From String
"This is a piece of Text".length()

//Get Characters from String
str.charAt(0)
str.charAt(1)
str.charAt(20)
str.charAt(22)
str.charAt(-22)

//Get Substring from String
str.substring(11)
str.substring(11, 15)

//Searching Content of a String
str.indexOf('C')
"test".indexOf("te")
str.lastIndexOf('C')
"test".lastIndexOf("te")

//Checking Content of a String
str.equalsIgnoreCase("test");
str.contains("ABCD");
str.endsWith("78")
str.startsWith("01");
str.isEmpty();
```

---

## String Puzzles

- Modification of a String
- Strings are immutable. Value of a String Object once created cannot be modified. Any modification on a String object creates a new String object.

```java
String str3 = "value1";
str3.concat("value2");
System.out.println(str3); //value1
str.toLowerCase()
str.toUpperCase()
"012301230123".replace('0', '4')
" abcd  ".trim()
```

String Concatenation Operator
- RULE1: Expressions are evaluated from left to right.
    - Except if there are parenthesis.
- RULE2: number + number = number
- RULE3: number + String = String

```java
System.out.println(5 + "Test" + 5); //5Test5
System.out.println(5 + 5 + "Test"); //10Test
System.out.println("5" + 5 + "Test"); //55Test
System.out.println("5" + "5" + "25"); //5525
System.out.println(5 + 5 + "25"); //1025
System.out.println("" + 5 + 5 + "25"); //5525
System.out.println(5 + (5 + "25")); //5525
System.out.println(5 + 5 + 25); //35
```


---

# Why do we need an Array?
- Arrays allow storing multiple values of same type.

## Array Basics

```java
//Declaring an array
int[] marks;
marks = new int[5]; // creating a 5 values array

// or declaring and creating an array in same line.
int[] marksBis = new int[5];

// or you can Declare, Create and Initialize Array on same line.
int[] marksTer = { 25, 30, 50, 10, 5 };

//Accessing values from an array

int length = marksTer.length;//Length of an array: Property length

//Index of elements in an array runs from 0 to length - 1
System.out.println(marksTer[0]);//Printing a value from array
System.out.println(marksTer[1]);
System.out.println(marksTer[2]);

// modify a value of an array
marksTer[0] = 25;
marksTer[2] = 30;
```
---

#### Reference or content

```java
int marks[] = { 25, 30, 50, 10, 5 };
System.out.println(marks); //[I@6db3f829
System.out.println(
    Arrays.toString(marks));//[25, 30, 50, 10, 5]


```
#### Exercise
- Print all values in an array
- Find sum of all values in an array

#### Default values

- New Arrays are always initialized with default values.
   - byte,short,int,long `0`
   - float,double `0.0`
   - boolean `false`
   - object `null`

- Storing values of same type

---

## More Basics about Arrays

#### Enhanced for loop can be used to loop around array's or List's.
```java
int[] numbers = {1,2,3,4,5};

for(int number:numbers){
    System.out.print(number);
}
//Output - 12345
```

---

#### Comparing Arrays

```java
int[] numbers1 = { 1, 2, 3 };
int[] numbers2 = { 4, 5, 6 };

System.out.println(Arrays
.equals(numbers1, numbers2)); //false

int[] numbers3 = { 1, 2, 3 };

System.out.println(Arrays
.equals(numbers1, numbers3)); //true
```

---

#### Sorting an Array
```java
int rollNos[] = { 12, 5, 7, 9 };
Arrays.sort(rollNos);
System.out.println(Arrays.toString(rollNos));//[5, 7, 9, 12]
```
On voit qu'il est très simple avec un tableau et les méthodes de la classe Arrays de trouver le max, min, etc ... d'une liste.

---

## Let's create Student class now

... on le garde pour cette après-midi

## [D'autres exercices](./tp.md)
