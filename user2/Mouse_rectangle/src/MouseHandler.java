import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;

public class MouseHandler extends MouseAdapter implements MouseMotionListener{

	private MyFrame frame;
	
	public MouseHandler() {
		
	}
	
	public MouseHandler(MyFrame f) {
		this.frame = f;
	}
	
	public void mouseClicked(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		frame.setLine(x, y);
		frame.repaint();
	}
	
	public void mousePressed(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		//System.out.println("pressed x : "+x +" , "+y);
		frame.setRect1(x, y);
	}
	
	public void mouseReleased(MouseEvent e) {
		int x = e.getX();
		int y = e.getY();
		//System.out.println("released x : "+x +" , "+y);
		frame.setRect2(x, y);
		frame.repaint();
	}
	
	public void mouseDragged(MouseEvent e) {
		frame.setDrag(e.getX(), e.getY());
		frame.repaint();
	}

}
