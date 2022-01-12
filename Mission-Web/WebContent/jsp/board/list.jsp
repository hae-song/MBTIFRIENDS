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
    
    Connection conn = new ConnectionFactory().getConnection();
    StringBuilder sql = new StringBuilder();
    sql.append(" select no, title, writer, to_char(reg_date,'yyyy-mm-dd') as reg_date ");
    sql.append(" from tbl_board ");
    sql.append(" order by no desc ");
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    ResultSet rs = pstmt.executeQuery();
   
    
    List<BoardVO> list = new ArrayList<>();
    
    
    while(rs.next()){
    	int no=rs.getInt("no");
    	String title=rs.getString("title");
    	String writer=rs.getString("writer");
    	String regDate=rs.getString("reg_date");
    	BoardVO board = new BoardVO(no, title, writer, regDate);
    	//System.out.println(board);
    	
    	list.add(board);
    	
    }
    JDBCClose.close(pstmt, conn);
    pageContext.setAttribute("list",list);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
hr, table{
width:80%
}
</style>

<script>
	function goWriteForm(){
	location.href = "writeform.jsp"
	
}

</script>


</head>
<body>

<div align="center">
<hr>
<h2>게시판 목록</h2>
<hr>
<br>

<table border ="1">
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
	<a href="detail.jsp?no=${board.no}">
	
	${board.title }
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
<button onclick="goWriteForm()">새글등록</button>


</div>
</body>
</html>

<% 
 JDBCClose.close(pstmt, conn); 
%>
