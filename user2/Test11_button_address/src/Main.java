
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyFrame my = new MyFrame();
		
		Address a = new Address("KIM", "SEOUL");
		my.add(a);
		
	    a = new Address("LEE", "BUSAN");
	    my.add(a);
		
		my.setSize(600, 600);
		my.setVisible(true);
	}

}
