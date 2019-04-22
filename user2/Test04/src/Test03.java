
public class Test03 {

	public static void main(String[] args) {
		
		int[] a = {3,5,7,9,8,4,2,1,6};
		
		
		int i = 8;
		int j =1;
		
		while(i>0) {
			//System.out.println("i "+i);
			int max = a[0];
			int max_i = 0;
			int c = 0; 
			j = 0;
			
			while(j<i+1) {
				//System.out.println("j "+j);
				if(a[j]>max) {
					max = a[j];
					max_i = j;
				}
				j=j+1;
			}
				c = a[i];
				a[i] = max;
				a[max_i] = c;
				i=i-1;
		}
		
		for (int k=0; k<9; k=k+1) {
			System.out.println(a[k]);
		}
	}

}
