<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 화면</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
main {
	height: 120vh;
}

ul {
	list-style-type: none;
}

.post-top, .post-mid, .post-third, .applybutton {
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

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

	<main>

		<section>

			<article>

				<form action="/Post/GoApply?po_num=${po_num}&user_id=${ sessionScope.plogin.user_id }" method="POST">
					<input type="hidden" id="po_num" name="po_num" value="${ po_num }" />
					<input type="hidden" id="user_id" name="user_id"
						value="${ sessionScope.plogin.user_id }" />

					<c:forEach var="postList" items="${postList}">
						<div>
							<ul class="post-top" id="postView">
								<li data-value="value1"><input type="text"
									class="postTitle" name="po_title"
									value="공고 제목: ${postList.po_title}" /></li>
								<li data-value="value2"><img src="/img/Rogo.png"
									alt="회사로고 이미지1"></li>
							</ul>
						</div>

						<table class="post-mid">
							<tr>
								<td>기술스택</td>
								<td>지역</td>
								<td>경력유무</td>
							</tr>
							<tr>
								<td><input type="text" style="border: none;" name="skill"
									value="${postList.skill}" /></td>
								<td><input type="text" style="border: none;" name="region"
									value="${postList.region}" /></td>
								<td><input type="text" style="border: none;" name="career"
									value="${postList.career}" /></td>
							</tr>
						</table>

						<table class="post-third">
							<tr>
								<td colspan="3"><input type="text" style="border: none;"
									name="po_content" value="모집조건: ${postList.po_content}" /></td>
							</tr>
							<tr>
								<td colspan="3"><input type="text" style="border: none;"
									name="po_qual" value="근무조건: ${postList.po_qual}" /> <input
									type="hidden" style="border: none;" name="com_id"
									value="${postList.com_id}" /></td>
							</tr>
						</table>

						<div class="applybutton" style="display: flex;">

							<input type="submit" class="btn btn-primary" value="지원하기">&nbsp;&nbsp;
							<a href="/Post/List?user_id=${sessionScope.plogin.user_id}"
								class="btn btn-primary">목록으로</a>&nbsp;&nbsp;

						</div>

					</c:forEach>

                    <div id="scrapBtn"></div> 

				<%-- 	<c:forEach var="getBookList" items="${getBookList}">
					    <div>
					    	<input class="btn scrap-button" type="button" />
					    </div>
					</c:forEach> --%>

				</form>

			</article>

		</section>

	</main>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			
			/* $.ajax({
				type : 'POST',
				url : '/checkUserBook', // 요청을 처리할 서버의 URL
				data : {
					user_id : user_id,
					po_num : po_num
				},
				success: function(response) {
		            // 성공적으로 데이터를 보냈을 때 처리할 내용
		            console.log(response);
		            
		        },
				error : function(xhr, status, error) {
					// 데이터 전송이 실패했을 때 처리할 내용
					console.error(error);
				}
		        
			}); */
		});

		const user_id = $('#user_id').val();
		const po_num = $('#po_num').val();

		function loadUserBookInfo(user_id, po_num) {
			
			const button = $('.scrap-button');
			console.dir(button);
			
			$.ajax({
				type : 'GET',
				url : '/checkUserBook', // 요청을 처리할 서버의 URL
				data : {
					user_id : user_id,
					po_num : po_num
				},
				success: function(data) {
		            // 성공적으로 데이터를 받았을 때 처리할 내용
		            console.log(data);
		            const scrapBtnEl = document.querySelector('#scrapBtn')
		            if (data.length > 0) {
		            	scrapBtnEl.innerHTML = '<input class="btn scrap-button btn-outline-secondary" type="button" value="스크랩 해제">'
		            } else {
		            	scrapBtnEl.innerHTML = '<input class="btn scrap-button btn-primary" type="button" value="스크랩 하기">'
		            }
		        },
				error : function(xhr, status, error) {
					// 데이터 요청이 실패했을 때 처리할 내용
					console.error(error);
				}
			});
		}

		// 스크랩 버튼 갱신 (꼭 있어야 함)
		loadUserBookInfo(user_id, po_num);
		
		//---------------------------------------------------------------------------------------------------------------
		
		// 스크랩 버튼 클릭 시
		$('#scrapBtn').on('click', '.scrap-button', function() {
		    const user_id = $('#user_id').val();
		    const po_num = $('#po_num').val();
		    const isScraped = $(this).hasClass('btn-primary'); // 스크랩 상태 확인

		    // Ajax 요청 보내기
		    $.ajax({
		        type: 'POST',
		        url: isScraped ? '/addBookmark' : '/removeBookmark', // 스크랩 상태에 따라 요청 URL 선택
		        data: {
		            user_id: user_id,
		            po_num: po_num
		        },
		        success: function(data) {
		            // 성공적으로 데이터를 받았을 때 처리할 내용
		            console.log(data);

		            // 스크랩 상태 업데이트
		            if (isScraped) {
		                // 스크랩 해제 버튼인 경우
		                alert('스크랩 되었습니다')
		                $('#scrapBtn').html('<input class="btn scrap-button btn-outline-secondary" type="button" value="스크랩 해제">');
		                loadUserBookInfo(user_id, po_num);
		            } else {
		                // 스크랩 버튼인 경우
		                alert('스크랩 해제되었습니다')
		                $('#scrapBtn').html('<input class="btn scrap-button btn-primary" type="button" value="스크랩 하기">');
		                loadUserBookInfo(user_id, po_num);
		            }
		        },
		        error: function(xhr, status, error) {
		            // 데이터 요청이 실패했을 때 처리할 내용
		            console.error(error);
		        }
		    });
		});

		
		
		
		
	</script>

</body>
</html>
