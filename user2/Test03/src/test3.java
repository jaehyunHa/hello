import java.util.Scanner;

public class test3 {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		System.out.println("배열의 개수를 입력하세요");
		
		int num = in.nextInt();
		int sum = 0;
		int avg = 0;
		int range = 0;
		
		int[] a = new int[num];
	
		for (int k=0; k<num; k=k+1) {
			System.out.println((k+1)+" 번째 배열 값을 입력하세요");
			a[k] = in.nextInt();
		}
		
		int max = a[0];
		int min = a[0];
		
		System.out.print("변경전 : ");
		for (int k=0; k<num; k=k+1) {
			System.out.print(a[k]+"  ");
			sum = sum+a[k];			//sum
		}
		System.out.println("\n");
		
		//max
		for (int k=1; k<num; k=k+1) {
			if(a[k]>max) {
				max=a[k];
			}
		}
		
		//min
		for (int k=1; k<num; k=k+1) {
			if(a[k]<min) {
				min=a[k];
				System.out.println("min : "+min);
			}
		}
		
		System.out.println("합계 : "+sum);
		System.out.println("평균: "+(sum/num));
		System.out.println("범위 : "+(max-min)+" ( max : "+max +" min : "+min+ " )");
		
		System.out.println(" 몇 번 변경하시겠습니까 ?");
		int ch = in.nextInt();
		int index = 0;
		int cnum = 0;
		
		for(int k=0; k<ch; k=k+1) {
			System.out.println((k+1)+" 번째 변경할 배열 위치 ");
			index = in.nextInt();
			System.out.println("변경할 값 입력");
			cnum = in.nextInt();
			a[index] = cnum;
		}
		
		System.out.print("변경후 : ");
		sum = 0;
		for (int k=0; k<num; k=k+1) {
			System.out.print(a[k]+"  ");
			sum = sum+a[k];			//sum
		}
		System.out.println("\n");
		
		
		max = a[0];
		min = a[0];
		//max
		for (int k=1; k<num; k=k+1) {
			if(a[k]>max) {
				max=a[k];
			}
		}
		
		//min
		for (int k=1; k<num; k=k+1) {
			if(a[k]<min) {
				min=a[k];
			}
		}
		
		System.out.println("합계 : "+sum);
		System.out.println("평균: "+(sum/num));
		System.out.println("범위 : "+(max-min)+" ( max : "+max +" min : "+min+ " )");

	}

}
