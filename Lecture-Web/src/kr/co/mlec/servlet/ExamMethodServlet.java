package kr.co.mlec.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/examMethod"})
//http://localhost:9999/Lecture-Web/examMethod?name=hong&hobby=reading&hobby=movie
public class ExamMethodServlet extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//System.out.println("/examMethod service()...");
	String name = request.getParameter("name");
	//String hobby = request.getParameter("hobby"); 히나밖에 못뽑아옴
	String[] hobby = request.getParameterValues("hobby");
	
	System.out.println("name : "+name);
	System.out.println("hobby : "+Arrays.toString(hobby));
	
	}

	
}
