package hk220929;

public class ToStringEx {

	public static void main(String[] args) {
		Book book1 = new Book(200, "개미");
		System.out.println(book1);
		System.out.println(book1.toString());
		
		String str = new String("hello java"); // 문자열은 힙 영역에 생성
		String str1 = "이숭무"; // new String 생략
		System.out.println(str);
		System.out.println(str.toString());
		
		Integer i = new Integer(10);
		Integer i1 = 10;
		System.out.println(i);
		System.out.println(i.toString());
		// int i [] = new int [] {1,2,3,4};

	}

}
