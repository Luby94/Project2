<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link href="/bootstrap-5.0.2-dist/css/bootstrap.min.css"
	rel="stylesheet" /> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script src="/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script> -->

<style>
body {
	padding: 20px;
	margin: 0 auto;
	width: 80%;
	height: 300vh;
}

.container{
	width: 500px;
	text-align: center;
	 /* 헤더 배경 색상 */
    color: white; /* 텍스트 색상 */
    padding: 10px 15px; /* 패딩 */
    border-top-left-radius: 8px; /* 상단 왼쪽 모서리 둥글게 */
    border-top-right-radius: 8px; /* 상단 오른쪽 모서리 둥글게 */
    font-size: 18px; /* 폰트 크기 */
    
}
.container2 {
	width: 100px;
	height: 1000px;
}

/* .container2 { */
/* 	text-align: center; */
/* } */

h2 {
	margin: 0 auto;
}

table {
	width: 100%;
	margin-top: 20px;
	font-size: 13px;
	border-collapse: collapse;
}

table th, table td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ddd;
}

table th {
	background-color: #f8f9fa;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table-actions {
	text-align: center;
	padding: 10px;
	border: none;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.title {
	padding: 150px;
}

input:not(input[type=submit]) {
	width: 100%;
}

input[type=submit] {
	width: 100px;
}

#goList {
	width: 80px;
}

main {
	min-height: 100vh;
}

td {
	padding: 10px;
	text-align: center;
}

td:nth-of-type(1) {
	width: 200px;
	background: blue;
	color: white;
	font-weight: bold;
}

input[readonly] {
	background: #EEE;
}

#table {
	margin: 0 auto;
	width: 80%;
	margin-bottom: 20px;
}

#table td {
	text-align: center;
	padding: 10px;
}

#table td:nth-of-type(1) {
	width: 100px;
	background-color: #B4E5FF;
	color: black;
}

#table td:nth-of-type(2) {
	width: 200px;
}

#table td:nth-of-type(3) {
	width: 150px;
	background-color: #B4E5FF;
	color: black;
}

#table td:nth-of-type(4) {
	width: 250px;
}

#table tr:nth-of-type(3) td:nth-of-type(2) {
	text-align: left;
}

#table tr:nth-of-type(4) td[colspan] {
	height: 250px;
	text-align: left;
	vertical-align: baseline;
}

#table tr:last-child td {
	background-color: white;
	color: black;
}

textarea {
	height: 150px;
	width: 100%;
}

.comment {
    display: flex;
    align-items: center;
    
    
}

.comment .comment-body {
    flex-grow: 1;
    font-size: 20px;
}

.comment .thumb-icon {
    margin-left: 10px;
    display: flex;
    align-items: center;
}

.comment .like-count {
    margin-left: 10px;
    font-size: 20px;
}
/* 전체 컨테이너 스타일 */
.container2 {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-left: 50px;
    
}

/* 댓글 카드 스타일 */
.card {
    width: 80%; /* 카드 너비 */
    background-color: #f9f9f9; /* 배경 색상 */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 그림자 효과 */
    margin-bottom: 20px; /* 마진 */
    border-radius: 8px; /* 둥근 모서리 */
}

.card-header {
    background-color: #007bff; /* 헤더 배경 색상 */
    color: white; /* 텍스트 색상 */
    padding: 10px 15px; /* 패딩 */
    border-top-left-radius: 8px; /* 상단 왼쪽 모서리 둥글게 */
    border-top-right-radius: 8px; /* 상단 오른쪽 모서리 둥글게 */
    font-size: 18px; /* 폰트 크기 */
}

.card-body {
    display: flex;
    align-items: center;
    padding: 15px;
    font-size: 16px; /* 본문 폰트 크기 */
}

.comment {
    margin-left: auto; /* 왼쪽 여백 자동 */
}

/* 새 댓글 작성 카드 스타일 */
#comments-new {
    padding: 20px;
}

.form-label {
    font-weight: bold; /* 라벨 폰트 굵게 */
}

.btn-primary {
    background-color: #007bff; /* 버튼 배경 색상 */
    border: none; /* 테두리 없앰 */
    padding: 10px 20px; /* 패딩 */
    cursor: pointer; /* 커서 포인터 */
    color: white; /* 텍스트 색상 */
    border-radius: 5px; /* 둥근 모서리 */
}

.btn-primary:hover {
    background-color: #0056b3; /* 호버 시 배경 색상 변경 */
}

</style>




</head>
<body>
	<main>

		<%@include file="/WEB-INF/views/include/cheader.jsp"%>
		<div class="container">
			<div class="header-container">
				<h2>게시글 내용 조회</h2>
			</div>
			<table id="table">

				<tr>
					<td>글번호</td>
					<td>${ vo.ccomu_bno }</td>
					<td>조회수</td>
					<td>${ vo.ccomu_hit }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${ vo.com_id }</td>
					<td>작성일</td>
					<td>${ vo.ccomu_date }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${ vo.ccomu_title }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">${ vo.ccomu_content }</td>
				</tr>

				<tr>
					<td colspan="4"><a class="btn btn-info btn-sm"
						href="javascript:history.back()">이전으로</a>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		

		<!-- 댓글 뷰 화면 추가 -->
		
			<!-- 댓글 목록 보기 -->
		<div class="container2" style="width: 95%;">
			
				<c:forEach items="${commentList}" var="commentList">
					<div class="card m-2" id="comments-${commentList.ccomu_bno}">
						<div class="card-header">${commentList.com_id}
							&nbsp;&nbsp;&nbsp;</div>
						<div class="card-body" style="display: flex;">
							<div style="font-size: 20px;">${commentList.ccomm_body}</div>
							
							<div class="comment thumb-icon" data-comment-id="${commentList.ccomm_id}">
								<!-- <img src="/img/empty-like.png" alt="Thumb Icon"> -->
							</div>
							<div>&nbsp;&nbsp;&nbsp;</div>
							<div>
								<span style="font-size: 20px;">${commentList.ccomu_good}</span>							
							</div>
						</div>
					</div>
				</c:forEach>
			
			
			</div>
			
			<!-- 새 댓글 작성하기 -->
			<div class="container2" style="width: 82%;">
			<div class="card m-2" id="comments-new">
			
				<div class="card-body">
					<!-- 댓글 작성 폼 -->
					<form action="/Api/Comment/{ccomu_bno}/comments" method="POST">
						<!-- hidden 정보 -->

						<input type="hidden" name="ccomu_bno" value="${vo.ccomu_bno}"
							id="new-comment-id" />


						<!-- 닉네임 -->
						<div class="mb-3" style="margin: 10px;">
							<label class="form-label">아이디</label> <label> <input
								type="text" class="form-control" id="new-comment-nickname"
								data-com-id="${ sessionScope.clogin.com_id}"
								value="${ sessionScope.clogin.com_id}" readonly />

							</label>
						</div>
						<!-- 댓글 본문  -->
						<div class="mb-3" style="margin: 10px;">
							<label class="form-label">댓글 내용</label> <label> <textarea
									type="text" class="form-control" rows="3" id="new-comment-body"></textarea>
							</label>
							<!-- 전송 버튼-->
							<button type="button" class="btn btn-primary"
								id="comment-create-btn">댓글 작성</button>
						</div>
					</form>
				</div>
				</div>
			</div>
			
			
		
	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>


	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
	
  	const commentCreateBtnEl = document.getElementById('comment-create-btn');
  	
  	commentCreateBtnEl.addEventListener('click', ()=> {
  		
  		let ccomu_bno = parseInt(document.querySelector('#new-comment-id').value); // ccomu_bno 값을 정수로 변환
  		let url = 'http://localhost:9090/Api/Comment/${vo.ccomu_bno}/commentCreate';
  		
	 // js 객체
      const comment = {
          // 새 댓글의 nick name
          com_id   : document.querySelector('#new-comment-nickname').value,
          // 새글의 본문
          ccomm_body       : document.querySelector('#new-comment-body').value,
          // 부모 게시글의 id
          ccomu_bno  : ccomu_bno // 정수로 변환된 ccomu_bno 값 사용
      };
	 
      const params = {
          method  : 'POST',
          headers : {"Content-Type":"application/json" },
          body    : JSON.stringify( comment )   
      };
	 
   	  fetch(url, params)
   	  		.then(response => response.json()) // 응답 데이터를 JSON 으로 변환
   	  		.then(data => {
						if(data) {
								alert("댓글이 등록되었습니다");
								window.location.reload(); // 성공한 경우 페이지 새로고침
						} else {
							  alert("댓글 등록 실패!");
						}
   	  		}) 
      		.catch(error => {
						console.error('댓글 등록 에러:', error);
						alert("댓글 등록 중 오류가 발생했습니다.");      	
      		})
  	});
  	
  	//-----------------------------------------------------------------------------------------------------
  	
  	document.addEventListener('DOMContentLoaded', () => {
  		
        const ccomm_id = $('.thumb-icon').data('comment-id');        
        const ccomu_bno = ${vo.ccomu_bno};
        const com_id = $('#new-comment-nickname').data('com-id');
        
        function loadThumbInfo(ccomm_id, ccomu_bno, com_id) {
        	
        	//const ccomm_id = $('.thumb-icon').data('comment-id');        
            //const ccomu_bno = ${vo.ccomu_bno};
            //const com_id = $('#new-comment-nickname').data('com-id');
            //console.log('ccomm_id: ' + ccomm_id)
            //console.log('ccomu_bno: ' + ccomu_bno)
            //console.log('com_id: ' + com_id)
        	
			$.ajax({
				type : 'GET',
				url : 'http://localhost:9090/Api/Comment/${vo.ccomu_bno}/' + ccomm_id +'/commentLike',
				data : {
					ccomm_id : ccomm_id,
					ccomu_bno : ccomu_bno,
					com_id : com_id
				},
				success: function(data) {
					
		            console.log(data);
		            
		            const thumbEl = document.querySelector('.thumb-icon');
		            console.dir(thumbEl)
		            
		            if (data == 1) {
		            	thumbEl.innerHTML = '<img src="/img/full-like.png" alt="Thumb Icon">';
		            } else {
		            	thumbEl.innerHTML = '<img src="/img/empty-like.png" alt="Thumb Icon">';
		            }
		        },
				error : function(xhr, status, error) {
					console.error(error);
				}
			})
		};        

        
    loadThumbInfo(ccomm_id, ccomu_bno, com_id);

  	//});
  	
  		
    
  	//-----------------------------------------------------------------------------------------------------
  	
  	document.querySelectorAll('.thumb-icon').forEach(thumbIcon => {
  		
  	    thumbIcon.addEventListener('click', function() {
  	            
  	    	alert('aaa')
  	    	
  	    	const ccomm_id = $('.thumb-icon').data('comment-id');        
            const ccomu_bno = ${vo.ccomu_bno};
            const com_id = $('#new-comment-nickname').data('com-id');
            console.log('===========================================')
            console.log('ccomm_id: ' + ccomm_id)
            console.log('ccomu_bno: ' + ccomu_bno)
            console.log('com_id: ' + com_id)
            
            const imgSrc = $(this).html();
            console.log(imgSrc)
			//const isLiked = imgSrc.includes('full-like.png');
            const srcMatch = imgSrc.match(/src="([^"]+)"/);
            let isLiked = 0;

            if (srcMatch && srcMatch[1].includes('full-like')) {
                isLiked = 1;
            }
            console.dir('isLiked: ' + isLiked);
            
            $.ajax({
				type : 'POST',
				url : 'http://localhost:9090/Api/Comment/${vo.ccomu_bno}/' + ccomm_id +'/commentLike',
				data : {
					ccomm_id : ccomm_id,
					ccomu_bno : ccomu_bno,
					com_id : com_id
				},
				success: function(data) {
					
		            console.dir(data);
		            
		            const thumbEl = document.querySelector('.thumb-icon');
	            	console.dir(thumbEl);
	            	//console.log('isLiked: ' + isLiked);
		            
	            	if(isLiked == 1) {
	                	  thumbEl.innerHTML = '<img src="/img/empty-like.png" alt="Thumb Icon">';
	                } else {
	                	  thumbEl.innerHTML = '<img src="/img/full-like.png" alt="Thumb Icon">';
	                }	    
	                loadThumbInfo(ccomm_id, ccomu_bno, com_id);

		        },
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
      		location.reload();
		      });

		  });

	});
  </script>

</body>
</html>





