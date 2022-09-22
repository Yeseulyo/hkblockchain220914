package account;

public class AccountTest {
	public static void main(String [] args) {
		
	
	// 문제
	// Account라는 클래스가 있고 클래스에는 
	// 계좌번호, 계좌주, 잔액이 잇고 최초 잔액 0원입니다.
	// accountNum, accountName, balance
	// 계좌 개설을 한 후 setData메서드 사용해서 각 멤버에 값을 저장
	// deposit 함수를 이용하여 입금을 시키고 잔액을 출력(+)
	// withdraw 함수를 이용하여 출금을 하고 잔액을 출력(-)
	
		Account acc = new Account();
		acc.setData("1004", "윤예슬", 0);
		System.out.println("입금");
		acc.deposit(5000000);
		System.out.println("출력");
		acc.withdraw(1000000);
	
	
	
	}	
}
