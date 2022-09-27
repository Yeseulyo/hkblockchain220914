package inheritance;

public class CustomerTest1 {

	public static void main(String[] args) {
		Customer customerLee = new Customer(111, "이숭무");
		//Customer customerLee = new Customer(); // 생성자 실행
		customerLee.setCustomerID(10010);
		customerLee.setCustomerName("이순신");
		customerLee.bonusPoint = 1000;
		System.out.println(customerLee.showCustomerInfo());
		
		VIPCustomer customerKim = new VIPCustomer(111, "이장범", 10);
		//VIPCustomer customerKim = new VIPCustomer(); // 생성자
		customerKim.setCustomerID(10020);
		customerKim.setCustomerName("김유신");
		customerKim.bonusPoint = 10000;
		System.out.println(customerKim.showCustomerInfo());
		

	}

}
