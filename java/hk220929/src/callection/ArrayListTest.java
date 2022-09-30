package callection;

import java.util.ArrayList;

public class ArrayListTest {

	public static void main(String[] args) {
		// 변수 : 1개의 값
		// 배열 : 
		//   장점 : 여러개의 값을 저장 
		//   단점 : 크기가 정해져 이다.
		// 컬렉션 : 크기를 가지지 않는 배열
		
		int i[] = new int[3];
		i[0] = 1;
		i[1] = 2;
		i[2] = 3;
		
		ArrayList <Integer> list1 = new ArrayList <Integer>(); //컬렉션에서 어떠한 타입을 지정하겠다 = 제네럴 타입
		list1.add(1); // 0번 인덱스
		list1.add(2); // 1
		list1.add(3); // 2
		list1.add(4); // 3
		list1.add(5); // 4
		list1.add(6); // 5
		list1.add(7); // 6
		System.out.println(list1.get(0));
		
		for(int idx = 0; idx < list1.size(); idx++) {
			System.out.println(list1.get(idx));
		}
		for(int s : list1) {
			System.out.println(s);
		}
		list1.add(5);
		for(int s : list1)
		System.out.println(s);
		

	}

}
