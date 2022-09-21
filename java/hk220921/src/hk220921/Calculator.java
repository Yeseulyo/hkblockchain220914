package hk220921;

public class Calculator { // 사용자 자료형
	// 멤버변수
	int num1; //10
	int num2; // 20
	int result;
	// 멤버필드 (=멤버변수)를 사용하기 위한 기능 구현 : 메서드
	//                 (parameter : 매개변수 : 가인자)
	// 피호출 메서드
	public void setData(int num1, int num2) { // 파라메타 앞엔 항상 자료형이 필요하다.
		this.num1 = num1; // 10        파라메타 값을 멤버필드에 전달하겠다.
		this.num2 = num2; // 20        파라메타와 멤버변수 구별법은 색깔로 구별.
		// 멤버변수    파라메타
	}
	//     반환형
	public int add() {
	// return 뒤에 값의 타입을 써야한다.(int)
		result = num1 + num2; // 30  = 10   + 20
		return result; // 30 // 리턴은 리턴 뒤에 값을 호출함수(호출메서드)쪽으로 반환(return)하겠다.
		               // 30을 호출함수로 보내겠다.      
	}
	public int sub() {
		result = num1 - num2;
		return result;
	}
	public int mul() {
		result = num1 * num2;
		return result;
	}
	public int div() {
		result = num1 / num2;
		return result;
	}
	
}
