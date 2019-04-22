
public class Main {

	public static void main(String[] args) {

		int[] array = {4, 8, 2, 1, 9, 6, 3, 5, 7};
		
		BinarySearcher bs = new BinarySearcher();
		
		//bs.ascendSorting(array, array.length);	//오름차순 정렬
		
		bs.descendSorting(array, array.length);		//내림차순 정렬
		
		//int sorted_result = bs.isSorted(array, array.length);
		//System.out.println();
		//System.out.println("is sorted result : "+sorted_result);
		
		int binary_result = bs.binarySearch(array, array.length, 9);
		
		if(binary_result>-1) {
			System.out.println();
			System.out.println(binary_result+" th number");
		}
		else {
			System.out.println("not found");
		}
		
		
	}

}
