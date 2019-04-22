import java.awt.Frame;

	//UI 
	//awt = abstract window toolkit < component
	//swing: 100% java				< jcomponent
public class Main {

	public static void main(String[] args) {
		
		MyFrame f  = new MyFrame();
		
		Address a = new Address("Kim", "Seoul");
		f.add(a);
		
		a = new Address("Choi", "Suwon");
		f.add(a);
		
		a = new Address("Lee", "Cheonan");
		f.add(a);

		f.setSize(600, 400);
		f.setVisible(true);
	
		//add
		
		//delete
		f.delete("Kim");
	}

}
