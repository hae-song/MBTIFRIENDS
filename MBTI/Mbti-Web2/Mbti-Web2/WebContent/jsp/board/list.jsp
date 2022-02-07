<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/board.css">
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('#new').click(function() {
			location.href = "${ pageContext.request.contextPath }/board/writeForm.do"
		})
		
		$('#search').click(function() {
			location.href = "${ pageContext.request.contextPath }/board/searchBoard.do" 
		})
	})
     
   function goWriteForm(){
      location.href = "writeForm.jsp"
   }
   
   function doAction(boardNo){
	   <c:choose>
	   		<c:when test="${ not empty userVO }"> //updateCnt먼저 갔다가 아래 주소로 가게 추가
	   			location.href = "${ pageContext.request.contextPath }/board/detail.do?no=" + boardNo
	   					
			</c:when>
	   		<c:otherwise>
	   			if(confirm('로그인 서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
	   				location.href = '${ pageContext.request.contextPath }/login.do'
	   			}	
	   		</c:otherwise>
   	   </c:choose>
   }
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr>
			<h2>게시판 목록</h2>
			<hr>
			<br>
			<table border="1" class="list">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>
					<th width="10%">조회수</th>
					<th width="20%">등록일</th>
				</tr>

				<c:forEach items="${ list }" var="board">
					<tr>
						<td>${ board.no }</td>
						<td><a href="javascript:doAction(${ board.no })"> 
						<c:out value="${ board.title }" />
						</a></td>
						<td>${ board.writer }</td>
						<td>${ board.viewCnt }</td>
						<td>${ board.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<jsp:include page="/jsp/board/paging.jsp">
				<jsp:param value="${paging.page}" name="page" />
				<jsp:param value="${paging.beginPage}" name="beginPage" />
				<jsp:param value="${paging.endPage}" name="endPage" />
				<jsp:param value="${paging.prev}" name="prev" />
				<jsp:param value="${paging.next}" name="next" />
			</jsp:include>
			<br>
			<br>
			<c:if test="${ not empty userVO }">
				<button id= "new">새글등록</button>
			</c:if>
			<br>
			<br>
		</div>
		<div class='aside_menu'>
			<form method="post" name="search" action="searchBoard.do">
				<ASIDE style='float: right;'>
					<SELECT name='choice'>
						<!-- 검색 컬럼 -->
						<OPTION ${(param.choice == "all")? "selected" : ""} value='all'>전체</OPTION>
						<OPTION ${(param.choice == "writer")? "selected" : ""} value='writer'>작성자</OPTION>
						<OPTION ${(param.choice == "title")? "selected" : ""} value='title'>제목</OPTION>
						<OPTION ${(param.choice == "content")? "selected" : ""} value='content'>내용</OPTION>
						<OPTION ${(param.choice == "titleNcontent")? "selected" : ""} value='titleNcontent'>제목+내용</OPTION>
					</SELECT> <input type='text' name='word' value="${param.word}"
						placeholder="특수문자는 사용하실 수 없습니다.">
					<button id='search' type='submit'>검색</button>
				</ASIDE>
			</FORM>
			<DIV class='menu_line' style='clear: both'></DIV>
		</div>
	</section>
	<br>
	<br>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>

