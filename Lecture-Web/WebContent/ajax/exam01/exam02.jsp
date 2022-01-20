<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$('button').click(function(){
		//param.jsp?name=hong&age=25
				
		$.ajax({
			type:"post",
			url:'param.jsp',
			data:'name=hong&age=25',
			success : function(data){
				$('#debug').val(data.trim())
			}, error:function(error){
				alert('오류상태코드 : '+error.status)	//코드상태가 뜸!
			}
		})
	})
})
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	이름 : <input type="text" name="name" id="name"><br>
	나이 : <input type="text" name="age" id="age"><br>
	<button>호출</button>
</body>
</html> 