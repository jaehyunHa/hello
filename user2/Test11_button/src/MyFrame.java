import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
									//2번
public class MyFrame extends Frame implements ActionListener {

	//inner class
	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}
	
	//3번
	public class BuHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.out.println("ActionListener in inner class");
		}
	}
	
	public MyFrame() {
		WindowHandler wh = new WindowHandler();
		this.addWindowListener(wh);
		
		this.setLayout(new FlowLayout());
		
		Button b = new Button("OK");
		this.add(b);
		
		
		//1. 전용 handler class 만들기
		/*ButtonHandler bh = new ButtonHandler();
		b.addActionListener(bh);*/
		
		//2. 현재 class를 핸들러로 만들기
		//b.addActionListener(this);
		
		//3. 핸들러를 inner class로 만든다
		/*BuHandler bu = new BuHandler();
		b.addActionListener(bu);*/
		
		//4. Anonymous class ***********
		//class 선언없이 바로 객체를 만듬
		ActionListener a1 = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Listener in anonymous");
			}
		};
		
		b.addActionListener(a1);
		
		
		
		
		
		//layout Manager
	/*	BorderLayout bl = new BorderLayout();
		this.setLayout(bl);
		
		Button b1 = new Button("OK");
		Button b2 = new Button("Cancel");
		
		Panel p = new Panel();
		p.setLayout(new FlowLayout());
		p.add(b1);
		p.add(b2);
		
		this.add(p, BorderLayout.SOUTH);*/
		
	
		
		
		
		//set은 하나만 필요한 것
		/*FlowLayout f = new FlowLayout();
		this.setLayout(f);
		
		//component add
		//add는 여러가지 들어갈 수 있는 것
		Button b1 = new Button("OK");	
		this.add(b1);
		
		Button b2 = new Button("Cancel");	
		this.add(b2);
		
		this.add(new Label("My name is kim"));
		this.add(new TextField(30));	
		this.add(new TextArea(5,10));*/
	
	
	}
	//2번
	public void actionPerformed(ActionEvent e) {
		System.out.println("ActionListener int MyFrame");
	}
}
