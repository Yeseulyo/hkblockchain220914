package hk220921;

public class CalculatorTest {

	public static void main(String[] args) {
		Calculator calculator = new Calculator();
		//                (argument / 실인자 / 전달인자)
		// 호출 메서드                                            호출메서드와 피호출메서드는 이름이 같아야 한다. (setData), 파라메타 값과 아그먼트 값은 같아야한다.
		calculator.setData(10, 20);
		System.out.println(calculator.num1);
		System.out.println(calculator.num2);
		int i = calculator.add(); // 10 + 20 = 30
		System.out.println(i);
		i = calculator.sub();
		System.out.println(i);
		
		Calculator calculator1 = new Calculator();
		calculator1.setData(100, 200);
		System.out.println(calculator.num1);
		System.out.println(calculator.num2);
		int i1 = calculator1.add();
		System.out.println(i1);
		
		
	}

}
