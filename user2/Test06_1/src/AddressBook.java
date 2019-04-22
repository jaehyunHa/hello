import java.util.ArrayList;
import java.util.List;

public class AddressBook {

	private List book;
	
	public AddressBook() {
		book = new ArrayList();
	}
	
	public void show() {
		for (int k=0; k<book.size(); k=k+1) {
			Address a = (Address)book.get(k);
			
			String name = a.getName();
			int age = a.getAge();
			String address = a.getAddress();
			
			System.out.println(name+" / "+age+" / "+address);
		}
	}
	
	public void add(Address ad) {
		book.add(ad);
	}
	
	public void query(String name, int age) {
		
		for (int k=0; k<book.size(); k=k+1) {
			Address a = (Address)book.get(k);
			
			if(name.equals(a.getName())&& age == (a.getAge())) {
				System.out.println("yes");
			}
		}
		
	}
}
