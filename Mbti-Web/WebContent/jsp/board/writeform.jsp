<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>글등록페이지</title>
<style>
hr, table{
width:80%
}


</style>
<script>
function doWrite(){
	let f = document.inputForm
	
	if(f.title.value==''){	//공백일때 alert
		alert("제목을 입력하세요")
		f.content.focus()
		return false
	}
	
	if(f.writer.value==''){
		alert("글쓴이를 입력하세요")
		f.content.focus()
		return false
	}
	
	if(f.content.value==''){
		alert("내용을 입력하세요")
		f.content.focus()
		return false
	}
	
	return true
}

</script>
</head>

<body>

	
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp" />
	</header>
	
	<section>body부분
		
			<div align="center">
		
		<hr>
		<h2>새글 등록</h2>
		<hr>
		<br>
		
		<form action = "${pageContext.request.contextPath }/board/write.do" method="post" name="inputForm" onsubmit="return doWrite()"
		enctype="multipart/form-data">
		<%--
		writer값을 디비에 보내줘야 되는데 로그인 아이디로 작성자를 설정해 놔서 writer 값을 디비에 보내줄 수 없음   -> 로그인한 아이디로 writer값을 보내주기 위해 hidden사용 !!
		 --%>
		<input type="hidden" name="writer" value="${userVO.id }">
		
		<table border="1">
		<tr>
			<th width="23%">제목</th>
			<td>
			<input type="text" name="title" >	
			</td>
			
		</tr>
		
		
		<tr>
		<th>글쓴이</th>
		<td>
		${userVO.id }
		<!-- 
		 <input type="text" name="writer" >
		 -->
		</td>
		</tr>
		
		<tr>
		<th>내용</th>
		<td>
		<textarea name="content" rows="7" cols="60" ></textarea>
		</td>
		</tr>
		
		 <tr>
               <th>첨부파일</th>
               <td>
                  <input type="file" name="attachfile1"><br>
                  <input type="file" name="attachfile2"><br>
               </td>
            </tr>
		
		
		</table>
		
		<br>
		<input type ="submit" value="새글등록">
		
		</form>
		
		
		</div>
	</section>

	<footer> 
		<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
	</footer>

</body>
</html>