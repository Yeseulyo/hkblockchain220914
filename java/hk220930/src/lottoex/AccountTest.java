package lottoex;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class AccountTest {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Map<String, Account> map = new HashMap<>();
		while(true) {
		System.out.println("계좌번호 : 1 | 입금 : 2 | 출금 : 3 | 계좌출력 : 4 | 종료 : 5");
		System.out.print("헤당 번호를 입력해주세요.");
		String num = sc.nextLine(); //문자열을 받아올 땐 nextLine
		switch(num) {
		case "1" : 
			System.out.println("계좌번호 등록");
			System.out.println("계좌번호를 입력하세요 : ");
			String accNum = sc.nextLine(); 
			System.out.println("계좌주를 입력해주세요 : ");
			String accName = sc.nextLine(); 
			System.out.println("금액을 입력해주세요 : ");
			int money = Integer.parseInt(sc.nextLine());
			Account acc = new Account(accNum, accName, money);
			map.put(accNum, acc);
			break;
		case "2" :
			System.out.println("입금입니다.");
			System.out.println("계좌번호를 입력해주세요 : ");
			accNum = sc.nextLine();
			acc = map.get(accNum);
			System.out.println("입금 금액을 입력해주세요 : ");
			money = Integer.parseInt(sc.nextLine());
			acc.deposit(money);
			System.out.println();
			break;
		case "3" :
			System.out.println("출금입니다.");
			System.out.println("계좌번호를 입력해주세요 : ");
			accNum = sc.nextLine();
			acc = map.get(accNum);
			System.out.println("출금 금액을 입력해주세요 : ");
			money = Integer.parseInt(sc.nextLine());
			acc.withdraw(money);
			System.out.println();
			break;
		case "4" :
			System.out.println("계좌 출력");
			System.out.println("계좌 번호 \t 계좌주 \t 금액");
			for(String key : map.keySet()) {
				Account ac = map.get(key);
				ac.print();
			}
			break;
		case "5" :
			System.out.println("프로그램이 종료되었습니다.");
			System.exit(0);
			break;
			default :
				System.out.println("잘못된 번호입니다.");
		}
		}
	}

}
