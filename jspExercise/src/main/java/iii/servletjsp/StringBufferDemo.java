package iii.servletjsp;

public class StringBufferDemo {

	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer("Hello");
		sb.append("@Micky");
		System.out.println(sb.toString());
		sb.insert(0, "123#");
		System.out.println(sb.toString());
		sb.replace(4, 9, "");
		System.out.println(sb.toString());
		

	}

}
