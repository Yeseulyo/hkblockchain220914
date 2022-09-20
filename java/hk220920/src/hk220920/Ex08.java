package hk220920;

public class Ex08 {
	public static void main(String [] args) {
		int sum = 0;
		//     1번         2번    4번
		for(int i = 1; i <= 10; i++) {
			sum += i; //3번
		}
		System.out.println(sum);
		System.out.println("=======while======");
		sum = 0;
		int j = 1; //1번
		while(j <= 10) { //2번
			sum += j; //3번
			j++; //4번
			
		}
		System.out.println(sum);
		// 1-2-3-4-2-3-4-....-3-4-2
		
	}
}
