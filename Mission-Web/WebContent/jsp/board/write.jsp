<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="kr.co.mlec.util.ConnectionFactory"%>
<%@ page import="kr.co.mlec.util.JDBCClose"%>
<%--
작업순서
1. writeForm.jsp에서 넘겨준 제목(title), 글쓴이(writer), 내용(content)추출
2. tbl_board 테이블에 추출된 정보로 새로운 게시글 삽입(insert)
 

 --%>
<%
	//요청객체 데이터 인코딩
	request.setCharacterEncoding("utf-8");
	//요청객체에서 입력한 데이터 추출
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");

	System.out.println("title : " + title);
	System.out.println("writer : " + writer);
	System.out.println("content : " + content);

	// request.getParameter("");//jsp내장객체

	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	
	//데이터베이스 tbl_board 테이블에 새글등록
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);	//위에 settitle해서 변경해줬던거 insertboard에 넘겨줌
	
%>

<script>
	alert('새글 등록이 완료되었습니다')
	location.href = 'list.jsp' // location : 그위치로 가는거.
</script>
