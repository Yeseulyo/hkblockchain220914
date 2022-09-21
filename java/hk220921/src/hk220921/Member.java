package hk220921;

public class Member {
	private String memberNum; // 변수인걸 나타내기 위해서 첫글자를 소문자로씀. memberNum
	private String memberName;
	private int memberAge;

	// 값을 저장할 때 set 씀. // return이 있으면 자료형 적어야한다. // return 없으면 void
	// setter
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;

	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;

	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;

	}

	// getter
	public String getMemberNum() {
		return memberNum;

	}

	public String getMemberName() {
		return memberName;

	}

	public int getMemberAge() {
		return memberAge;

	}
}
