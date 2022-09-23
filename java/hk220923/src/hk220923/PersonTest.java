package hk220923;

import constructor.Member;

public class PersonTest {

	public static void main(String[] args) {
		Member member = new Member();
		//member.name="nvbiosdxhg";
		// 객체 선언       // 객체 생성
		Person person = new Person(); // 디펄트 생성자가 실행된 것 *
		              // 객체, 인스턴스   // 생성자 안에 값이 없어서 밑에 setData 생성해 줌.
		// person.name = "이숭무"; // 은닉된 상태
		//    인스턴스변수
		//     호출메서드  // argument, 실인자, 전달인자(값을 전달하는) 
		person.setData("이숭무", 197.0f, 75.0f);
		// 객체(인스턴스)내에 있는 멤버필드(인스턴스 변수)에 초기화 하기 위해 setData 쓴다. 
		person.print();
		
		Person person1; // 객체 선언
		person1 = new Person(); // 객체 생성
		// 생성자 : 객체(인스턴스)내에 있는 멤버필드(인스턴스 변수)에 초기화
		Person_1 p = new Person_1("박준현", 197.0f, 75.0f); //객체가 생성될 떄 실행된다.
		p.print();
		
		
		// 객체를 생성할 때는 생성자를 이용해서 객체를 생성한다. *****중요*****
		
		
		

	}

}
