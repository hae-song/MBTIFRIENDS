<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO" %>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.mlec.util.ConnectionFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>

	$(document).ready(function() {
		
		$('button').click(function() {
			location.href = "${ pageContext.request.contextPath }/board/writeForm.do"
		})
	})

	function goWriteForm(){
		location.href = "writeForm.jsp"
		
	}
	
	function doAction(boardNo) {
		<c:choose>
			<c:when test="${ not empty userVO}">
		location.href = "${ pageContext.request.contextPath }/board/detail.do?no=" +boardNo
		
			</c:when>
			<c:otherwise>
				if(confirm('로그인서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
					location.href = '${ pageContext.request.contextPath}/login.do'
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
		<c:set var="totPage" value="${ dao.getTotalPage }" />
	<br>
		<table border="1" class="list">
		<tr>
			<th width="7%">번호</th>
			<th>제목</th>
			<th width="16%">글쓴이</th>
			<th width="10%">조회수</th>
			<th width="20%">등록일</th>
		</tr>
		
		<c:forEach items="${ list }" var="board">
			<tr>
				<td>${ board.no }</td>
				<td>
					<a href="javascript:doAction(${ board.no })">
						<c:out value="${ board.title }" />
					</a>
				<%-- javascript문법을 사용해 줄 수 있다 ^
					<a href="detail.jsp?no=${ board.no }">
						<c:out value="${ board.title }" /> 
					</a> --%>
				</td>
				<td>${ board.writer }</td>
				<td>${ board.viewCnt }</td>
				<td>${ board.regDate }</td>
			</tr>
	
		</c:forEach>
		</table>
		<br>
		<c:choose>
			<c:when test="${ param.start == null }">
				<c:set var="start" value = "1" />
			</c:when>
			<c:otherwise>
				<c:set var="start" value ="${ param.start }" />
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${ start > 1 }">
				<button test="button"
					onclick="location.href='/Mission-Web/jsp/board/list.jsp?start=${ start-1 }'">
				이전 페이지
				</button>
			</c:when>
			<c:otherwise>
				<button type="button" disabled>이전 페이지</button>
			</c:otherwise>	
		</c:choose>
		<c:forEach	begin="1" end="${ totPage }" step="1" var="cnt">
			<a href="/Mission-Web/jsp/board/list.jsp?start=${ cnt }"></a>			
		</c:forEach>
		<c:choose>
			<c:when test = "${ start < totPage }">
				<button type="button" onclick="location.href='/Mission-Web/jsp/board/list.jsp?start=${ start+1 }">
				</button>
			</c:when>
		<c:otherwise>
			<button type="button" disabled>다음 페이지</button>
		</c:otherwise>
		</c:choose>
		<br>
		<br>
		<c:if test="${ not empty userVO }">
		<button onclick="goWriteForm()">새글등록</button>
		</c:if>
	</div>
	</section>
	<br>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>
