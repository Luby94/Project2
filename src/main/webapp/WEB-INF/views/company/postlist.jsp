<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 목록</title>

<style>

  main {
    height: 100vh;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    margin-top: 10px;
  }
  
  .info-box,
  .resume-table {
    justify-content: center;
    align-items: center;
    margin: auto;
    width: 50%;
  }
  
  .resume-table,
  .resume-table tr,
  .resume-table tr td {
    border: 1px solid black;
    padding: 10px;
  }
  
  .resume-table {
    table-layout: fixed;
    border-collapse: collapse; /* 셀 간의 간격을 없애고 테두리를 합침 */
  }
  
  /* 각 셀의 너비를 고정 */
  .resume-table td:first-child {
    width: 10%;
    word-wrap: break-word; /* 텍스트가 셀을 벗어날 경우 줄 바꿈 */
  }
  .resume-table td:nth-child(2) {
    width: 20%;
    word-wrap: break-word; /* 텍스트가 셀을 벗어날 경우 줄 바꿈 */
  }
  
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	   <article>
	   
	   <div class="container">
	   
		   <select name="region" id="region">
		     <option value="" selected disabled>지역 선택</option>
	         <option value="서울특별시">서울특별시</option>
	         <option value="경기도">경기도</option>
	         <option value="인천광역시">인천광역시</option>
	         <option value="강원도">강원도</option>
	         <option value="충청북도">충청북도</option>
	         <option value="충청남도">충청남도</option>
	         <option value="대전광역시">대전광역시</option>
	         <option value="세종특별자치시">세종특별자치시</option>
	         <option value="전라북도">전라북도</option>
	         <option value="전라남도">전라남도</option>
	         <option value="광주광역시">광주광역시</option>
	         <option value="경상북도">경상북도</option>
	         <option value="경상남도">경상남도</option>
	         <option value="대구광역시">대구광역시</option>
	         <option value="울산광역시">울산광역시</option>
	         <option value="부산광역시">부산광역시</option>
	         <option value="제주특별자치도">제주특별자치도</option>
	       </select>
	       
	       <select name="jobshape" id="jobshape">
		     <option value="" selected disabled>고용형태</option>
	         <option value="정규직">정규직</option>
	         <option value="계약직">계약직</option>
	         <option value="프리랜서">프리랜서</option>
	       </select>
	
	       <select name="career" id="career">
		     <option value="" selected disabled>경력유무</option>
	         <option value="신입">신입</option>
	         <option value="경력">경력</option>
	         <option value="경력무관">경력무관</option>
	       </select>
	       
	       <button onclick="search()">검색</button>
       
       </div>
       
	   
	     <h2 style="text-align:center; padding-top: 2%;">공고보기</h2>
		 <hr/>
			
		 <div class="info-box">

			 <c:forEach var="postList" items="${ postList }" >
			   <table class="resume-table" >	
			   <tr>
			     <td class="table-num">${ postList.po_num }</td>
			     <td class="table-name">${ postList.region }</td>
			     <td class="table-title"><a href="/Post/View?po_num=${ postList.po_num }">${ postList.po_title }</a></td>
			   </tr>
			   </table>
			 </c:forEach>

		</div>
		
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