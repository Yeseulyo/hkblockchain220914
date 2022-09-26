package staticex;

public class StudentTest {

	public static void main(String[] args) {
		Student stu1 = new Student();
		stu1.setStudentId(++stu1.serialNum); // serialNum = 1001
		System.out.println(stu1.getStudentId());
		
		Student stu2 = new Student();
		stu2.setStudentId(++stu2.serialNum); // serialNum = 1002
		System.out.println(stu2.getStudentId());
		
		Student stu3 = new Student(); // serialNum = 1002
		stu3.setStudentId(++stu3.serialNum); // serialNum =  1003
		System.out.println(stu3.getStudentId());
		
		System.out.println(stu1.serialNum); // 1003
		System.out.println(stu2.serialNum); // 1003
		System.out.println(stu3.serialNum); // 1003
		
		
		

	}

}
