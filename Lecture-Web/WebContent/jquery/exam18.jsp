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
	$('#btn01').click(function(){
		
		/*
		//<h1>세번째문장</h1>
		let h1Tag = document.createElement('h1')
		let text = document.createTextNode('세번째 문장')
		h1Tag.appendChild(text)
		//console.log(h1Tag)
		document.querySelector('div').appendChild(h1Tag)
		*/
		//위의 내용을 jquery로 사용 간단하게~
		$('div').append('<h1>세번째 문장</h1>')
	})
	$('#btn02').click(function(){
		/*
		$('ol').append('<li>노랑</li>')
		글머리번호 아래부터 순서대로 나타난다.
		*/
		$('ol').prepend('<li>노랑</li>') //위에서부터 순서대로 나타난다.
		
		
	})
})
	
	$(document).ready(function(){
	$('#btn03').click(function(){
		//$('body').prepend('<h4>추가된 문장</h4>')
		//$('body').prepend('<h3>또 추가된 문장</h3>')
		//$('body').prepend('<h6>또또 추가된 문장</h6>')
		
		$('body').prepend('<h4>추가된 문장</h4>' ,'<h3>또 추가된 문장</h3>','<h6>또또 추가된 문장</h6>' )
		//순서가 h4, h3, h6순서대로 추가된다. 위에 하나하나 추가하는거랑 다름. 위에는 h6, h3, h4 순으로 추가
		
	})
	})
	
	
	

</script>

</head>
<body>
<div>
<h1>첫번째 문장</h1>
<h1>두번째 문장</h1>
<!-- 
 <h1>세번째 문장</h1>
 -->

</div>
<h2>색상표</h2>
<ol>
<li>빨강</li>
<li>파랑</li>
<li>초록</li>


</ol>
<button id="btn01">문장추가</button>
<button id="btn02">색상추가</button>
<button id="btn03">본문추가</button>

</body>
</html>