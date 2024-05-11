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
  
  .postTitle {
    border: none;
    outline: none;
    border-radius: 10px;
    padding: 40px 70px;
    width: 400px;
  }
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	 
	   <article>
	   
	   <form action="/Post/GoApply?po_num=${ po_num }" method="POST">
	     <%-- <input type="hidden" name="com_id" value="${ com_id }" /> --%>
	   	   
	     <c:forEach var="postList" items="${ postList }" >
	       <div>
	         <ul class="post-top" id="postView">
	           <li data-value="value1"><input type="text" class="postTitle" name="po_title" value="공고 제목: ${ postList.po_title }" /></li>
	           <li data-value="value2"><img src="/img/Rogo.png" alt="회사로고 이미지1"></li>
	         </ul>
	       </div>
	     </c:forEach>
	     
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
			     <td><input type="text" style="border: none;" name="skill" value="${ postList.skill }" /></td>
			     <td><input type="text" style="border: none;" name="region" value="${ postList.region }" /></td>
			     <td><input type="text" style="border: none;" name="career" value="${ postList.career }" /></td>
			   </tr>
		     </table>
		   </c:forEach>
			 
		   <c:forEach var="postList" items="${ postList }" >
			 <table class="post-third" >	 
			   <tr>
			     <td colspan="3">
			       <input type="text" style="border: none;" name="po_content" value="모집조건: ${ postList.po_content }" />
			     </td>
			   </tr>
			   <tr>
			     <td colspan="3">
			       <input type="text" style="border: none;" name="po_qual" value="근무조건: ${ postList.po_qual }" />
			       <input type="hidden" style="border: none;" name="com_id" value="${ postList.com_id }" />
			     </td>
			   </tr>
			 </table>
		   </c:forEach>
	     
	     </div>
	     
	     <div class="applybutton" style="display: flex;">
	       <!-- <a href="/Post/GoApply" class="btn btn-primary">지원하기</a>&nbsp;&nbsp; -->
	       <input type="submit" class="btn btn-primary" value="지원하기" >&nbsp;&nbsp;
	       <a href="/Post/List?user_id=${ sessionScope.plogin.user_id}" class="btn btn-primary">목록으로</a>
	     </div>
		
	   </form>

	   </article>	   
	   
	 </section>
	 
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
   
   /* document.getElementById("postView").addEventListener("click", function(e) {
     if (e.target.tagName === "LI") {
       let selectedValue = e.target.getAttribute("data-value");
       sendDataToController(selectedValue);
     }
   });

   function sendDataToController(value) {
     // 여기에 AJAX 요청을 통해 컨트롤러로 데이터를 전송하는 코드를 작성합니다.
	 $.ajax({
		type: "POST",
		url: "http://localhost:9090/Post/GoApply",
		data: { 	// 전송할 데이터
			po_title: po_title
			}, 
		success: function(response) {
		     // 성공적으로 응답을 받았을 때 처리할 코드
		     console.log("전송 성공!");
		},
		error: function(xhr, status, error) {
		     // 오류 발생 시 처리할 코드
			 console.error("전송 실패:", error);
		}
		});
   } */
   
   //------------------------------------------------------------------------------
   
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