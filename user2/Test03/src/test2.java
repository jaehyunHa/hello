import java.util.Scanner;

public class test2 {

	public static void main(String[] args) {
		
		
		scanner();
		

	}
	
	private static void scanner() {
		

		System.out.println("��� ������############");
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("ù��° ���� �Է��ϼ���");
		float num1 = sc.nextInt();
		System.out.println("��ȣ�� �Է��ϼ���");
		String cal = sc.next();
		System.out.println("�ι�° ���� �Է��ϼ���");
		float num2 = sc.nextInt();
		
		cal(num1, cal, num2);
	}
	
	private static void cal(float num1, String cal, float num2) {
		float result;
		
		switch (cal) {
			case "+":
				result =num1+num2;
				System.out.println("�����: "+result);
				break;
			case "-":
				result = num1-num2;
				System.out.println("�����: "+result);
				break;
			case "*":
				result = num1*num2;
				System.out.println("�����: "+result);
				break;
			case "/":
				result = num1/num2;
				System.out.println("�����: "+result);
				break;
			default:
				System.out.println("�߸� �Է��ϼ̽��ϴ�--------------");
				scanner();
				break;
		}
	}

}
