<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=3 
    작업순서
    1. 요청 (request) url의 파라미터 분석 => 게시글번호 추출 getparameter
    2. db tbl_board에서 추출된 게시글번호의 게시물 조회
    3. html에 조회된 게시물 연결
    
    
    --%>
    
<% 
//1.
//String boardNo = request.getParameter("no"); //list에서 받아온 no!!detail.jsp의 no
int boardNo = Integer.parseInt(request.getParameter("no"));


//2.
Connection conn = new ConnectionFactory().getConnection();
StringBuilder sql = new StringBuilder();
sql.append("select no, title, writer, content, view_cnt ");
sql.append("	, to_char(reg_date,'yyyy-mm-dd') reg_date ");
sql.append(" from tbl_board ");
sql.append(" where no=? ");
PreparedStatement pstmt = conn.prepareStatement(sql.toString());
pstmt.setInt(1,boardNo);
pstmt.executeQuery();

ResultSet rs = pstmt.executeQuery();

rs.next();

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<style>
hr{
width:80%
}

</style>


<script>
function doAction(type){
	switch(type){
	case 'U':
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
<div align="center">

<hr>
<h2>게시판 상세</h2>
<hr>
<br>
<table border="1">
<tr>
	<th width="25%">번호</th>
	<td><%= rs.getInt("no") %></td>

</tr>

<tr>
	<th width="25%">제목</th>
	<td><%= rs.getString("title") %></td>

</tr>

<tr>
	<th width="25%">작성자</th>
	<td><%= rs.getString("writer") %></td>

</tr>

<tr>
	<th width="25%">내용</th>
	<td><%= rs.getString("content") %></td>

</tr>

<tr>
	<th width="25%">조회수</th>
	<td><%= rs.getInt("view_cnt") %></td>

</tr>

<tr>
	<th width="25%">등록일</th>
	<td><%= rs.getString("reg_date") %></td>

</tr>
</table>
<br>
<button onclick="doAction('U')">수정</button>
<button onclick="doAction('D')">삭제</button>
<button onclick="doAction('L')">목록</button>



</div>

</body>
</html>

<% 
JDBCClose.close(pstmt, conn);
%>