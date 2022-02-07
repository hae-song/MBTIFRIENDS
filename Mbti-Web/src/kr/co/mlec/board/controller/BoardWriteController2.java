package kr.co.mlec.board.controller;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.util.SesacFileNamePolicy;


public class BoardWriteController2 implements Controller {

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
		//service.insertBoard(board);
		
		/*
		multi.getFile("attachfile1");
		multi.getFile("attachfile2");
		원래는 이렇게 쓰는데 밑에서는 파일이름을 받아오고 파일객체를 만들겠다
		*/
		
		//첨부파일 추출(file_ori_name, file_save_name, file_size) ==> tbl_board iterator이랑 비슷
		Enumeration<String> files = multi.getFileNames();
		
		//hasmoreelements는 enumeration 의 내장함수
		while(files.hasMoreElements()) {
			String fileName = files.nextElement();
			//System.out.println(fileName);
			File file = multi.getFile(fileName);
			//System.out.println(fileName + ":"+file);
			
			if(file != null) {
				String fileOriName = multi.getOriginalFileName(fileName);
				String fileSaveName = multi.getFilesystemName(fileName);
				
				//크기는 file객체로 알수있음. 원래 long 형태
				int fileSize = (int)file.length();
				
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setFileOriName(fileOriName);
				fileVO.setFileSaveName(fileSaveName);
				fileVO.setFileSize(fileSize);
				
				
				System.out.println(fileOriName);
				System.out.println(fileSaveName);
				System.out.println(fileSize);
			}
		}
		
		
		
		
		
		
		return "redirect:/board/list.do";
		
	}

}
