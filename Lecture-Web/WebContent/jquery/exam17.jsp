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
	$("#btn01").click(function(){
		$('#p01)/text('<mark>문장이 변환되었습니다</mark')
	})
})

</script>

</head>
<body>
<p id="p01"> 첫번째 문장입니다</p>
<p id="p02"> 두번째 문장입니다</p>
<button id="btn01">TEXT변환</button>

</body>
</html>