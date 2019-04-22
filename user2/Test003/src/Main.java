import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		int a=1;
		
		int k=0;  //count 변수 k initialize
		
		while(k<10) {  //while condition
			
			a = in.nextInt();
			
			if(a>=0) {
				System.out.println(k+" 번째 Entered value is "+a);
			}
		    k=k+1; //증감조건(change)
		}
		
		
	}

}
