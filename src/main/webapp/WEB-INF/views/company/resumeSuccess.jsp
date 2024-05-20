<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/cheader.jsp" %>
            
   <main>
                  
	  <h1>Success</h1>
      <p>면접제의에 성공하였습니다.</p>
      
      <%-- <div><a href="/Company/ComBookmarkList?com_id=${ sessionScope.clogin.com_id }">스크랩 목록으로</a></div> --%>
      <div><a href="/Resume/List?com_id=${ sessionScope.clogin.com_id }">목록으로</a></div>
	 
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>
   
   
   
   </script>
  

</body>
</html>