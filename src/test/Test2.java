package test;

import java.util.ArrayList;
import java.util.List;

public class Test2 {
	public static void main(String[] args) {
		List<String> asd = new ArrayList<>();
		
		asd.add(0, "¤±¤¤¤·");
		asd.add(1, null);
		
		
		System.out.println(asd.get(1));
	}
}
