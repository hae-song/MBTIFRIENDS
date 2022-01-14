<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    //session.removeAttribute("id");
    //session.removeAttribute("password");
    
    session.invalidate(); //session영역에 저장되어있는거 한번에 지우는거.
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
<c:remove var="member" scope="session" />
 --%>

<h2>세션삭제 완료</h2>
<a href="get.jsp">삭제된 세션정보 보기</a>
</body>
</html>


