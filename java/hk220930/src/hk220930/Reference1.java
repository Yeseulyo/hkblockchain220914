package hk220930;

public class Reference1 {
	int i;
	
	public int getI() {
		return i;
	}
	//              리터럴변수
	public void setI(int i) {
		this.i = i;
		this.i = 20;
		System.out.println(this.i);
	}
	//       클래스형 변수 : 참조변수(reference 변수) / 주소변수 / 객체변수
	//                   힙영역에 주소를 저장
	public void setData(Reference1 r1) {
		r1.setY(30);
		System.out.println(r1.getY());
	}
}
