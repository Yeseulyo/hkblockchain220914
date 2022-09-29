package inheritance;

public class VIPCustomer extends Customer{
	private int agentID;
	double saleRatio;
	
	public VIPCustomer() {
		customerGrade = "VIP";
		bonusRatio = 0.05;
		saleRatio = 0.1;
		System.out.println("VIPCustomer() 생성자 호출");
	}
	public VIPCustomer(int customerID, String customerName, int agentID) {
		//Customer(int customerID, String customerName)
		super(customerID, customerName); 
		customerGrade = "VIP";
		bonusRatio = 0.05;
		saleRatio = 0.1;
		this.agentID = agentID;
	}
	
	public int getAgentID() {
		return agentID;
	}
	@Override // 오버라이딩
	/*
	public int calcPrice(int price) {
		bonusPoint += bonusRatio * price;
		return price = (int)(price * saleRatio);
	}
	*/
	public int calcPrice(int price) {
		return super.calcPrice(price);
	}
}
