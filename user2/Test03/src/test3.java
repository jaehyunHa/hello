import java.util.Scanner;

public class test3 {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		System.out.println("�迭�� ������ �Է��ϼ���");
		
		int num = in.nextInt();
		int sum = 0;
		int avg = 0;
		int range = 0;
		
		int[] a = new int[num];
	
		for (int k=0; k<num; k=k+1) {
			System.out.println((k+1)+" ��° �迭 ���� �Է��ϼ���");
			a[k] = in.nextInt();
		}
		
		int max = a[0];
		int min = a[0];
		
		System.out.print("������ : ");
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
		
		System.out.println("�հ� : "+sum);
		System.out.println("���: "+(sum/num));
		System.out.println("���� : "+(max-min)+" ( max : "+max +" min : "+min+ " )");
		
		System.out.println(" �� �� �����Ͻðڽ��ϱ� ?");
		int ch = in.nextInt();
		int index = 0;
		int cnum = 0;
		
		for(int k=0; k<ch; k=k+1) {
			System.out.println((k+1)+" ��° ������ �迭 ��ġ ");
			index = in.nextInt();
			System.out.println("������ �� �Է�");
			cnum = in.nextInt();
			a[index] = cnum;
		}
		
		System.out.print("������ : ");
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
		
		System.out.println("�հ� : "+sum);
		System.out.println("���: "+(sum/num));
		System.out.println("���� : "+(max-min)+" ( max : "+max +" min : "+min+ " )");

	}

}
