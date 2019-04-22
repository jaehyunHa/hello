
public class Address {

	private String name;
	private int age;
	private String address;
	
	public Address() {
		address = "korea";
	}
	
	public Address(String name) {
		this.name = name;
	}
	
	public Address(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public Address(String name, int age, String address) {
		this.name = name;
		this.age = age;
		this.address = address;
	}
	
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
}
