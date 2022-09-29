package staticex;

public class StudentTest {

	public static void main(String[] args) {
		Student stu1 = new Student();
		stu1.setAddress("성남");
		stu1.setSutudentname("이숭무");
		stu1.serialNum++;
		System.out.println(stu1.serialNum);
		System.out.println(stu1.getAddress());
		
		Student stu2 = new Student();
		System.out.println(stu2.serialNum);
		stu2.setAddress("서울");
		stu2.serialNum++;
		
		System.out.println(stu1.serialNum); // 1001
		System.out.println(stu2.serialNum); // 1002
		
		Student stu3 = new Student();
		System.out.println(stu3.serialNum);
		System.out.println(Student.serialNum);
		
		
		
		
		
		
	}

}

//정적변수는 객체내용을 이용해서 사용할 수도 있지만 클래스명을 이용해서 사용하도록 만들어 놓은 것이다.