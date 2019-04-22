import java.util.Scanner;

public class Main2 {

	public static void main(String[] args) {
		
		
		//int[] a = new int[5];
		int[] a = {4,3,6,2,5};  //Array initialization
		
		for(int k=0; k<5; k=k+1) {
			System.out.print(a[k]+"  ");
		}
		System.out.println("\n");
	
		
		//sum
		int sum = 0;
		for(int k=0; k<5; k=k+1) {
			sum = sum + a[k];
		}
		System.out.println("гу╟Х : "+sum);
	}

}
