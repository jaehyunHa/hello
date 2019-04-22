
public class Address {

	private String name;
	private int age;
	private String addr;
	
	//Constructors
	public Address() { 	//default 생성자
		age = 0; //default 값
	}
	
	public Address(String n, String ad) {
		name = n;
		addr = ad;
	}
	
	public Address(String n, int a, String ad) {      //overloading
		name = n;
		age = a;
		addr = ad;
	}
	
	//set method
	public void setName(String n) {
		name = n;
	}
	
	public void setAge(int a) {
		age = a;
	}
	
	public void setAddr(String ad) {
		addr = ad;
	}
	
	//get
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
	public String getAddr() {
		return addr;
	}

	
}
