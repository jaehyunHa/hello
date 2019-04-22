import java.awt.Graphics;

public class AddressBook {

	private Address[] ad;
	private int no;
	
	
	public AddressBook() {
		
		ad = new Address[10];
		no = 0;
	
	}
	
	public void add(Address a) {
		ad[no] = a;
		no++;
	}
	
	public void delete() {
		no--;
	}
	
	public void draw(Graphics g) {
		
		g.drawString("name", 100, 80);
		g.drawLine(100, 100, 200, 100);
		
		g.drawString("address", 300, 80);
		g.drawLine(300, 100, 400, 100);
		
		for(int k=0; k<no; k=k+1) {
			g.drawString(ad[k].getName(), 100, 100+30*(k+1));
			g.drawString(ad[k].getAddress(), 300, 100+30*(k+1));
		}
	}
}
