<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
hr, table{
width:80%
}

</style>

<script>
function doSignup(){
	let f = document.inputForm
	
	if(f.id.value==''){
		alert("아이디를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.name.value==''){
		alert("이름를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.password.value==''){
		alert("패스워드를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.email_id.value==''){
		alert("이메일 아이디를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.email_domain.value==''){
		alert("이메일 도메인을 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.tel1.value==''){
		alert("휴대폰 번호를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.tel2.value==''){
		alert("휴대폰 번호를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.tel3.value==''){
		alert("휴대폰 번호를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.post.value==''){
		alert("우편번호를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.basic_addr.value==''){
		alert("기본 주소를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	if(f.detail_addr.value==''){
		alert("세부 주소를 입력하세요")
		f.content.focus()
		return false
		
	}
	
	return true
}

</script>



</head>
<body>
<div align="center">

<hr>
<h2>회원 가입</h2>
<hr>
<br>

<form action = "signup.jsp" method="post" name="inputForm" onsubmit= "return doSignup()">

<table border="1">
<tr>
<th width=23%>아이디</th>
<td>
<input type="text" name="id">
</td>
</tr>


<tr>
<th>이름</th>
<td>
<input type="text" name="name">
</td>
</tr>

<tr>
<th>비밀번호</th>
<td>
<input type="text" name="password">
</td>
</tr>

<tr>
<th>이메일</th>
<td>
<input type="text" name="email_id">
<input type="text" name="email_domain">
</td>
</tr>


<tr>
<th>전화번호</th>
<td> 
<input type="text" name="tel1">
<input type="text" name="tel2">
<input type="text" name="tel3">
</td>
</tr>


<tr>
<th>우편번호</th>
<td> 
<input type="text" name="post">
</td>
</tr>


<tr>
<th>주소</th>
<td> 
<input type="text" name="basic_addr">
<input type="text" name="detail_addr">
</td>
</tr>

</table>


<br>
<input type="submit" value="회원가입">

</form>
</div>


</body>
</html>