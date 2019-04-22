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

//2
public class TestFrame extends Frame implements ActionListener{

	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}
	
	//3.
	public class ButtonHandler2 implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.out.println("Button is pressed 3");
		}
	}
	
	public void actionPerformed(ActionEvent e) {
		System.out.println("button is pressed 2");
	}
	
	
	public TestFrame(){
		WindowHandler w = new WindowHandler();
	    this.addWindowListener(w);
	    
	 
	   /* BorderLayout b = new BorderLayout();
	    this.setLayout(b);
	    
	    FlowLayout f = new FlowLayout();
	    //this.setLayout(f);
	    */
	    
	    this.setLayout(new FlowLayout());
	    
	    Button bu = new Button("OK");
	    
	    /*1. 
	    ButtonHandler bh = new ButtonHandler();
		bu.addActionListener(bh);*/
	    
	    //2.
	    //bu.addActionListener(this);
	    
	    
	   //3
	    /*ButtonHandler2 bh2 = new ButtonHandler2();
	    bu.addActionListener(bh2);*/
	    
	    //4.
	    ActionListener ac = new ActionListener(){
	    	public void actionPerformed(ActionEvent e) {
	    		System.out.println("button is pressed 4");
	    	}
	    };
	    bu.addActionListener(ac);
	    
	    
	    Button bu2 = new Button("Cancel");
	    
	    this.add(bu);
	    this.add(bu2);
	    
	    
	    
	    /*this.add(bu);
	    this.add(bu2);
	    this.add(new TextArea(5,10));
	    this.add(new Label("id"));
	    this.add(new TextField(10));*/
	    
	    
	 /*   Panel p = new Panel();
	    p.setLayout(f);
	    p.add(bu);
	    p.add(bu2);
	    
	    this.add(p, BorderLayout.SOUTH);*/
	    
	    
	    
	    
	}

}
