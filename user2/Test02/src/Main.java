import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		int a = 0;
		
		//escape condition (loop에서 빠져나오는 조건) / counter 변수로 통제
		while(a>=0) {
			System.out.println("Enter a score: ");
			a = in.nextInt();
			if(a>100) {
				System.out.println("점수가 100을 넘었습니다. 점수를 다시 입력하세요");
			}
			else {
				if(a>=90) {
					System.out.println("A 학점입니다");
				}
				else {
					if(a>=80) {
						System.out.println("B 학점입니다");
					}
					else {
						if(a>=70) {
							System.out.println("C 학점입니다");
						}else {
							if(a>=60) {
								System.out.println("D 학점입니다");
							}else {
								if(a<0) {
									//System.out.println("점수가 0보다 작습니다. 다시 입력하세요");
								}else {
									System.out.println("F 학점입니다.");
								}
							}
						}
					}
				}
			}
		}
			System.out.println("끝-------------");
	}

}
