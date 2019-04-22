import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class MouseHandler extends MouseAdapter{
	
	private MyFrame frame;
	
	public MouseHandler() {
		
	}
	
	public MouseHandler(MyFrame f) {
		frame = f;
	}
	
    public void mousePressed(MouseEvent e) {
    	int x = e.getX();
    	int y = e.getY();

		System.out.println("mousePressed"+x+" , "+y);
		
		frame.setPoint(x, y);
		
	}
	
	public void mouseReleased(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		System.out.println("mouseReleased"+x+" , "+y);
	    frame.setLast(x,y);
	    frame.repaint();
	}
	
}
