<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
hr, table {

	width: 40%
}
</style>
</head>
<body>
<header>
		<jsp:include page="/jsp/include/topmenu.jsp" />
	</header>
<section>

<img src="./images/kakao.png" width="100%" height="100%">


</section>
<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
		<%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
	</footer>
</body>
</html>