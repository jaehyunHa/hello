import java.util.Scanner;

public class Ex1_1 {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		double a = in.nextDouble();
		double b = in.nextDouble();
		double sol;
		//y=a*x+b
		
		double s=0;
		double e=10;
		
		while(true) {
			System.out.println(" s: "+s +"  /  e: "+e);
			double m = (s+e)/2;
			
			double fs = a*s+b;
			if(Math.abs(fs-0)<0.0001) {
				sol=s;
				System.out.println("결과 abs 1:    "+sol);
				break;
			}
			double fe = a*e+b;
			if(Math.abs(fe-0)<0.0001) {
				sol=e;
				System.out.println("결과 abs 2:    "+sol);
				break;
			}
			double fm = a*m+b;
			if(Math.abs(fm-0)<0.0001) {
				sol=m;
				System.out.println("결과 abs 3:    "+sol);
				break;
			}
			
			if(fs*fm<0) {
				e = m;
			}
			else if(fm*fe<0) {
				s = m;
			}
			else {
				System.out.println("no solution__________");
				break;
			}
			
			if(e-s<0.000001) {
				sol=m;
				System.out.println("결과 :    "+sol+"     ******************");
				break;
			}
		}
		
		
		

	}

}
