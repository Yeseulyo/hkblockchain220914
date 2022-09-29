package hk220923;

public class Person_1 {
	private String name;
	private float height;
	private float weight;
	// 모든 클래스에는 생성자가 존재해야 한다.
	// setData를 한번만 쓰기위해 
	// 클래스명과 같은 이름의 메서드를 만든다. : 생성자
	// 피호출 메서드
	public Person_1(String name, float height, float weight) {
		this.name = name;
		this.height = height;
		this.weight = weight;
		
	}
	public void print() {
		System.out.println(name + "는 키가 " + height + "이고 몸무게는 "
				+ weight + "입니다.");
		
	}
}
