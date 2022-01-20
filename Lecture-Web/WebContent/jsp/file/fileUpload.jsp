<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	<%-- 파일 그자체로 올리기 위해서 옵션하나 추가해주기 --%>
	<form action="uploadInfo.jsp" method="post"
	enctype="multipart/form-data">	
	
		ID : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>