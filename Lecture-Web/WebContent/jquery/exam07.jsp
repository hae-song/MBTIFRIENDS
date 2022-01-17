<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	alert('!!!')
	$('input').keydown(function(){
		//input태그에 keydown이벤트(key입력)가 발생하면 함수를 실행시켜줘!
		$(this).css('color','orange')
	
		$('input').keyup(function(){
			$(this).css('color','black')//key뗄때 검정색으로
		})
		
	})
		$('input').focus(function(){
			$(this).css('border','2px solid skyblue')
			$(this).css('background-color','pink')		
		
		
	})
	
	$('input').blur(function(){
		$(this).css('border','1px solid black')
		$(this).css('background-color','gray')	//입력하고 다른곳으로 넘어가면 그곳 바뀜
	})
	
})
</script>

</head>
<body>
이름 : <input type="text" size="30"><br>
전화번호 : <input type="text" size="30"><br>
</body>
</html>