package staticex;

public class Student {
	// 정적 변수
	static int serialNum = 1000; // 클래스 변수 / static 주면 멤버필드 아니고 static로 값이 저장되므로 setter 필요없다. // static = 정적/ 정적변수는 setter getter 필요없다./ 객체변수 아닌 클래스명을 이용해서 사용하는 변수 : 정적변수
	// 정적 변수를 사용하면 모든 객체가 공유하는 데이터를 만들어 사용.
	int studentId;
	String studentName;
	int grade;
	String address;
	// 정적 메서드
	public static int getSrialNum() {
		return serialNum;
	}

	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getSutudentName() {
		return studentName;
	}
	public void setSutudentname(String studentName) {
		this.studentName = studentName;
	}
	public int getgrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
