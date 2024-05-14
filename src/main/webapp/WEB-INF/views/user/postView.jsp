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

				<form action="/Post/GoApply?po_num=${po_num}" method="POST">
					<input type="hidden" name="po_num" value="${ po_num }" /> <input
						type="hidden" id="user_id" name="user_id"
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

					<c:forEach var="getBookList" items="${getBookList}">
						<div>
						<c:choose>
						<c:when test="${ getBookList.ub_boolean == 0 }">
							<input class="btn btn-primary scrap-button"
								type="button" data-po-num="${ getBookList.po_num }"
								data-user-id="${sessionScope.plogin.user_id}"
								data-ub-boolean="${ getBookList.ub_boolean }" value="스크랩 하기"  />
						</c:when>
						<c:otherwise>
							<input class="btn btn-outline-secondary scrap-button"
								type="button" data-po-num="${ getBookList.po_num }"
								data-user-id="${sessionScope.plogin.user_id}"
								data-ub-boolean="${ getBookList.ub_boolean }" value="스크랩 해제"  />
						</c:otherwise>
						</c:choose>
						</div>
					</c:forEach>

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
		/*
		 $(document).ready(function() {
		
		 // 스크랩 버튼 클릭 시 동작
		 $('.scrap-button').click(function() {
		 const button = $(this);
		 const po_num = button.data('po-num');
		 const user_id = button.data('user-id');
		 //const isScraped = button.data('scraped');
		 const isScraped = button.data('ub-boolean');
		 console.dir(this)
		 console.dir(isScraped)
		
		
		 // 서버로 스크랩 여부 확인 요청
		 $.ajax({
		 url: `/Bookmark/CheckBoolean?po_num=`
		 + po_num + '&user_id=' + user_id,
		 type: 'GET',
		 success: function(isScraped) {
		
		 button.data('scraped', isScraped);
		
		 if (isScraped) {
		 button.removeClass('btn-outline-secondary').addClass('btn-primary').val('스크랩 해제');
		 } else {
		 button.removeClass('btn-primary').addClass('btn-outline-secondary').val('스크랩 하기');
		 }
		
		
		 if() {
		 // 서버로 스크랩 추가 또는 제거 요청
		 $.ajax({
		 url: `/Bookmark/AddBoolean?po_num=`
		 + po_num + '&user_id=' + user_id,
		 type: 'POST',
		 contentType : 'application/json',
		 data : JSON.stringify({
		 po_num : po_num,
		 user_id : user_id
		 }),
		 success: function(response) {
		 // 스크랩 상태가 업데이트되었음을 사용자에게 알림
		 alert(isScraped ? '스크랩이 해제되었습니다.' : '스크랩되었습니다.');
		 },
		 error: function(xhr, status, error) {
		 console.error('Error:', error);
		 alert('오류가 발생했습니다. 다시 시도해주세요.');
		 }
		 });
		 } else if {
		 $.ajax({
		 url: `/Bookmark/RemoveBoolean?po_num=`
		 + po_num + '&user_id=' + user_id,
		 type: 'POST',
		 contentType : 'application/json',
		 data : JSON.stringify({
		 po_num : po_num,
		 user_id : user_id
		 }),
		 success: function(response) {
		 // 스크랩 상태가 업데이트되었음을 사용자에게 알림
		 alert(isScraped ? '스크랩되었습니다.' : '스크랩이 해제되었습니다.');
		 },
		 error: function(xhr, status, error) {
		 console.error('Error:', error);
		 alert('오류가 발생했습니다. 다시 시도해주세요.');
		 }
		 });
		 }
		
		
		 },
		 error: function(xhr, status, error) {
		 console.error('Error:', error);
		 }
		 });
		 });
		 });
		 */

		$(document).ready(
				function() {

					const user_id = $('#user_id').val(); // 현재 사용자 ID

					// 북마크 여부 확인 함수
					function checkBookmark() {
						$('.scrap-button').each(

								function() {
									const button = $(this);
									const po_num = button.data('po-num');

									// 스크랩 상태 확인 요청
									$.ajax({
										type : 'GET',
										url : `/Bookmark/CheckBoolean?po_num=`
												+ po_num + '&user_id='
												+ user_id,
										contentType : 'application/json',
										success : function(isScraped) {
											button.data('scraped', isScraped);
											button.val(isScraped ? '스크랩 하기' : '스크랩 해제');
											//button.toggleClass('btn-outline-secondary', isScraped)
											//      .toggleClass('btn-primary', !isScraped)
											//      .val(isScraped ? '스크랩 하기' : '스크랩 해제');
										},
										error : function(error) {
											console.error('Error:', error);
										}
									});
								});
					}

					checkBookmark(); // 페이지 로드 시 스크랩 버튼 상태 갱신

					$('.scrap-button').click(
							function() {

								const button = $(this);
								const po_num = button.data('po-num');
								const ub_boolean = button.data('ub-boolean');
								const isScraped = button.data('scraped');

								/*
								if (isScraped) {
									// 스크랩 삭제 요청
									$.ajax({
										url : `/Bookmark/RemoveBoolean?po_num=`
												+ po_num + '&user_id='
												+ user_id,
										type : 'POST',
										contentType : 'application/json',
										}),
										success : function(response) {
											alert('스크랩이 해제되었습니다.');
											checkBookmark(); // 모든 스크랩 버튼 상태 갱신
										},
										error : function(error) {
											console.error('Error:', error);
											alert('오류가 발생했습니다. 다시 시도해주세요.');
										}
									});
					*/
					
								if (isScraped) {
									
									// 스크랩 추가 요청
									$.ajax({
										url : `/Bookmark/AddBoolean?po_num=`
												+ po_num + '&user_id='
												+ user_id,
										type : 'POST',
										contentType : 'application/json',
										data : JSON.stringify({
											po_num : po_num,
											user_id : user_id
										}),
										success : function(response) {
											alert('스크랩되었습니다.');
											checkBookmark(); // 모든 스크랩 버튼 상태 갱신
										},
										error : function(error) {
											console.error('Error:', error);
											alert('오류가 발생했습니다. 다시 시도해주세요.');
										}
									});

								} else {
									
									// 스크랩 삭제 요청
									$.ajax({
								        url: `/Bookmark/RemoveBoolean?po_num=` + po_num + '&user_id=' + user_id,
								        type: 'POST',
								        contentType: 'application/json',
								        success: function(response) {
								            alert('스크랩이 해제되었습니다.');
								            checkBookmark(); // 모든 스크랩 버튼 상태 갱신
								        },
								        error: function(xhr, status, error) {
								            console.error('Error:', error);
								            alert('오류가 발생했습니다. 다시 시도해주세요.');
								        }
								    });
									
								}
							});
						});
				
	</script>

</body>
</html>
