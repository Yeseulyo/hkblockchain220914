package hk220930;

public class Reference {
	int i;
	public int getI() {
		return i;
	}
	public void setI (int i) {
		this.i = i;
		this.i = 20;
		System.out.println(this.i);
	}
}
