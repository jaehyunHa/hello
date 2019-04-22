
public class Parent {
	
	private int money;
	private String familyname;
	
	public Parent() {
		this.money = 300;
		this.familyname = "ha";
	}
	
	public void fly() {
		System.out.println("parent fly");
	}
	
	public int getMoney() {
		return money;
	}
	
	public void setMoney(int money) {
		this.money = money;
	}
}
