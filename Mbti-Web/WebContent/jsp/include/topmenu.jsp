<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css"> 

<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" align="center">
		<a href="${ pageContext.request.contextPath }">
		
		<img src="data:image/png;base64,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" 
		style="height: 50px; width: 150px;">
		
		<%--
		<img src="${ pageContext.request.contextPath }/resources/images/ssac.PNG" 
		style="height: 50px; width: 150px;"> 
		 --%>
		</a>
		</td>
		<td align="right">즐겨찾기 <c:if test="${not empty userVO }">
		[${ userVO.id }님으로 로그인중...] <%--userVO.getId()가 el이라서 userVO.id로 표현 --%>
			</c:if>
		</td>
	</tr>

	<tr>
		<td>
			<nav>
			<c:if test="${userVO.type eq 'S' }">
			
				회원관리 |
			</c:if>
				<a href="${pageContext.request.contextPath }/board/list.do">게시판</a> | 
				<a href="${pageContext.request.contextPath }/member/signup.do">회원가입</a> | 
				<a href="${pageContext.request.contextPath }/map.do">MBTI 지도보기</a> |
				<c:choose>
					<c:when test="${empty userVO }">
	
					
					
					<a href="${pageContext.request.contextPath }/login.do">로그인 | </a>
				</c:when>
				<c:otherwise>
				마이페이지 | 
				<a href="${ pageContext.request.contextPath }/logout.do"> 로그아웃 </a>
				</c:otherwise>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>