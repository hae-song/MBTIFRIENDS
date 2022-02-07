package kr.co.mlec.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;


public class BoardReplyController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      request.setCharacterEncoding("utf-8");
      
      BoardVO board = new BoardVO();
      int no = Integer.parseInt(request.getParameter("no"));

      //int result = 0;
      
      board.setNo(Integer.parseInt(request.getParameter("no")));
      board.setNo(no);
      board.setTitle(request.getParameter("title"));
      board.setWriter(request.getParameter("writer"));
      board.setContent(request.getParameter("content"));
      //board.setViewCnt(Integer.parseInt(request.getParameter("view_cnt")));
      //board.setRegDate(request.getParameter("reg_date"));
      board.setRef(Integer.parseInt(request.getParameter("ref")));
      board.setReStep(Integer.parseInt(request.getParameter("re_step")));
      board.setReLevel(Integer.parseInt(request.getParameter("re_level")));
      
      
      
      
      //String title = request.getParameter("title");
      //String writer = request.getParameter("writer");
      
      //board.setTitle(title);
      //board.setWriter(writer);
   
//      BoardDAO dao = new BoardDAO();
//      
//      int result = dao.replyBoard(board);
//      
//      if(result == 0) {
//         System.out.println("답글 작성을 실패하였습니다.");
//         return null;
//      }
   
      
      BoardService service = new BoardService();
      service.replyBoard(board);
      
      
      return "redirect:/board/list.do";
      //return "redirect:/board/detail.do?no="+Integer.parseInt(request.getParameter("no"));
   }


}