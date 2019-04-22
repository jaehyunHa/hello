
public class Calculator {


	void binary(int num) {
		
		int[] a = new int[8];
		int k = a.length-1;
		
		while(num>0) {
			
			a[k] = num%2;
			num = num/2;
			System.out.println(a[k]+" / "+num);
			k=k-1;
		}
		for (int i=0; i<a.length; i=i+1) {
			System.out.print(a[i]);
		}
	}	
}
