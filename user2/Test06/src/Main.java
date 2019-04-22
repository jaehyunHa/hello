
public class Main {

	public static void main(String[] args) {
	
		AddressBook book = new AddressBook();
		
		Address a = new Address("kim", 32, "Seoul");
	
		book.add(a);
		
		a = new Address("lee", 20, "Busan");
		
		book.add(a);
		
		a = new Address("park", 60, "Incheon");
		
		book.add(a);
		
		a = new Address("ha", 30, "Suwon");
		
		book.add(a);
		
		book.show();
	   
		String ad = book.queryAddr("kim");
		System.out.println("address is : "+ad);
		/*		
		//
		book.updateAddr("kim", "LA");
		book.show();
		
		System.out.println();
		
		book.deleteAddr("ha", "Suwon");
		book.show();
		
		book.clearAll();
		System.out.println("===============");
		book.show();*/
	}

}
