<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.mlec.member.vo.SignupVO"%>
<%@page import="kr.co.mlec.member.dao.SignupDAO"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	SignupVO vo = new SignupVO(id, pwd, name);
	
	SignupDAO dao = new SignupDAO();
	boolean result = dao.insertMember(vo);
	
	String msg = "";
	String location ="member.jsp";
	if(result){
		msg="회원가입에 실패 하였습니다";
		location ="member.jsp";
	} else {
		msg = "회원가입이 완료되었습니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg%>");
</script>
</head>
<body>

</body>
</html>