
public class Sort_Ex {

	public static void main(String[] args) {
		
		int[] a = {4, 6, 5, 7, 9, 2, 8, 1, 3};
		
		for (int i=8; i>0; i=i-1) {
			
			int max = a[0];  	//최대값
			int max_i=0;		//최대값이 담긴 index
			int c=0;			//배열의 정렬 되지 않은 마지막 값
			
			for (int j=1; j<i+1; j=j+1) {		//max값과 max값이 담긴 index 구하는 부분
		    	if (a[j]>max) {
		    		max = a[j];
		    		max_i=j;
		    	}
		
		    }
				c=a[i];			//c에 아직 정렬되지 않은 배열의 가장 마지막 값을 대입
			    a[i]=max;		//아직 정렬되지 않은 배열의 가장 마지막 값에 max값 대입
			    a[max_i]=c;		//max값이 있던 자리에 c값 대입
			 //System.out.println("max : "+max +" index: "+max_i +" c: "+c);
		} 
		
		for (int k=0; k<9; k=k+1) {
			System.out.print(a[k]+" ");
		}
		 
	    
		
	}

}
