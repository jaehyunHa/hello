import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Menu;
import java.awt.MenuBar;
import java.awt.MenuItem;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/*component: button, label, check box
   => ����� action�� ���ϸ� (event�� �߻��ϸ�) component�� ����(action ����� �̷����� ��)
   => component -> event �߻�(WindowEvent, ActionEvent) -> action
					=>Listener
*/

/* <Listener>
 * 1.
 * WindowListener�� �������̽��̹Ƿ� �߻� method ������ ��� �����ؾ���
	������ �ʿ��� ���� windowClosing()
	windowHandler class�� ����ϴ� class�� ���� �ʿ��� method�� overriding�Ѵ� *****/

/* 2. WindowAdaptor
 *    :java�� class�� ����� ���� 
 *    :WindowAdaptor�� ��ӹ޾Ƽ� ���
*/

/*
	3.MyFrame������ ����ϴ� class�̹Ƿ� 
	inner class�� �����
*/

public class MyFrame extends Frame{

	private int x;
	private int y;
	private int x2;
	private int y2;
	
	//inner class
	public class WindowHandler extends WindowAdapter{
		public void windowClosing(WindowEvent e) {
			System.exit(0);
		}
	}

	public class OkHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.out.println("ok");
		}
	}
	
	
	public MyFrame() {
		
		//WindowListener
		WindowHandler w = new WindowHandler();
		this.addWindowListener(w);

		//menu
		MyMenuBar mb = new MyMenuBar();
		this.setMenuBar(mb);
		
		this.setLayout(new BorderLayout());
		Panel p = new Panel();
		p.setLayout(new FlowLayout());
		Button b1 = new Button("OK");
		Button b2 = new Button("Cancel");
		p.add(b1);
		p.add(b2);
		this.add(p, BorderLayout.SOUTH);
		
		//ActionListener
		//OkHandler ok = new OkHandler();
		
		//class ���� ���� �ٷ� ��ü ���� => anonymous class
		ActionListener ok = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("ok button is pressed");
			}
		};
		b1.addActionListener(ok);
		CancelListener ca = new CancelListener();
		b2.addActionListener(ca);
		
		MouseHandler mh = new MouseHandler(this);
		this.addMouseListener(mh);
	}
	
	public void paint(Graphics g) {
		g.setColor(Color.yellow);
		//g.fillOval(x, y, Math.abs(x2-x), Math.abs(y2-y));
	}
	
	public void setPoint(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public void setLast(int x, int y) {
		this.x2 = x;
		this.y2 = y;
	}
	
	
}
