# Loops - For, While, Do While

A loop is used to run same code again and again.

## For Loop

For loop is used to loop code specified number of times.

```java
for (int i = 0; i < 10; i++) {
    System.out.print(i);
}
//Output - 0123456789

```
Syntax - For loop statement has 3 parts
- Initialization => int i=0. Initialization happens the first time a for loop is run.
- Condition => i<10. Condition is checked every time before the loop is executed.
- Operation (Increment or Decrement usually) => i++. Operation is invoked at the start of every loop (except for first time).

For Loop Puzzles
- Any of 3 parts in a for loop can be empty.
- There can be multiple statements in Initialization or Operation separated by commas

### Exercices
1. Demandez un nombre et affichez 0123456789.. avec une boucle for
2. Demandez un nombre et affichez la somme des nombres jusqu'à ce nombre
3. Organisez le code précédent dans des méthodes, par exemple :

```java

/**
* Cette méthode s'appelle afficheNombres.
* Elle prend un paramètre en entrée de type int.
* Ce paramètre sera appelé "nb" dans la méthode.
**/
public static void afficheNombres(int nb) {
  for (int i = 0;i< 10; i++) { // il faut remplacer les ... par le nombre de répétitions voulu
    System.out.print(...) // à chaque tour de boucle, on affiche la nouvelle valeur
  }
}

/**
* pour tester
**/
public static void main(String[] args){
  // on pourrait faire un scanner pour demander le nb

  afficheNombres(10); // ou tester directement avec 10
  afficheNombres(56);
}
```

## While Loop

```java
int count = 0;

while(count < 5){//while this condn is true, loop is executed.
    System.out.print(count);
    count++;
}
//Output - 01234
```

```java
count = 5;
while(count < 5){//condn is false. So, code in while is not executed.
    System.out.print(count);
    count++;
}//Nothing is printed to output
```

> Do not forget the increment!

### Exercises

```java

WhileNumberPlayer player = new WhileNumberPlayer(30);//limit

player.printSquaresUptoLimit();
//For limit = 30, output would be 1 4 9 16 25

player.printCubesUptoLimit();
//For limit = 30, output would be 1 8 27

```

## Do While Loop
- The difference between a while and a do while is that the code in do while is executed at least once.
- In a do while loop, condition check occurs after the code in loop is executed once.

Do While loop Example 1
```java
int count = 0;
do{
    System.out.print(count);
    count++;
}while(count < 5);//while this condn is true, loop is executed.
//output is 01234
```

Do While loop Example 2
```java
count = 5;
do{
    System.out.print(count);
    count++;
}while(count < 5);
//output is 5
```

### Exercise
- Ask user for a number.
- Print the cube of the number.
- Do this repeatedly until user enters a negative number.

```
Enter a number: 5
Cube is 125
Enter a number: 3
Cube is 27
Enter a number: -1
Thank You! Have Fun!
```
## Choosing a Loop
- Do you know how many times to run?
  - For Loop
- Do you when to end the loop?
  - While
- Do you want to execute the loop atleast once?
  - Do While

## [D'autres exercices](./tp.md)
