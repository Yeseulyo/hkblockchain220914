package hk220929;

public class StringTest1 {

	public static void main(String[] args) {
		String str1 = new String("abc");
		String str2 = new String("abc");
		
		String str3 = "abc";
		String str4 = "abc";
		System.out.println(str1 == str2);
		System.out.println(str3 == str4);
		System.out.println(str1.equals(str2));
		System.out.println(str3.equals(str4));

		
		String javaStr = new String("Java");
		//                           0123
		String androidStr = new String("Android");
		System.out.println(javaStr + androidStr);
		System.out.println(javaStr.concat(androidStr));
		System.out.println(javaStr.toLowerCase());
		System.out.println(javaStr.toUpperCase());
		System.out.println(javaStr.charAt(2));
		System.out.println(javaStr.indexOf('a'));
		System.out.println(String.valueOf(10) + "ubvusb");
		System.out.println(10 + "ubvusb");
		System.out.println(javaStr.lastIndexOf("a"));
		String str5 = "Life is too short";
		//             01234567890123456
		//
		System.out.println(str5.substring(5, 5 + 6));
		System.out.println(str5.substring(8, 8 + 3));
		
		System.out.println(str5.indexOf("is"));
		System.out.println(str5.substring(str5.indexOf("is"), str5.indexOf("is") + 6));
		System.out.println(str5.substring(8));
			

	}

}
