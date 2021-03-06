package kr.co.mlec.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.util.SesacFileNamePolicy;

public class BoardWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String saveFolder = "D:\\Lecture\\web-workspace\\mbtiFriends\\WebContent\\upload";
		
		MultipartRequest multi = new MultipartRequest(
							request, saveFolder, 1024*1024*3, 
							"utf-8", new SesacFileNamePolicy());
		
		// 제목, 작성자, 내용 추출 -> tbl_board 저장
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
//		service.insertBoard(board);
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		
		
		//multi.getFile(attachfile1); -> 이런식으로 첨부파일명을  불러와도 되지만  
		//multi.getFile(attachfile2); -> file크기 및 개수등 여러상황을 위해 fileName으로 불러온다
		
		//첨부파일 추출(file_ori_name, file_save_name, file_size) -> tbl_board_file 저장
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String fileName = files.nextElement();
		//	System.out.println(fileName);
			File file = multi.getFile(fileName);
			//File -> 파일의 속성을 알수있는 객체
			
			if(file != null) {
				String fileOriName = multi.getOriginalFileName(fileName);
				String fileSaveName = multi.getFilesystemName(fileName);
				int fileSize = (int)file.length();
				
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setFileOriName(fileOriName);
				fileVO.setFileSaveName(fileSaveName);
				fileVO.setFileSize(fileSize);
				
				fileList.add(fileVO);
			}
		}
		BoardService service = new BoardService();
		service.insertBoard(board, fileList);
		
		
		return "redirect:/board/list.do";
	}

}
