
public class Test02 {

	public static void main(String[] args) {
		 
		int[] a= {4,6,5,7,9,2,8,1,3};
		
	    int sum = 0;
	   
	    for (int k=0; k<9; k=k+1) {
	    	sum = sum + a[k];
	    }
	    
	    System.out.println("sum : "+sum);
	   
	    int avg = sum/9;
	    System.out.println("avg : "+avg);
	    
	    int max = a[0];
	    int min = a[0];
	    
	    for (int k=1; k<9; k=k+1) {
	    	if (a[k]>max) {
	    		max = a[k];
	    	}
	    }
	    
	    for (int k=1; k<9; k=k+1) {
	    	if (a[k]<min) {
	    		min = a[k];
	    	}
	    }
	      
	    int range = max - min;
	    System.out.println("range : "+range +" (max = "+max +" , min = "+min +")");
	}

}
