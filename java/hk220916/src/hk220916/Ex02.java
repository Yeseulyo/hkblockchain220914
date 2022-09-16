package hk220916;

public class Ex02 {
	public static void main(String [] args) {
		// 변수 : 리터럴 값을 저장 하는 역할
		// 정수 리터널 10, 9
		int i = 10; // int i : 4byte
		System.out.println(i);
		long l = 10000000000000L; // long l : 8byte
		System.out.println(l);
		// 실수 리터널 : 10.5
		float f; // 4byte : 정밀도 낮다. 소수점 이하 8자리
		double d; // 8byte : 정밀도 높다. 소수점 이하 17자리
		// 99.99, 99.99999
		
		f = 0.1234567890123456789f; // 실수는 8byte다.
		d = 0.123456789012345678;
		System.out.println(f);
		System.out.println(d);
		
		// 문자 리터널
		char ch = 'a';
		System.out.println(ch); // 문자 변수
		char ch1 = 98;          // 정수 변수           char은 정수형도 저장 가능
		System.out.println(ch1);// 정수에 해당하는 문자 출력
		
		// 문자열 리터널
		String str = "a"; // String은 문자를 저장하는 문자열 변수명
		System.out.println(str);
		str = "이숭무";
		System.out.println(str);
		
		
		// boolean 리터널 : true, false
		//                "true", "false"(문자열)
		boolean bl1; // 선언
		bl1 = true; // 대입
		boolean bl2 = false; // 초기화
	    int i1 = 10;
	    System.out.println(bl1);
	    System.out.println(bl2);
	    System.out.println(true);
	    System.out.println(false);
	    System.out.println(100 + 1);
		//boolean bl3 = "true"; 에러남
	    String str2 = "true";
	    // str2 = true; // boolean 타입이어서 저장 안됨
	    
	    
		
		
		
		
		
				
		
	}
}
