import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class MyFrame extends Frame{

	private AddressBook ab;
	
	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}
	
	public MyFrame() {
		
		WindowHandler w = new WindowHandler();
		this.addWindowListener(w);
		
		ab = new AddressBook();
		
		Button bu = new Button("ADD");
		Button bu2 = new Button("delete");
		
		ActionListener li = new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				ab.add(new Address("ha","suwon"));
				res();
			}
		};
		
		ActionListener li2 = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ab.delete();
				res();
			}
		};
		
		bu.addActionListener(li);
		bu2.addActionListener(li2);
		
		this.setLayout(new BorderLayout());
		
		Panel p = new Panel(new FlowLayout());
		p.add(bu);
		p.add(bu2);
	
		this.add(p, BorderLayout.SOUTH);
		
	}
	
	public void paint(Graphics g) {
		ab.draw(g);
	}
	
	public void add(Address a) {
		ab.add(a);
	}
	
	public void res() {
		this.repaint();
	}
}
