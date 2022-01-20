<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body *{
display:block;
border:1px solid red;
padding:10px;
margin:10px;


}

.blue{
border-color:blue
}

</style>

<script src="js/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){
	//span태그의 부모의 border-color를 blue로 바꾸고싶음.
	//$('span').parent().css('border-color','blue')
	//$('span').parents().addClass('blue') 여러개
	//$('span').parents('div').addClass('blue')
	//$('span').parentsUntil('div').addClass('blue') div전까지의 부모까지
	//자식의 클래스들을 blue로(후손의 후손까지 접근하기가 힘듬)
	//$('#ancester').children().addClass('blue')
	//$('#ancester').children('#div02').addClass('blue') div02만
	//$('#ancester').children('ul').addClass('blue') ul태그에 안먹힘
	$('#ancester').find('ul').addClass('blue')
	
	
	
})
</script>

</head>

<body>
<div id="ancester">div
		<div id="div01">div1
			<ul>ul
				<li>li
					<span>span</span>
				</li>
			</ul>
		</div>
		<div id="div02">div2
			<p>p
				<span>span</span>
			</p>
		</div>
	</div>
</body>
</html>