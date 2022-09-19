package hk220919;

public class Ex03 {
	public static void main(String [] args) {
		// 제어문 : 조건문, 반복문
		// 조건문 : condition에 따라 실행할지 안할지
		// if(condition : 조건식){ // true : 실행
		//      명령어;
		//       ...
		//  }
		// 조건식 : 관계연산자 또는 논리연산자.
		// 단일 if문 : 실행이 되거나 안되거나 
		
		int i = 10;
		if(i < 20) System.out.println("작다");
		if(i < 20) {System.out.println("작다");}
		if(i < 20) {
			System.out.println("i가");
			System.out.println("작다");
		}
		
        System.out.println("==================================");
        i = 30; 
        if(i < 20) System.out.println("작다");
                   System.out.println("싫행되는 명령어"); // if문 영향을 안받음
        
                  
					int money = 3000;
					// 3000 원 이상이면 "차를 타고 가시오"를 출력
					if (money >= 3000)
						System.out.println("차를 타고 가시오");
					System.out.println("if문 종료");

					money = 2000;
					// 3000 원 이상이면 "차를 타고 가시오"를 출력
					if (money >= 3000)
						System.out.println("차를 타고 가시오"); // 조건을 만족 안해서 밑에 것만 출력 {}로 안 묶어서
					System.out.println("if문 종료");

					// 컨트롤 시피트 에프 누르면 자동으로 라인 맞춤 // 들여쓰기 안 된 문장은 조건문이 아니다.
					
					money = 3000; 
					// 3000 원 이상이면 "차를 타고 가시오"를 출력
					if (money >= 3000) {
						System.out.println("차를 타고 가시오");
					}
					System.out.println("if문 종료");
                   
        
        
	}
}
