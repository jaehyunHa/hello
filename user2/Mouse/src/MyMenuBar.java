import java.awt.Menu;
import java.awt.MenuBar;
import java.awt.MenuItem;

public class MyMenuBar extends MenuBar{

	public MyMenuBar() {
		/*	
		<Menu>
		1. MenuBar
		2. Menu : ���� �޴� ������
		3. MenuItem	: ������ �����
	*/		
		//1. MyFrame ������ �Լ� ������
		//Menu
		//MenuBar mbar = new MenuBar();
		//this.setMenuBar(mbar);    //set : �ϳ��� / add: ������ �߰� ����
		
		//2. �Լ� �����
		
		//3. class�� �����
		
		Menu m1 = new Menu("File");
		this.add(m1);
		
		MenuItem mi1 = new MenuItem("New");
		NewListener n = new NewListener();
		m1.add(mi1);
		mi1.addActionListener(n);
		MenuItem mi2 = new MenuItem("Open");
		m1.add(mi2);
		MenuItem mi3 = new MenuItem("Save");
		m1.add(mi3);
		Menu mi4 = new Menu("Save as");
		m1.add(mi4);
		MenuItem mi4_1 = new MenuItem(".jpg");
		mi4.add(mi4_1);
		MenuItem mi4_2 = new MenuItem(".png");
		mi4.add(mi4_2);
	    m1.addSeparator();
		MenuItem mi5 = new MenuItem("Exit");
		m1.add(mi5);
		
		Menu m2 = new Menu("Analysis");
		this.add(m2);
		
		MenuItem mi2_1 = new MenuItem("k-means");
		m2.add(mi2_1);
		MenuItem mi2_2 = new MenuItem("MBA");
		m2.add(mi2_2);
		MenuItem mi2_3 = new MenuItem("Neural Network");
		m2.add(mi2_3);
	}
}
