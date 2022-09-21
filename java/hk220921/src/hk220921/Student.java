package hk220921;

public class Student { // 사용자 자료형  (클래스를 만들어주는것은 사용자 자료형을 만들어주는 것)
	// 멤버변수
	// 멤버 필드(엑셀에서)
	int age;
	double height;
	String addr;
	String phone;
	String name;
	
	// 메서드 : 기능 구현을 하기 위해서 작성
	public void print() {
		System.out.println(name + "의 주소는 " + addr);
		
	}
	
	
}
