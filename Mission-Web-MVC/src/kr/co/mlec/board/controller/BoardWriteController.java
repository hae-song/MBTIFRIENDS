package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.util.SesacFileNamePolicy;


public class BoardWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String saveFolder = "E:\\web-workspace\\Mission-Web-MVC\\WebContent\\upload";
		
		MultipartRequest multi = 
				new MultipartRequest( 
				request,	//파싱
				saveFolder,		//여기다가 저장
				1024*1024*3, 	//3메가 까지만 파일저장할거야(바이트)
				"utf-8", 		//utf-8로 인코딩
				new SesacFileNamePolicy());	//filenamepolicy	폴더에 실제 저장할땐 이름 겹치지 않게 다른이름으로 저장하고싶음.
		
		//제목, 작성자, 내용 추출
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		BoardService service = new BoardService();
		service.insertBoard(board);
		
		
		return "redirect:/board/list.do";
		
	}

}
