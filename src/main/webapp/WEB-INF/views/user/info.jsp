<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<style>

   /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }

</style>


</head>
<body>

  <%@include file="/WEB-INF/views/include/header.jsp" %>
  
  <!-- 사이드 바 -->
  <nav class="col-sm-3 sidenav">
      <h4> 개인정보</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#">개인정보</a></li>
        <li><a href="#">이력서 관리</a></li>
        <li><a href="#">입사지원 관리</a></li>
        <li><a href="#">스크랩</a></li>
      </ul>
    </nav>

  <!-- 페이지 내용 -->
  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="col-sm-9 page">
     메인 내용
    </div>
    <!-- 내용 추가 -->
  </main>

</body>
</html>