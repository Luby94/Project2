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

</style>


</head>
<body>

  <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
  <!-- 사이드 바 -->
  <nav class="col-sm-3 sidenav">
      <h4> 개인정보</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }">개인정보</a></li>
        <li><a href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }">이력서 관리</a></li>
        <li><a href="#">입사지원 관리</a></li>
        <li><a href="#">스크랩</a></li>
      </ul>
    </nav>

  <!-- 페이지 내용 -->
            <div class="container">
                <div class="border border-tertiary p-5 rounded shadow">
                    <div>
                        <h1>이력서 관리</h1>
                    </div>
                    <hr>

                    <div class="jh_resume mt-5">
                        <button class="jh_resume_button mb-5 rounded jm_card"
                            onclick="location.href=`/Users/ResumeMake?user_id=${ sessionScope.plogin.user_id }`">➕ 새 이력서 등록</button>
                        
                        <c:forEach items="${goresumeList}" var="Re">
						    <div id="resume_del" class="jh_resume_content mt-2 mb-2" style="display: flex; justify-content: space-between">
						        <div class="d-flex align-items-center">
						            <a href="/Users/ResumeView?re_num=${Re.re_num}&user_id=${sessionScope.plogin.user_id}"> ${Re.re_title} </a>
						        </div>
						        <div>
						            <form action="/Post/Apply" method="POST">
						                <input type="hidden" name="re_num" value="${Re.re_num}" />
						                <input type="hidden" name="user_id" value="${sessionScope.plogin.user_id}" />
						                <input type="hidden" name="re_title" value="${Re.re_title}" />
						                <input type="hidden" name="po_title" value="${po_title}" />
						                <input type="hidden" name="po_num" value="${po_num}" />
						                <button type="submit" class="btn btn-success">선택</button>
						            </form>
						        </div>
						    </div>
						</c:forEach>
                            
                        <!--
                        <c:forEach items="${goresumeList}" var="Re">

                            <div id="resume_del" class="jh_resume_content mt-2 mb-2" style="display: flex; justify-content: space-between">
                                <div class="d-flex align-items-center">
                                    <a href="/Users/ResumeView?re_num=${Re.re_num}&user_id=${ sessionScope.plogin.user_id }"> ${Re.re_title} </a>
                                </div>
                                <div>
      							  <form action="/Post/Apply?re_num=${Re.re_num}&user_id=${ sessionScope.plogin.user_id }" method="POST">
      							    <input type="hidden" name="re_title" value="${ Re.re_title }" />
      							    <input type="hidden" name="po_title" value="${ po_title }" />
      							    <input type="hidden" name="po_num" value="${ po_num }" />
                                    <button type="submit" class="btn btn-success">선택</button>
       				              </form>
                                </div>
                            </div>
                            
                        </c:forEach>
                        -->
                        
                    </div>
                </div>
            </div>
    <!-- 내용 추가 -->


</body>
</html>