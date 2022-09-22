package classMathod;

public class Ex01 {
	public static void main(String [] args) {
		
	
	String name = "이숭무";
	int age = 15;
	String addr = "성남";
	System.out.println( " age = 세인 " + name + "은 " + addr +"에 살아요." );
	
	String name1 = "장인호";
	int age1 = 15;
	
	
	Member member = new Member(); // 
	/* name;
	   age;
	   addr;
	 */
	member.addr = "성남";
	member.age = 15;
	member.name = "이숭무";
	
	Member member1 = new Member();
	                 // 객체/인스턴스   (Member 클래스를 불러라.)
	// heap 영역에 만들어진 모든 것을 객체라고 한다.
	member.name = "장인호";
	member.age = 15;
	
	
	Member_1 member_1 = new Member_1();
	//member_1.name = " 1edjfdsl" // 직접전근을 방지해서 오류 뜸.
	// name
	// age
	//addr
	//setData()
	//print()
	
	// 호출메서드 (클래스 안에 있는 메서드를 호출한다.)
	// 피호출 메서드에 있는 parameter에 값을 전달 하기 위해서 사용.
	// 변수명 적기(소문자)  argument / 실인자 / 전달 인자
	member_1.setData("이숭무", 15, "성남");
	member_1.print();
	Member_1 i = new Member_1();
	member_1.setName("장인호");
	member_1.print();
	
	// 호툴메서드
	String addr11 = member_1.getAddr(); // 성남
	System.out.println(addr11); // addr인데 위에 addr이 있어서 변수명 바꿈
	
	
	}
}






//int i = 10; // = Member_1 member_1 = new Member_1(); // 변수 선언하는 것과 같다.
//객체타입      변수        객체변수

// 파라메타는 변수형태 아그먼트는 값 형태
// 파라메타와 아그먼트는 일대이 대응 (파라메타 와 아그먼트 수는 같아야 한다.)
