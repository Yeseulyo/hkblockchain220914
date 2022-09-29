package classMathod;

public class Member_1 {
	// 멤버필드(멤버변수)
	private String name; // 직접접근을 방지하기 위해 private 씀.
	private int age;
	private String addr;
	
	// 피호출메서드          // parameter( = 매개변수 = 가인자)
	public void setData(String name, int age, String addr) { // void = 반환값이 없다. void는 리턴 적지 않음
		this.name = name;     //파라메타 이름(변수명)은 멤버필드 이름과 같게준다.(가독성)
		this.age = age;
		this.addr = addr;
	}
	// setter (값을 저장)
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	// getter (값을 전달)
	public String getName() { //return 뒤에 타입을 public 뒤에 적어줘야함. void 자리 대신에 타입을 쓴다.
		return this.name;
	}
	public int getAge() {
		return this.age;
	}
	// 피호출 메서드
	public String getAddr() {
		// return은 return 뒤에 있는 값을 호출함수로 전달.
		return this.addr; // 피호출 메서드 return 뒤에 값을 호출 메서드로 전달
	}
	
	public void print() {
		System.out.println(name);
		System.out.println(age);
		System.out.println(addr);
	}
	
}
