package test;

import java.util.ArrayList;

public class Lotto {
	public static void main(String [] args) {
		
	// 비복원
	// 1 ~ 45 까지 랜덤으로 6개 뽑기
	
	ArrayList<Integer>lottoNum = new ArrayList<Integer>();
	for(int i = 1; i <= 45; i++) {
		lottoNum.add(i);   //add(i); 1 ~ 45 로또 값 저장.
	}
	//System.out.println(lottoNum);
	for(int k = 0; k < 6; k++) {
		int s = lottoNum.size();
		int index = (int)(Math.random()* s); // index 랜덤뽑기 하고 저장.
		int value = lottoNum.remove(index); // value에 지우기 전에 저장 후에 지우기.
		System.out.print(value + " ");
		
	}
	
}
}