import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		int a = 0;
		
		//escape condition (loop���� ���������� ����) / counter ������ ����
		while(a>=0) {
			System.out.println("Enter a score: ");
			a = in.nextInt();
			if(a>100) {
				System.out.println("������ 100�� �Ѿ����ϴ�. ������ �ٽ� �Է��ϼ���");
			}
			else {
				if(a>=90) {
					System.out.println("A �����Դϴ�");
				}
				else {
					if(a>=80) {
						System.out.println("B �����Դϴ�");
					}
					else {
						if(a>=70) {
							System.out.println("C �����Դϴ�");
						}else {
							if(a>=60) {
								System.out.println("D �����Դϴ�");
							}else {
								if(a<0) {
									//System.out.println("������ 0���� �۽��ϴ�. �ٽ� �Է��ϼ���");
								}else {
									System.out.println("F �����Դϴ�.");
								}
							}
						}
					}
				}
			}
		}
			System.out.println("��-------------");
	}

}
