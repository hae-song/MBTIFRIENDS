package kr.co.mlec.board;
/*
	 * 자바빈즈클래스
	 * 1. 패키지존재
	 * 2. 클래스 접근제한자 public
	 * 3. 멤버변수의 접근제한자 private
	 * 4. getter/setter 구현
	 * 5. 기본생성자
	 * 
	 * */

public class BoardVO {

	
	private int no;
	private String title;
	
	public BoardVO() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + "]";
	}
	
	
	
	
	
	
	
}
