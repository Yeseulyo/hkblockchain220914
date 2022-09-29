package staticex;

public class StudentTest1 {

	public static void main(String[] args) {
		Student stu = new Student();
		stu.setStudentId(Student.serialNum++);
		stu.setSutudentname("이숭무");
		System.out.println(stu.getStudentId());
		System.out.println(stu.getSutudentName());
		
		Student stu1 = new Student();
		stu1.setStudentId(Student.serialNum++);
		System.out.println(stu.getStudentId());
		
	}

}
