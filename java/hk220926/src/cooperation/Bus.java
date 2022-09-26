package cooperation;

public class Bus {
	int busNumber;
	int passengerCount;
	int money;
	
	// 생성자
	public Bus (int busnumber) {
		this.busNumber = busnumber;
	}
	public void Take(int money) {
		this.money += money;
		passengerCount++;
	}
	public void showInfo() {
		System.out.println("버스 " + busNumber + 
				"번의 승객은 " + passengerCount + "명이고 수입은 " + money + "원 입니다.");
	}
}
