package kr.co.mlec.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.controller.Controller;

public class SignupProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//인코딩 먼저
		request.setCharacterEncoding("utf-8");
		
		String addrx = request.getParameter("find_lat");
		
		System.out.println(addrx);
		
		return null;
	}

}
