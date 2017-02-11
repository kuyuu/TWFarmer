package ch03;

public class GetClassDemo {

	public static void main(String[] args) {
		Integer i = new Integer(100);
		Number n = i;
		Object o = n;

		System.out.println(i.getClass().getName());
		System.out.println(n.getClass().getName());
		System.out.println(o.getClass().getName());
	}

}
