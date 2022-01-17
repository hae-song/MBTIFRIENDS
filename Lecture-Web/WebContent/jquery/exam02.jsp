<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	alert('ready...')
	
	//$('h1').hide()
	//$('#h01').hide()//id가 h01인 애를 찾아서 null로 만들어줘라
	//$('.c01').hide()
	//$('h1.c01').hide()	//h1이면서 class가 c01인것 지우기
	//$('body>*').hide()
	$('h1:first').hide()	//h1의 첫번째
	$('h1:last').hide()
	
	/*
	let h1Tags = document.getElementsByTagName("h1")
	for(let tag of h1Tags){
		tag.style.display = 'none'
	}
	*/
})
</script>
</head>
<body>

<hr>
<h1 id="h01">Hello</h1>
<h1 class="c01">Hi</h1>
<h2>good-bye</h2>
<hr>
<h1>Hello</h1>
<h1 class="c01">Hi</h1>
<h2 class="c01">good-bye</h2>
<hr>

</body>
</html>