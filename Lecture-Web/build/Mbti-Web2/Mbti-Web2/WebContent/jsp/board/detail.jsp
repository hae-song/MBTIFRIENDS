<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<link rel = "stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel = "stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script>
	function doAction(type) {
		
	
	switch (type) {
		case 'U':
			if (confirm("수정하시겠습니까?")) {
			location.href = "${ pageContext.request.contextPath }/board/updateForm.do?no=${ param.no }"
			}
			return false;
			break;
			
		case 'D':
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/board/delete.do?no=${ param.no }"
			}
			return false;
			break;
			
		case 'L':
			location.href = "${ pageContext.request.contextPath }/board/list.do"
			break;
			
		}
		}

	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align= "center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<br>
		<table border="1">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt + 1 }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
			<tr>
				<th width="25%">첨부파일</th>
				<td>
					<c:forEach items="${ fileList }" var="file">
						<a href= "${ pageContext.request.contextPath }/upload/${ file.fileSaveName }">
						${ file.fileOriName }
						</a>
						(${ file.fileSize } bytes)<br>
					</c:forEach>
				</td>
			</tr>
		</table>
		<br>
		<c:if test = "${ board.writer eq userVO.id }">
			<button onclick="doAction('U')">수정</button>
			<button onclick="doAction('D')">삭제</button>	
		</c:if>
		<button onclick="doAction('L')">목록</button>
		<a href="javascript:history.back()" class="btn btn-primary">
		<button>뒤로가기</button></a>
	</div>	
	</section> 	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>	
</body>
</html>


