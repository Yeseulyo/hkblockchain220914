package lottoex;

public class Account {
	String accNum;
	String accName;
	int balance;
	public Account (String accNum, String accName, int balance) {
		this.accName = accName;
		this.accNum = accNum;
		this.balance = balance ;
		
	}
	// 입금
	public void deposit(int money) {
		balance += money;
	}
	
	// 출금

	public void withdraw(int money) {
		balance -= money;
	}
	public void print() {
		System.out.println(accNum + "\t" + accName + "\t" + balance);
	}
}