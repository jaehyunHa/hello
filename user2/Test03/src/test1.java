import java.util.Scanner;

public class test1 {

	public static void main(String[] args) {
		
		
		//System.out.println("������!!!!!!");
		
		/*for(int i=1; i<=9; i++) {
			System.out.println("2*"+i+"="+2*i);
		}*/
		
		
		//int num =s.nextInt();
		/*for(int i=1; i<10; i++) {
			System.out.println(num+"��: "+num+ " * "+i+" = "+num*i);
		}*/
		
		
		/*int a=1;
		while(a<10) {
			System.out.println(num+" �� : "+num +" * "+a +" = "+num*a);
			a++;
		}*/
		
		
		/*for(int i=2; i<10; i++) {
			for(int j=1; j<10; j++) {
				System.out.println(i+" ��: "+i+" * "+j+" = "+i*j);
			}
		}*/
		
		/*for(int i =1; i<6; i++) {
			for(int j=1; j<=6-i; j++) {
				System.out.print("*");
			}
			System.out.println("\n");
		}*/
		
		
			
		
	/*	System.out.println("���� �غ���ƾƾƾ�");
		
		System.out.println("ù��° ���� ����");
		float num1 = s.nextInt();
		
		System.out.println("���� ��ȣ ����");
		String st = s2.nextLine();
		
		System.out.println("�ι�° ���� ����");
		float num2 = s3.nextInt();
		
		cal(num1, num2, st);*/
		start();
		}
	
	public static void start() {
		Scanner s = new Scanner(System.in);
		
		System.out.println("���� �غ���ƾƾƾ�");
		
		System.out.println("ù��° ���� ����");
		float num1 = s.nextInt();
		
		System.out.println("���� ��ȣ ����");
		String st = s.next();
		
		System.out.println("�ι�° ���� ����");
		float num2 = s.nextInt();
		
		cal(num1, num2, st);
	}
	
	private static void cal(float num1, float num2, String st) {
		
		if(st.equals("+")) {
			System.out.println("������ : "+ (num1 + num2));
		}
		else if(st.equals("-")) {
			System.out.println("������ : "+ (num1 - num2));
		}
		else if(st.equals("*")) {
			System.out.println("������ : "+ (num1 * num2));
		}
		else if(st.equals("/")) {
			System.out.println("������ : "+ (num1 / num2));
		}
		else {
			System.out.println("�������� �ٺ���");
			start();
	}

 }
	
	
}
