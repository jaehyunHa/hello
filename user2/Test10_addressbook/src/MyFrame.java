import java.awt.Color;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class MyFrame extends Frame{
	
	private AddressBook ab;
	
	//inner class
	public class MyWindowAdapter extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}
	
	public MyFrame() {
		MyWindowAdapter m = new MyWindowAdapter();
		this.addWindowListener(m);
		
		ab = new AddressBook();
	}
	
	public void paint(Graphics g) {
		/*g.drawOval(170, 80, 50, 50);
	    g.drawOval(200, 100, 100, 100);
	    g.drawOval(280, 80, 50, 50);
	    
	    g.drawRect(220, 130, 20, 10);
	    g.drawRect(260, 130, 20, 10);
	    
	    for (int i=0; i<2; i=i+1) {
	    	for (int j=0; j<4; j=j+1) {
	    		int x = 230;
	    		int y = 150;
	   
	    		g.drawRect(x+(10*j), y+(5*i), 9, 5);
	    	}
	    }
	    
	    g.drawOval(165, 200, 180, 180);
		
	    g.drawString("hello", 100, 100);
	    g.drawLine(100, 100, 200, 100);*/
		ab.draw(g);
		
		
	}
	
	public void add(Address a) {
		ab.add(a);
	}
	
	public void delete(String name) {
		ab.delete(name);
	}
	
	
}
