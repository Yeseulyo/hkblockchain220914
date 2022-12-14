package lottoex;

import java.util.ArrayList;
import java.util.Scanner;

public class LottoTest {

	public static void main(String[] args) {
		// 변수 : 단점 : 값을 하나만 저장
		// 배열 : 여러개 값을 저장
		//       단점 : 크기가 정해져 있다.
		//            같은 유형만 저장 가능 
		// 컬렉션 : ArrayList : 여러개의 값을 저장하지만 크기가 정해져 있지 않고 무한히 사용
		// Map : HashMap
		// 베열의 단점인 같은 유형만 저장 가능 하다는 것에 착안하여
		// 다른 유형을 여러개 저장할 수 있는 class를 만듦
		
		/*
		int i1 [] = new int[45];
		i[0] = 1;
		int y = i[0];
		System.out.println(i1.length);
		*/
		//         제네릭타입 Integer, String, Boolean
		ArrayList<Integer> lottoNum = new ArrayList<Integer>();
		Scanner sc = new Scanner(System.in);
		System.out.println("구매 갯수를 입력하세요 : ");
		int cnt = Integer.parseInt(sc.nextLine());
		for(int j = 1; j < cnt; j++) {
			for(int i = 1; i <= 45; i++) {
			lottoNum.add(i);
		}
		}
		for(int i = 0; i < 6; i++) {
		int lottoSize = lottoNum.size();
		int idx = (int)(Math.random() * 45); // 0 ~ 44
		int y = lottoNum.remove(idx);
		System.out.print(y + ",");
		}
		lottoNum.clear();
		System.out.println();
		System.out.println(lottoNum);
		
		/*
		int y = lottoNum.get(0);                    // 배열 int y = i[0]과 같다.
		System.out.println(lottoNum);
		System.out.println(lottoNum.size());
		y = lottoNum.remove(0); // 요소 삭제
		System.out.println(lottoNum);
		System.out.println(lottoNum.size());
		y = lottoNum.remove(5);
		System.out.println(lottoNum);
		System.out.println(lottoNum.size());
	
		 */
	}
}
