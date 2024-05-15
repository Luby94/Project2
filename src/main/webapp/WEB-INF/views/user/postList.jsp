<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>

<style>
  body {
	background-color: #f4f4f4;
	margin: 0;
}

.post-listings {
	max-width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}

a {
	color: #0073e6;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.post-listings tr td:nth-child(3) {
	width: 400px;
}
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	   <article>
	   <form action="/Post/View?po_num=${ po_num }&user_id=${ user_id }" method="post">
	   <input type="hidden" name="" />
	   <div class="select_box jm_select_box mt-5">
	   
		<select id="skill" class="jm_select selectpicker"
			data-style="btn-info" name="">
			<option value="none" selected>분야</option>
			<option value="Java">Java</option>
			<option value="Springboot">Springboot</option>
			<option value="C">C</option>
			<option value="CSS">CSS</option>
			<option value="html">Html</option>
			<option value="Flutter">Flutter</option>
			<option value="JavaScript">JavaScript</option>
		</select>
		
		<select id="career" class="jm_select" name="">
			<option value="none" selected>고용형태</option>
			<option value="신입">신입</option>
			<option value="경력">경력</option>
		</select>
		
		<select id="address" class="jm_select" name="">
			<option value="none" selected>근무지</option>
			<option value="경기">전국</option>
			<option value="경기">경기</option>
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="경기">경남</option>
			<option value="제주">제주</option>
			<option value="울산">울산</option>
		</select>
       
       </div>
	   
	     <h2 style="text-align:center; padding-top: 2%;">공고보기</h2>
		 <hr/>
			
			
		 <div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<!-- <div class="col-sm-9 page"> -->
					<div class="d-flex justify-content-center">

						<div>
							<table class="post-listings">
								<thead>
									<tr>
										<th>No.</th>
										<th>기업명</th>
										<th>공고제목</th>
										<th>근무조건</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${postList}" var="post">
										<tr>
											<td>${post.po_num}</td>
											<td>${post.com_id}</td>
											<td><a
												href="/Post/View?po_num=${post.po_num}&user_id=${sessionScope.plogin.user_id}">
													${post.po_title} </a></td>
											<td>${post.po_qual}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<input type="hidden" id="user_id" value="${ sessionScope.plogin.user_id }" />
					</div>
				</div>
			<!-- </div> -->
		</div>
		 
		 
		 <%-- <div class="info-box">

			 <c:forEach var="postList" items="${ postList }" >
			   <table class="resume-table" >	
			   <tr>
			     <td class="table-num">${ postList.po_num }</td>
			     <td class="table-name">${ postList.region }</td>
			     <td class="table-title"><a href="/Post/View?po_num=${ postList.po_num }&user_id=${ sessionScope.plogin.user_id }">${ postList.po_title }</a></td>
			   </tr>
			   </table>
			 </c:forEach>

		</div> --%>
		
		</form>
	   </article>
	 </section>
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   <script>
   
   function search() {
       let region = document.getElementById("region").value;
       let skill = document.getElementById("skill").value;
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