<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.c1{
font-style:italic
}
.c2{
color:orange
}

.blue{
color:blue
}

.red{
color:red
}
</style>

<script src="js/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	$('button').click(function(){
		//body 밑 h1 태그에다가 red라는 클래스 추가(버튼 눌렀을때)
		$('body h1').addClass('red')
		//body 밑에 전체 태그에 blue 클래스 추가, (버튼도 포함)
		$('body *').addClass('blue')
		$('h1').removeClass('red')
	})
	
	
})
</script>

</head>
<body>
<!-- h1의 클래스 명이 c1도 있고 c2도 있다. -->
<h1 class="c1 c2">나는 문장1입니다</h1>
<h1>나는 문장2입니다</h1>
<p>나는 단락입니다</p>
<div>
나는 구역입니다
</div>
<button>추가</button>


</body>
</html>