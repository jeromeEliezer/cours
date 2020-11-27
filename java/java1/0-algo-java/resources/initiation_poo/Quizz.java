package co.simplon.bnppf;

public class Quizz {
	private int score;
	private TestItem[] items;
	
	public Quizz(TestItem[] items) {
		score= 0;
		this.items= items;
	}
	public static void main(String[] args) {
		TestItem[] items1= {
				new TestItem("Quel est votre langage préféré ?",
						"Java",
						2),
				new TestItem("Quel est votre IDE préféré ?",
						"Eclipse",
						1),
				new TestItem("Quel est votre système d'exploitation préféré ?",
						"Linux",
						4)
		};
		Quizz q= new Quizz(items1);
		q.attempt();
		q.displayResult();
	}
	private void attempt() {
		for (int i = 0; i != items.length; ++i) {
			score += items[i].attempt();
		}
	}
	private void displayResult() {
		int sum=0;
		for(int i=0; i != items.length; ++i) {
			sum += items[i].getNbPoints();
		}
		
		System.out.println("Votre score :" + score + " sur un total de " + sum + " points.");
	}
}
