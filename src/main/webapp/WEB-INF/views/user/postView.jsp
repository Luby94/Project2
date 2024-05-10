<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 화면</title>

<style>

  main {
    height: 100vh;
  }
  
  ul {
    list-style-type: none;
  }
  
  .post-top,
  .post-mid,
  .post-third,
  .applybutton {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin-top: 10px;
  }
  
  .post-top li:first-child {
    border: 1px solid black;
    border-radius: 10px;
    padding: 40px 100px;
  }
  
  .post-mid {
    width: 50%;
  }
  .post-mid tr td {
    border: 1px solid black;
    width: 200px;
    padding: 20px;
  }
  
  .podt-third {
    width: 50%;
  }
  .post-third tr td {
    border: 1px solid black;
    width: 100%;
    padding: 20px;
    height: 200px;
  }
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	 
	   <article>
	   
	     <form action="/Apply" method="POST">
	     <%-- <input type="hidden" name="po_num" value="${postList.po_num}" > --%>
	   
	     <c:forEach var="postList" items="${ postList }" >
	       <div>
	         <ul class="post-top">
	           <li>공고 제목: ${ postList.po_title }</li>
	           <li><img src="/img/Rogo.png" alt="회사로고 이미지1"></li>
	         </ul>
	       </div>
	     </c:forEach>
	     
	     <%-- <div>
	     
	       <c:forEach var="postList" items="${ postList }" >
			   <table class="post-top" >	
			   <tr>
			     <td>공고 제목: </td>
			     <td class="table-num">${ postList.po_title }</td>
			     <td colspan="2">
			     <img src="/img/Rogo.png" alt="회사로고 이미지1"><!-- 로고이미지 추가, 수정필요 -->
			     </td>
			   </tr>
			   </table>
			 </c:forEach>
	     
	     </div> --%>
	     
	     <hr />
	     
	     <div>
	     
	       <c:forEach var="postList" items="${ postList }" >
			   <table class="post-mid" >	
			   <tr>
			     <td>기술스택</td>
			     <td>지역</td>
			     <td>경력유무</td>
			   </tr>
			   <tr>
			     <td>${ postList.skill }</td>
			     <td>${ postList.region }</td>
			     <td>${ postList.career }</td>
			   </tr>
		     </table>
		   </c:forEach>
			 
		   <c:forEach var="postList" items="${ postList }" >
			 <table class="post-third" >	 
			   <tr>
			     <td colspan="3">모집조건: ${ postList.po_content }</td>
			   </tr>
			   <tr>
			     <td colspan="3">근무조건: ${ postList.po_qual }</td>
			   </tr>
			 </table>
		   </c:forEach>
	     
	     </div>
	     
	     <div class="applybutton" style="display: flex;">
	       <button type="submit" class="btn btn-primary">지원하기</button>&nbsp;&nbsp;
	       <a href="/Post/List" class="btn btn-primary">목록으로</a>
	     </div>
	     
	     </form>
		
	   </article>
	   
	 </section>
	 
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>
   
   function search() {
       let region = document.getElementById("region").value;
       let jobshape = document.getElementById("jobshape").value;
       let career = document.getElementById("career").value;

       // 선택된 값들을 서버로 전송하여 검색 수행
       // AJAX 요청을 사용하여 서버와 통신하거나, 폼을 제출하여 서버로 데이터 전송 가능
       // 이 예제에서는 간단히 선택된 값을 콘솔에 출력
       console.log("Selected Region:", region);
       console.log("Selected Job Shape:", jobshape);
       console.log("Selected Career:", career);
       
       // AJAX 요청 보내기
       let xhr = new XMLHttpRequest();
       let url = "your_server_endpoint"; // 서버 엔드포인트 URL을 여기에 입력
       xhr.open("POST", url, true);
       xhr.setRequestHeader("Content-Type", "application/json");

       // 서버로 전송할 데이터를 JSON 형식으로 만듦
       let data = JSON.stringify({
           region: region,
           jobshape: jobshape,
           career: career
       });

       // AJAX 요청 보내기
       xhr.onreadystatechange = function () {
           if (xhr.readyState === 4 && xhr.status === 200) {
               // 서버에서 응답을 받았을 때 수행할 작업
               console.log("서버 응답:", xhr.responseText);
           }
       };

       // AJAX 요청 보내기
       xhr.send(data);
       
   }
   
   </script>
  

</body>
</html>