<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import = "kr.co.mlec.util.ConnectionFactory" %>
<%@ page import = "kr.co.mlec.util.JDBCClose"%>
<%@ page import = "java.util.List" %>
<%@ page import = "kr.co.mlec.board.vo.BoardVO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <% 
    /* tbl_board에서 전체게시글(번호, 제목, 작성자, 등록일) 조회*/
    
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = dao.selectAllBoard();
    

    
    pageContext.setAttribute("list",list);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">

<script src="/Lecture-Web/jquery/js/jquery-3.6.0.js"></script>



<script>
//jquery로 함수 필요없이 그냥 클릭 쓸수있다.
$(document).ready(function(){
	
	$('button').click(function(){
		location.href="writeform.jsp"
		
	})
})

	function goWriteForm(){
	location.href = "writeform.jsp"
	
	}

	function doAction(boardNo){
		<c:choose>
		
			<c:when test="${ not empty userVO }">
			location.href="detail.jsp?no=" + boardNo
			</c:when>
			
			<c:otherwise>
				if(confirm('로그인서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
					location.href = '/Mission-Web/jsp/login/loginForm.jsp'
				}
			</c:otherwise>
		
		</c:choose>
		
		
	}	
	

</script>


</head>



<body>

	<header>
	<jsp:include page="/jsp/include/topmenu.jsp" />
	 </header>
<section>


<!-- 주석 -->
<div align="center">
<hr>
<h2>게시판 목록</h2>
<hr>
<br>

<table border ="1" class="list">
<tr>
<th width="7%">번호</th>
<th>제목</th>
<th width="16%">글쓴이</th>
<th width="20%">등록일</th>


</tr>
<c:forEach items="${list }" var="board" >
	<tr>
	<td>${board.no }</td>
	<td>
	
	<%-- 
	<a href="detail.jsp?no=${board.no}">
	<c:out value="${board.title }"/>
	</a>
	--%>
	
	<%--
	<a href="javascript:alert('!!!')"> 클릭했을때 자바스크립트 함수(alert('!!!'))라는 호출하기
	 --%>
	 
	 <a href="javascript:doAction(${board.no })"> 
	 <%--foreach문이 돌고있으니까 한 행의 board.no 아는것. foreach 블럭 넘어가면 board.no모름 그래서 파라미터로 board.no써주는것 --%>

	<c:out value="${board.title }"/>
	</a>
	
	
	
	</td>
	<td>${board.writer }</td>
	<td>${board.regDate }</td>
	</tr>
</c:forEach>
<%--

<%
while(rs.next()){
int no = rs.getInt("no");
String title = rs.getString("title");
String writer = rs.getString("writer");
String regDate=rs.getString("reg_date");

%>
 
 
<tr>
<td><%= no %></td>
<td><a href="detail.jsp?no=<%=no%>"><%= title %></td>
<td><%= writer %></td>
<td><%= regDate %></td>

</tr>
--%>

</table>


<br>
<c:if test="${not empty userVO  }">
<button>새글등록</button>
</c:if>

</div>





</section>

<footer> 
<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>

</body>
</html>






