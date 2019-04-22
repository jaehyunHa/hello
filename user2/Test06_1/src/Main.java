
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Address a = new Address("lee", 30, "seoul");
	
	    Address b = new Address("kim", 20, "suwon");
	    
	    AddressBook book = new AddressBook();
	    book.add(a);
	    book.add(b);
	    
	    book.show();
	    
	    book.query("lee", 30);
	    
	    
	}

}
