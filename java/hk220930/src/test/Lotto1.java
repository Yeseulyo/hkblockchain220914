package test;

import java.util.ArrayList;
import java.util.Scanner;

public class Lotto1 {

	public static void main(String[] args) {
		// 비복원
		// 1 ~ 45 까지 랜덤으로 6개 뽑기
		// 로또 몇장 뽑을거임?
		
		Scanner sc = new Scanner(System.in);
		System.out.println("로또 몇장 뽑을거임? ");
		int str = Integer.parseInt(sc.nextLine());
		for(int p = 0; p < str; p++) {
			
		System.out.println();
		
		// 1 ~ 45 까지 값을 LottoNum에 저장
		ArrayList<Integer> lottoNum = new ArrayList<Integer>();
		for(int i = 1; i <= 45; i++) {
			lottoNum.add(i);
		}
		// System.out.println(lottoNum); 확인 해 본 것임
		
		// 6개 뽑기 
		for(int k = 0; k < 6; k++) {
			int s = lottoNum.size(); // 인덱스 크기 확인
			int index = (int)(Math.random() * s); // 인덱스에서 랜덤뽑기   int index = (int)(Math.random() * 45);
			int value = lottoNum.remove(index); // 지운 값을 인덱스에 저장하고 그걸 value에 저장.
			System.out.print(value + " ");
		}
		lottoNum.clear(); //초기화
		
		}
		
	}

}
