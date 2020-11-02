// TODO les imports sont à faire ici

public class Etudiant{

  // Les propriétés sont écrites en dehors des méthodes,
  // elles sont visibles dans toute la classe (mais pas en dehors).
  private String name;

  // un tableau de double
  private double[] notes;

  // cette méthode permet d'initialiser l'objet
  public Etudiant(String name){
    this.name = name;
  }

  /**
  * cette methode boucle pour demander la saisie de chaque note
  **/
  public void saisieNotes(int nbNote) {
    notes = new double[nbNote];

    //for

    //notes[i]=saisie.nextInt();
    // TODO
  }

  /**
  * calcule la moyenne obtenue par l'étudiant. Affiche une erreur si aucune note.
  **/
  public double moyenne(){
    // TODO
    return 0.0; // juste pour compiler
  }

  /**
  * retourne la note minimale obtenue
  **/
  public double minimum(){
    // TODO
    double min= notes[0];
    for(int i=0;i<notes.length;i++) {
        if(notes[i]<min){
          min = notes[i];
        }

    }
    return min;
  }

  /**
  * retourne la note maximale obtenue
  **/
  public double maximum(){
    // TODO
    return 0.0;
  }

  /**
  * indique si l'étudiant à validé son annnée (si la moyenne est >= 10)
  **/
  public boolean valide(){
    // TODO
    return false;
  }

  /**
  * retourne la note numéro index
  **/
  public double getNote(int index){
    // TODO
    return 0.0;
  }

  /**
  * NE PAS TOUCHER
  **/
  public double[] getNotes(){
    return notes;
  }



}
