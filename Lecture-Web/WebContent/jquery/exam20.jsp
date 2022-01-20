<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
border : 1px solid red;
padding : 10px;
}
</style>

<script src="js/jquery-3.6.0.js"></script>
<script>
//삭제
//브라우저마다 remove가 안먹힐 수 있기 때문에 부모를 찾아서 자식을 지워준다.
$(document).ready(function(){
	$('button').click(function(){
		/* 자식태그가 애매해짐
		let pTags = document.getElementsByTagName("p")
		for(let i in pTags){
			
		pTags[i].parentNode.removeChild(pTags[i]) //이건 익스플로러에서도 먹힌다.
		}
		*/
		
		//$('p').remove()
		//$('div').remove()
		//$('div').empty()
		
		/*둘이 같은말임
		$('p').remove('.c01')
		$('p.c01').remove()
		*/
		$('p').remove('c01,#id01')
	})
})
</script>
</head>

<body>

<div>
<p id="id01">나는 홍길동입니다</p>
<mark class="c01">나는 윤길동입니다</mark><br>
나는 고길동입니다<br>
<p class="c01">나는 한길동입니다</p>
<p>나는 김길동입니다</p>

</div>
<p class="c01">나는 박길동입니다</p>
<button>삭제</button>

</body>
</html>