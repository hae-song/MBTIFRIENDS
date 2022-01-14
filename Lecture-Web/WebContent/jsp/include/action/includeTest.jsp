<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
request.setAttribute("id", "hong");
%>
msg :<%= msg %><br>
phone : ${phone }<br>
<h2>인클루드전</h2>
<h3>파라미터 미설정</h3>
<jsp:include page="one.jsp" />	<%--include할때 저장되니까 인클루드 하고나서 request값 찍어야함. 시점의 문제 --%>

phone: ${phone }<br>
<h3>파라미터 설정</h3>
<jsp:include page="one.jsp">
	<jsp:param name="name" value="hong"/>
	<jsp:param name="age" value="22"/>
	
</jsp:include>
<h2>인클루드후</h2>

</body>
</html>