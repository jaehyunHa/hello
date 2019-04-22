
public class BinarySearcher {

	//�������� ����
	void ascendSorting(int[] a, int size){
		
		for(int i=size-1; i>0; i=i-1) {
			int max = a[0];
			int index = 0;
			
			for (int j=1; j<i+1; j=j+1) {
				if (a[j]>max) {
					max = a[j];
					index = j;
				}
			}
			
			int c = a[i];
			a[i] = max;
			a[index] = c;
		}
		
		System.out.println("ascendSorting");
		for(int k=0; k<size; k=k+1) {
			System.out.print(a[k]+" / ");
		}
		
	}
	
	//�������� ����
	void descendSorting(int[] a, int size){
		
		for(int i=size-1; i>0; i=i-1) {
		
			int min = a[0];
			int index = 0;
			
			for(int j=1; j<i+1; j=j+1) {
				if(a[j]<min) {
					min = a[j];
					index = j;
				}
			}
			
			int c = a[i];
			a[i] = min;
			a[index] = c;
		}	
		
		System.out.println("descendSorting");
		for(int k=0; k<size; k=k+1) {
			System.out.print(a[k]+" / ");
		}
		System.out.println();
	}
	
	//���ĵƴ��� Ȯ���ϴ� method
	int isSorted(int[] array, int size) {
		
		System.out.println();
		System.out.print("isSorted called");
		
		int result = 0;
		int a_count = 0;
		
		//������������ Ȯ��
		for (int k=0; k<size-1; k=k+1) {
			if (array[k]<array[k+1]) {
				a_count = a_count+1;
			}
		}
		System.out.println("is ascending ? "+a_count);
		
		int d_count = 0;
		
		//������������ Ȯ��
		for (int k=0; k<size-1; k=k+1) {
			if (array[k]>array[k+1]) {
				d_count = d_count+1;
			}
		}
		System.out.println("is decending ? "+d_count);
		
		
		if(a_count == size-1) {			//�������� ������ ���
			result = 1;
		}
		else if(d_count == size-1) {	//�������� ������ ���
			result = 2;
		}
		else {							//���� �ȵ� ���
			result = 0;
		}
		return result;
	}
	
	int binarySearch(int[] array, int size, int key) {
		
		int check = this.isSorted(array, size);
		
		if(check == 0) {			//���� �ȵ����� �������� �����ϴ� �Լ��� ����
			this.ascendSorting(array, size);
		}
		else if(check==2) { 		//�������� ���ĵ� �迭�̸� ������������ �ٲ��ִ� �Լ��� ����
			invert(array, size);
		}
									//�������� ���� �� ������ binary Search
		int result = -1;
		
		int s = 0;
		int e = size-1; 
		int m = (s+e)/2;
		
		System.out.println();
		System.out.println("start s: "+s+" / m: "+m+" / e: "+e);
		
		while(true) {
			
			if (array[m] == key) {
				result = m;
				System.out.println("== s: "+s+" / result : "+result+" / e: "+e);
				break;
			}
			else {
				if ((e-s) == 1) {
					if (array[s] == key) {
						result = s;
						break;
					}
					else if (array[e] == key) {
						result = e;
						break;
					}
					else {
						break;
					}
				}
				else {
					if (array[m] < key) {
						s = m;
						m = (s+e)/2;
						System.out.println("< s: "+s+" / m : "+m+" / e: "+e);
					}
					else if (array[m] > key) {
						e = m;
						m = (s+e)/2;
						System.out.println("> s: "+s+" / m : "+m+" / e: "+e);
					}
					else {
						break;
					}
				}
			}
			
		}
		System.out.println("last s: "+s+" / result : "+result+" / e : "+e);
		return result;
		
	}
	
	//��������->������������ �ٲ��ִ� method
	void invert(int[] array, int size) {
		
		int[] a = new int[size];
		
		for (int k=0; k<size; k=k+1) {
			a[k] =  array[(size-1)-k];
		}
		
		for (int k=0; k<size; k=k+1) {
			array[k] = a[k];
		}
		
		System.out.println();
		System.out.println("invert");
		for(int k=0; k<size; k=k+1) {
			System.out.print(array[k]+"  ");
		}
	}
}
