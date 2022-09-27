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
		
		// 이중조건문
		score = 95;
		
		if(score >= 90) {
			if(score >= 95)System.out.println("A+");
			else System.out.println("A");
		}else if(score >= 80) {
			if(score >= 85)System.out.println("B+");
			else System.out.println("B");
		}else if(score >= 70) {
			if(score >= 75)System.out.println("C+");
			else System.out.println("C");
		}else if(score >= 60) {
			if(score >= 65)System.out.println("D+");
			else System.out.println("D");
		}else {
			System.out.println("F");
		}
		
	}
}
