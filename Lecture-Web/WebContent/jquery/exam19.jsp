<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 경로 이렇게 쓰는게 더 좋다 -->
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	$('#btn01').click(function(){
		//$('img').before('<strong>before</strong>')
		$('img').after('<em>after</em>','<b>맨뒤</b>')
	})	//이미지 뒤에 나오는게 after
})
</script>

</head>
<body>
<hr>
<strong>before</strong>
<img src="https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png">
<hr>
<button id="btn01">추가</button>

</body>
</html>
