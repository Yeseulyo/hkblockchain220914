package cooperation;

public class Student {
	String StudentName;
	int grade;
	int money;
	
	// 생성자
	public Student(String studentName, int money) {
		this.StudentName = studentName;
		this.money = money;
	}
	public void takeBus(Bus bus) { //객체변수를 매개변수로 사용할 수 있다. 객체를 넘기기위해서는 객체변수여야한다.
		bus.Take(1000);
		this.money -= 1000;
	}
	public void takeSubWay(SubWay subWay) {
		subWay.take(1500);
		this.money -= 1500;
	}
	public void showInfo() {
		System.out.println(StudentName + "님의 남은 돈은" 
				+ money + "원 입니다.");
		
	}
	
}
