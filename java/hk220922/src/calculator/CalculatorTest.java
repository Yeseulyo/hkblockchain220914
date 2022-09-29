package calculator;

public class CalculatorTest {
	public static void main(String [] args) {
		Calculator cal = new Calculator();
		int i = cal.add(20, 10); // 아그먼트값은 파라메타로 전달
		// int i = 30            // result는 아그먼트로 전달
		System.out.println(i);
		
		i = cal.sub(30, 10);
		// i = 20
		System.out.println(i);
		
		
		
	}
}
