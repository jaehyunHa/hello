import java.util.Scanner;

public class Test01 {

	public static void main(String[] args) {
		
		int[] a = new int[5];
		int sum = 0;
		
		Scanner in = new Scanner(System.in);
		
		for (int k=0; k<5; k=k+1) {
			System.out.println((k+1)+"번째 입력");
			a[k]=in.nextInt();
		}
		
		System.out.print("변경전 : ");
		
		for (int k=0; k<5; k=k+1) {
			System.out.print(a[k]+" ");
			sum = sum+a[k];
		}
		
		System.out.println("\n");
		System.out.println("합계 : "+sum);
		
		System.out.println("몇 번 변경하시겠습니까");
		int b = in.nextInt();
		System.out.println(b+ "회 배열 변경합니다");
		
		for (int k=0; k<b; k=k+1) {
			System.out.println("변경할 배열 위치 :");
			int c = in.nextInt();
			System.out.println("변경할 값 : ");
			int d = in.nextInt();
			a[c] = d ; 
		}
				
	    int sum2 =0;
	    
		for (int k=0; k<5; k=k+1) {
			System.out.print(a[k]+" ");
			sum2 = sum2+a[k];
		}
		
		System.out.println("\n");
		System.out.println("합계 : "+sum2);
	}

}
