<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources//css/board.css">
<script>
   function doWrite() {
      
      let f = document.inputForm
      
      if(f.title.value == '') {
         alert('제목을 입력하세요')
         f.title.focus()
         return false
      }
      
      if(f.writer.value == '') {
         alert('글쓴이를 입력하세요')
         f.writer.focus()
         return false
      }
      
      if(f.content.value == '') {
         alert('내용을 입력하세요')
         f.content.focus()
         return false
      }
      
      return true
   }
</script>
</head>
<body>
   <header>
      <jsp:include page="/jsp/include/topMenu.jsp" />
   </header>
   <div align="center">
      <hr>
      <h2>답글 등록</h2>
      <hr>
      <br>
      <form action="${ pageContext.request.contextPath }/board/reply.do" method="get" name="inputForm" onsubmit="return doWrite()" >
          <input type="hidden" name="no" value="${ board.no }" />
          <input type="hidden" name="writer" value="${ userVO.id }">
          <input type="hidden" name="ref" value="${ board.ref }">
          <input type="hidden" name="re_step" value="${ board.reStep }">
          <input type="hidden" name="re_level" value="${ board.reLevel }">
          
            <table border="1">
            <tr>
               <th width="23%">제목${ board.reLevel }</th>
               <td>
                   <input type="text" name="title" value="[답글] ">
               </td>
            </tr>
            <tr>
               <th>글쓴이</th>
               <td>
                  ${ userVO.id }
               </td>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <textarea name="content" rows="7" cols="45"></textarea>
               </td>
            </tr>
         </table>
         <br>

         <input type="submit" value="답글등록">
      </form>
   </div>
   <footer>
      <%@ include file="/jsp/include/footer.jsp" %>
   </footer>

</body>
</html>