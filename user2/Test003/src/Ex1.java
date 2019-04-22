import java.util.Scanner;

public class Ex1 {

	public static void main(String[] args) {
		
		Scanner in  = new Scanner(System.in);
		
		double a,b;
		
		a= in.nextDouble();
		b= in.nextDouble();
		
		// y = a*x+b;
		
		double s = 0;
		double e = 10;
		double sol;
		
		while(true) {
			System.out.println("s: "+s+" / "+e);
			double m = (s+e)/2;
			
			double fs = a*s+b;
			if (Math.abs(fs-0)<0.00001) {
				sol = s;
				break;
			}
			double fe = a*e+b;
			double fm = a*m+b;
			
			if(fs*fm<0) {
				e=m;
			}
			else if(fm*fe<0) {
				s=m;
			}
			else {
				System.out.println("no solution");
				break;
			}
			
			if(e-s<0.000001) {
				sol = (s+e)/2;
				System.out.println("°á°ú: "+m);
				break;
			}
			
		}
		//  sol;
		
		
		
	}

}
