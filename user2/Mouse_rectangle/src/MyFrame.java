import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.List;

public class MyFrame extends Frame{

	private int no;
	private int c;   
	private int x, y, x2, y2;
	private int lx, ly, lx2, ly2;
	private int dx, dy, dx2, dy2;
	private List shape;   		
	
	
	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}
	
	public MyFrame(){

		WindowHandler w = new WindowHandler();
		this.addWindowListener(w);
		
		MouseHandler m = new MouseHandler(this);
		this.addMouseListener(m);
		this.addMouseMotionListener(m);
		 
	    shape = new ArrayList();         
	    
	    this.setLayout(new BorderLayout());
	    Button b = new Button("draw rectangle");
	    Button b2 = new Button("draw oval");
	    Panel p = new Panel(new FlowLayout());
	    p.add(b);
	    p.add(b2);
	    this.add(p, BorderLayout.SOUTH);
	    
	    ActionListener a = new ActionListener() {
	    	public void actionPerformed(ActionEvent e) {
	    		no = 0;
	    	}
	    };
	    ActionListener a2 = new ActionListener() {
	    	public void actionPerformed(ActionEvent e) {
	    		no = 1;
	    	}
	    };
	    b.addActionListener(a);
	    b2.addActionListener(a2);
	}
	
	public void paint(Graphics g) {
		
		for (int k=0; k<shape.size(); k=k+1) {
			Shape r = (Shape)shape.get(k);
			r.draw(g);
		}
		
		if(no==0) {
			g.drawRect(dx, dy, dx2, dy2);
		}
		else {
			g.drawOval(dx, dy, dx2, dy2);
		}
		
		
		
	}
	
	public void setLine(int x, int y) {
		
	    if(c==0){
	    	this.lx = x;
		    this.ly = y; 
		    c++;
	    }
	    else {
    		this.lx2 = x;
	    	this.ly2 = y;
	    	Shape li = new Shape(lx, ly, lx2, ly2, 2);
			shape.add(li);
			c=0;
	    }
	    	
	    
	}
	
	public void setRect1(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public void setRect2(int x2, int y2) {
		
		if(x != x2 || y!= y2) {
			if(x > x2) {
				int c = x2;
				x2 = x;
				x = c;
			}
			
			if(y > y2) {
				int c = y2;
				y2 = y;
				y = c;
			}
			this.x2 = Math.abs(x2-x);
			this.y2 = Math.abs(y2-y);
			
			if(no==0) {
				Shape rec = new Shape(x, y, this.x2, this.y2, 0);
				shape.add(rec);
			}
			else if(no==1){
				Shape oval = new Shape(x, y, this.x2, this.y2, 1);
				shape.add(oval);
			}
			
		}
	}
	
	
	public void setDrag(int dx2, int dy2) {
		dx = x; 
		dy = y;
		
		if(dx != dx2 || dy!= dy2) {
			if(dx > dx2) {
				int c = dx2;
				dx2 = x;
				dx = c;
			}
			
			if(dy > dy2) {
				int c = dy2;
				dy2 = dy;
				dy = c;
			}
			this.dx2 = Math.abs(dx2-dx);
			this.dy2 = Math.abs(dy2-dy);
		}
	}	
}
