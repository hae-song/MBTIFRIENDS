<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#msgView{
border:1px solid red;
height:200px;
width:500px;

}
</style>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('button').click(function(){
	
		$.ajax({
		
		/*
		url		:요청주소(문자열)
		type 	:요청메소드(문자열)
		data	:요청파라미터(문자열 또는 객체)
		success	:수신성공(함수)
		error	:수신실패(함수)
		*/	
		
		//댓글쓸때는 ajax 꼭써야한다....ㅠㅠㅠ
		
		//비동기이기때문에 콘솔의 네트워크에서만 확인할수있따.
			url:'hello.jsp',
			
			success : function(dat){	//성공했을때 data의 인자로 날아온다.
				$('#msgView').append(dat)
			}, error : function(){
				alert('실패')
			}
		
		
		})
	})
})
</script>
</head>
<body>
<h2>천국에서 받은 메세지</h2>
<div id="msgView"></div>
<button>천국에서 자료요청</button>
</body>
</html>