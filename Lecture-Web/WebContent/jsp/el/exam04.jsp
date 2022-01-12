<%@page import="kr.co.mlec.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    BoardVO b = new BoardVO();
    b.setNo(10);
    b.setTitle("제목입니다");
    
    //pageContext영역에 객체 등록
    //이름 : board 값 : 생성된 BoardVO 객체
    pageContext.setAttribute("board",b);	//b가 가리키고있는 board객체를 넣어줌??
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
no : <%= b.getNo() %><br>

<%--  
no : <%= ((BoardVO)pageContext.getAttribute("board")).getNo() %> //이거 별로 안좋음 ><br>	
title : <%= b.getTitle() %><br>
--%>

<hr>

el no : ${board.no }<br>
el title : ${board.title }<br>
el aaa : ${ board.aaa }<br> <!-- 500에러 나옴.. 자바빈즈클래스에서 프로퍼티를 찾을수없다고함.--> 
el title : ${board['title'] }<br> <!-- 이렇게도 가능 -->


</body>


</html>