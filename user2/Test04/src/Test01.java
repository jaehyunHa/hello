import java.util.Scanner;

public class Test01 {

	public static void main(String[] args) {
		
		int[] a = new int[5];
		int sum = 0;
		
		Scanner in = new Scanner(System.in);
		
		for (int k=0; k<5; k=k+1) {
			System.out.println((k+1)+"��° �Է�");
			a[k]=in.nextInt();
		}
		
		System.out.print("������ : ");
		
		for (int k=0; k<5; k=k+1) {
			System.out.print(a[k]+" ");
			sum = sum+a[k];
		}
		
		System.out.println("\n");
		System.out.println("�հ� : "+sum);
		
		System.out.println("�� �� �����Ͻðڽ��ϱ�");
		int b = in.nextInt();
		System.out.println(b+ "ȸ �迭 �����մϴ�");
		
		for (int k=0; k<b; k=k+1) {
			System.out.println("������ �迭 ��ġ :");
			int c = in.nextInt();
			System.out.println("������ �� : ");
			int d = in.nextInt();
			a[c] = d ; 
		}
				
	    int sum2 =0;
	    
		for (int k=0; k<5; k=k+1) {
			System.out.print(a[k]+" ");
			sum2 = sum2+a[k];
		}
		
		System.out.println("\n");
		System.out.println("�հ� : "+sum2);
	}

}
