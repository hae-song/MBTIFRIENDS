<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/*
자바스크립트 객체
let person = {
		변수명 : 값, 변수명 : 값, ...
}
json이라고 함
*/

let person={
		name : '홍길동',
		phone : '010-1111-2222',
		info : function(){
			alert(this.name +' : '+this.phone)
		}
		
		//'phone-home'과 같은 -붙일때는 작은따옴표 필수
}

</script>
</head>
<body>

</body>
</html>