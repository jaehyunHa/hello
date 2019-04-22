import java.awt.Graphics;

public class AddressBook {

	private Address[] list;
	private int no;
	
	public AddressBook() {
		list = new Address[10];
		no = 0;
	}
	
	public void add(Address a) {
		list[no] = a;
		no++;
	}
	
	public void draw(Graphics g) {
		
		g.drawString("Name", 100, 100);
		g.drawLine(100, 100, 200, 100);
		
		for (int k=0; k<no; k=k+1) {
			String name = list[k].getName();
			g.drawString(name, 100, 130+(10*k));
		}
		
		g.drawString("Address", 300, 100);
		g.drawLine(300, 100, 400, 100);
		
		for (int k=0; k<no; k=k+1) {
			String address = list[k].getAddress();
			g.drawString(address, 300, 130+(10*k));
		}
		
	}
	
	public void delete(String name) {
		for (int k=0; k<no; k=k+1) {
			String fname = list[k].getName();
			
			if(name.equals(fname)) {
				for(int j=k; j<no; j=j+1) {
					list[j] = list[j+1];
				}
				no--;
			}
		}
		
		/*for (int k=0; k<no; k=k+1) {
			String n = list[k].getName();
			System.out.println(n);
		}*/
		
	}
	
	public void delete(int num) {
		for (int k=0; k<no; k=k+1) {
			
		}
	}
	
	public void queryByName() {
		
	}
	
	public void queryByAddress() {
		
	}
	
	public void update() {
		
	}
}
