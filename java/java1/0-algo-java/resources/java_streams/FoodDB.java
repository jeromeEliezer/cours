import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.util.Scanner;

/**
 * This class enables users to manage a text file food database.
 * 
 * @author Franck Achard - Jules Grand
 */
public class FoodDB {
  // private ==> input, foodFileName are only visible in FoodDB class.
  // static ==> input, foodFileName are class attributes ==> exists indenpendently of any specific instance.
  private static Scanner input = new Scanner(System.in);

  // foodFileName only contains a file name ==> it is a relative path
  // when we will use a reader or a writer we will search the file in the program execution folder
  // the program execution folder is here "BD alimentaire"
  private static final String FOOD_FILENAME = "aliments.csv";

  // Food item separator in food DB file.
  private static final String FOOD_ITEM_SEPARATOR = ";";

  // List of food attributes
  private static final String[] FOOD_ATTRIBUTES = { "Nom de l'aliment", "Categorie", "Energie (kcal)", "Protéines (g/100g)",
      "Glucides (g/100g)", "Lipides (g/100g)" };

  /**
   * Entry point for our FoodDB program
   * 
   * @param args command line arguments
   */
  public static void main(String[] args) {
    String menuChoice = "";

    do {
      // Display menu in console
      System.out.println();
      System.out.println("Bonjour et bienvenue dans l'application de BDD alimentaire");
      System.out.println("1) Ajouter un aliment en base de données");
      System.out.println("2) Supprimer un aliment de la base de données");
      System.out.println("3) Afficher toute la liste");
      System.out.println("0) Quitter le programme");

      try {
        // Get menu choice from console
        menuChoice = input.nextLine();
        switch (menuChoice) {
        case "1":
          addFood();
          break;

        case "2":
          deleteFood();
          break;

        case "3":
          printFood();
          break;

        case "0":
          System.out.println("bye bye!");
          break;

        default:
          System.out.println("Commande inconnue ! Enlevez vos moufles svp");
          break;
        }
      } catch (ArrayIndexOutOfBoundsException e) {
        System.out.println("Le fichier " + FOOD_FILENAME + " est mal formatté. Impossible d'utiliser la base de données.");
        System.out.println("Fermeture du programme.");
        menuChoice = "0";
      } catch (FileNotFoundException e) {
        System.out.println("Le fichier " + FOOD_FILENAME + " n'existe pas. Impossible d'utiliser la base de données.");
        System.out.println("Fermeture du programme.");
        menuChoice = "0";
      } catch (IOException e) {
        System.out.println("Un problème d'accès au fichier est survenu.");
        System.out.println("Fermeture du programme.");
        menuChoice = "0";
      }

      // while menu choice is not "0" we keep printing the menu
    } while (!menuChoice.equals("0"));

    input.close();
  }

  /**
   * Adds food in the food file DB.
   * 
   * @throws IOException
   */
  private static void addFood() throws IOException {
  // Filewriter used to write in food file in append mode
    FileWriter foodFile = new FileWriter(FOOD_FILENAME, true);
    // We use the FileWriter with a BufferedWriter to write faster
    BufferedWriter writer = new BufferedWriter(foodFile);

    // Loop on all messages in the messages String array to write input in file
    for (int i=0; i != FOOD_ATTRIBUTES.length; ++i) {
      writer.write(getFoodAttributeFromConsole(FOOD_ATTRIBUTES[i]) + FOOD_ITEM_SEPARATOR);
    }   
    writer.newLine();

    // close bufferwriter
    writer.close();

  }

  /**
   * Prints a message in console and gets a String attribute from console.
   * 
   * @param message the message to print in console
   * @return the String got from console
   */
  private static String getFoodAttributeFromConsole(String message) {
    String foodAttribute = "";
    System.out.println(message);
    foodAttribute = input.nextLine();

    return foodAttribute;
  }

  /**
   * Deleting a food item from the food DB file. To perform deletion, we re-write the original file using in a temp file. Once re-writing is
   * done we replace original file with temp file.
   * 
   * @throws IOException
   */
  private static void deleteFood() throws ArrayIndexOutOfBoundsException, FileNotFoundException, IOException {

    // FileReader to read the original food DB file
    FileReader fileReader = new FileReader(FOOD_FILENAME);
    // We use the FileReader with a BufferedReader to read faster
    BufferedReader reader = new BufferedReader(fileReader);

    // Creating a temporary file to write new food DB file without removed food item.
    Path tempFilePath = Files.createTempFile(Paths.get("."), "foodBaseTemp", ".csv");
    BufferedWriter writer = Files.newBufferedWriter(tempFilePath, StandardOpenOption.WRITE);
    // We ask JVM to remove temp file when the program terminates.
    tempFilePath.toFile().deleteOnExit();

    // Getting food item to delete from console.
    String foodNameToDelete = getFoodAttributeFromConsole("Quel aliment voulez-vous supprimer ?");

    String foodLine = "";
    String[] foodLineSplit = new String[FOOD_ATTRIBUTES.length];

    // Reading DB file and writing each line only if the line is not containing the food item to delete.
    do {
      // We read a line from original file
      foodLine = reader.readLine();
      if (foodLine != null) {
        // If the line is not null we split it to get only the food item name.
        foodLineSplit = foodLine.split(FOOD_ITEM_SEPARATOR);
        // If read line doesn't start with food to delete, we write it in temp file.
        if (!(foodLineSplit[0].equals(foodNameToDelete))) {
          writer.write(foodLine);
          writer.newLine();
        }
      }
      // We loop while file has still lines to read.
    } while (foodLine != null);

    // We close resources (reader and writer)
    reader.close();
    writer.close();

    // We replace foodDB original file by the temp file which has just been created.
    Files.move(tempFilePath, Paths.get("./" + FOOD_FILENAME), StandardCopyOption.ATOMIC_MOVE);
  }

  /**
   * Read food DB file and prints it in console.
   * 
   * @throws IOException
   */
  private static void printFood() throws ArrayIndexOutOfBoundsException, FileNotFoundException, IOException {

    // FileReader to read the original food DB file
    FileReader fileReader = new FileReader(FOOD_FILENAME);
    // We use the FileReader with a BufferedReader to read faster
    BufferedReader reader = new BufferedReader(fileReader);

    String currentLine = "";

    do {
      // Reading line from file
      currentLine = reader.readLine();
      if (currentLine != null) {
        // We print read file line to console if not null.
        String foodItemString = "";
        String[] foodLineSplit = currentLine.split(FOOD_ITEM_SEPARATOR);
        final String separator = " - ";
        for (int i = 0; i < FOOD_ATTRIBUTES.length; ++i) {
          foodItemString += FOOD_ATTRIBUTES[i] + " : " + foodLineSplit[i] + separator;
        }
        foodItemString = foodItemString.substring(0, foodItemString.length() - separator.length());
        System.out.println(foodItemString);
      }
      // We loop while file has still lines to read.
    } while (currentLine != null);

    // We close the reader resource.
    reader.close();
  }
}
