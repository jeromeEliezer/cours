
public class Exercice3_1 {

  /**
   * Je veux que ce programme affiche un sapin de 20 ligne de haut mais ça ne fonctionne pas.
   */
  public static void main(String[] args) {
    System.out.println(drawTree(20));
  }

  /**
   * Function that draws a tree with height treeHeight.
   * 
   * @param treeHeight the height of the tree to draw.
   * @return a String array containing each stage of the tree.
   */
  public static String[] drawTree(int treeHeight) {
    String[] tree = new String[treeHeight + 1];
    if (treeHeight > 4 && treeHeight < 26) {
      for (int i = 0; i < treeHeight; i++) {
        tree[i] = drawTreeStage(i + 1, treeHeight);
      }
      tree[treeHeight] = drawTreeStage(2, treeHeight);
    }

    return tree;
  }

  /**
   * Function that draws a stage of the tree.
   * 
   * @param stage the stage number to draw
   * @param treeHeight the tree height
   * @return a String representing the nth stage of the tree.
   */
  private static String drawTreeStage(int stage, int treeHeight) {
    String treeStage = "";
    int spaceNumber = treeHeight - stage;
    int hashTagNumber = 1 + 2 * (treeHeight - 1);

    for (int i = 0; i < spaceNumber; i++) {
      treeStage = treeStage + " ";
    }

    for (int i = 0; i < hashTagNumber; i++) {
      treeStage = treeStage + "#";
    }

    return treeStage;
  }
}
