package kr.co.mlec.controller;

import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;

import kr.co.mlec.board.controller.BoardListController;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;


public class HandlerMapping {
	
	private Map<String, Controller> mappings = null;
	
	public HandlerMapping(String propLoc) {
		
		//properties파일 읽기
		Properties prop = new Properties();
		mappings = new HashMap<>();
		
		//예외처리 안하면 오류남
		try {
		//파일 읽어오기
			
		//InputStream is = new FileInputStream("F:\\web-workspace\\Mbti-Web\\bean.properties");
		InputStream is = new FileInputStream(propLoc);
		
		//inputstream 필요함
		prop.load(is);
		Set<Object> keys = prop.keySet();
		
		//key 값 받기
		for(Object key:keys) {
								
			//property 파일에서 key만 뽑아내는게 keyset
			//property에서 value 뽑아내는게 getproperty
			
			String className = prop.getProperty(key.toString());
			System.out.println(key+" : "+className);
			
			//bean properties파일만 고치면된다.
			//classname으로 클래스를 만든다.
			Class<?> clz = Class.forName(className);
			//그 클래스의 객체를 만든다.
			mappings.put(key.toString(),(Controller)clz.newInstance());
			
			/*
			 * 
			 *
		//mappings.put(key.toString(), value);
										//이객체만들고싶어서
		mappings.put("/board/list.do", new BoardListController());
		mappings.put("/board/writeForm.do", new BoardWriteFormController());
		
			 * 
			 * 
			 * */
			
		}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	

	}
	
public Controller getController(String uri) {
	return mappings.get(uri);
	
}

public static void main(String[] args) throws Exception{
	
	/*									try catch 쓰기 싫어서 throws
	java.util.Random r = new java.util.Random();
	
	int random = r.nextInt(100);
	System.out.println("추출된 난수 : "+random);
	*/
	
	/*
	Class<?> clz = Class.forName("java.util.Random");
	//선 그어진건 무시하기
	java.util.Random obj = (java.util.Random)clz.newInstance();
	//인스턴스 객체 받아옴.
	int random = obj.nextInt(100);
	System.out.println("추출된 난수 : "+random);
	*/
	
	//이 클래스의 인스턴스 객체 만들기가 목표
	//BoardListController obj = new BoardListController();를 동적으로 표현한것
	//클래스로 파일을 읽고 그떄그때마다 객체 만들수있음
	
	Class<?> clz = Class.forName("kr.co.mlec.controller.BoardListController");
	
	BoardListController obj = (BoardListController)clz.newInstance();
	System.out.println(obj.handleRequest(null,null));
}


}
