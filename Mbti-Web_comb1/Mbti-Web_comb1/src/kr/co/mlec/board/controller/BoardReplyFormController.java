package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;

public class BoardReplyFormController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      int no = Integer.parseInt(request.getParameter("no"));
      BoardDAO dao = new BoardDAO();
      BoardVO board = new BoardVO();
       
       
      // BoardService service = new BoardService();
       
       board = dao.selectBoardByNo(no);
       
       if(board == null){ // 게시물이 존재하지 않을 경우 아래 경고를 발생 
            System.out.println("(Reply)Board Detail is Null");
            return null;
         }
   
       request.setAttribute("board", board); // JSP에 값을 넘겨주기 위하여 세팅

       
         return "/jsp/board/replyForm.jsp";
   
   }

}