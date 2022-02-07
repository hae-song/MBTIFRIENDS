package kr.co.mlec.board.vo;

public class BoardVO {
	
	private int no;
	private String title;
	private String writer;
	private String content;
	private int viewCnt;
	private String regDate;
	private String choice;
	private String word;
	private int ref; // 계층형게시판, 글의 그룹(답글 내 같은 그룹)
	private int reStep; // 일반글 0단계 / 답글1의 답글은 1단계 / 답글 1의 답글의 답글은 2단계
	private int reLevel; // 일반글 0층 / 답글1 1층 / 답글2 1층 / 답글3 1층	
	
	public BoardVO() {
	}
	
	
	
	
	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate, String choice,
			String word, int ref, int reStep, int reLevel) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.choice = choice;
		this.word = word;
		this.ref = ref;
		this.reStep = reStep;
		this.reLevel = reLevel;
	}




	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}

	public BoardVO(int no, String title, String writer, String content) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
	}



	public BoardVO(int no, String title, String writer, int viewCnt, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	public BoardVO(int no, String title, String writer, String content, String regDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}
	
	

	public int getRef() {
		return ref;
	}



	public void setRef(int ref) {
		this.ref = ref;
	}



	public int getReStep() {
		return reStep;
	}



	public void setReStep(int reStep) {
		this.reStep = reStep;
	}



	public int getReLevel() {
		return reLevel;
	}



	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}



	public String getChoice() {
		return choice;
	}



	public void setChoice(String choice) {
		this.choice = choice;
	}



	public String getWord() {
		return word;
	}



	public void setWord(String word) {
		this.word = word;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}




	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + ", choice=" + choice + ", word=" + word + ", ref=" + ref
				+ ", reStep=" + reStep + ", reLevel=" + reLevel + "]";
	}



	

	
	
	
	
}
