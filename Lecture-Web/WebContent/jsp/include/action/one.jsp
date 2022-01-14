<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
인클루드 되면 <body>태그까지 다 가져가니까 지워주기
 --%> 
<hr>
id:${id }<br>
<h3>날라온 파라미터 정보</h3>
name : ${param.name }<br> <%-- param.name --%>
age:${param.age }<br>
<h3>인클루드 된 내용</h3>
<h3>인클루드 된 내용</h3>
<h3>인클루드 된 내용</h3>
<h3>인클루드 된 내용</h3>
<h3>인클루드 된 내용</h3>
<hr>

<c:set var="phone" value="010-1111-2222" scope ="request"/>

