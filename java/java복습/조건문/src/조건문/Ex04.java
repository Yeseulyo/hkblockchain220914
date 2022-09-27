package 조건문;

public class Ex04 {
	public static void main(String [] args) {
		int score = 90;
		char grade;
		
		if(score >= 90) {
			grade = 'A';
			System.out.println(grade + " 입니다.");
		}else if(score >= 80) {
			grade = 'B';
			System.out.println(grade + " 입니다.");
		}else if(score >= 70) {
			grade = 'C';
			System.out.println(grade + " 입니다.");
		}else if(score >= 60) {
			grade = 'D';
			System.out.println(grade + " 입니다.");
		}else {
			grade = 'F';
			System.out.println(grade + " 입니다.");
		}
	}
}
