
public class Main {

	public static void main(String[] args) {
		
		//정수형 배열
		int[] a = new int[5];
		
		//첨자값에 변수를 쓸 수 있는 것이 배열의 장점
		a[0] = 5;
		a[1] = 4;
		a[2] = 3;
		a[3] = 2;
		a[4] = 1;
		
		for(int k=0; k<5; k=k+1) {
			System.out.println(a[k]);
		}
		//System.out.println(a); //reference 참조자

	}

}
