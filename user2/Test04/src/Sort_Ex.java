
public class Sort_Ex {

	public static void main(String[] args) {
		
		int[] a = {4, 6, 5, 7, 9, 2, 8, 1, 3};
		
		for (int i=8; i>0; i=i-1) {
			
			int max = a[0];  	//�ִ밪
			int max_i=0;		//�ִ밪�� ��� index
			int c=0;			//�迭�� ���� ���� ���� ������ ��
			
			for (int j=1; j<i+1; j=j+1) {		//max���� max���� ��� index ���ϴ� �κ�
		    	if (a[j]>max) {
		    		max = a[j];
		    		max_i=j;
		    	}
		
		    }
				c=a[i];			//c�� ���� ���ĵ��� ���� �迭�� ���� ������ ���� ����
			    a[i]=max;		//���� ���ĵ��� ���� �迭�� ���� ������ ���� max�� ����
			    a[max_i]=c;		//max���� �ִ� �ڸ��� c�� ����
			 //System.out.println("max : "+max +" index: "+max_i +" c: "+c);
		} 
		
		for (int k=0; k<9; k=k+1) {
			System.out.print(a[k]+" ");
		}
		 
	    
		
	}

}
