package finalex;

public class Constant {
	int num = 10; // 변수는 메서드 안, 밖 둘다 만들기 가능하다.
	public static void main(String [] args) {
		int num = 10; // 변수는 메서드 안, 밖 둘다 만들기 가능하다.
		System.out.println(num);
		num = 20;
		System.out.println(num);
		final int NUM = 100; // 값을 변경하지 못하는 "상수"
		System.out.println(NUM);
		// NUM = 200; -- 위에서 final로 NUM값을 100으로 지정했기 때문에 바뀌지 않는다.
		// 변수에 final을 붙여주면 상수
		
		final double PI = 3.141592; // 상수
		
		
	}
}
