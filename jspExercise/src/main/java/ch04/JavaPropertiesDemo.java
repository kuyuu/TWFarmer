package ch04;

import java.util.Properties;
import java.util.Set;

public class JavaPropertiesDemo {

	public static void main(String[] args) {
		Properties prop = System.getProperties();
		Set set = prop.keySet();
		for (Object o : set) {
			System.out.println(o + "-->" + prop.get(o));
		}
	}

}
