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
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String propLoc = config.getInitParameter("propLocation");
		mappings = new HandlerMapping(propLoc);
	}
	
	@Override
	public void service(HttpServletRequest request,
					HttpServletResponse response)
					throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		uri = uri.substring(context.length());
		System.out.println("요청 URI : " + uri);
		//ContextPath - 지정해준 모듈값을 불러온다 
//		System.out.println("요청 contextPath : " + contextPath);
		
		try {
			Controller control = mappings.getController(uri);
			
			String callPage = control.handleRequest(request, response);
			
			// forward or sendRedirect 선택
			if(callPage.startsWith("redirect:")) {
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
				dispatcher.forward(request, response);		
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}


