package inheritance;

public class CalculatorTest1 {
	public static void main(String[] args) {
		FourCalculator cal = new FourCalculator();
		cal.setData(0, 10); // 0/10          0을 10으로 나눠도 항상 0 : 부정  :연산을 하지 못한다.
		int i = cal.div();
		System.out.println(i);
		// 10/0 : 불능
	}
}