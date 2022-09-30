package interfaceex;

public interface Calc {
	// 인터페이스에는 상수, 추상메서드 있다.
	double PI = 3.14;   // 상수
	final int ERROR = -999999; // 상수
	// 추상 메서드
	int add(int num1, int num2);
	int substract(int num1, int num2);
	int times(int num1, int num2);
	int divide(int num1, int num2);
	// 버전 8
	default void description() {
		System.out.println("정수 계산기를 구현합니다.");        //인터페이스에 메서드를 만들려면 default를 붙여준다.
	}
	static void myStaticMethod() {
		System.out.println("private static 메서드 입니다.");
	}
}
