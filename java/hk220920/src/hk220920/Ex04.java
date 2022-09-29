package hk220920;

public class Ex04 {
	public static void main(String [] args) {
		// 1 ~ 10까지의 합을 구해 출력
		int sum = 0;
		sum = sum + 1; // 1 // sum += 1
		sum = sum + 2; // 3
		sum = sum + 3; // 6
		sum = sum + 4; // 10
		sum = sum + 5; // 15
		sum = sum + 6; // 21
		sum = sum + 7; // 28
		sum = sum + 8; // 36
		sum = sum + 9; // 45
		sum = sum + 10;// 55
		System.out.println(sum);
		sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum = sum + i;
		}
		System.out.println(sum);
		
	}
}
