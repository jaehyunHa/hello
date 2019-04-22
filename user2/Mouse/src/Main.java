
public class Main {

	public static void main(String[] args) {
		//H/W <wrapper[O/S] < JVM  <-> App :하드웨어의 의존성 없애기 위해(portable)
		//Java
		//jdk
		//jre - JVM
		
		/*client -> 윈도우(UI)	-> Java(연산:logic)
					웹
					모바일
					             ->RAM에 데이터 저장(컴퓨터 끄면 데이터 날아감)
					             =>Hard Disk에 저장해야 함(영구 기억장치) 
					            
					                		-> Data Base
					                		   java가 db에 시킴  */
		
		MyFrame f = new MyFrame();
		f.setSize(600,400);
		f.setVisible(true);

	}

}
