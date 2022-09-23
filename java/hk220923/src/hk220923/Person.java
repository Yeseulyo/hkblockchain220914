package hk220923;

public class Person {
	// 멤버필드, 멤버변수
	private String name;
	private float height;
	private float weight;
	
	// 모든 클래스에는 생성자가 존재해야 한다.
	public Person() {} // 디펄트 생성자.
	// setter /getter 써야하는데 생략했다.
	// 피호출 메서드
	// 멤버 메서드 
	// 은닉되어있는 값을 받아오기 위해 메서드 생성
	                     // parameter / 가인자 / 매개변수(값을 전달받는)
	public void setData(String name, float height, float weight) {
		this.name = name;
		this.height = height;
		this.weight = weight;
		
	}
	public void print() {
		System.out.println(name + "는 키가 " + height + "이고 몸무게는 "
				+ weight + "입니다.");
		
	}
	
}
