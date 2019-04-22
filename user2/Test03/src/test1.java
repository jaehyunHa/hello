import java.util.Scanner;

public class test1 {

	public static void main(String[] args) {
		
		
		//System.out.println("구구단!!!!!!");
		
		/*for(int i=1; i<=9; i++) {
			System.out.println("2*"+i+"="+2*i);
		}*/
		
		
		//int num =s.nextInt();
		/*for(int i=1; i<10; i++) {
			System.out.println(num+"단: "+num+ " * "+i+" = "+num*i);
		}*/
		
		
		/*int a=1;
		while(a<10) {
			System.out.println(num+" 단 : "+num +" * "+a +" = "+num*a);
			a++;
		}*/
		
		
		/*for(int i=2; i<10; i++) {
			for(int j=1; j<10; j++) {
				System.out.println(i+" 단: "+i+" * "+j+" = "+i*j);
			}
		}*/
		
		/*for(int i =1; i<6; i++) {
			for(int j=1; j<=6-i; j++) {
				System.out.print("*");
			}
			System.out.println("\n");
		}*/
		
		
			
		
	/*	System.out.println("계산기 해보쟈아아아아");
		
		System.out.println("첫번째 숫자 눌러");
		float num1 = s.nextInt();
		
		System.out.println("연산 기호 눌러");
		String st = s2.nextLine();
		
		System.out.println("두번째 숫자 눌러");
		float num2 = s3.nextInt();
		
		cal(num1, num2, st);*/
		start();
		}
	
	public static void start() {
		Scanner s = new Scanner(System.in);
		
		System.out.println("계산기 해보쟈아아아아");
		
		System.out.println("첫번째 숫자 눌러");
		float num1 = s.nextInt();
		
		System.out.println("연산 기호 눌러");
		String st = s.next();
		
		System.out.println("두번째 숫자 눌러");
		float num2 = s.nextInt();
		
		cal(num1, num2, st);
	}
	
	private static void cal(float num1, float num2, String st) {
		
		if(st.equals("+")) {
			System.out.println("정답은 : "+ (num1 + num2));
		}
		else if(st.equals("-")) {
			System.out.println("정답은 : "+ (num1 - num2));
		}
		else if(st.equals("*")) {
			System.out.println("정답은 : "+ (num1 * num2));
		}
		else if(st.equals("/")) {
			System.out.println("정답은 : "+ (num1 / num2));
		}
		else {
			System.out.println("정신차려 바보야");
			start();
	}

 }
	
	
}
