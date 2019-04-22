import java.awt.Graphics;

public class Shape {

	private int x, y, w, h;
	//o=0이면 rectangle 
	//o=1이면 oval
	//o=2이면 Line
	private int o;
	
	public Shape() {
		
	}
	
    public Shape(int x, int y, int w, int h, int o) {
		this.x = x;
		this.y = y; 
		this.w = w;
		this.h = h;
		this.o = o;
	}
	
	public int getX() {
		return x;
	}
	
	public int getY() {
		return y;
	}
	
	public int getW() {
		return w;
	}
	
	public int getH() {
		return h;
	}
	
	public int getO() {
		return o;
	}
	
	public void draw(Graphics g) {
		if(o==0) {
			g.drawRect(x, y, w, h);
		}
		else if(o==1) {
			g.drawOval(x, y, w, h);
		}
		else if(o==2){
			g.drawLine(x, y, w, h);
		}   
	}
}
