package hk220921;

public class MemberTest {

	public static void main(String[] args) {
		Student student = new Student(); 
		//                객제생성 Student란 클래스를 객체생성 시키겠다.
		student.addr = "서울";
		student.age = 15;
		System.out.println(student.addr);
		
		Member member = new Member();
		member.setMemberNum("12345");
		System.out.println(member.getMemberNum());
		member.setMemberName("이숭무");
		System.out.println(member.getMemberName());
		String name = member.getMemberName();
		System.out.println(name);
		
	}

}
