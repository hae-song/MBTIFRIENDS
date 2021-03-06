package kr.co.mlec.board.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;

// /board/list.do (전체리스트조회) 호출되었을때
// 1. 비지니스로직수행(tbl_board에서 전체게시글 조회)
// 2. servlet에게 forward 시킬 jsp/board/list.jsp 알려줌

public class BoardListController implements Controller {

	@Override
	//jsp주소를 알려줘야하니까 return 값 string
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		
		BoardService service = new BoardService();
		
		List<BoardVO> list = service.selectAllBoard();
		
		
		
		
		//request영역에 등록(공유영역)
		request.setAttribute("list",list);
		
		
		return "/jsp/board/list.jsp";
		
	}
}
