package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.controller.Controller;

public class BoardWriteFormController2 implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		//forward시킬 주소 알려줌
		return "/jsp/board/writeform.jsp";
		
	}
}
