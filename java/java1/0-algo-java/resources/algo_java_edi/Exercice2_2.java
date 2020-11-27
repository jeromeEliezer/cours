
public class Exercice2_2 {

  /**
   * Ce programme m'affiche une jolie erreur. Que ce passe t-il ?
   */
  public static void main(String[] args) {
    System.out.println(fibonacciRec(5));
  }

  /**
   * Math function to find the nth Fibonacci number (recursive)
   * 
   * @param n nth Fibonacci index
   * @return the nth Fibonacci number
   */
  public static int fibonacciRec(int n) {
    int result = 0;

    result = fibonacciRec(n - 1) + fibonacciRec(n - 2);

    return result;
  }
}
