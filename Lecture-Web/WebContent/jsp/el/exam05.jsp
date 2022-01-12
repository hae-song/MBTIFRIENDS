<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Map<String, String> b = new HashMap<>();
    b.put("no","10");
    b.put("title","제목입니다");
    
    pageContext.setAttribute("board",b);
        
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

no : <%= b.get("no") %><br>
title : <%= b.get("title") %><br>

<hr>
el no : ${board.no }<br>	<!-- board.no 는 key이 no라는 값을 뽑아달라는거 -->
el title : ${board.title }<br>

el aaa : ${ board.aaa }<br> <!-- 빈값나옴. empty라서 , 자바빈즈클래스랑 결과가 다름.--> 

</body>
</html>