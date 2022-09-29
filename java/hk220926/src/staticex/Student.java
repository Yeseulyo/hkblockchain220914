package staticex;

public class Student {
	static int serialNum = 1000; // 정적 변수, 클래스 변수 
	int studentId;
	String studentName;
	int grade;
	String address;
	
	// 클래스 메서드
	public static int getSerialNum() {
		return serialNum; //일반변수는 static변수에 사용 불가 static 변수만 static 메서드에 사용 가능하다.
	}
	
	//setter
	public void setStudentId(int studentId){
		this.studentId = studentId;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	//getter
	public int getStudentId() {
		return this.studentId;
	}
	public String getStudentName() {
		return this.studentName;
	}
	public int getGrade() {
		return this.grade;
	}
	public String getAddress() {
		return this.address;
	}
}