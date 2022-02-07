<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	$('button').click(function(){
		location.href = "mbtiSignup.jsp";
	})
	
})
		


</script>
</head>
<body>
<h1>당신의 MBTI 친구를 찾아보세요</h1>
<button id="go">입장하기</button>


</body>
</html>