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

/* 모달 스타일 */
.modal {
  position: absolute;
  z-index: 9999;
  left: 0;
  top: 0;
  width: 80%;
  height: 80%;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  align-items: center;
  justify-content: center;
  overflow: auto;
}

.modal-content {
  background-color: #fefefe;
  border-radius: 10px;
  margin: 5% auto;
  padding: 20px;
  max-width: 600px;
  width: 90%;
  box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); /* 테두리 그림자 */
  transform:translateY(-50%); /* 모듈창열었을때 위치설정 가운데로 */
  position:absolute;
  top:40%; /* 모달을 화면가운데 놓기위함. */ 
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
}

.modal-header {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.company-logo {
  width: 100px;
  height: auto;
  margin-right: 10px;
}

.modal-body p {
  margin-bottom: 10px;
}

.modal-body p strong {
  font-weight: bold;
  margin-right: 5px;
}

/* 모달 내용 간 구분선 */
.modal-body p {
  margin-bottom: 10px;
  border-bottom: 1px solid #ddd; /* 각 내용 사이에 선 추가 */
}

/* 마지막 내용의 선 제거 */
.modal-body p:last-child {
  border-bottom: none; /* 마지막 요소에는 선을 표시하지 않음 */
}

/* 평점 스타일 */
.rating {
  display: inline-block;
}

.rating input {
  display: none;
}

.rating label {
  cursor: pointer;
  width: 30px;
  font-size: 24px;
  color: #ffd700; /* 별 색상 */
}

.rating label:hover,
.rating label:hover ~ label {
  color: #ffcc00; /* 호버 시 색상 변경 */
}

.ratingSubmitBtn {
  background-color: #007bff; /* 제출 버튼 배경색 */
  color: white; /* 제출 버튼 텍스트 색상 */
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}
.ratingSubmitBtn:hover {
  background-color: #0056b3; /* 호버 시 배경색 변경 */
}
  
</style>

</head>

<body>

   <%@include file="/WEB-INF/views/include/pheader.jsp" %>
            
   <main>
                  
	 <section>
	   <article>
	   <form action="/Post/View?po_num=${ po_num }&user_id=${ user_id }" method="post">
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
											<td>
											  <a href="#"
											     id="com_name"
											     onclick="openPopup('${ post.com_name }')">
											  ${post.com_name}
											  </a>
											</td>
											<td>
											  <a href="/Post/View?po_num=${ post.po_num }&user_id=${ sessionScope.plogin.user_id }">${ post.po_title }</a>
											</td>
											<td>${ post.po_qual }</td>
										</tr>
							
										<!-- 모달 팝업 -->
										<div id="popupModal" class="modal">
										  <div class="modal-content">
										    <span class="close" onclick="closePopup()">&times;</span>
										    <div class="modal-header">
											    <img src="/img/Rogo.png" alt="회사 로고" class="company-logo">
											    <h3 id="popupTitle"></h3>
										    </div>
										    <div class="modal-body">
											    <p id="popupContent"></p>
											    <p id="popupComNum"><input type="hidden" value="${ post.com_num }"/></p>
											    <p id="popupComBoss"><input type="hidden" value="${ post.com_boss }"/></p>
											    <p id="popupComAdr"><input type="hidden" value="${ post.com_adr }"/></p>
											    <p id="popupComTell"><input type="hidden" value="${ post.com_tell }"/></p>
											    <p><input type="hidden" id="poNum" value="${ post.po_num }"/></p>
											    <p><input type="hidden" id="comId" value="${ post.com_id }"/></p>
											    <!-- 평점 입력 폼 -->
											      <form id="ratingForm" onsubmit="submitRating(event)">
											        <label for="rating">평점:</label>
											          <input type="number" id="rating" name="rating" min="1" max="5" required>
											          <input type="hidden" id="user_id" name="user_id" value="${ sessionScope.plogin.user_id }" />
											        
											        <!-- <div class="rating">
											          <input type="radio" id="star5" name="rating" value="5" required/>
											          <label for="star5" title="5 stars">&#9733;</label>
											          <input type="radio" id="star4" name="rating" value="4" required/>
											          <label for="star4" title="4 stars">&#9733;</label>
											          <input type="radio" id="star3" name="rating" value="3" required/>
											          <label for="star3" title="3 stars">&#9733;</label>
											          <input type="radio" id="star2" name="rating" value="2" required/>
											          <label for="star2" title="2 stars">&#9733;</label>
											          <input type="radio" id="star1" name="rating" value="1" required/>
											          <label for="star1" title="1 star">&#9733;</label>
											        </div> -->
											        
											        <button type="button" class="ratingSubmitBtn"><i class="fas fa-check"></i> 제출</button>
      
											      </form>
											      <!-- 평점 표시 영역 -->
											      <div id="ratingDisplay"></div>
										    </div>
										  </div>
										</div>
							
									</c:forEach>
								</tbody>
							</table>
							
							
						</div>
					<input type="hidden" id="user_id" value="${ sessionScope.plogin.user_id }" />
					</div>
				</div>
		</div>
		
		</form>
	   </article>
	 </section>
   </main>

   <%@include file="/WEB-INF/views/include/footer.jsp" %>
  
   <script>
   const com_name = document.querySelector('#com_name');
   
   // 모달 열기
   function openPopup(com_name) {
      var modal = document.getElementById("popupModal");
      var title = document.getElementById("popupTitle");
      var content = document.getElementById("popupContent");

      // 정보 설정을 위한 객체 배열 생성
      var infoElements = [
         {id: "popupComNum", label: "사업자등록번호: "},
         {id: "popupComBoss", label: "회사대표명: "},
         {id: "popupComAdr", label: "회사주소: "},
         {id: "popupComTell", label: "회사번호: "}
      ];

      // 모달 제목과 기본 내용 설정
      title.innerHTML = com_name + " 정보";
      content.innerHTML = "이곳에 " + com_name + "의 정보를 표시합니다.";

      // 정보 객체 배열을 순회하며 모달 내용 설정
      infoElements.forEach(function(info) {
         var element = document.getElementById(info.id);
         var value = element.querySelector('input').value;
         element.innerHTML = info.label + value;
      });

      modal.style.display = "block";
      
   //-----------------------------------------------------------------------------
   // 평점
   
   // 평점 표시 엘리먼트 가져오기
   var ratingDisplay = document.getElementById("ratingDisplay");
   console.log(ratingDisplay)
   
   // 이전에 입력된 평점이 있다면 초기화
   ratingDisplay.innerHTML = "";
	
   // 이전에 저장된 평점이 있다면 표시
   var savedRating = localStorage.getItem("rating");
   if (savedRating) {
     ratingDisplay.innerHTML = "이전 평점: " + savedRating;
   }
   
   }
	
   // 평점 제출 처리 함수
   
   const ratingSubmitBtnEl = document.querySelector('.ratingSubmitBtn');
   console.log(ratingSubmitBtnEl)
   
   ratingSubmitBtnEl.addEventListener('click', function submitRating(e) {
	   e.preventDefault();
	   
	   /*
	   const rating = document.querySelector('input[name="rating"]:checked');
	   if (rating) {
	       var selectedRating = rating.value;
	       console.log("선택된 평점:", selectedRating);
	   } else {
	       console.log("평점을 선택해주세요.");
	   }
	   
        var comIdEl = document.getElementById('comId');
       var poNumEl = document.getElementById('poNum');
       console.log(comIdEl)
       console.log(poNumEl)
       */
       
       const rating = $('#rating').val();
       const com_id = $('#comId').val();
       const user_id = $('#user_id').val();
       console.log(rating)
       console.log(com_id)
       console.log(user_id)

       // 서버로 평점 데이터 전송
       fetch('/Company/ratings/add?com_id=' + com_id + '&user_id=' + user_id + '&rating=' + rating, {
           method: 'POST'
       })
       .then(response => response.text())
       .then(data => console.log(data)) // 성공적으로 처리된 경우 메시지 출력
       .catch(error => console.error(error)); // 오류 발생 시 에러 메시지 출력
   })
   
   //-----------------------------------------------------------------------------

   // 모달 닫기
   function closePopup() {
      var modal = document.getElementById("popupModal");
      modal.style.display = "none";
      location.reload(); // 페이지 새로고침
   }
   
   // 모달 바깥을 클릭하면 모달이 닫히도록 설정
   window.onclick = function(event) {
      var modal = document.getElementById("popupModal");
      if (event.target == modal) {
         modal.style.display = "none";
      location.reload(); // 페이지 새로고침
      }
   }
   
</script>


</body>
</html>