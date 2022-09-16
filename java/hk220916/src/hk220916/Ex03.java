package hk220916;

public class Ex03 {
	public static void main(String [] args) {
		int i; // 변수 : 변할 수 있는 값
		i = 10;
		System.out.println(i);
		i = 20; // 값을 변경
		System.out.println(i);
		
		// 상수 : 값을 변경 할 수 없다.
		// 리터널 상수 : 10 
		// 사용자 상수 : 사용자 정의 : final
		double pi = 3.141592;
		System.out.println(pi);
		pi = 3.1111;
		System.out.println(pi);
		
		final double PI = 3.141592;
		System.out.println(PI);
		// PI = 3.1111; 상수는 값을 못 바꾸므로 에러남
		final int MAX_VOL = 100; // 상수명은 변수명을 다 대문자로 쓴다. 단어 두개가 섞여있을 때는 사이에 언더바를 쓴다.
		final int MIN_VOL = 1;
		
		
		
	}
}
