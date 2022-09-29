package cooperation;

public class SubWay {
	int lineNumber;
	int passengerCount;
	int money;
	
	//생성자
	public SubWay(int lineNumber) {
		this.lineNumber = lineNumber;
	}
	public void take(int money) {
		this.money += money;
		passengerCount++;
	}
	public void showInfo() {
		System.out.println(lineNumber + "호선의 승객은 "
				+ passengerCount + "명이고 수익금은 " +  money + "원 입니다.");
		
	}
}
