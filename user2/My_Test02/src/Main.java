import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws Exception {
		
		boolean run = true;
		int stnum = 0;
		int[] scores = null;
		
		Scanner sc = new Scanner(System.in);
		
		while (run) {
			System.out.println("1/2/3/4");
			
			int no = sc.nextInt();
			
			if (no==1) {
				System.out.println("enter the student num");
				stnum = sc.nextInt();
			}
			else if(no==2) {
				scores = new int[stnum];
				for(int k=0; k<stnum; k=k+1) {
					System.out.println("enter the score");
					scores[k] = sc.nextInt();
				}
			}
			else if (no==3) {
				for (int k=0; k<stnum; k=k+1) {
					System.out.println(scores[k]);
				}
			}
			else if (no==4) {
				int max = scores[0];
				
				for (int k=1; k<stnum; k=k+1) {
					if (scores[k]>max) {
						max = scores[k];
					}
				}
				System.out.println("max : "+max);
			}
			else if (no==5) {
				break;
			}
			
		}
	}

}
