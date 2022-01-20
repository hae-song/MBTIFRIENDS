<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		width: 150px;
	}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		//앞에다가 붙이는거
		$('#next').click(function(){
			//$('img').first().appendTo('body')	//first($('img').eq(0)랑 같음)를 잘라내서 body에 붙여라
			$('img').last().prependTo('body')
				
		})
		
		//뒤에다가 붙이는거
		$('#prev').click(function(){
			$('img').first().appendTo('body')
		})
		
		/*
		setInterval(function(){
			$('#next').trigger('click')
		},2000) //이벤트가 발생하지 않아도 자동으로 클릭하는 느낌으로
		*/
	})
</script>
</head>
<body>
	<img src="/Lecture-Web/html/dogs/dog.jpg">
	<img src="/Lecture-Web/html/dogs/dog2.jpg">
	<img src="/Lecture-Web/html/dogs/dog3.jpg">
	<img src="/Lecture-Web/html/dogs/dog4.jpg">
<br>

	<button id='prev'>클릭</button>
	<button id='next'>클릭</button>
</body>
</html>








