<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <% 
    //요청객체 데이터 인코딩
    request.setCharacterEncoding("utf-8");
    
    	//요청객체에서 입력한 데이터 추출
    	String id = request.getParameter("id");
    	String name = request.getParameter("name");
    	String password = request.getParameter("password");
    	String emailid = request.getParameter("email_id");
    	String emaildomain = request.getParameter("email_domain");
    	String tel1 = request.getParameter("tel1");
    	String tel2 = request.getParameter("tel2");
    	String tel3 = request.getParameter("tel3");
    	String post = request.getParameter("post");
    	String basicaddr = request.getParameter("basic_addr");
    	String detailaddr = request.getParameter("detail_addr");
    	

    	
   // request.getParameter("");//jsp내장객체
    
   //데이터베이스 tbl_board 테이블에 새글등록
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into tbl_member(id, name, password, email_id, email_domain ");
	sql.append(" ,tel1, tel2, tel3, post, basic_addr ,detail_addr ) ");
	sql.append(" values(?,?,?,?,?,?,?,?,?,?,?) ");
   
   PreparedStatement pstmt = conn.prepareStatement(sql.toString());
   pstmt.setString(1,id);
   pstmt.setString(2,name);
   pstmt.setString(3,password);
   pstmt.setString(4,emailid);
   pstmt.setString(5,emaildomain);
   pstmt.setString(6,tel1);
   pstmt.setString(7,tel2);
   pstmt.setString(8,tel3);
   pstmt.setString(9,post);
   pstmt.setString(10,basicaddr);
   pstmt.setString(11,detailaddr);
   
   pstmt.executeUpdate();
   
   
    
    %>
    
    <script>
    alert('회원가입이 완료되었습니다')
    location.href = 'memlist.jsp'	// location : 그위치로 가는거.
    
    </script>