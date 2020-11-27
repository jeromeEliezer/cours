
public class Exercice2_1 {

  /**
   * Ce programme ne calcule pas comme il faut la factorielle d'un nombre.
   */
  public static void main(String[] args) {
    System.out.println(factorielleIte(5));
  }

  /**
   * Math factorial iterative implementation.
   * 
   * @param n factorial number to process.
   * @return n!
   */
  public static int factorielleIte(int n) {
    int result = 1;
    int i = 1;

    while (i <= n) {
      result *= i;
    }

    return result;
  }
}
