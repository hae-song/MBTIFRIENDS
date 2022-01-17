<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div01{
background-color: yellow;
height:150px;
}
</style>
<script src="js/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	alert('!!!')
	/* 
	h1 태그를 클릭하면 글자색이 빨간색으로 변하고
	h1에 마우스를 접근시키면 배경으로 노란색으로 변경하고
	h1에서 마우스가 벗어나면 배경을 흰색으로 변경한다.

	
	$('h1').click(function(){
		
	})
	
	$('h1').mouseenter(function(){
		
	})
	
	$('h1').mouseleave(function(){
		
		
	})
	*/
	//on이 마우스 갖다대는거 객체를 {}로 묶어준다.
	$('h1').on({
		'click' : function() {	//객체에는 함수도 들어갈 수 있다.
			$(this).css('color','red')
		},'mouseenter' : function() {
			$(this).css('background-color', 'yellow')
		},'mouseleave' : function() {
			$(this).css('background-color', 'white')
			
		}
		
		
	})
	
})


</script>

</head>
<body>
<div id="div01">
나는 DIV영역입니다.<br>
마우스를 접근시켜보세요

</div>

<h1>첫번째 문장입니다.</h1>
<h1>두번째 문장입니다.</h1>
<div>
<h1>세번째 문장입니다.</h1>
</div>
<h1>네번째 문장입니다</h1>
<button>클릭</button>
</body>
</html>