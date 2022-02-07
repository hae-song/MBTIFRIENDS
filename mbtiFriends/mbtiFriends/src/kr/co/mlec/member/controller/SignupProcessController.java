package kr.co.mlec.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.dao.SignupDAO;
import kr.co.mlec.member.service.SignupService;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.member.vo.SignupVO;

public class SignupProcessController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //인코딩 먼저
      request.setCharacterEncoding("utf-8");
      
      String id = request.getParameter("id");
      String password = request.getParameter("pwd");
      String name = request.getParameter("name");
     
      /*
      String my_mbti = request.getParameter("mymbti");
      String like_mbti = request.getParameter("likembti");
      String dislike_mbti = request.getParameter("dislikembti");
      String addrx = request.getParameter("find_lat");
      String addry = request.getParameter("find_lng");
    */
      
      MemberVO signupVO = new MemberVO();
      signupVO.setId(id);
      signupVO.setPassword(password);
      signupVO.setName(name);
      
      
	  SignupService service = new SignupService();
	  service.signup(signupVO);
	  
	  return "redirect:/board/list.do";
	  
	  /*
	  boolean result = dao.insertMember(signupVO);
	  	
	  	String msg = "";
	  	String location ="mbtiSignup.jsp";
	  	if(result){
	  		msg="회원가입에 실패 하였습니다";
	  		location ="mbtiSignup.jsp";
	  	} else {
	  		msg = "회원가입이 완료되었습니다";
	  	}
	  		System.out.print(msg);
	      return "/jsp/login/loginForm.jsp";
	   }
	   */
}