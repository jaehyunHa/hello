
	//추상 method가 하나라도 있으면 class도 abstract
	//객체 만들 수 없음

	//모든 method가 추상이면 interface로 선언 or 추상 class
	//=> overriding 강제하기 위함

	//다중 상속 문제해결하기 위해 interface 사용

public abstract class A {

	public abstract void f1();
	
	//추상(abstract) method
	public abstract void f2();
}
