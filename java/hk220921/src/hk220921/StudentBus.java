package hk220921;

public class StudentBus {

	public static void main(String[] args) {
		Student student = new Student(); // 객체 생성    // class 와 변수를 구분하기 위해서 class명 맨 앞은 대문자를 쓴다. // class명은 대문자 변수명은 소문자
		//        객체변수 =    객체
		                     /*
		                      * age;
							 	height;
								addr;
								phone;
							 	name;
		                      */
		student.addr = "서울";
		student.age = 30;
		student.height = 175.8;
		student.name = "이숭무";
		student.phone = "012";
		
		Student student1 = new Student();
		student1.name = "윤예슬";
		// 클래스   객체       
		student1.age = 23;
		student1.addr = "서울";
		student1.height = 160.0;
		student1.phone = "010";
		
		Bus bus = new Bus(); // int j = 10; 선언 한 것과 같다.
		bus.number = 145;
		
		System.out.println(student1.name + "은 " + bus.number + "를 타고 갑니다." );
		System.out.println(student.name + "은 " + bus.number + "를 타고 갑니다." );
		student.print(); // 이숭무
		student.print(); // 윤예슬
		
	}

}
