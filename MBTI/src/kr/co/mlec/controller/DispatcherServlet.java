package kr.co.mlec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {

	private HandlerMapping mappings = null;
	
	@Override		//servletconfig는 환경설정 제어
	public void init(ServletConfig config) throws ServletException {
		
		//xml에 initparam으로 설정해놓은것.
		String propLoc = config.getInitParameter("propLocation");
		System.out.println("prop : "+propLoc);
		mappings = new HandlerMapping(propLoc);
	}
	
	@Override
	public void service(HttpServletRequest request, 
					HttpServletResponse response) 
					throws ServletException, IOException {
		
		//throws : 예외 처리에 대한 책임을 전가시키는 키워드
		//throw : 예외를 발생시키는 키워드
		String uri = request.getRequestURI();
		
		// "/Mission-Web-MVC/ 이부분 가져옴
		String context = request.getContextPath();
		uri = uri.substring(context.length());
		System.out.println("요청 URI : " + uri);

		try {
			
			Controller control = mappings.getController(uri);
			
			String callPage = control.handleRequest(request, response);
			
			//forward or sendRedirect 선택
			if(callPage.startsWith("redirect:")) {
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath()+callPage);
				
			}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
			dispatcher.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
	}
}









