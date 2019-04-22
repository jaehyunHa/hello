import java.util.ArrayList;

public class AddressBook {

	private ArrayList list;
	
	public AddressBook() {
		list = new ArrayList();
	}
	
	public void add(Address a) {
		list.add(a);
	}
	
	public void show() {
		
		for (int k=0; k<list.size(); k=k+1) {
			Address a = (Address)list.get(k);
			
			String name = a.getName();
			int age = a.getAge();
			String addr = a.getAddr();
			
			System.out.println("name: "+name+" age : "+age+" / address: "+addr);
		}
	}
	
	public String queryAddr(String x) {
		
		String addr=null;
		
		for (int k=0; k<list.size(); k=k+1) {
			
			Address  a = (Address)list.get(k);
			
			String name = a.getName();
			if(name.equals(x)) {
				addr = a.getAddr();
			}
		}
		
		return addr;
	}
	/*	
	public void updateAddr(String n, String ad) {
		
		for (int k=0; k<no; k=k+1) {
			String name = list[k].getName();
			
			if (name.equals(n)) {
				list[k].setAddr(ad);
			}
		}
		
	}
	
	public void deleteAddr(String n, String ad) {
		
		for (int k=0; k<no; k=k+1) {
			
			String name = list[k].getName();
			String addr = list[k].getAddr();
			
			if (name.equals(n) && addr.equals(ad)) {
				no = no-1;
				for (int j=k; j<no; j=j+1) {
						list[j].setName(list[j+1].getName());
						list[j].setAge(list[j+1].getAge());
						list[j].setAddr(list[j+1].getAddr());
				}
				
			}
		}
	}
	
	public void clearAll() {
		no = 0;
	}
*/
}
