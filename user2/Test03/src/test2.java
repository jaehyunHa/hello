import java.util.Scanner;

public class test2 {

	public static void main(String[] args) {
		
		
		scanner();
		

	}
	
	private static void scanner() {
		

		System.out.println("계산 시이작############");
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫번째 숫자 입력하세요");
		float num1 = sc.nextInt();
		System.out.println("부호를 입력하세요");
		String cal = sc.next();
		System.out.println("두번째 숫자 입력하세요");
		float num2 = sc.nextInt();
		
		cal(num1, cal, num2);
	}
	
	private static void cal(float num1, String cal, float num2) {
		float result;
		
		switch (cal) {
			case "+":
				result =num1+num2;
				System.out.println("결과는: "+result);
				break;
			case "-":
				result = num1-num2;
				System.out.println("결과는: "+result);
				break;
			case "*":
				result = num1*num2;
				System.out.println("결과는: "+result);
				break;
			case "/":
				result = num1/num2;
				System.out.println("결과는: "+result);
				break;
			default:
				System.out.println("잘못 입력하셨습니다--------------");
				scanner();
				break;
		}
	}

}
