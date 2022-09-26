package array;

public class ArrayTest {

	public static void main(String[] args) {
		int i = 10;
		int [] i1 = new int[10];
		i1[2] = 11; // i1에 있는 3번째 기억공간에 11을 넣겠다.
		double d = 10.5;
		double [] d1 = new double[15];
		d1[3] = 100.5;
		System.out.println(i1[2]);
		System.out.println(d1[3]);
		System.out.println(d1[0]);
		System.out.println(i1[0]);
		int [] i2 = new int[5];
		int [] i3;
		i3 = new int[3];
		
		System.out.println("============================");
		
		// 배열의 초기화
		int i4 [] = new int [4];
		for(int idx = 0; idx < 4; idx++) {
			System.out.println(i4[idx]);
		}
		int i5[] = new int[] {100,200,300,400};
		for(int idx = 0; idx < 4; idx++) {
			System.out.println(i5[idx]);
		}
		int i6[];
		i6 = new int[] {100,200,300,400};
		// int i7[] = new int[4] {100,200,300,400}; <- 초기화할때 내가 지정한 크기값과 달라져서 []안에 값을 넣으면 안된다.
		int i8[] = {100,200,300,400};
		for(int idx = 0; idx < 4; idx ++) {
			System.out.println(i8[idx]);
		}
		/*
		int i9[];
		i9 = {100,200,300,400}; --오류 발생
		*/
		int iiii = 10;
		int y = iiii; // y = 10
		i8[2] = 100;
		y = i8[2]; // y = 100;
		
		int arr [] = new int[] {3,6,9,12};
		//                      0 1 2 3
		y = arr[0] + 2; // y = 5
		System.out.println(y);
		y = arr[1] + arr[2]; // 15
		System.out.println(y);
		/*
		y = arr[4] = 3; // ArrayIndex 4 out of bounds
		System.out.println(y);
		*/
		
	}

}