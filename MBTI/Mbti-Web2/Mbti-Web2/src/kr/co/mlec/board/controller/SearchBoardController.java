package kr.co.mlec.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.controller.Controller;

public class SearchBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardService service = new BoardService();
		BoardDAO dao = new BoardDAO();
		PagingVO paging = new PagingVO();
		

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String choice = request.getParameter("choice");
		String word = request.getParameter("word");
		
		int count = dao.getSearchCount(choice, word);
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		System.out.println(paging);
		
        //BoardVO board = new BoardVO();
        
       
		//BoardService service = new BoardService();
		
		System.out.println(choice + " : " + word);
        List<BoardVO> list = service.searchByOneBoard(choice, word);
        
     //   board.setChoice(choice);
     //   board.setWord(word);
        
		/*
		 * int no = Integer.parseInt(request.getParameter("no")); String title =
		 * request.getParameter("title"); String writer =
		 * request.getParameter("writer"); String content =
		 * request.getParameter("content"); int viewCnt =
		 * Integer.parseInt(request.getParameter("view_cnt")); String regDate =
		 * request.getParameter("reg_date");
		 */
       // }

        request.setAttribute("list", list);
      
        request.setAttribute("paging", paging);
        
        return "/jsp/board/searchBoard.jsp?choice="+choice+"&word="+word+"&page="+page;
        
       // return "redirect:/board/searchBoard.do?choice=" + choice + "&word=" + word + "&page=" + page;
        }

}
