<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Connection conn = new ConnectionFactory().getConnection();
    StringBuilder sql = new StringBuilder();
    sql.append(" select id, name, password, email_id, email_domain, tel1, tel2 ");
    sql.append(" ,tel3, post, basic_addr,detail_addr, type, to_char(reg_date,'yyyy-mm-dd') reg_date ");
    sql.append(" from tbl_member ");
    sql.append(" order by id desc ");
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    ResultSet rs = pstmt.executeQuery();
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
function goMemForm(){
	location.href="memform.jsp"
	
	
}

</script>

</head>
<body>
<div align="center">
<hr>
<h2>회원 목록</h2>
<hr>
<br>


<table border ="1">
<tr>

<th>id</th>
<th>name</th>
<th  >password</th>
<th >email_id</th>
<th >email_domain</th>
<th >tel1</th>
<th >tel2</th>
<th >tel3</th>
<th >post</th>
<th width="20%" >basic_addr</th>
<th >detail_addr</th>
<th >type</th>
<th width="20%">reg_date</th>

</tr>


<%
while(rs.next()){
	String id = rs.getString("id");
	String name = rs.getString("name");
	String password = rs.getString("password");
	String emailid = rs.getString("email_id");
	String emaildomain = rs.getString("email_domain");
	String tel1 = rs.getString("tel1");
	String tel2 = rs.getString("tel2");
	String tel3 = rs.getString("tel3");
	String post = rs.getString("post");
	String basicaddr = rs.getString("basic_addr");
	String detailaddr = rs.getString("detail_addr");
	String type = rs.getString("type");
	String regdate = rs.getString("reg_date");
	
	

%>

<tr>
<td><%= id %></td>
<td><%= name %></td>
<td><%= password %></td>
<td><%= emailid %></td>
<td><%= emaildomain %></td>
<td><%= tel1 %></td>
<td><%= tel2 %></td>
<td><%= tel3 %></td>
<td><%= post %></td>
<td><%= basicaddr %></td>
<td><%= detailaddr %></td>
<td><%= type %></td>
<td><%= regdate %></td>

</tr>


<%
}
%>


</table>

<br> 
<button onclick="goMemForm()">회원가입</button>


</div>
</body>
</html>

<%

JDBCClose.close(pstmt,conn);
%>