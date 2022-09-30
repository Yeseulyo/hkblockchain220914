package lottoex;

import java.util.HashMap;

public class HashMapTest {

	public static void main(String[] args) {
		HashMap<Integer, String> map = new HashMap<>();
		map.put(1, "이숭무"); 
		map.put(2, "이상범");
		map.put(8, "이장범");
		map.put(6, "박기영");
		System.out.println(map.keySet()); //키를 다 갖고 오는 것 (전체를 불러온다.)
		for(int key : map.keySet()) {
			System.out.println(map.get(key));
		}
		System.out.println(map.get(1));
		System.out.println(map.get(6));
		map.remove(8);
		map.clear(); //모두 다 삭제
		

	}

}
