package kr.co.mlec.util;

import java.util.ArrayList;
import java.util.List;

public class test {

	
	public static void main(String[] args) {
		List<String> list = new ArrayList<>();
		
		
		
		list.add("hello");
		list.add("hi");
		
		
		System.out.println(list);
		
		list.add("hello");
		
		
		for(int i=0;i<5;i++ ) {
			
			list.add("hello");
			
			//list[i] = list;
			
		}
		
		
	}
}
