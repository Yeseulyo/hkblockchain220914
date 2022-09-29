package hk220916;

public class Ex01 {
	public static void main(String [] args) {
		/* 리터널 : 자연어 ( 한국어, 일본어, 영어, 중국어,...)
		 *        문자 리터널 : '가', 'a',     '0', '1'
		 *                         a(변수)   0(정수리터널)
		 *                         '\n' , '\t'       \붙으면 문자 하나 , \n = enter표시
		 *        문자열 리터널 : "11", "abcd"
		 *                    "가"(문자열 리터널), "abcd"
		 *                    '가'(문자 리터널)
		 *        자연수 : 
		 *          정수 리터널 : 10, "10"(문자열 리터널) , '10'은 문자가 될 수 없다. 문자열만 가능 두자리이기 때문에 (1,0 합친거라서)
		 *                     '1', "11"
		 *          실수 리터널 : 10.5
		 *                    "10.5"(문자열 리터널)
		 *          boolean 리터널 : true(참)
		 *                         false(거짓)   
		 *                                
		 * 
		 * 
		 * 		
		 * 
		 */
		
		
		int a = 'b';
		char ch = 0;
		char ch1 = 'o';
		System.out.println(ch);
		System.out.println(ch1);
		System.out.println((int)'\n');
		System.out.println();
		System.out.println(100 + 1);
		System.out.println("100" + 1);
		System.out.println("100" + "3");
		
	}
}