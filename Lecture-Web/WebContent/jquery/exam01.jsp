<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  
<script src="js/jquery-3.6.0.js"></script>
-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
window.onload=function(){
	alert('load...')
}
//window.onload는 한번만 실행된다. 밑에꺼로 겹쳐짐.

//document.ready는 여러번 나와도 됨.
$(document).ready(function(){
	alert('ready...')
	
	
})
$(document).ready(function(){
	alert('ready...2')
	
	
})

$(function(){
	alert('ready3...')
})

</script>

</head>
<body>

</body>
</html>