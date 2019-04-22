
public class Main {

	public static void main(String[] args) {
		
		Parent p = new Parent();
		
		Child c =  new Child();
		
		AnotherChild a = new AnotherChild();
		
		p.fly();
		c.fly();
		a.fly();
		
		int money = a.getMoney();
		System.out.println(money);
		a.setMoney(100);
		int am = a.getMoney();
		System.out.println(am);
		
		System.out.println("-------------");
		int cm = c.getMoney();
		System.out.println(cm);

	}

}
