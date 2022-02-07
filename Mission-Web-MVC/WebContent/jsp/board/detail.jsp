<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>



<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">

<script>
function doAction(type){
	switch(type){
	case 'U':
		location.href = "updateForm.jsp?no=${param.no}" //board.no써도됨
		break;
		
	case 'D':
		break;
		
	case 'L':
		location.href="list.jsp"
		break;
	
	}
	
	
	
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
<h2>게시판 상세</h2>
<hr>
<br>
<table border="1">
<tr>
	<th width="25%">번호</th>
	<td>${board.no }</td>	
	
	<%--boardvo에 있는 no 변수 이름들.. 
	 <td><%= rs.getInt("no") %></td>
	 --%>

</tr>

<tr>
	<th width="25%">제목</th>
	<td>${board.title }</td>
	
	<%--
	<td><%= rs.getString("title") %></td>
 	--%>

</tr>

<tr>
	<th width="25%">작성자</th>
	<td>${board.writer }</td>
	<%--
	 <td><%= rs.getString("writer") %></td>
	 --%>

</tr>

<tr>
	<th width="25%">내용</th>
	<td>${board.content }</td>
	<%--
	  <td><%= rs.getString("content") %></td>
	 --%>

</tr>

<tr>
	<th width="25%">조회수</th>
	<td>${board.viewCnt }</td>
	<%--
	 <td><%= rs.getInt("view_cnt") %></td>
	 --%>

</tr>

<tr>
	<th width="25%">등록일</th>
	<td>${board.regDate }</td>
	
	<%--
	<td><%= rs.getString("reg_date") %></td>
	 --%>

</tr>

<tr>
	<th width="25%">첨부파일</th>
	<td>
	<%--오브젝트 형이라서 foreach로 하나하나 볼수있음. file이라는 이름으로 쓰겠다. --%>
	<c:forEach items="${ fileList }" var="file">
	<a href="${ pageContext.request.contextPath }/upload/${file.fileSaveName}">
	${ file.fileOriName }
	</a>
	(${file.fileSize }bytes)<br>
	</c:forEach>
	</td>

</tr>


</table>
<br>
<button onclick="doAction('U')">수정</button>
<button onclick="doAction('D')">삭제</button>
<button onclick="doAction('L')">목록</button>



</div>















</section>

<footer> 
<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>

</body>
</html>







